CREATE TABLE [conform].[fct_Student_Program_Participation] (
    [Academic_Year_Name]    CHAR (9)      NULL,
    [District_Id]           VARCHAR (16)  NULL,
    [School_Id]             VARCHAR (16)  NULL,
    [Program_Cd]            VARCHAR (30)  NULL,
    [Local_Student_Id]      VARCHAR (30)  NULL,
    [Effective-Date_Of_Day] DATE          NULL,
    [Ending-Date_Of_Day]    DATE          NULL,
    [Occurrence]            TINYINT       NULL,
    [Effective_Date]        DATE          NULL,
    [Ending_Date]           DATE          NULL,
    [Batch_Period]          VARCHAR (50)  NULL,
    [SAID]                  VARCHAR (30)  NULL,
    [Date_Stamp]            DATETIME2 (7) NULL,
    [SourceIdentifier]      VARCHAR (50)  NULL
);

