drop schema public CASCADE;
create schema public;
\i docker-entrypoint-initdb.d/ddl.sql
\i docker-entrypoint-initdb.d/triggers.sql
\i docker-entrypoint-initdb.d/dml.sql
\i docker-entrypoint-initdb.d/usuarioBanco.sql
