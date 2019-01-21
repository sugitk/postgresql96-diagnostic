\echo =================================
\echo MEMORY USAGE
\echo =================================

-- https://www.slideshare.net/AlexeyBashtanov/postgresql-and-ram-usage
do $do$
declare
  l_command text :=
    $p$ cat /proc/$p$ || pg_backend_pid() || $p$/smaps $p$ ||
    $p$ | grep '^Private' $p$ ||
    $p$ | awk '{a+=$2}END{print a * 1024}' $p$;
begin
  create temp table if not exists z (a int);
  execute 'copy z from program ' || quote_literal(l_command);
  raise notice '%', (select pg_size_pretty(sum(a)) from z);
  drop table z;
end;
$do$;

