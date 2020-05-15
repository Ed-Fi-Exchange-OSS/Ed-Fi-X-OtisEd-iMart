CREATE TABLE [conform].[dim_Withdrawal] (
    [Withdrawal_Cd]         VARCHAR (30)  NULL,
    [Withdrawal_Desc]       VARCHAR (254) NULL,
    [Withdrawal_State_Cd]   VARCHAR (30)  NULL,
    [Withdrawal_State_Desc] VARCHAR (254) NULL,
    [Withdrawal_Sort_Order] SMALLINT      NULL,
    [Batch_Period]          VARCHAR (50)  NULL,
    [SAID]                  VARCHAR (30)  NULL,
    [Date_Stamp]            DATETIME2 (7) NULL
);

