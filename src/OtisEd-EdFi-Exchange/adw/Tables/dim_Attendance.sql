CREATE TABLE [adw].[dim_Attendance] (
    [Attendance_Key]               INT           NOT NULL,
    [Attendance_Category_Cd]       VARCHAR (30)  NOT NULL,
    [Attendance_State_Category_Cd] VARCHAR (30)  NULL,
    [Attendance_Cd]                VARCHAR (30)  NOT NULL,
    [Attendance_Desc]              VARCHAR (254) NULL,
    [Attendance_Sort_Order]        SMALLINT      NULL,
    [Attendance_State_Cd]          VARCHAR (30)  NULL,
    [Attendance_State_Desc]        VARCHAR (254) NULL,
    [Last_Updated_T1]              DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Attendance] PRIMARY KEY CLUSTERED ([Attendance_Key] ASC)
);

