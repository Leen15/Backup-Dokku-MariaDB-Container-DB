#!/bin/bash

CONTAINER=$1
BACKUP_PATH=$2


DBS="$(dokku mariadb:list $CONTAINER)"

#echo "${OUTPUT}"


today=`date +%Y-%m-%d`
today_path=$BACKUP_PATH/$today

if [ ! -d $today_path ]
then
  mkdir -p $today_path
fi


for DB in $DBS; do

  sql_file=$today_path/$DB-`date +%H%M`.sql
  tar_file=$today_path/$DB-`date +%H%M`.tar.gz

  echo "Creating dump for $DB..."
  dokku mariadb:dump $1 $DB > $sql_file

  tar zcf $tar_file $sql_file
  rm $sql_file

done

echo "Done."
