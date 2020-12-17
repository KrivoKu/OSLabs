#!/bin/bash

LBackupDate=$(ls $HOME|grep -e "^Backup-"|sort -n|tail-1|sed "s/Backup-//")
LBackup="$HOME/Backup-${LBackupDate"
Today=$(date +"%Y-%m-%d")
NowTimes=$(date -d "$Today"+"%s")
LBackupTimes=$(date -d "$Today"+"%s")
Totaltime=$(echo "(${NowTimes} - ${LBackupTimes})/60/60/24"|bc)
Report = $HOME/.backup-report

if ! [[ -d ~/source ]]; then
	mkidr ~/source
fi

if (( $Totaltime > 7)) || [[ -z $LBackupDate ]]; then
	mkdir "$HOME/Backup-${Today}"
	for obj in $(ls $HOME/source); do
		cp "$HOME/source/$obj	
	done
	flist=$(ls $HOME/source | sed "s/^/\t/")
	echo -e "${Today}, Created:\n${flist}" >> $Report
else
	changes=""
	for obj in $(ls $HOME/source); do
		if [[ -f "LBackup/$obj" ]]; then
			sourceSize=$(wc -c "$HOME/source/${obj}"|awk '{print $1}'
			BackupSize=$(wc -c "${LBackup}/${obj}"|awk '{print $1}'
			TotalSize=$(echo "${sourceSize}-${BackupSzie}"|bc)
			if [[ $TotalSize != 0 ]]; then
				mv "$LBackup/$obj" "$LBackup/$obj.$Today"
				cp "$HOME/source/$obj" $LBackup
				changes="${changes}\n\t$obj ($obj.$Today)"
			fi
		else
			cp "$HOME/source/$obj" $LBackup
			changes="${changes}\n\t$obj"
		fi
		done
	changes=$(echp $changes | sed 's/^\\n//')
	if [[ ! -z "$changes" ]]; then
		echo -e "${LBackupDate}, Updated:\n${changes}" >> $Report
	fi
fi
