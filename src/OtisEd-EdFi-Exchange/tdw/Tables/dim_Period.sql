CREATE TABLE [tdw].[dim_Period] (
    [Period_Key]                      INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                     VARBINARY (16) NOT NULL,
    [Period_School_Id]                VARCHAR (16)   NOT NULL,
    [Period_Cd]                       VARCHAR (30)   NOT NULL,
    [Period_Desc]                     VARCHAR (254)  NULL,
    [Period_Sort_Order]               SMALLINT       NULL,
    [Period_Start_Time]               TIME (7)       NULL,
    [Period_End_Time]                 TIME (7)       NULL,
    [Period_Noninstructional_Minutes] SMALLINT       NULL,
    [Date_Stamp]                      DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                     VARBINARY (16) NOT NULL,
    [Last_Updated_T1]                 DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]         CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Period] PRIMARY KEY CLUSTERED ([Period_Key] ASC)
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


