CREATE TABLE [conform].[dim_Academic_Year] (
    [Academic_Year_Name]               CHAR (9)      NULL,
    [Academic_Year_Short_Name]         CHAR (5)      NULL,
    [Start_Year]                       INT           NULL,
    [End_Year]                         INT           NULL,
    [Academic_Year_Nbr_Sequence]       INT           NULL,
    [State_Funded_School_Days_In_Year] INT           NULL,
    [Current_Academic_Year_Ind]        CHAR (1)      NULL,
    [Batch_Period]                     VARCHAR (50)  NULL,
    [SAID]                             VARCHAR (30)  NULL,
    [Date_Stamp]                       DATETIME2 (7) NULL
);

