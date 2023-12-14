 
SELECT "EMPLOYEEID", "APPLYDTM", count(*)
from JBSKRONOS.KRP."WFCTOTAL"
where 
    "APPLYDTM" = '2023-10-26'
group by
  "EMPLOYEEID",   
  "APPLYDTM"
having count(*)>1;


/*
select distinct *
from JBSKRONOS.KRP."WFCTOTAL"
where
  "EMPLOYEEID" like '572331'
  and "APPLYDTM" = '2023-09-03';
*/  