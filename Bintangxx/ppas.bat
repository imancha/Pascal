@echo off
c:\progra~1\dev-pas\bin\ldw.exe  C:\Users\Imancha\DOCUME~1\iProject\Pascal\BINTAN~3\rsrc.o -s   -o c:\users\imancha\docume~1\iproject\pascal\bintan~3\bintan~1.exe link.res exp.$$$
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
