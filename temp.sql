/*
SELECT "PlantCode", "ProductionDate", "ProductId", "Shift", COUNT(*) "BoxesProduced", SUM(NetWeightCalculation) "NetWeight"
FROM PLANTFLOOR.PLANT."vwBoxProduction_sf"
Where "PlantCode" ='3500'
-- and "ProductionDate" BETWEEN DATEADD(day, -7, CURRENT_DATE()) AND CURRENT_DATE()
and "ProductionDate" = CURRENT_DATE()
AND "PartFamily" = 'FAB'
GROUP BY "PlantCode", "Shift", "ProductId", "ProductionDate";
-- ORDER BY PlantCode, "Shift", ProductId;
*/


//SELECT * FROM PLANTFLOOR.PLANT."ColdScaleCarcassSides"
//Where "KillDate" ='2023-01-02'
// and "PlantCode" ='3015';


//Select * From PLANTFLOOR."PLANT"."Plants";

SELECT * FROM ECSBEEFPORK.ECS."LegacyOrders"
Limit 10;