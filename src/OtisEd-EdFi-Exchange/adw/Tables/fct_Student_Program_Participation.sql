CREATE TABLE [adw].[fct_Student_Program_Participation] (
    [Student_Program_Participation_Key] INT     NOT NULL,
    [Academic_Year_Key]                 INT     NOT NULL,
    [District_Key]                      INT     NOT NULL,
    [School_Key]                        INT     NOT NULL,
    [Program_Key]                       INT     NOT NULL,
    [Student_Key]                       INT     NOT NULL,
    [Effective_Date_Key]                INT     NOT NULL,
    [Ending_Date_Key]                   INT     NULL,
    [Occurrence]                        TINYINT NULL,
    [Effective_Date]                    DATE    NULL,
    [Ending_Date]                       DATE    NULL,
    CONSTRAINT [PK_fct_Student_Program_Participation] PRIMARY KEY CLUSTERED ([Student_Program_Participation_Key] ASC)
);

