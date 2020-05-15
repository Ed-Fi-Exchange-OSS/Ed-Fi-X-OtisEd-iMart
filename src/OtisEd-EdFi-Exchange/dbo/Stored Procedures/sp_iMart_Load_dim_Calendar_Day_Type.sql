﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Day_Type_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Day_Type_Desc], '?') + CHAR(9)
    + IsNull(A.[School_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Holiday_Ind], '?') + CHAR(9)
    + IsNull(A.[Staff_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Calendar_Day_Type_Planned_Make_Up_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Calendar_Day_Type_Actual_Make_Up_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Calendar_Day_Type_Inclement_Weather_Day_Ind], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Calendar_Day_Type_Cd]=A.[Calendar_Day_Type_Cd],
    [Calendar_Day_Type_Desc]=A.[Calendar_Day_Type_Desc],
    [Calendar_Day_Type_Sort_Order]=A.[Calendar_Day_Type_Sort_Order],
    [School_Day_Ind]=A.[School_Day_Ind],
    [Holiday_Ind]=A.[Holiday_Ind],
    [Staff_Day_Ind]=A.[Staff_Day_Ind],
    [Calendar_Day_Type_Planned_Make_Up_Day_Ind]=A.[Calendar_Day_Type_Planned_Make_Up_Day_Ind],
    [Calendar_Day_Type_Actual_Make_Up_Day_Ind]=A.[Calendar_Day_Type_Actual_Make_Up_Day_Ind],
    [Calendar_Day_Type_Inclement_Weather_Day_Ind]=A.[Calendar_Day_Type_Inclement_Weather_Day_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Calendar_Day_Type] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Calendar_Day_Type_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Calendar_Day_Type_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Calendar_Day_Type_Key_Temp]=k1.[Calendar_Day_Type_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Calendar_Day_Type_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Calendar_Day_Type] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Calendar_Day_Type_Key]=dm.[Calendar_Day_Type_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record