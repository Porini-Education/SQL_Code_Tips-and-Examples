/* 
Demo At Time Zone
*/

SELECT CONVERT(datetime, '20180701 14:00') AT TIME ZONE 'Central European Standard Time';   -- ora legale 
SELECT CONVERT(datetime, '20181101 14:00') AT TIME ZONE 'Central European Standard Time';   -- ora solare

-- From UTC to Rome timezone
select Convert(datetime,  convert(datetime,'20180701 14:00') at time zone 'UTC' at time zone 'Central European Standard Time', 0)
select Convert(datetime,  convert(datetime,'20181101 14:00') at time zone 'UTC' at time zone 'Central European Standard Time', 0)

select SysUtcDateTime()
select Convert(datetime,  SysUtcDateTime() at time zone 'UTC' at time zone 'Central European Standard Time', 0)
