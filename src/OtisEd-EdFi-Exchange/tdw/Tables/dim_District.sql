CREATE TABLE [tdw].[dim_District] (
    [District_Key]                 INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                  VARBINARY (16) NOT NULL,
    [District_Id]                  VARCHAR (16)   NOT NULL,
    [District_Name]                VARCHAR (60)   NULL,
    [Superintendent_Name]          VARCHAR (36)   NULL,
    [State_Abbr]                   CHAR (2)       NULL,
    [State_Name]                   VARCHAR (50)   NULL,
    [County_Name]                  VARCHAR (50)   NULL,
    [REA_Name]                     VARCHAR (60)   NULL,
    [REA_Abbr]                     VARCHAR (36)   NULL,
    [District_Academic_Year_Began] VARCHAR (9)    NULL,
    [District_Academic_Year_Ended] VARCHAR (9)    NULL,
    [District_Phone]               VARCHAR (24)   NULL,
    [District_Address_1]           VARCHAR (36)   NULL,
    [District_Address_2]           VARCHAR (36)   NULL,
    [District_City]                VARCHAR (24)   NULL,
    [District_State]               VARCHAR (2)    NULL,
    [District_Postal_Cd]           VARCHAR (10)   NULL,
    [District_Latitude]            DECIMAL (9, 6) NULL,
    [District_Longitude]           DECIMAL (9, 6) NULL,
    [Date_Stamp]                   DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                  VARBINARY (16) NOT NULL,
    [Last_Updated_T1]              DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]      CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_District] PRIMARY KEY CLUSTERED ([District_Key] ASC)
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



GO


