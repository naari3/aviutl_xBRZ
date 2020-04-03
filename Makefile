MKDIR = cmd.exe /C mkdir
RMDIR = cmd.exe /C rmdir /s /q
RM = cmd.exe /C del
CP = cmd.exe /C copy

.PHONY:
	build clean

build:
	$(MKDIR) aviutl_xBRZ
	$(CP) .\\xBRZ_dll\\Release\\XBRZ.dll .\\aviutl_xBRZ\\xBRZ.dll
	$(CP) .\\xBRZ_anm\\xBRZ.* .\\aviutl_xBRZ\\
	zip -r aviutl_xBRZ.zip aviutl_xBRZ
clean:
	-$(RMDIR) .\\aviutl_xBRZ 
	-$(RM) .\\aviutl_xBRZ.zip