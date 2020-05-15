CREATE TABLE [tdw].[dim_Course] (
    [Course_Key]              INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]             VARBINARY (16) NOT NULL,
    [Course_Cd]               VARCHAR (30)   NOT NULL,
    [Course_Title]            VARCHAR (60)   NULL,
    [Course_Desc]             VARCHAR (254)  NULL,
    [Course_State_Cd]         VARCHAR (30)   NULL,
    [Course_State_Title]      VARCHAR (60)   NULL,
    [Course_State_Code_Desc]  VARCHAR (254)  NULL,
    [Course_Department_Desc]  VARCHAR (60)   NULL,
    [Course_Active_Ind]       CHAR (1)       NULL,
    [Course_Level_Cd]         VARCHAR (30)   NULL,
    [Advanced_Placement_Cd]   VARCHAR (60)   NULL,
    [Advanced_Placement_Desc] VARCHAR (254)  NULL,
    [SCED_Course_Cd]          CHAR (5)       NULL,
    [SCED_Course_Subject_Cd]  CHAR (2)       NULL,
    [SCED_Course_Sequence]    VARCHAR (10)   NULL,
    [Date_Stamp]              DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]             VARBINARY (16) NOT NULL,
    [Last_Updated_T1]         DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind] CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Course] PRIMARY KEY CLUSTERED ([Course_Key] ASC)
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


