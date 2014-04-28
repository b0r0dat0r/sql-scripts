select --+ leading(s l) use_nl(s l)
l.SID locker
,l.ID1 locked_object
,s.sid locked_sid
,s.sql_id
,s.P1 --name|mode
,s.P1TEXT
,s.p2 --object #
,s.P2TEXT
,s.p3 --table/partition
,s.P3TEXT
,l.*
from v$session s
,v$lock l
where 
s.event='enq: TM - contention'
and l.type='TM'
and l.id1=s.p2
and l.REQUEST=0;
