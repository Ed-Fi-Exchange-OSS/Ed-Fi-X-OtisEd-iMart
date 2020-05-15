CREATE TABLE [adw].[fct_Attendance_Period_Activity] (
    [Attendance_Period_Activity_Key]  INT            NOT NULL,
    [Academic_Year_Key]               INT            NOT NULL,
    [District_Key]                    INT            NOT NULL,
    [School_Key]                      INT            NOT NULL,
    [Calendar_Track_Key]              INT            NOT NULL,
    [Period_Key]                      INT            NOT NULL,
    [Student_Key]                     INT            NOT NULL,
    [Attendance_Key]                  INT            NOT NULL,
    [Attendance_Date_Key]             INT            NOT NULL,
    [Attendance_Calendar_Date]        DATE           NULL,
    [Attendance_Periods_Absent_Count] DECIMAL (9, 2) NULL,
    [Minutes_Absent]                  SMALLINT       NULL,
    [Minutes_Scheduled]               SMALLINT       NULL,
    CONSTRAINT [PK_fct_Attendance_Period_Activity] PRIMARY KEY CLUSTERED ([Attendance_Period_Activity_Key] ASC)
);

