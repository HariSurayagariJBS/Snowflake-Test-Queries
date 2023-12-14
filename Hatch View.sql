CREATE OR REPLACE VIEW "vwHatch"(
"GrowoutNo",
"HatcheryNo",
"MonthEndDate",
"FiscalYear",
"FiscalMonth",
"ChicksHatched",
"EggsSet"
) AS
SELECT GC."GrowoutNo", H."HatcheryNo", FC."EndDate" as "MonthEndDate", FC."FiscalYear", FC."xMonth" as "FiscalMonth",
   Sum(HT."U_SaleableSR" - HT."U_CullFemales" - HT."U_CullMales") AS "ChicksHatched", Sum(HT."EggsSet") AS "EggsSet"
FROM MTECHPOULTRY.MTP."HimHatchTrans" as HT
INNER JOIN MTECHPOULTRY.MTP."ProteinFacilityHatcheries" as H
   ON HT."ProteinFacilityHatcheriesIRN" = H.IRN
INNER JOIN MTECHPOULTRY.MTP."MtFiscalCalendar" as FC
   ON HT."xDate" >= FC."BegDate" and HT."xDate" <= FC."EndDate" and FC."BegDate" >= DateAdd(yy, -1, GetDate())
INNER JOIN MTECHPOULTRY.MTP."ProteinCostCenters" as CC
   ON H."ProteinCostCentersIRN" = CC."IRN"
INNER JOIN MTECHPOULTRY.MTP."ProteinDivisions" as PD
   ON CC."ProteinDivisionsIRN" = PD."IRN"
INNER JOIN MTECHPOULTRY.MTP."ProteinGrowoutCodes" as GC
   ON GC."ProteinDivisionsIRN" = PD."IRN"
GROUP BY GC."GrowoutNo", H."HatcheryNo", FC."EndDate", FC."FiscalYear", FC."xMonth";