
SELECT "CarcassId", "PlantCode", "KillDate", "SideNumber", "RealizationCode", count(*)
from PLANTFLOOR.PLANT."ColdScaleCarcassSideRealizationCodes"
group by
  "CarcassId",
  "PlantCode",
  "KillDate", 
  "SideNumber",
  "RealizationCode"
having count(*)>1;

