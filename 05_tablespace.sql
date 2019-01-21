\echo =================================
\echo TABLESPACES 
\echo =================================

SELECT t.spcname, u.usename as owner
FROM pg_tablespace t, pg_user u
WHERE t.spcowner = u.usesysid;
