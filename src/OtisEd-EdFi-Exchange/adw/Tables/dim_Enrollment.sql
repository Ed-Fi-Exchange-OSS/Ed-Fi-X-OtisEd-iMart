CREATE TABLE [adw].[dim_Enrollment] (
    [Enrollment_Key]        INT           NOT NULL,
    [Enrollment_Cd]         VARCHAR (30)  NOT NULL,
    [Enrollment_Desc]       VARCHAR (254) NULL,
    [Enrollment_State_Cd]   VARCHAR (30)  NULL,
    [Enrollment_State_Desc] VARCHAR (254) NULL,
    [Enrollment_Sort_Order] SMALLINT      NULL,
    [Last_Updated_T1]       DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Enrollment] PRIMARY KEY CLUSTERED ([Enrollment_Key] ASC)
);

