#include <cassert>
#include <execinfo.h>
#include <fcntl.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

/* Some programs like to snarf stderr; this gets it to work on them */
static char log_to_file = true;
static const char * log_to_file_env = "LOG_TO_FILE";

/* Show a backtrace if a sink is reached */
static char backtrace_on_badness = false;
static const char * backtrace_on_badness_env = "BACKTRACE_ON_BADNESS";

/* For testing, to ensure output ordering works as expected */
static char excessive_flushing = true;
static const char * excessive_flushing_env = "EXCESSIVE_FLUSHING";

/* For performance testing, only incur call overhead to 'badness' */
static char log_badness = true;
static const char * log_badness_env = "LOG_BADNESS";

static char abort_on_badness = false;
static const char * abort_on_badness_env = "ABORT_ON_BADNESS";

static const char * log_dir = "/tmp/";
static const char * log_dir_env = "LOG_DIR";

// What we log to
static FILE *out = NULL;
static bool first_time_init = false;

extern "C" void ____jf_logger(const char *fmt, ...);
extern "C" void ____jf_badness(void);
extern "C" void ____jf_init_logger(void);
extern "C" void ____jf_reinit_logger(void);

static char * lastNChars(char * str, int n) {
  char * p = strrchr(str,'/');
  if (!p) p = str;
  else p++;
  int len = strlen(p);
  if (len < n) return p;
  return p + (len - n);
}

static void read_config(char & value, const char * env_key) {
  const char * env = getenv(env_key);
  // If nothing is specified, use default
  if (!env) return;

  value = env[0] == '1';
}

static void read_config_str(const char *& value, const char * env_key) {
  const char * env = getenv(env_key);
  // If nothing is specified, use default
  if (!env) return;

  value = strdup(env);
}

static void init_and_print(const char *msg) {
  ____jf_init_logger();
  if (msg) {
    fflush(out);
    ____jf_logger("[JF] %s\n", msg);
    fflush(out);
  }
}

static void close_logger(const char *msg) {
  init_and_print(msg);

  if (out != stderr)
    fclose(out);

  out = NULL;
}

static void fork_prepare() { close_logger("Pre-fork"); }
static void fork_parent() { init_and_print("Post-fork, in parent"); }
static void fork_child() { init_and_print("Post-fork, in child"); }
static void exit_close() { close_logger(NULL); }

void ____jf_reinit_logger() {
  // If we have no valid logging fd, fine
  if (!out)
    return;

  // Can't reinit stderr anyway
  if (!log_to_file)
    return;

  ____jf_init_logger();
}

void ____jf_init_logger() {
  // If we already intialized, bail
  if (out && (!log_to_file ||
              (fileno(out) != -1 && fcntl(fileno(out), F_GETFD) != -1)))
    return;

  // Initialize our settings from the environment
  if (!first_time_init) {
    read_config(log_to_file, log_to_file_env);
    read_config(backtrace_on_badness, backtrace_on_badness_env);
    read_config(excessive_flushing, excessive_flushing_env);
    read_config(log_badness, log_badness_env);
    read_config(abort_on_badness, abort_on_badness_env);
    read_config_str(log_dir, log_dir_env);

    pthread_atfork(fork_prepare, fork_parent, fork_child);
    atexit(exit_close);

    first_time_init = true;
  }

  // Initialize logger as specified
  if (log_to_file) {
    pid_t p = getpid();
    char buffer[1024];
    char cmdline[1024] = {};
    char pname[300];
    snprintf(buffer, 1000, "/proc/%u/cmdline", p);
    FILE *f = fopen(buffer, "r");
    if (f) {
      fgets(cmdline, sizeof(cmdline), f);
      for (unsigned i = 0; i < sizeof(cmdline)-1; ++i)
        if (cmdline[i] == 0 && cmdline[i+1] != 0)
          cmdline[i] = ' ';
      fclose(f);
    } else
      strcpy(cmdline, "<unknown>");
    sscanf(cmdline, "%300s", pname);

    // Ensure directory exists with hacktastic system invocation.
    // Forgive me.
    assert(log_dir && log_dir[0]);
    struct stat sb;
    if (stat(log_dir, &sb)) {
      snprintf(buffer, 1000, "mkdir -p %s", log_dir);
      system(buffer);
    } else
      assert(S_ISDIR(sb.st_mode) && "Log directory not a directory");

    snprintf(buffer, 1000, "%s/jf_log.%s.%d",
                            log_dir,
                            lastNChars(pname, 80),
                            p);
    buffer[1000] = 0;
    out = fopen(buffer, "a");
    assert(out && "[JF] Unable to open log file!");
    fprintf(out, "[JF] opened log, cmdline = %s\n", cmdline);
  } else
    out = stderr;
}

/* We build this into a separate library
 * to avoid differences in the way C/C++
 * define types (va_list, stderr, etc)
 */
void ____jf_logger(const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);

  ____jf_init_logger();
  if (!log_to_file && excessive_flushing)
    fflush(stdout);
  vfprintf(out,fmt,ap);
  if (!log_to_file || excessive_flushing)
    fflush(out);

  va_end(ap);
}

void ____jf_badness() {
  ____jf_init_logger();

  if (log_badness) {
    ____jf_logger("Bad value reached program point!\n");
  }

  if (abort_on_badness) {
    exit(-1);
  }

  if (backtrace_on_badness)
  {
    void *buffer[256]; /* 256 should be enough for anybody, right? :-) */
    int numelems = backtrace(buffer, 256);
    fprintf(out, "Backtrace: \n");
    fflush(out);
    backtrace_symbols_fd(buffer, numelems, fileno(out));
    fflush(out);
  }
}
