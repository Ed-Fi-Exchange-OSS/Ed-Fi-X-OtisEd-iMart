CREATE TABLE [tdw].[dim_Grade_Type] (
    [Grade_Type_Key]          INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]             VARBINARY (16) NOT NULL,
    [Grade_Type_Cd]           VARCHAR (30)   NOT NULL,
    [Grade_Type_Desc]         VARCHAR (254)  NULL,
    [Grade_Type_Sort_Order]   SMALLINT       NULL,
    [Date_Stamp]              DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]             VARBINARY (16) NOT NULL,
    [Last_Updated_T1]         DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind] CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Grade_Type] PRIMARY KEY CLUSTERED ([Grade_Type_Key] ASC)
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


