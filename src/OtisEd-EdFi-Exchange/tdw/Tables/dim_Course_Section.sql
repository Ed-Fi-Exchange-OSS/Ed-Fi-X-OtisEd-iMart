﻿CREATE TABLE [tdw].[dim_Course_Section] (
    [Course_Section_Key]        INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]               VARBINARY (16) NOT NULL,
    [Course_School_Id]          VARCHAR (16)   NOT NULL,
    [Course_Cd]                 VARCHAR (30)   NOT NULL,
    [Course_Section_Identifier] VARCHAR (50)   NOT NULL,
    [Course_Section_Cd]         VARCHAR (30)   NULL,
    [Course_School_Name]        VARCHAR (60)   NULL,
    [Course_Title]              VARCHAR (60)   NULL,
    [Course_Desc]               VARCHAR (254)  NULL,
    [Course_Sort_Order]         SMALLINT       NULL,
    [Course_State_Cd]           VARCHAR (30)   NULL,
    [Course_State_Title]        VARCHAR (60)   NULL,
    [Course_State_Code_Desc]    VARCHAR (254)  NULL,
    [Course_Department_Desc]    VARCHAR (60)   NULL,
    [Course_Active_Ind]         CHAR (1)       NULL,
    [Course_Level_Cd]           VARCHAR (30)   NULL,
    [Course_Level_Sort_Order]   SMALLINT       NULL,
    [Advanced_Placement_Cd]     VARCHAR (60)   NULL,
    [Advanced_Placement_Desc]   VARCHAR (254)  NULL,
    [Course_Credit_Value]       DECIMAL (9, 2) NULL,
    [SCED_Course_Cd]            CHAR (5)       NULL,
    [SCED_Course_Subject_Cd]    CHAR (2)       NULL,
    [SCED_Course_Sequence]      VARCHAR (10)   NULL,
    [Classroom_Identifier]      VARCHAR (30)   NULL,
    [Delivery_Mode_Cd]          VARCHAR (30)   NULL,
    [Delivery_Mode_Desc]        VARCHAR (254)  NULL,
    [Primary_Teacher_Unique_Id] VARCHAR (30)   NULL,
    [Primary_Teacher_Full_Name] VARCHAR (254)  NULL,
    [Course_Key]                INT            NULL,
    [Date_Stamp]                DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]               VARBINARY (16) NOT NULL,
    [Last_Updated_T1]           DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]   CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Course_Section] PRIMARY KEY CLUSTERED ([Course_Section_Key] ASC)
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



GO



GO



GO



GO


