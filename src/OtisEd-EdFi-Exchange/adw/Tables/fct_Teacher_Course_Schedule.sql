CREATE TABLE [adw].[fct_Teacher_Course_Schedule] (
    [Teacher_Course_Schedule_Key] INT            NOT NULL,
    [Academic_Year_Key]           INT            NOT NULL,
    [District_Key]                INT            NOT NULL,
    [Calendar_Track_Key]          INT            NOT NULL,
    [Term_Key]                    INT            NOT NULL,
    [Course_Section_Key]          INT            NOT NULL,
    [Staff_Key]                   INT            NOT NULL,
    [School_Key]                  INT            NOT NULL,
    [Cycle_Day_Key]               INT            NOT NULL,
    [Start_Period_Key]            INT            NOT NULL,
    [End_Period_Key]              INT            NOT NULL,
    [Entered_Date_Key]            INT            NOT NULL,
    [Exited_Date_Key]             INT            NULL,
    [Entered_Calendar_Date]       DATE           NULL,
    [Exited_Calendar_Date]        DATE           NULL,
    [Course_Enroll_Count]         DECIMAL (9, 2) NULL,
    [Primary_Secondary_CD]        CHAR (2)       NULL,
    CONSTRAINT [PK_fct_Teacher_Course_Schedule] PRIMARY KEY CLUSTERED ([Teacher_Course_Schedule_Key] ASC)
);

