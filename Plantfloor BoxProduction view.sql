

select "PlantCode", "ProductionDate", count(*)
from PLANTFLOOR.PLANT."vwBoxProduction_sf"
where "CommonProductCode" = '56606'
and "ProductionDate" between '2023-08-15' and '2023-09-12'
and "PlantCode" = '4510'
group by "PlantCode", "ProductionDate"
having count(*)>1
;