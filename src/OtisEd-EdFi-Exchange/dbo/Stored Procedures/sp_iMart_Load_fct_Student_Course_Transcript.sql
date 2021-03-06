﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[TERM_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[STUDENT_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Term_Key]=T6.[TERM_KEY],
    [Student_Key]=T7.[STUDENT_KEY],
    [Batch_Key]=T17.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Term_Cd]=A.[Term_Cd],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Letter_Grade]=A.[Letter_Grade],
    [Numeric_Grade]=A.[Numeric_Grade],
    [Credit_Attempted]=A.[Credit_Attempted],
    [Credit_Earned]=A.[Credit_Earned],
    [Quality_Points_Earned]=A.[Quality_Points_Earned],
    [Grade_Point_Max]=A.[Grade_Point_Max],
    [Passing_Grade_Ind]=A.[Passing_Grade_Ind],
    [Content_Completer_Ind]=A.[Content_Completer_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Student_Course_Transcript] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Term] T6
     ON T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
    AND T6.[Term_Cd]=A.[Term_Cd]

LEFT OUTER JOIN [tdw].[dim_Student] T7
     ON T7.[Local_Student_Id]=A.[Local_Student_Id]
    AND T7.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Batch] T17
     ON T17.[Batch_Period]=A.[Batch_Period]
    AND T17.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Student_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Term_Key], sd.[Student_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Student_Course_Grade_Key_Temp]=k1.[Student_Course_Grade_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Student_Course_Grade_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Student_Course_Transcript] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Student_Course_Grade_Key]=dm.[Student_Course_Grade_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record