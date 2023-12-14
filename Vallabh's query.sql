SELECT
"PlantCode",
    "CommonProductCode",
    "Description",
    "ProductionDate",
    "AGE",
    "InventoryStatusId",
    "QAStatusCode",
    "QAReasonDescription",
    "PalletNumber",
    "Barcode",
    "Weight",
    "WarehouseLocationId",
    "ExitDate",
    "QAReasonCode",
    "HoldTag",
    "USDATag",
    "InventoryCasesQAStatuses_CreatedBy",
    "InventoryCasesQAStatuses_CreatedDate",
    "InventoryCasesQAStatuses_ModifiedBy",
    "InventoryCasesQAStatuses_ModifiedDate",
    "IsAvailable",
    "TestId"
FROM "PLANTFLOOR"."PLANT"."vw_InventoryDetails_sf"
WHERE
"IsAvailable" = 1
    AND "QAStatusCode" = 'HLD'
    AND "PlantCode" IN ('6010')
    And "ProductionDate" between '2022-01-01' and '2023-12-13'; 

//('3500', '6005', '6010', '6015', '6020')