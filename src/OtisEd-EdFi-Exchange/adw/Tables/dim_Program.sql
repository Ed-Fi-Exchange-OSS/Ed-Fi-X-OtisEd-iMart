CREATE TABLE [adw].[dim_Program] (
    [Program_Key]        INT           NOT NULL,
    [Program_Cd]         VARCHAR (30)  NOT NULL,
    [Program_Desc]       VARCHAR (254) NULL,
    [Program_Sort_Order] SMALLINT      NULL,
    [Last_Updated_T1]    DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Program] PRIMARY KEY CLUSTERED ([Program_Key] ASC)
);

