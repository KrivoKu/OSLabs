NET STOP dnscache
timeout 30
SC QUERY > newSCs.txt
START Task3_check.bat
NET START dnscache
