CREATE TABLE [adw].[fct_Student_Course_Schedule] (
    [Student_Course_Schedule_Key] INT            NOT NULL,
    [Academic_Year_Key]           INT            NOT NULL,
    [District_Key]                INT            NOT NULL,
    [Calendar_Track_Key]          INT            NOT NULL,
    [Term_Key]                    INT            NOT NULL,
    [Course_Section_Key]          INT            NOT NULL,
    [Student_Key]                 INT            NOT NULL,
    [Enrolled_School_Key]         INT            NOT NULL,
    [Attending_School_Key]        INT            NOT NULL,
    [Cycle_Day_Key]               INT            NOT NULL,
    [Start_Period_Key]            INT            NOT NULL,
    [End_Period_Key]              INT            NOT NULL,
    [Entered_Date_Key]            INT            NOT NULL,
    [Exited_Date_Key]             INT            NOT NULL,
    [Entered_Calendar_Date]       DATE           NULL,
    [Exited_Calendar_Date]        DATE           NULL,
    [Course_Enroll_Count]         DECIMAL (9, 2) NULL,
    CONSTRAINT [PK_fct_Student_Course_Schedule] PRIMARY KEY CLUSTERED ([Student_Course_Schedule_Key] ASC)
);

