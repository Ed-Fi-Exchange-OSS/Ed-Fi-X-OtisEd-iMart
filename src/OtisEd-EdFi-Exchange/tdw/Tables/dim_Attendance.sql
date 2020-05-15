CREATE TABLE [tdw].[dim_Attendance] (
    [Attendance_Key]               INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                  VARBINARY (16) NOT NULL,
    [Attendance_Category_Cd]       VARCHAR (30)   NOT NULL,
    [Attendance_State_Category_Cd] VARCHAR (30)   NULL,
    [Attendance_Cd]                VARCHAR (30)   NOT NULL,
    [Attendance_Desc]              VARCHAR (254)  NULL,
    [Attendance_Sort_Order]        SMALLINT       NULL,
    [Attendance_State_Cd]          VARCHAR (30)   NULL,
    [Attendance_State_Desc]        VARCHAR (254)  NULL,
    [Date_Stamp]                   DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                  VARBINARY (16) NOT NULL,
    [Last_Updated_T1]              DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]      CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Attendance] PRIMARY KEY CLUSTERED ([Attendance_Key] ASC)
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


