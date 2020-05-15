﻿CREATE TABLE [tdw].[dim_Staff] (
    [Staff_Key]                  INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                VARBINARY (16) NOT NULL,
    [Local_Staff_Id]             VARCHAR (32)   NULL,
    [Staff_Unique_Id]            VARCHAR (32)   NULL,
    [Staff_State_Id_Nbr]         VARCHAR (32)   NULL,
    [Staff_SSN]                  VARCHAR (11)   NULL,
    [Staff_First_Name]           VARCHAR (30)   NULL,
    [Staff_Middle_Name]          VARCHAR (30)   NULL,
    [Staff_Last_Name]            VARCHAR (30)   NULL,
    [Staff_Name_Suffix]          VARCHAR (30)   NULL,
    [Staff_Full_Name]            VARCHAR (254)  NULL,
    [Staff_Preferred_Name]       VARCHAR (254)  NULL,
    [Staff_Sort_Name]            VARCHAR (254)  NULL,
    [Staff_Birth_Date]           DATE           NULL,
    [Staff_Gender_Cd]            VARCHAR (30)   NULL,
    [Staff_Gender_Desc]          VARCHAR (254)  NULL,
    [Staff_Gender_Sort_Order]    SMALLINT       NULL,
    [Staff_Primary_Ethnicity_Cd] VARCHAR (30)   NULL,
    [Staff_Type_Cd]              VARCHAR (30)   NULL,
    [Staff_Type_Desc]            VARCHAR (254)  NULL,
    [Staff_Type_Sort_Order]      SMALLINT       NULL,
    [Hire_Date]                  DATE           NULL,
    [Total_Salary_Amt]           DECIMAL (9, 2) NULL,
    [Instruction_Salary_Amt]     DECIMAL (9, 2) NULL,
    [Total_Contract_Hours]       DECIMAL (9, 2) NULL,
    [Date_Stamp]                 DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                VARBINARY (16) NOT NULL,
    [Last_Updated_T1]            DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]    CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Staff] PRIMARY KEY CLUSTERED ([Staff_Key] ASC)
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



GO



GO



GO



GO



GO


