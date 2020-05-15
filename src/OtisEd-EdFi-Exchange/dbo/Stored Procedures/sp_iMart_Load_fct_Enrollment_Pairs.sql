﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]

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
    + IsNull(CONVERT(VARCHAR, T6.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[STUDENT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[ENROLLMENT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[DATE_KEY]), '?') + CHAR(9)
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
    [Calendar_Track_Key]=T6.[CALENDAR_TRACK_KEY],
    [Student_Key]=T7.[STUDENT_KEY],
    [Enrollment_Key]=T8.[ENROLLMENT_KEY],
    [Enrollment_Date_Key]=T9.[DATE_KEY],
    [Withdrawal_Key]=T10.[WITHDRAWAL_KEY],
    [Withdrawal_Date_Key]=T11.[DATE_KEY],
    [Batch_Key]=T24.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Enrollment_Cd]=A.[Enrollment_Cd],
    [Enrollment-Date_Of_Day]=A.[Enrollment-Date_Of_Day],
    [Withdrawal_Cd]=A.[Withdrawal_Cd],
    [Withdrawal-Date_Of_Day]=A.[Withdrawal-Date_Of_Day],
    [Serving_District_Id]=A.[Serving_District_Id],
    [Resident_District_Id]=A.[Resident_District_Id],
    [Enrollment_Date]=A.[Enrollment_Date],
    [Withdrawal_Date]=A.[Withdrawal_Date],
    [Enrolled_Grade_Level]=A.[Enrolled_Grade_Level],
    [Current_Enrollment_Ind]=A.[Current_Enrollment_Ind],
    [Percent_Enrolled]=A.[Percent_Enrolled],
    [Enrollment_Count]=A.[Enrollment_Count],
    [No_Show_Count]=A.[No_Show_Count],
    [Calendar_Days_Enrolled]=A.[Calendar_Days_Enrolled],
    [FullYear_Enrollment_Count]=A.[FullYear_Enrollment_Count],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Enrollment_Pairs] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T6
     ON T6.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Student] T7
     ON T7.[Local_Student_Id]=A.[Local_Student_Id]
    AND T7.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Enrollment] T8
     ON T8.[Enrollment_Cd]=A.[Enrollment_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T9
     ON T9.[Date_Of_Day]=A.[Enrollment-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Withdrawal] T10
     ON T10.[Withdrawal_Cd]=A.[Withdrawal_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T11
     ON T11.[Date_Of_Day]=A.[Withdrawal-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Batch] T24
     ON T24.[Batch_Period]=A.[Batch_Period]
    AND T24.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Enrollment_Key] IS NULL OR sd.[Enrollment_Date_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Enrollment_Key] IS NULL OR sd.[Enrollment_Date_Key] IS NULL OR sd.[Withdrawal_Key] IS NULL OR sd.[Withdrawal_Date_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Calendar_Track_Key], sd.[Student_Key], sd.[Enrollment_Key], sd.[Enrollment_Date_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Enrollment_Pairs_Key_Temp]=k1.[Enrollment_Pairs_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Enrollment_Pairs_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Enrollment_Pairs] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Enrollment_Pairs_Key]=dm.[Enrollment_Pairs_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record