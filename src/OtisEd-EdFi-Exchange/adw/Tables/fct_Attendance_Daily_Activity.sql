CREATE TABLE [adw].[fct_Attendance_Daily_Activity] (
    [Attendance_Daily_Activity_Key] INT            NOT NULL,
    [Academic_Year_Key]             INT            NOT NULL,
    [District_Key]                  INT            NOT NULL,
    [School_Key]                    INT            NOT NULL,
    [Calendar_Track_Key]            INT            NOT NULL,
    [Student_Key]                   INT            NOT NULL,
    [Attendance_Key]                INT            NOT NULL,
    [Attendance_Date_Key]           INT            NOT NULL,
    [Attendance_Calendar_Date]      DATE           NULL,
    [Attendance_Days_Absent_Count]  DECIMAL (9, 2) NULL,
    [Periods_Absent]                SMALLINT       NULL,
    [Periods_Scheduled]             SMALLINT       NULL,
    [Minutes_Absent]                SMALLINT       NULL,
    [Minutes_Scheduled]             SMALLINT       NULL,
    CONSTRAINT [PK_fct_Attendance_Daily_Activity] PRIMARY KEY CLUSTERED ([Attendance_Daily_Activity_Key] ASC)
);

