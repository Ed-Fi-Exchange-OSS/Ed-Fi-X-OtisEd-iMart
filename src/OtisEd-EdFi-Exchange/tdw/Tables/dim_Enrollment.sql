CREATE TABLE [tdw].[dim_Enrollment] (
    [Enrollment_Key]          INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]             VARBINARY (16) NOT NULL,
    [Enrollment_Cd]           VARCHAR (30)   NOT NULL,
    [Enrollment_Desc]         VARCHAR (254)  NULL,
    [Enrollment_State_Cd]     VARCHAR (30)   NULL,
    [Enrollment_State_Desc]   VARCHAR (254)  NULL,
    [Enrollment_Sort_Order]   SMALLINT       NULL,
    [Date_Stamp]              DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]             VARBINARY (16) NOT NULL,
    [Last_Updated_T1]         DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind] CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Enrollment] PRIMARY KEY CLUSTERED ([Enrollment_Key] ASC)
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



GO



GO


