{ryanmcquen:elvis-2.2_1-pre2}$ ./configure
darwin should build OK as a generic Unix but you must use the --x-libraries= option
{ryanmcquen:elvis-2.2_1-pre2}$ ./configure --x-libraries=
Options:  --x-libraries=$ --with-x --ioctl=termios
System:   darwin
Compiler: gcc -O2
Bin dir:  /usr/bin
Data dir: /usr/share/elvis/
Doc dir:  /usr/share/elvis/doc/
Man dir:  /usr/share/man/man1
To see details, run "configure --verbose"
{ryanmcquen:elvis-2.2_1-pre2}$ make
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o main.o main.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c osunix/osblock.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c osunix/osdir.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c osunix/osprg.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c osunix/ostext.c
clang: warning: argument unused during compilation: '-L/lib'
osunix/ostext.c:49:22: warning: use of logical '||' with constant operand [-Wconstant-logical-operand]
                if (errno == EPERM || EACCES)
                                   ^  ~~~~~~
osunix/ostext.c:49:22: note: use '|' for a bitwise operation
                if (errno == EPERM || EACCES)
                                   ^~
                                   |
1 warning generated.
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c osunix/osnet.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o optglob.o optglob.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o options.o options.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o safe.o safe.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o session.o session.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o buffer.o buffer.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o calc.o calc.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o color.o color.c
clang: warning: argument unused during compilation: '-L/lib'
color.c:289:13: warning: expression which evaluates to zero treated as a null pointer constant of type 'CHAR *' (aka 'unsigned char *') [-Wnon-literal-null-conversion]
        *likeref = '\0';
                   ^~~~
1 warning generated.
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o descr.o descr.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o digraph.o digraph.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o display.o display.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o gui.o gui.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o lowbuf.o lowbuf.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o mark.o mark.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o misc.o misc.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o io.o io.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o dmhex.o dmhex.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o dmmarkup.o dmmarkup.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o dmnormal.o dmnormal.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o dmsyntax.o dmsyntax.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o scan.o scan.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c osunix/tcaphelp.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o autocmd.o autocmd.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o cut.o cut.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o draw.o draw.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o event.o event.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o ex.o ex.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o exaction.o exaction.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o exconfig.o exconfig.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o exedit.o exedit.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o exmake.o exmake.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o exsubst.o exsubst.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o fold.o fold.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o ftp.o ftp.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o http.o http.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o input.o input.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o lp.o lp.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o map.o map.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o message.o message.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o move.o move.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o more.o more.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o need.o need.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o operator.o operator.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o regexp.o regexp.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o region.o region.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o regsub.o regsub.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o search.o search.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o spell.o spell.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o state.o state.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o tinytcap.o tinytcap.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o tag.o tag.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o tagsrch.o tagsrch.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o tagelvis.o tagelvis.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o url.o url.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o vi.o vi.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o vicmd.o vicmd.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o window.o window.c
clang: warning: argument unused during compilation: '-L/lib'
window.c:406:14: warning: if statement has empty body [-Wempty-body]
        if (changed);
                    ^
window.c:406:14: note: put the semicolon on a separate line to silence this warning
1 warning generated.
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/guix11.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xclip.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xevent.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xmisc.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xscroll.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xstatus.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xtext.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xtool.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -I. -Iosunix -c guix11/xdialog.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o guicurs.o guicurs.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o guitcap.o guitcap.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o guiopen.o guiopen.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o lpescape.o lpescape.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o lpovrtyp.o lpovrtyp.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix   -c -o lpps.o lpps.c
clang: warning: argument unused during compilation: '-L/lib'
gcc -O2 -L/lib -I/usr/X11R6/include -Iosunix main.o osblock.o osdir.o osprg.o ostext.o osnet.o optglob.o options.o safe.o session.o buffer.o calc.o color.o descr.o digraph.o display.o gui.o lowbuf.o mark.o misc.o io.o dmhex.o dmmarkup.o dmnormal.o dmsyntax.o scan.o tcaphelp.o autocmd.o cut.o draw.o event.o ex.o exaction.o exconfig.o exedit.o exmake.o exsubst.o fold.o ftp.o http.o input.o lp.o map.o message.o move.o more.o need.o operator.o regexp.o region.o regsub.o search.o spell.o state.o tinytcap.o tag.o tagsrch.o tagelvis.o url.o vi.o vicmd.o window.o  guix11.o xclip.o xevent.o xmisc.o xscroll.o xstatus.o xtext.o xtool.o xdialog.o guicurs.o guitcap.o guiopen.o lpescape.o lpovrtyp.o lpps.o -lX11 -ltermcap  -o elvis
ld: warning: directory not found for option '-L/lib'
ld: library not found for -lX11
clang: error: linker command failed with exit code 1 (use -v to see invocation)
make: *** [elvis] Error 1
{ryanmcquen:elvis-2.2_1-pre2}$