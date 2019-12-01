md5sum.exe: md5sum.d Makefile
	dmd -O -release -ofmd5sum.exe md5sum.d

clean:
	del *.obj
	del md5sum.exe
