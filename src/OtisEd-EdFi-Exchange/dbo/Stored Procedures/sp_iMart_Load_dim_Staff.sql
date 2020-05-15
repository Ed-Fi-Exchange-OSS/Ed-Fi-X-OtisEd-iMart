﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Staff]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Staff]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Staff]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Local_Staff_Id], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Staff_Unique_Id], '?') + CHAR(9)
    + IsNull(A.[Staff_State_Id_Nbr], '?') + CHAR(9)
    + IsNull(A.[Staff_SSN], '?') + CHAR(9)
    + IsNull(A.[Staff_First_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Middle_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Last_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Name_Suffix], '?') + CHAR(9)
    + IsNull(A.[Staff_Full_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Preferred_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Sort_Name], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Staff_Birth_Date]), '?') + CHAR(9)
    + IsNull(A.[Staff_Gender_Cd], '?') + CHAR(9)
    + IsNull(A.[Staff_Gender_Desc], '?') + CHAR(9)
    + IsNull(A.[Staff_Primary_Ethnicity_Cd], '?') + CHAR(9)
    + IsNull(A.[Staff_Type_Cd], '?') + CHAR(9)
    + IsNull(A.[Staff_Type_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Hire_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Total_Salary_Amt]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Instruction_Salary_Amt]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Total_Contract_Hours]), '?') + CHAR(9)
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
    [Local_Staff_Id]=A.[Local_Staff_Id],
    [Staff_Unique_Id]=A.[Staff_Unique_Id],
    [Staff_State_Id_Nbr]=A.[Staff_State_Id_Nbr],
    [Staff_SSN]=A.[Staff_SSN],
    [Staff_First_Name]=A.[Staff_First_Name],
    [Staff_Middle_Name]=A.[Staff_Middle_Name],
    [Staff_Last_Name]=A.[Staff_Last_Name],
    [Staff_Name_Suffix]=A.[Staff_Name_Suffix],
    [Staff_Full_Name]=A.[Staff_Full_Name],
    [Staff_Preferred_Name]=A.[Staff_Preferred_Name],
    [Staff_Sort_Name]=A.[Staff_Sort_Name],
    [Staff_Birth_Date]=A.[Staff_Birth_Date],
    [Staff_Gender_Cd]=A.[Staff_Gender_Cd],
    [Staff_Gender_Desc]=A.[Staff_Gender_Desc],
    [Staff_Gender_Sort_Order]=A.[Staff_Gender_Sort_Order],
    [Staff_Primary_Ethnicity_Cd]=A.[Staff_Primary_Ethnicity_Cd],
    [Staff_Type_Cd]=A.[Staff_Type_Cd],
    [Staff_Type_Desc]=A.[Staff_Type_Desc],
    [Staff_Type_Sort_Order]=A.[Staff_Type_Sort_Order],
    [Hire_Date]=A.[Hire_Date],
    [Total_Salary_Amt]=A.[Total_Salary_Amt],
    [Instruction_Salary_Amt]=A.[Instruction_Salary_Amt],
    [Total_Contract_Hours]=A.[Total_Contract_Hours],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Staff] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Local_Staff_Id] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Local_Staff_Id] ORDER BY sd.[Date_Stamp] DESC),
    [Staff_Key_Temp]=k1.[Staff_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Staff_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Staff] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Staff_Key]=dm.[Staff_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record