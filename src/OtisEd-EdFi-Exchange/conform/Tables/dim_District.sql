CREATE TABLE [conform].[dim_District] (
    [District_Id]                  VARCHAR (16)   NULL,
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
    [Batch_Period]                 VARCHAR (50)   NULL,
    [SAID]                         VARCHAR (30)   NULL,
    [Date_Stamp]                   DATETIME2 (7)  NULL
);

