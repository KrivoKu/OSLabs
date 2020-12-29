FORFILES C:\WINDOWS /C "cmd if @fsize>1048576 copy @path \\%COMPUTERNAME\temp"
