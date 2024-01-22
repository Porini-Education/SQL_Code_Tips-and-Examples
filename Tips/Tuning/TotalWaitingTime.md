# Total time spent waiting for CPU (signal waits) and the total time spent waiting for resources (resource waits)

In the **sys.dm_os_wait_stats** dynamic management view:

- `wait_time_ms` column represents the total wait time for each wait type in milliseconds. 
- `signal_wait_time_ms` column represents the time that threads spent in the runnable queue waiting for CPU.

**Note:** The counters are reset whenever the SQL Server service is restarted.

To reset manually the counters execute DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR).

Additionally, they can be manually reset by running the following command:

```sql
DBCC SQLPERF('sys.dm_os_wait_stats', CLEAR);
```

This command clears all the wait statistics, setting them back to 0. Be careful when using this command, as it can impact any monitoring or troubleshooting efforts that rely on these statistics. It's generally recommended to only clear wait statistics in a controlled manner and when you understand the implications.

```SQL
SELECT 
    '%signal (cpu) waits' = CAST(100.0 * SUM(signal_wait_time_ms) / SUM (wait_time_ms) AS NUMERIC(20,2)),
    resource_wait_time_ms=SUM(wait_time_ms - signal_wait_time_ms),
    '%resource waits'= CAST(100.0 * SUM(wait_time_ms - signal_wait_time_ms) / SUM (wait_time_ms) AS NUMERIC(20,2))
FROM 
    sys.dm_os_wait_stats
```
