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
  size_t i=0, o = 0;
  klee_make_symbolic(&i, sizeof(i), "symvari");

  for (i = 0; i < sizeof(option_data) / sizeof(option_data[0]); i++)
    {
      struct cmdline_option *opt = &option_data[i];
      struct option *longopt;

      if (!opt->long_name)
        /* The option is disabled. */
        continue;

      printf("%c",*(opt->long_name));
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
