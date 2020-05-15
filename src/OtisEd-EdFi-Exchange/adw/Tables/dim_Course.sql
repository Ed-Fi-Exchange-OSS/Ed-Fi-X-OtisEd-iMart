CREATE TABLE [adw].[dim_Course] (
    [Course_Key]              INT           NOT NULL,
    [Course_Cd]               VARCHAR (30)  NOT NULL,
    [Course_Title]            VARCHAR (60)  NULL,
    [Course_Desc]             VARCHAR (254) NULL,
    [Course_State_Cd]         VARCHAR (30)  NULL,
    [Course_State_Title]      VARCHAR (60)  NULL,
    [Course_State_Code_Desc]  VARCHAR (254) NULL,
    [Course_Department_Desc]  VARCHAR (60)  NULL,
    [Course_Active_Ind]       CHAR (1)      NULL,
    [Course_Level_Cd]         VARCHAR (30)  NULL,
    [Advanced_Placement_Cd]   VARCHAR (60)  NULL,
    [Advanced_Placement_Desc] VARCHAR (254) NULL,
    [SCED_Course_Cd]          CHAR (5)      NULL,
    [SCED_Course_Subject_Cd]  CHAR (2)      NULL,
    [SCED_Course_Sequence]    VARCHAR (10)  NULL,
    [Last_Updated_T1]         DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Course] PRIMARY KEY CLUSTERED ([Course_Key] ASC)
);

