CREATE TABLE [tdw].[dim_Cycle_Day] (
    [Cycle_Day_Key]           INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]             VARBINARY (16) NOT NULL,
    [Cycle_Day_Cd]            VARCHAR (30)   NOT NULL,
    [Cycle_Day_Desc]          VARCHAR (254)  NULL,
    [Cycle_Day_Sort_Order]    SMALLINT       NULL,
    [Date_Stamp]              DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]             VARBINARY (16) NOT NULL,
    [Last_Updated_T1]         DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind] CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Cycle_Day] PRIMARY KEY CLUSTERED ([Cycle_Day_Key] ASC)
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


