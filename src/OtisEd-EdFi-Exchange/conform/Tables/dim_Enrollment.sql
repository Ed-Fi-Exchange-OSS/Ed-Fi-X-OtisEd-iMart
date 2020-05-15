CREATE TABLE [conform].[dim_Enrollment] (
    [Enrollment_Cd]         VARCHAR (30)  NULL,
    [Enrollment_Desc]       VARCHAR (254) NULL,
    [Enrollment_State_Cd]   VARCHAR (30)  NULL,
    [Enrollment_State_Desc] VARCHAR (254) NULL,
    [Enrollment_Sort_Order] SMALLINT      NULL,
    [Batch_Period]          VARCHAR (50)  NULL,
    [SAID]                  VARCHAR (30)  NULL,
    [Date_Stamp]            DATETIME2 (7) NULL
);

