cls
java -cp ..\sictools.jar sic.Asm .\fact.asm
java -cp ..\sictools.jar sic.Asm ..\SIC_LIB\stack.asm
java -cp ..\sictools.jar sic.Asm ..\SIC_LIB\screen.asm
java -cp ..\sictools.jar sic.Asm ..\SIC_LIB\std.asm
java -cp ..\sictools.jar sic.Link -o .\main.obj -m main .\fact.obj ..\SIC_LIB\stack.obj ..\SIC_LIB\screen.obj ..\SIC_LIB\std.obj
