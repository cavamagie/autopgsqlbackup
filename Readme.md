
docker based on debian that use a script autopgsqlbackup to manage a schedule backup of a postgres docker


autopgsqlbackup
## Table of contents

- [Getting started](#getting-started)
  - [usind docker-compose](#docker-compose.yml)
  - [dafault backup rotation](#dafault backup rotation)


## Getting started

### docker-compose.yml
```yml


  postgres:
    image: postgres:9.6
    ports:
      - "127.0.0.1:5432:5432"
    restart: unless-stopped
    volumes:
      - /pgdata:/var/lib/postgresql/data:Z
      - /pgbackup:/var/lib/postgresql/pgbackup:Z
    environment:
      POSTGRES_USER: user
      POSTGRES_PASSWORD: password
      POSTGRES_DB: database
      PGDATA: /var/lib/postgresql/data/pgdata

  pgbackups2:
    image: cavamagie/autopgsqlbackup
    restart: unless-stopped
    volumes:
      - /pgbackup:/backups:Z
    links:
      - postgres
    depends_on:
      - postgres
    environment:
      POSTGRES_HOST: postgres
      POSTGRES_DB: database
      POSTGRES_USER: user
      PGPASSWORD: password
```


### dafault backup rotation 
```yml
 Daily Backups are rotated weekly..
 Weekly Backups are run by default on Saturday Morning when
 Weekly Backups are rotated on a 5 week cycle..
 Monthly Backups are run on the 1st of the month..
 Monthly Backups are NOT rotated automatically...
 It may be a good idea to copy Monthly backups offline or to another
 server..
```
