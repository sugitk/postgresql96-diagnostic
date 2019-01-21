select t.spcname, u.usename as owner
from pg_tablespace t, pg_user u
where t.spcowner = u.usesysid;
