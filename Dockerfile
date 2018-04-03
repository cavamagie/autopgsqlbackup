FROM debian

RUN set -x \
	&& apt-get update && apt-get install -y --no-install-recommends ca-certificates curl postgresql-client && rm -rf /var/lib/apt/lists/* \
	&& apt-get purge -y --auto-remove ca-certificates && apt-get clean

ENV POSTGRES_DB **None**
ENV POSTGRES_HOST **None**
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER **None**
ENV POSTGRES_EXTRA_OPTS '-Z9'
ENV SCHEDULE '@daily'
ENV SCHEDULE2 '@daily'
ENV BACKUP_DIR '/backups'
ENV BACKUP_KEEP_DAYS 7
ENV BACKUP_KEEP_WEEKS 4
ENV BACKUP_KEEP_MONTHS 6
ENV PGPASSWORD **None**

COPY autopgsqlbackup.sh go-cron ./

RUN chmod -R 777 autopgsqlbackup.sh go-cron


VOLUME /backups

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["exec ./go-cron -s \"$SCHEDULE\" -p 80 -- /autopgsqlbackup.sh"]

HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
