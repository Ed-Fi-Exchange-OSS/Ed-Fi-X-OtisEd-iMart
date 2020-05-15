CREATE TABLE [adw].[dim_Academic_Year] (
    [Academic_Year_Key]                INT           NOT NULL,
    [Academic_Year_Name]               CHAR (9)      NOT NULL,
    [Academic_Year_Short_Name]         CHAR (5)      NULL,
    [Start_Year]                       INT           NULL,
    [End_Year]                         INT           NULL,
    [Academic_Year_Nbr_Sequence]       INT           NULL,
    [State_Funded_School_Days_In_Year] INT           NULL,
    [Current_Academic_Year_Ind]        CHAR (1)      NULL,
    [Last_Updated_T1]                  DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Academic_Year] PRIMARY KEY CLUSTERED ([Academic_Year_Key] ASC)
);

