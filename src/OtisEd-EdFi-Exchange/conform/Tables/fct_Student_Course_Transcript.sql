CREATE TABLE [conform].[fct_Student_Course_Transcript] (
    [Academic_Year_Name]    CHAR (9)       NULL,
    [District_Id]           VARCHAR (16)   NULL,
    [School_Id]             VARCHAR (16)   NULL,
    [Calendar_Track_Cd]     VARCHAR (30)   NULL,
    [Term_Cd]               VARCHAR (30)   NULL,
    [Local_Student_Id]      VARCHAR (30)   NULL,
    [Letter_Grade]          VARCHAR (12)   NULL,
    [Numeric_Grade]         DECIMAL (9, 2) NULL,
    [Credit_Attempted]      DECIMAL (5, 2) NULL,
    [Credit_Earned]         DECIMAL (5, 2) NULL,
    [Quality_Points_Earned] DECIMAL (5, 2) NULL,
    [Grade_Point_Max]       DECIMAL (9, 2) NULL,
    [Passing_Grade_Ind]     CHAR (1)       NULL,
    [Content_Completer_Ind] CHAR (1)       NULL,
    [Batch_Period]          VARCHAR (50)   NULL,
    [SAID]                  VARCHAR (30)   NULL,
    [Date_Stamp]            DATETIME2 (7)  NULL,
    [SourceIdentifier]      VARCHAR (50)   NULL
);



