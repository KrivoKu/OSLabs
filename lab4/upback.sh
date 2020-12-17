#!/bin/bash

LBackupDate=$(ls $HOME | grep -E "^Backup-" | sort -n | tail -1| sed 's/^Backup-//')
LBackup="$HOME/Backup-${LBackupDate}"

if [[ -z $LBackupDate ]]; then
	echo "Backup was not found"
	exit 1
fi

if ! [[ -d $HOME/restore ]]; then
	mkdir $HOME/restore
else
	rm $HOME/restore
	mkdir $HOME/restore
fi

for file in $(ls $LBackup | grep -Ev "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$"); do
	cp "${LBackup}/${file}" "$HOME/restore/${file}"
	echo "Success!"
done
