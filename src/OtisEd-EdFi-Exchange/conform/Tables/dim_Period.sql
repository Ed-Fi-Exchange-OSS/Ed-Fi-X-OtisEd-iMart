CREATE TABLE [conform].[dim_Period] (
    [Period_School_Id]                VARCHAR (16)  NULL,
    [Period_Cd]                       VARCHAR (30)  NULL,
    [Period_Desc]                     VARCHAR (254) NULL,
    [Period_Sort_Order]               SMALLINT      NULL,
    [Period_Start_Time]               TIME (7)      NULL,
    [Period_End_Time]                 TIME (7)      NULL,
    [Period_Noninstructional_Minutes] SMALLINT      NULL,
    [Batch_Period]                    VARCHAR (50)  NULL,
    [SAID]                            VARCHAR (30)  NULL,
    [Date_Stamp]                      DATETIME2 (7) NULL
);

