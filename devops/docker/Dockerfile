FROM postgres:13.3-alpine
ADD ./postgresql.conf /etc/postgresql/postgresql.conf
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]