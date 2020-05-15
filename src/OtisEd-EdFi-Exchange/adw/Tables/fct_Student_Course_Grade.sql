CREATE TABLE [adw].[fct_Student_Course_Grade] (
    [Student_Course_Grade_Key] INT            NOT NULL,
    [Academic_Year_Key]        INT            NOT NULL,
    [District_Key]             INT            NOT NULL,
    [School_Key]               INT            NOT NULL,
    [Calendar_Track_Key]       INT            NOT NULL,
    [Term_Key]                 INT            NOT NULL,
    [Marking_Period_Key]       INT            NOT NULL,
    [Grade_Type_Key]           INT            NOT NULL,
    [Course_Section_Key]       INT            NOT NULL,
    [Student_Key]              INT            NOT NULL,
    [Letter_Grade]             VARCHAR (12)   NULL,
    [Numeric_Grade]            DECIMAL (9, 2) NULL,
    [Grade_Point_Max]          DECIMAL (9, 2) NULL,
    [Passing_Grade_Ind]        CHAR (1)       NULL,
    CONSTRAINT [PK_fct_Student_Course_Grade] PRIMARY KEY CLUSTERED ([Student_Course_Grade_Key] ASC),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_ACADEMIC_YEAR_ACADEMIC_YEAR_KEY] FOREIGN KEY ([Academic_Year_Key]) REFERENCES [adw].[dim_Academic_Year] ([Academic_Year_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY] FOREIGN KEY ([Calendar_Track_Key]) REFERENCES [adw].[dim_Calendar_Track] ([Calendar_Track_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_COURSE_SECTION_COURSE_SECTION_KEY] FOREIGN KEY ([Course_Section_Key]) REFERENCES [adw].[dim_Course_Section] ([Course_Section_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_DISTRICT_DISTRICT_KEY] FOREIGN KEY ([District_Key]) REFERENCES [adw].[dim_District] ([District_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_GRADE_TYPE_GRADE_TYPE_KEY] FOREIGN KEY ([Grade_Type_Key]) REFERENCES [adw].[dim_Grade_Type] ([Grade_Type_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_MARKING_PERIOD_MARKING_PERIOD_KEY] FOREIGN KEY ([Marking_Period_Key]) REFERENCES [adw].[dim_Marking_Period] ([Marking_Period_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.dim_School_School_Key] FOREIGN KEY ([School_Key]) REFERENCES [adw].[dim_School] ([School_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_STUDENT_STUDENT_KEY] FOREIGN KEY ([Student_Key]) REFERENCES [adw].[dim_Student] ([Student_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_TERM_TERM_KEY] FOREIGN KEY ([Term_Key]) REFERENCES [adw].[dim_Term] ([Term_Key])
);



