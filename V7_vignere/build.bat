cls
java -cp ..\sictools.jar sic.Asm .\vignere.asm
java -cp ..\sictools.jar sic.Asm ..\SIC_LIB\stack.asm
java -cp ..\sictools.jar sic.Asm ..\SIC_LIB\std.asm
java -cp ..\sictools.jar sic.Link -o .\main.obj -m main .\vignere.obj ..\SIC_LIB\stack.obj ..\SIC_LIB\std.obj
