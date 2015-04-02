#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <locale.h>
#include <assert.h>
#include <errno.h>
#include <time.h>

#include <getopt.h>

struct cmdline_option {
  const char *long_name;
  char short_name;
  enum {
    OPT_VALUE,
    OPT_BOOLEAN,
    OPT_FUNCALL,
    /* Non-standard options that have to be handled specially in
       main().  */
    OPT__APPEND_OUTPUT,
    OPT__CLOBBER,
    OPT__DONT_REMOVE_LISTING,
    OPT__EXECUTE,
    OPT__NO,
    OPT__PARENT
  } type;
  const void *data;             /* for standard options */
  int argtype;                  /* for non-standard options */
};

static struct cmdline_option option_data[] =
  {
    { "accept", 'A', OPT_VALUE, "accept", -1 },
    { "adjust-extension", 'E', OPT_BOOLEAN, "adjustextension", -1 },
#if 0
    { "append-output", 'a', OPT__APPEND_OUTPUT, NULL, required_argument },
    { "ask-password", 0, OPT_BOOLEAN, "askpassword", -1 },
    { "auth-no-challenge", 0, OPT_BOOLEAN, "authnochallenge", -1 },
    { "background", 'b', OPT_BOOLEAN, "background", -1 },
    { "backup-converted", 'K', OPT_BOOLEAN, "backupconverted", -1 },
    { "backups", 0, OPT_BOOLEAN, "backups", -1 },
    { "base", 'B', OPT_VALUE, "base", -1 },
    { "bind-address", 0, OPT_VALUE, "bindaddress", -1 },
    { "ca-certificate", 0, OPT_VALUE, "cacertificate", -1 },
    { "ca-directory", 0, OPT_VALUE, "cadirectory", -1 },
    { "cache", 0, OPT_BOOLEAN, "cache", -1 },
    { "certificate", 0, OPT_VALUE, "certificate", -1 },
    { "certificate-type", 0, OPT_VALUE, "certificatetype", -1 },
    { "check-certificate", 0, OPT_BOOLEAN, "checkcertificate", -1 },
    { "clobber", 0, OPT__CLOBBER, NULL, optional_argument },
    { "config", 0, OPT_VALUE, "chooseconfig", -1 },
    { "connect-timeout", 0, OPT_VALUE, "connecttimeout", -1 },
    { "continue", 'c', OPT_BOOLEAN, "continue", -1 },
    { "convert-links", 'k', OPT_BOOLEAN, "convertlinks", -1 },
    { "content-disposition", 0, OPT_BOOLEAN, "contentdisposition", -1 },
    { "cookies", 0, OPT_BOOLEAN, "cookies", -1 },
    { "cut-dirs", 0, OPT_VALUE, "cutdirs", -1 },
    { "debug", 'd', OPT_BOOLEAN, "debug", -1 },
    { "default-page", 0, OPT_VALUE, "defaultpage", -1 },
    { "delete-after", 0, OPT_BOOLEAN, "deleteafter", -1 },
    { "directories", 0, OPT_BOOLEAN, "dirstruct", -1 },
    { "directory-prefix", 'P', OPT_VALUE, "dirprefix", -1 },
    { "dns-cache", 0, OPT_BOOLEAN, "dnscache", -1 },
    { "dns-timeout", 0, OPT_VALUE, "dnstimeout", -1 },
    { "domains", 'D', OPT_VALUE, "domains", -1 },
    { "dont-remove-listing", 0, OPT__DONT_REMOVE_LISTING, NULL, no_argument },
    { "dot-style", 0, OPT_VALUE, "dotstyle", -1 }, /* deprecated */
    { "egd-file", 0, OPT_VALUE, "egdfile", -1 },
    { "exclude-directories", 'X', OPT_VALUE, "excludedirectories", -1 },
    { "exclude-domains", 0, OPT_VALUE, "excludedomains", -1 },
    { "execute", 'e', OPT__EXECUTE, NULL, required_argument },
    { "follow-ftp", 0, OPT_BOOLEAN, "followftp", -1 },
    { "follow-tags", 0, OPT_VALUE, "followtags", -1 },
    { "force-directories", 'x', OPT_BOOLEAN, "dirstruct", -1 },
    { "force-html", 'F', OPT_BOOLEAN, "forcehtml", -1 },
    { "ftp-password", 0, OPT_VALUE, "ftppassword", -1 },
    { "ftp-stmlf", 0, OPT_BOOLEAN, "ftpstmlf", -1 },
    { "ftp-user", 0, OPT_VALUE, "ftpuser", -1 },
    { "glob", 0, OPT_BOOLEAN, "glob", -1 },
    { "header", 0, OPT_VALUE, "header", -1 },
    { "help", 'h', OPT_FUNCALL, "help", no_argument },
    { "host-directories", 0, OPT_BOOLEAN, "addhostdir", -1 },
    { "html-extension", 'E', OPT_BOOLEAN, "adjustextension", -1 }, /* deprecated */
    { "htmlify", 0, OPT_BOOLEAN, "htmlify", -1 },
    { "http-keep-alive", 0, OPT_BOOLEAN, "httpkeepalive", -1 },
    { "http-passwd", 0, OPT_VALUE, "httppassword", -1 }, /* deprecated */
    { "http-password", 0, OPT_VALUE, "httppassword", -1 },
    { "http-user", 0, OPT_VALUE, "httpuser", -1 },
    { "ignore-case", 0, OPT_BOOLEAN, "ignorecase", -1 },
    { "ignore-length", 0, OPT_BOOLEAN, "ignorelength", -1 },
    { "ignore-tags", 0, OPT_VALUE, "ignoretags", -1 },
    { "include-directories", 'I', OPT_VALUE, "includedirectories", -1 },
    { "inet4-only", '4', OPT_BOOLEAN, "inet4only", -1 },
    { "inet6-only", '6', OPT_BOOLEAN, "inet6only", -1 },
    { "input-file", 'i', OPT_VALUE, "input", -1 },
    { "iri", 0, OPT_BOOLEAN, "iri", -1 },
    { "keep-session-cookies", 0, OPT_BOOLEAN, "keepsessioncookies", -1 },
    { "level", 'l', OPT_VALUE, "reclevel", -1 },
    { "limit-rate", 0, OPT_VALUE, "limitrate", -1 },
    { "load-cookies", 0, OPT_VALUE, "loadcookies", -1 },
    { "local-encoding", 0, OPT_VALUE, "localencoding", -1 },
    { "max-redirect", 0, OPT_VALUE, "maxredirect", -1 },
    { "mirror", 'm', OPT_BOOLEAN, "mirror", -1 },
    { "no", 'n', OPT__NO, NULL, required_argument },
    { "no-clobber", 0, OPT_BOOLEAN, "noclobber", -1 },
    { "no-parent", 0, OPT_BOOLEAN, "noparent", -1 },
    { "output-document", 'O', OPT_VALUE, "outputdocument", -1 },
    { "output-file", 'o', OPT_VALUE, "logfile", -1 },
    { "page-requisites", 'p', OPT_BOOLEAN, "pagerequisites", -1 },
    { "parent", 0, OPT__PARENT, NULL, optional_argument },
    { "passive-ftp", 0, OPT_BOOLEAN, "passiveftp", -1 },
    { "password", 0, OPT_VALUE, "password", -1 },
    { "post-data", 0, OPT_VALUE, "postdata", -1 },
    { "post-file", 0, OPT_VALUE, "postfile", -1 },
    { "prefer-family", 0, OPT_VALUE, "preferfamily", -1 },
    { "preserve-permissions", 0, OPT_BOOLEAN, "preservepermissions", -1 }, /* deprecated */
    { "private-key", 0, OPT_VALUE, "privatekey", -1 },
    { "private-key-type", 0, OPT_VALUE, "privatekeytype", -1 },
    { "progress", 0, OPT_VALUE, "progress", -1 },
    { "protocol-directories", 0, OPT_BOOLEAN, "protocoldirectories", -1 },
    { "proxy", 0, OPT_BOOLEAN, "useproxy", -1 },
    { "proxy__compat", 'Y', OPT_VALUE, "useproxy", -1 }, /* back-compatible */
    { "proxy-passwd", 0, OPT_VALUE, "proxypassword", -1 }, /* deprecated */
    { "proxy-password", 0, OPT_VALUE, "proxypassword", -1 },
    { "proxy-user", 0, OPT_VALUE, "proxyuser", -1 },
    { "quiet", 'q', OPT_BOOLEAN, "quiet", -1 },
    { "quota", 'Q', OPT_VALUE, "quota", -1 },
    { "random-file", 0, OPT_VALUE, "randomfile", -1 },
    { "random-wait", 0, OPT_BOOLEAN, "randomwait", -1 },
    { "read-timeout", 0, OPT_VALUE, "readtimeout", -1 },
    { "recursive", 'r', OPT_BOOLEAN, "recursive", -1 },
    { "referer", 0, OPT_VALUE, "referer", -1 },
    { "reject", 'R', OPT_VALUE, "reject", -1 },
    { "relative", 'L', OPT_BOOLEAN, "relativeonly", -1 },
    { "remote-encoding", 0, OPT_VALUE, "remoteencoding", -1 },
    { "remove-listing", 0, OPT_BOOLEAN, "removelisting", -1 },
    { "restrict-file-names", 0, OPT_BOOLEAN, "restrictfilenames", -1 },
    { "retr-symlinks", 0, OPT_BOOLEAN, "retrsymlinks", -1 },
    { "retry-connrefused", 0, OPT_BOOLEAN, "retryconnrefused", -1 },
    { "save-cookies", 0, OPT_VALUE, "savecookies", -1 },
    { "save-headers", 0, OPT_BOOLEAN, "saveheaders", -1 },
    { "secure-protocol", 0, OPT_VALUE, "secureprotocol", -1 },
    { "server-response", 'S', OPT_BOOLEAN, "serverresponse", -1 },
    { "span-hosts", 'H', OPT_BOOLEAN, "spanhosts", -1 },
    { "spider", 0, OPT_BOOLEAN, "spider", -1 },
    { "strict-comments", 0, OPT_BOOLEAN, "strictcomments", -1 },
    { "timeout", 'T', OPT_VALUE, "timeout", -1 },
    { "timestamping", 'N', OPT_BOOLEAN, "timestamping", -1 },
    { "tries", 't', OPT_VALUE, "tries", -1 },
    { "unlink", 0, OPT_BOOLEAN, "unlink", -1 },
    { "trust-server-names", 0, OPT_BOOLEAN, "trustservernames", -1 },
    { "use-server-timestamps", 0, OPT_BOOLEAN, "useservertimestamps", -1 },
    { "user", 0, OPT_VALUE, "user", -1 },
    { "user-agent", 'U', OPT_VALUE, "useragent", -1 },
    { "verbose", 'v', OPT_BOOLEAN, "verbose", -1 },
    { "verbose", 0, OPT_BOOLEAN, "verbose", -1 },
    { "version", 'V', OPT_FUNCALL, "version", no_argument },
    { "wait", 'w', OPT_VALUE, "wait", -1 },
    { "waitretry", 0, OPT_VALUE, "waitretry", -1 },
    { "wdebug", 0, OPT_BOOLEAN, "wdebug", -1 },
#endif
  };

