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
    "WarehouseId",
    "AreaId",
    "WarehouseAreaDescription",
    "WarehouseAreaIsActive",
    "WarehouseAreaLocationDescription", 
    "WarehouseLocationId",
    "TestId"
FROM "PLANTFLOOR"."PLANT"."vw_InventoryDetails_sf"
WHERE
     "IsAvailable" = 1
    // AND "QAStatusCode" = 'HLD'
    AND "PlantCode" IN ('4010')
    //AND "ProductionDate" between '2023-12-01' and '2023-12-31';
    //AND "AreaId" IN ('24', '25', '26', '31', '32', '6', '7');
    AND "WarehouseAreaDescription" IN ('SOUTH FREEZER', 'SOUTH COOLER', 'SOUTH BLAST', 'SOUTH TRANSFER', 'SOUTH CVA'); 

//('3500', '6005', '6010', '6015', '6020')