MKDIR = cmd.exe /C mkdir
RMDIR = cmd.exe /C rmdir /s /q
RM = cmd.exe /C del
CP = cmd.exe /C copy

TARGET_DIR = xBRZ

.PHONY:
	build clean

build:
	$(MKDIR) $(TARGET_DIR)
	$(CP) .\\xBRZ_dll\\Release\\xBRZ.dll .\\$(TARGET_DIR)\\
	$(CP) .\\xBRZ_anm\\xBRZ.* .\\$(TARGET_DIR)\\
	zip -r aviutl_xBRZ.zip $(TARGET_DIR)
clean:
	-$(RMDIR) .\\$(TARGET_DIR) 
	-$(RM) .\\aviutl_xBRZ.zip