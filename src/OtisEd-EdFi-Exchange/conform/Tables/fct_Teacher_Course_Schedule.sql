﻿CREATE TABLE [conform].[fct_Teacher_Course_Schedule] (
    [Academic_Year_Name]        CHAR (9)       NULL,
    [District_Id]               VARCHAR (16)   NULL,
    [Calendar_Track_Cd]         VARCHAR (30)   NULL,
    [Calendar_Track_School_Id]  VARCHAR (16)   NULL,
    [Term_Cd]                   VARCHAR (30)   NULL,
    [Course_Cd]                 VARCHAR (30)   NULL,
    [Course_School_Id]          VARCHAR (16)   NULL,
    [Course_Section_Identifier] VARCHAR (50)   NULL,
    [Local_Staff_Id]            VARCHAR (32)   NULL,
    [School_Id]                 VARCHAR (16)   NULL,
    [Cycle_Day_Cd]              VARCHAR (30)   NULL,
    [Start-Period_Cd]           VARCHAR (30)   NULL,
    [Start-Period_School_Id]    VARCHAR (16)   NULL,
    [End-Period_Cd]             VARCHAR (30)   NULL,
    [End-Period_School_Id]      VARCHAR (16)   NULL,
    [Entered-Date_Of_Day]       DATE           NULL,
    [Exited-Date_Of_Day]        DATE           NULL,
    [Entered_Calendar_Date]     DATE           NULL,
    [Exited_Calendar_Date]      DATE           NULL,
    [Course_Enroll_Count]       DECIMAL (9, 2) NULL,
    [Primary_Secondary_CD]      CHAR (2)       NULL,
    [Batch_Period]              VARCHAR (50)   NULL,
    [SAID]                      VARCHAR (30)   NULL,
    [Date_Stamp]                DATETIME2 (7)  NULL,
    [SourceIdentifier]          VARCHAR (50)   NULL
);

