CREATE TABLE [tdw].[dim_Date] (
    [Date_Key]                 INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]              VARBINARY (16) NOT NULL,
    [Date_Record_Type]         CHAR (1)       NULL,
    [Year_Name]                CHAR (4)       NULL,
    [Year_Number_Sequence]     INT            NULL,
    [Year_Begin_Date]          DATE           NULL,
    [Year_End_Date]            DATE           NULL,
    [Days_In_Year]             SMALLINT       NULL,
    [Quarter_Name]             CHAR (2)       NULL,
    [Year_Quarter_Name]        CHAR (7)       NULL,
    [Quarter_Number_In_Year]   TINYINT        NULL,
    [Quarter_Number_Sequence]  INT            NULL,
    [Quarter_Begin_Date]       DATE           NULL,
    [Quarter_End_Date]         DATE           NULL,
    [Days_In_Quarter]          TINYINT        NULL,
    [Month_Name]               VARCHAR (9)    NULL,
    [Month_Year_Name]          VARCHAR (14)   NULL,
    [Year_Month_Yyyy_Mm]       CHAR (7)       NULL,
    [Month_Abbr]               CHAR (3)       NULL,
    [Month_Year_Abbr]          CHAR (8)       NULL,
    [Month_Number_In_Year]     TINYINT        NULL,
    [Month_Number_In_Quarter]  TINYINT        NULL,
    [Month_Number_Sequence]    INT            NULL,
    [Month_Begin_Date]         DATE           NULL,
    [Month_End_Date]           DATE           NULL,
    [Days_In_Month]            TINYINT        NULL,
    [Week_Name]                CHAR (7)       NULL,
    [Week_Abbr]                CHAR (4)       NULL,
    [Year_Week_Name]           CHAR (12)      NULL,
    [Year_Week_Abbr]           CHAR (9)       NULL,
    [Week_Desc_Short]          CHAR (19)      NULL,
    [Week_Desc]                CHAR (32)      NULL,
    [Week_Begin_Date]          DATE           NULL,
    [Week_End_Date]            DATE           NULL,
    [Week_Number_In_Year]      TINYINT        NULL,
    [Week_Number_Sequence]     INT            NULL,
    [Date_Of_Day]              DATE           NOT NULL,
    [Date_String]              CHAR (10)      NULL,
    [Date_Desc]                VARCHAR (30)   NULL,
    [Date_Desc_Short]          CHAR (16)      NULL,
    [Day_Number_In_Year]       SMALLINT       NULL,
    [First_Day_In_Year_Ind]    CHAR (1)       NULL,
    [Last_Day_In_Year_Ind]     CHAR (1)       NULL,
    [Day_Number_In_Quarter]    TINYINT        NULL,
    [First_Day_In_Quarter_Ind] CHAR (1)       NULL,
    [Last_Day_In_Quarter_Ind]  CHAR (1)       NULL,
    [Day_Number_In_Month]      TINYINT        NULL,
    [First_Day_In_Month_Ind]   CHAR (1)       NULL,
    [Last_Day_In_Month_Ind]    CHAR (1)       NULL,
    [Weekday_Name]             CHAR (9)       NULL,
    [Weekday_Abbr]             CHAR (3)       NULL,
    [Day_Number_In_Week]       TINYINT        NULL,
    [First_Day_In_Week_Ind]    CHAR (1)       NULL,
    [Last_Day_In_Week_Ind]     CHAR (1)       NULL,
    [Day_Number_Sequence]      INT            NULL,
    [Weekday_Ind]              CHAR (1)       NULL,
    [Date_Stamp]               DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]              VARBINARY (16) NOT NULL,
    [Last_Updated_T1]          DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]  CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Date] PRIMARY KEY CLUSTERED ([Date_Key] ASC)
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



GO



GO



GO


