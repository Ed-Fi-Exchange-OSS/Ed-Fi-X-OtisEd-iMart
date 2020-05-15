CREATE TABLE [conform].[dim_Attendance] (
    [Attendance_Category_Cd]       VARCHAR (30)  NULL,
    [Attendance_State_Category_Cd] VARCHAR (30)  NULL,
    [Attendance_Cd]                VARCHAR (30)  NULL,
    [Attendance_Desc]              VARCHAR (254) NULL,
    [Attendance_Sort_Order]        SMALLINT      NULL,
    [Attendance_State_Cd]          VARCHAR (30)  NULL,
    [Attendance_State_Desc]        VARCHAR (254) NULL,
    [Batch_Period]                 VARCHAR (50)  NULL,
    [SAID]                         VARCHAR (30)  NULL,
    [Date_Stamp]                   DATETIME2 (7) NULL
);

