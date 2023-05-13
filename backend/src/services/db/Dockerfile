FROM postgres:14.7-alpine as base

EXPOSE 5432

# Edit script locations below
# they're ran in ascending order
# e.g. 1.sql over 2.sql
#  - ./db/create-tables.sql:/docker-entrypoint-initdb.d/1.sql
COPY ./scripts/create-tables.sql /docker-entrypoint-initdb.d/1.sql
COPY ./scripts/seed-tables.sql /docker-entrypoint-initdb.d/2.sql
