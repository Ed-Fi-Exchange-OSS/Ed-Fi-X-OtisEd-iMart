CREATE TABLE [tdw].[dim_Withdrawal] (
    [Withdrawal_Key]          INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]             VARBINARY (16) NOT NULL,
    [Withdrawal_Cd]           VARCHAR (30)   NOT NULL,
    [Withdrawal_Desc]         VARCHAR (254)  NULL,
    [Withdrawal_State_Cd]     VARCHAR (30)   NULL,
    [Withdrawal_State_Desc]   VARCHAR (254)  NULL,
    [Withdrawal_Sort_Order]   SMALLINT       NULL,
    [Date_Stamp]              DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]             VARBINARY (16) NOT NULL,
    [Last_Updated_T1]         DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind] CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Withdrawal] PRIMARY KEY CLUSTERED ([Withdrawal_Key] ASC)
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


