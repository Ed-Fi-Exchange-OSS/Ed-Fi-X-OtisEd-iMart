CREATE TABLE [conform].[fct_Student_Course_Grade] (
    [Academic_Year_Name]        CHAR (9)       NULL,
    [District_Id]               VARCHAR (16)   NULL,
    [School_Id]                 VARCHAR (16)   NULL,
    [Calendar_Track_Cd]         VARCHAR (30)   NULL,
    [Calendar_Track_School_Id]  VARCHAR (16)   NULL,
    [Term_Cd]                   VARCHAR (30)   NULL,
    [Marking_Period_Cd]         VARCHAR (30)   NULL,
    [Grade_Type_Cd]             VARCHAR (30)   NULL,
    [Course_Cd]                 VARCHAR (30)   NULL,
    [Course_School_Id]          VARCHAR (16)   NULL,
    [Course_Section_Identifier] VARCHAR (50)   NULL,
    [Local_Student_Id]          VARCHAR (30)   NULL,
    [Letter_Grade]              VARCHAR (12)   NULL,
    [Numeric_Grade]             DECIMAL (9, 2) NULL,
    [Grade_Point_Max]           DECIMAL (9, 2) NULL,
    [Passing_Grade_Ind]         CHAR (1)       NULL,
    [Batch_Period]              VARCHAR (50)   NULL,
    [SAID]                      VARCHAR (30)   NULL,
    [Date_Stamp]                DATETIME2 (7)  NULL,
    [SourceIdentifier]          VARCHAR (50)   NULL
);



