CREATE TABLE [tdw].[fct_Enrollment_Pairs] (
    [Enrollment_Pairs_Key]      INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]               VARBINARY (16) NOT NULL,
    [Academic_Year_Key]         INT            NOT NULL,
    [District_Key]              INT            NOT NULL,
    [School_Key]                INT            NOT NULL,
    [Calendar_Track_Key]        INT            NOT NULL,
    [Student_Key]               INT            NOT NULL,
    [Enrollment_Key]            INT            NOT NULL,
    [Enrollment_Date_Key]       INT            NOT NULL,
    [Withdrawal_Key]            INT            NULL,
    [Withdrawal_Date_Key]       INT            NULL,
    [Serving_District_Id]       VARCHAR (16)   NULL,
    [Resident_District_Id]      VARCHAR (16)   NULL,
    [Enrollment_Date]           DATE           NULL,
    [Withdrawal_Date]           DATE           NULL,
    [Enrolled_Grade_Level]      VARCHAR (30)   NULL,
    [Current_Enrollment_Ind]    CHAR (1)       NULL,
    [Percent_Enrolled]          DECIMAL (9, 2) NULL,
    [Enrollment_Count]          SMALLINT       NULL,
    [No_Show_Count]             SMALLINT       NULL,
    [Calendar_Days_Enrolled]    SMALLINT       NULL,
    [FullYear_Enrollment_Count] TINYINT        NULL,
    [Date_Stamp]                DATETIME2 (7)  NOT NULL,
    [Batch_Key]                 INT            NOT NULL,
    [No_Longer_In_Source_Ind]   CHAR (1)       NOT NULL,
    [Date_First_Seen]           DATETIME2 (7)  NOT NULL,
    [Date_Last_Seen]            DATETIME2 (7)  NOT NULL,
    [SourceIdentifier]          VARCHAR (50)   NULL,
    CONSTRAINT [PK_fct_Enrollment_Pairs] PRIMARY KEY CLUSTERED ([Enrollment_Pairs_Key] ASC)
);




GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
CREATE NONCLUSTERED INDEX [Idx_HashKey]
    ON [tdw].[fct_Enrollment_Pairs]([Hash_Key_BK] ASC);

