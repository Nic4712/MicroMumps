@echo off
del MUMPS.COM
del MUMPSB.COM
del SETMUMPS.COM
del SETGLOB.COM
echo ++++++++++++++++++ Building MUMPS.COM
tniasm mumps.asm
echo ++++++++++++++++++ Building MUMPSB.COM
tniasm mumpsb.asm
echo ++++++++++++++++++ Building SETMUMPS.COM
tniasm setmumps.asm
echo ++++++++++++++++++ Building SETGLOB.COM
tniasm setglob.asm
del tniasm.out
del tniasm.tmp
del tniasm.sym