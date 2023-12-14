SELECT "PlantCode", "ProductId", count(*)
from PLANTFLOOR.PLANT."Products"
group by
  "PlantCode",
  "ProductId"
having count(*)>1;



select distinct *
from PLANTFLOOR.PLANT."Products"
where
  "PlantCode" like '7800'
  and "ProductId" like '500353831';