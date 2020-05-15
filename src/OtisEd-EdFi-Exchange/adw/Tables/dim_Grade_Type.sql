CREATE TABLE [adw].[dim_Grade_Type] (
    [Grade_Type_Key]        INT           NOT NULL,
    [Grade_Type_Cd]         VARCHAR (30)  NOT NULL,
    [Grade_Type_Desc]       VARCHAR (254) NULL,
    [Grade_Type_Sort_Order] SMALLINT      NULL,
    [Last_Updated_T1]       DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Grade_Type] PRIMARY KEY CLUSTERED ([Grade_Type_Key] ASC)
);

