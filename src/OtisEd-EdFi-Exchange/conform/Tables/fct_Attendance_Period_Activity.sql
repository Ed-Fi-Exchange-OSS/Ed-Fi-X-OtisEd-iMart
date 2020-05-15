CREATE TABLE [conform].[fct_Attendance_Period_Activity] (
    [Academic_Year_Name]              CHAR (9)       NULL,
    [District_Id]                     VARCHAR (16)   NULL,
    [School_Id]                       VARCHAR (16)   NULL,
    [Calendar_Track_Cd]               VARCHAR (30)   NULL,
    [Calendar_Track_School_Id]        VARCHAR (16)   NULL,
    [Period_Cd]                       VARCHAR (30)   NULL,
    [Period_School_Id]                VARCHAR (16)   NULL,
    [Local_Student_Id]                VARCHAR (30)   NULL,
    [Attendance_Category_Cd]          VARCHAR (30)   NULL,
    [Attendance_Cd]                   VARCHAR (30)   NULL,
    [Attendance-Date_Of_Day]          DATE           NULL,
    [Attendance_Calendar_Date]        DATE           NULL,
    [Attendance_Periods_Absent_Count] DECIMAL (9, 2) NULL,
    [Minutes_Absent]                  SMALLINT       NULL,
    [Minutes_Scheduled]               SMALLINT       NULL,
    [Batch_Period]                    VARCHAR (50)   NULL,
    [SAID]                            VARCHAR (30)   NULL,
    [Date_Stamp]                      DATETIME2 (7)  NULL,
    [SourceIdentifier]                VARCHAR (50)   NULL
);

