select usename,client_addr,state,query from pg_stat_activity;

SELECT pid, wait_event_type, wait_event FROM pg_stat_activity WHERE wait_event is NOT NULL;
