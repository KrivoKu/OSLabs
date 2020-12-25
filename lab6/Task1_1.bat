WMIC OS GET NAME,CAPTION,VERSION > C:\Lab6\SystemInfo.txt
WMIC COMPUTERSYSTEM GET totalphysicalmemory > C:\Lab6\MemoryInfo.txt
WMIC OS GET FreePhysicalMemory >> C:\Lab6\MemoryInfo.txt
WMIC LOGICALDISK GET NAME,DESCRIPTION,FREESPACE,FILESYSTEM >> C:\Lab6\DisksInfo.txt
