CREATE TABLE [adw].[dim_Period] (
    [Period_Key]                      INT           NOT NULL,
    [Period_School_Id]                VARCHAR (16)  NOT NULL,
    [Period_Cd]                       VARCHAR (30)  NOT NULL,
    [Period_Desc]                     VARCHAR (254) NULL,
    [Period_Sort_Order]               SMALLINT      NULL,
    [Period_Start_Time]               TIME (7)      NULL,
    [Period_End_Time]                 TIME (7)      NULL,
    [Period_Noninstructional_Minutes] SMALLINT      NULL,
    [Last_Updated_T1]                 DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Period] PRIMARY KEY CLUSTERED ([Period_Key] ASC)
);

