
//## hyphop ##

#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#define NAME "runasg"


struct stat sb;

int main(int argc, char *argv[], char **envp) {
  char *gs;
  int gid = 0;
  int uid;

  if (argc < 2) {
    fprintf(stderr, "USAGE: runasg [ progname ] [@args]\n");
    exit(1);
  }

  if (stat(argv[1], &sb) == 0 && sb.st_mode & S_IXUSR) {
    ;
  } else {

    fprintf(stderr, "[i] %s `%s` - is not exec - try: `%s $(which %s)`\n", NAME,
            argv[1], NAME, argv[1]);
    exit(1);
  }

  gs = getenv("GID");

  if (gs) {
    gid = atoi(gs);
  }

  setgid(gid);
  uid = getuid();

  fprintf(stderr, "%s UID: %d, GID: %d CMD: ", NAME, uid, gid);
  for (int i = 1; i < argc; i++) {
    fprintf(stderr, "%s ", argv[i]);
  }
  fprintf(stderr, "\n");

  argv++;

  execve(argv[0], argv, envp);
  perror("execve"); /* execve() returns only on error */
  exit(EXIT_FAILURE);
  return 0;
}
