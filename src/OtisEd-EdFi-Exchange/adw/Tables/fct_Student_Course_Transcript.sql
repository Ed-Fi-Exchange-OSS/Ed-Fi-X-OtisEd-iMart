CREATE TABLE [adw].[fct_Student_Course_Transcript] (
    [Student_Course_Grade_Key] INT            NOT NULL,
    [Academic_Year_Key]        INT            NOT NULL,
    [District_Key]             INT            NOT NULL,
    [School_Key]               INT            NOT NULL,
    [Term_Key]                 INT            NOT NULL,
    [Student_Key]              INT            NOT NULL,
    [Letter_Grade]             VARCHAR (12)   NULL,
    [Numeric_Grade]            DECIMAL (9, 2) NULL,
    [Credit_Attempted]         DECIMAL (5, 2) NULL,
    [Credit_Earned]            DECIMAL (5, 2) NULL,
    [Quality_Points_Earned]    DECIMAL (5, 2) NULL,
    [Grade_Point_Max]          DECIMAL (9, 2) NULL,
    [Passing_Grade_Ind]        CHAR (1)       NULL,
    [Content_Completer_Ind]    CHAR (1)       NULL,
    CONSTRAINT [PK_fct_Student_Course_Transcript] PRIMARY KEY CLUSTERED ([Student_Course_Grade_Key] ASC),
    CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_ACADEMIC_YEAR_ACADEMIC_YEAR_KEY] FOREIGN KEY ([Academic_Year_Key]) REFERENCES [adw].[dim_Academic_Year] ([Academic_Year_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_DISTRICT_DISTRICT_KEY] FOREIGN KEY ([District_Key]) REFERENCES [adw].[dim_District] ([District_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.dim_School_School_Key] FOREIGN KEY ([School_Key]) REFERENCES [adw].[dim_School] ([School_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_STUDENT_STUDENT_KEY] FOREIGN KEY ([Student_Key]) REFERENCES [adw].[dim_Student] ([Student_Key]),
    CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_TERM_TERM_KEY] FOREIGN KEY ([Term_Key]) REFERENCES [adw].[dim_Term] ([Term_Key])
);



