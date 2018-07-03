#!/bin/bash

# by piscue

# Setting variables
backup_path="/home/osmosys/backup/files"
target_path="saimanohar@10.0.0.239:/home/saimanohar/Documents/test-results/"
#backup_path="/home/core/backups"
tar_opts="--exclude='/var/run/*'"
cd "${BASH_SOURCE%/*}" || exit

mkdir -p $backup_path

echo starting docker backup

echo ""

echo - backing up images

echo ""

source  backup-images.sh

echo ""

#echo - backing up volumes

echo ""

#source backup-volumes.sh

echo ""

#echo - upload to dropbox

echo ""

#source sync-dropbox.sh

echo ""

# backup variables

# backup config

# backup something else?
