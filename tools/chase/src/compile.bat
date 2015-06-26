@echo off

set name="Chase.nes"

set path=%path%;..\bin\

set CC65_HOME=..\

cc65 -Oi game.c --add-source
ca65 crt0.s
ca65 game.s

ld65 -C nrom_128_horz.cfg -o %name% crt0.o game.o runtime.lib

pause

del *.o
del game.s

%name%