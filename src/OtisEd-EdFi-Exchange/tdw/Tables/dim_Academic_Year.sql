CREATE TABLE [tdw].[dim_Academic_Year] (
    [Academic_Year_Key]                INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                      VARBINARY (16) NOT NULL,
    [Academic_Year_Name]               CHAR (9)       NOT NULL,
    [Academic_Year_Short_Name]         CHAR (5)       NULL,
    [Start_Year]                       INT            NULL,
    [End_Year]                         INT            NULL,
    [Academic_Year_Nbr_Sequence]       INT            NULL,
    [State_Funded_School_Days_In_Year] INT            NULL,
    [Current_Academic_Year_Ind]        CHAR (1)       NULL,
    [Date_Stamp]                       DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                      VARBINARY (16) NOT NULL,
    [Last_Updated_T1]                  DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]          CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Academic_Year] PRIMARY KEY CLUSTERED ([Academic_Year_Key] ASC)
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


