// The code is creating or replacing a SQL view named `vsBroilerSettlement`.

CREATE OR REPLACE VIEW "vwBroilerSettlement"(
"GrowoutNo",
"MonthEndDate",
"FiscalYear",
"FiscalMonth",
"GrossWeight",
"ChickCost",
"FeedNetTotal",
"FeedCost",
"NewHouseIncentive",
"AuditBonus",
"PayAdjustment",
"AdditionalPay",
"PerfAdj",
"FuelBonus", 
"GrossPay",
"TotalPayAmount"
) AS
SELECT GC."GrowoutNo", FC."EndDate" as "MonthEndDate", FC."FiscalYear", FC."xMonth" as "FiscalMonth", 
   Sum(GS."GrossWeight") as "GrossWeight", Sum(GS."ChickCost") as "ChickCost", Sum(GS."FeedDelivered" - GS."FeedReturns") as "FeedNetTotal",
   Sum(GS."FeedCost") as "FeedCost", Sum(GS."NHABonusPay") as "NewHouseIncentive", Sum(GS."AuditBonus") as "AuditBonus", Sum(GS."PayAdjustment") as "PayAdjustment", 
   Sum(GS."AdditionalPay") as "AdditionalPay", Sum(GS."PerformanceAdjustment") as "PerfAdj", Sum(GS."FuelBonusPay") as "FuelBonus", 
   Sum(GS."AuditBonus" + GS."PayAdjustment" + GS."AdditionalPay" + GS."PerformanceAdjustment" + GS."FuelBonusPay" + GS."BasePay") as "GrossPay",
   Sum(GS."AuditBonus" + GS."PayAdjustment" + GS."AdditionalPay" + GS."PerformanceAdjustment" + GS."FuelBonusPay" + GS."BasePay" + GS."NHABonusPay") as "TotalPayAmount"
FROM MTECHPOULTRY.MTP."BrimGrowSettlements" as GS
INNER JOIN MTECHPOULTRY.MTP."MtFiscalCalendar" as FC
   ON GS."SettlementDate" >= FC."BegDate" and GS."SettlementDate" <= FC."EndDate" and FC."BegDate" >= DateAdd(yy, -1, GetDate())
INNER JOIN MTECHPOULTRY.MTP."ProteinDivisions" PD
   ON GS."ProteinDivisionsIRN" = PD."IRN"
INNER JOIN MTECHPOULTRY.MTP."ProteinGrowoutCodes" GC
   ON GC."ProteinDivisionsIRN" = PD."IRN"
GROUP BY GC."GrowoutNo", FC."EndDate", FC."FiscalYear", FC."xMonth";