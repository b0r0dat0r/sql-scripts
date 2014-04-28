--Ищем сессии в которых идёт удаление из таблиц
SELECT 'ALTER SYSTEM KILL SESSION ''' || s.sid || ',' || s.serial# ||  ''' IMMEDIATE;' as s,
       p.spid,
       s.username,
       s.program,
       s.state,
       s.machine,
       s.command
FROM   gv$session s
       JOIN gv$process p ON p.addr = s.paddr AND p.inst_id = s.inst_id
WHERE  s.type != 'BACKGROUND' and s.program='JDBC Thin Client' and s.username='NNU' and s.machine='app2.aisgz.sci' and s.command='7' order by sid

