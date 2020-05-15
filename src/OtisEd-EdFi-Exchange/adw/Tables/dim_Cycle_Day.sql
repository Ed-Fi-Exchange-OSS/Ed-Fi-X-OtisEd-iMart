CREATE TABLE [adw].[dim_Cycle_Day] (
    [Cycle_Day_Key]        INT           NOT NULL,
    [Cycle_Day_Cd]         VARCHAR (30)  NOT NULL,
    [Cycle_Day_Desc]       VARCHAR (254) NULL,
    [Cycle_Day_Sort_Order] SMALLINT      NULL,
    [Last_Updated_T1]      DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Cycle_Day] PRIMARY KEY CLUSTERED ([Cycle_Day_Key] ASC)
);

