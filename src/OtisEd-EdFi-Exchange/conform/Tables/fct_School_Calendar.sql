CREATE TABLE [conform].[fct_School_Calendar] (
    [Academic_Year_Name]       CHAR (9)      NULL,
    [District_Id]              VARCHAR (16)  NULL,
    [School_Id]                VARCHAR (16)  NULL,
    [Date_Of_Day]              DATE          NULL,
    [Calendar_Track_Cd]        VARCHAR (30)  NULL,
    [Calendar_Track_School_Id] VARCHAR (16)  NULL,
    [Calendar_Day_Type_Cd]     VARCHAR (30)  NULL,
    [Cycle_Day_Cd]             VARCHAR (30)  NULL,
    [Calendar_Date]            DATE          NULL,
    [School_Day_Num]           INT           NULL,
    [Occurrence]               SMALLINT      NULL,
    [Batch_Period]             VARCHAR (50)  NULL,
    [SAID]                     VARCHAR (30)  NULL,
    [Date_Stamp]               DATETIME2 (7) NULL,
    [SourceIdentifier]         VARCHAR (50)  NULL
);

