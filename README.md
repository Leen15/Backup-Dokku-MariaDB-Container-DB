# Backup-Dokku-MariaDB-Container-DB
Given a dokku container, it creates a folder with a backup of all connected dbs.

We use dokku-alt with mariaDB for our containers.
Every time we create a mysql DB we link it at needed container and at a default "mysql" container (that has only mysqladmin inside).

So, with this bash script you can backup all linked DBs given a container name and the path where you want to save them.

    bash dump_container_dbs.sh CONTAINER_NAME BACKUP_PATH

The bash script create a new folder in the BACKUP_PATH with today name and put inside all dumps **compressed**.
For create the folder in current path, you need to pass a dot "." in BACKUP_PATH.
