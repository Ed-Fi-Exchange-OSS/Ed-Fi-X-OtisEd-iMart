CREATE TABLE [adw].[dim_Withdrawal] (
    [Withdrawal_Key]        INT           NOT NULL,
    [Withdrawal_Cd]         VARCHAR (30)  NOT NULL,
    [Withdrawal_Desc]       VARCHAR (254) NULL,
    [Withdrawal_State_Cd]   VARCHAR (30)  NULL,
    [Withdrawal_State_Desc] VARCHAR (254) NULL,
    [Withdrawal_Sort_Order] SMALLINT      NULL,
    [Last_Updated_T1]       DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Withdrawal] PRIMARY KEY CLUSTERED ([Withdrawal_Key] ASC)
);

