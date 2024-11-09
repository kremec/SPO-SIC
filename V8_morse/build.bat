cls
java -cp ..\sictools.jar sic.Asm .\morse.asm
java -cp ..\sictools.jar sic.Asm ..\SIC_LIB\stack.asm
java -cp ..\sictools.jar sic.Link -o .\main.obj -m main .\morse.obj ..\SIC_LIB\stack.obj