/* The arguments that that main passes to getopt_long. */
static struct option long_options[2 * sizeof(option_data) / sizeof(option_data[0])+ 1];
static char short_options[128];

/* Mapping between short option chars and option_data indices. */
static unsigned char optmap[96];

/* Marker for `--no-FOO' values in long_options.  */
#define BOOLEAN_NEG_MARKER 1024

/* Initialize the long_options array used by getopt_long from the data
   in option_data.  */

static char *
no_prefix (const char *s)
{
  static char buffer[1024];
  static char *p = buffer;

  char *cp = p;
  int size = 3 + strlen (s) + 1;  /* "no-STRING\0" */
  if (p + size >= buffer + sizeof (buffer))
    abort ();

  cp[0] = 'n', cp[1] = 'o', cp[2] = '-';
  strcpy (cp + 3, s);
  p += size;
  return cp;
}

static void
init_switches (void)
{
  char *p = short_options;
  size_t i, o = 0;
  for (i = 0; i < sizeof(option_data) / sizeof(option_data[0]); i++)
    {
      struct cmdline_option *opt = &option_data[i];
      struct option *longopt;

      if (!opt->long_name)
        /* The option is disabled. */
        continue;

      longopt = &long_options[o++];
      longopt->name = opt->long_name;
      longopt->val = i;
      if (opt->short_name)
        {
          *p++ = opt->short_name;
          optmap[opt->short_name - 32] = longopt - long_options;
        }
      switch (opt->type)
        {
        case OPT_VALUE:
          longopt->has_arg = required_argument;
          if (opt->short_name)
            *p++ = ':';
          break;
        case OPT_BOOLEAN:
          /* Specify an optional argument for long options, so that
             --option=off works the same as --no-option, for
             compatibility with pre-1.10 Wget.  However, don't specify
             optional arguments short-option booleans because they
             prevent combining of short options.  */
          longopt->has_arg = optional_argument;
          /* For Boolean options, add the "--no-FOO" variant, which is
             identical to "--foo", except it has opposite meaning and
             it doesn't allow an argument.  */
          longopt = &long_options[o++];
          longopt->name = no_prefix (opt->long_name);
          longopt->has_arg = no_argument;
          /* Mask the value so we'll be able to recognize that we're
             dealing with the false value.  */
          longopt->val = i | BOOLEAN_NEG_MARKER;
          break;
        default:
          assert (opt->argtype != -1);
          longopt->has_arg = opt->argtype;
          if (opt->short_name)
            {
              if (longopt->has_arg == required_argument)
                *p++ = ':';
              /* Don't handle optional_argument */
            }
        }
    }
  /* Terminate short_options. */
  *p = '\0';
  /* No need for xzero(long_options[o]) because its storage is static
     and it will be zeroed by default.  */
  assert (o <= sizeof(long_options) / sizeof(long_options[0]));
}

int
main (int argc, char **argv)
{
  init_switches ();
  return 0;
}
