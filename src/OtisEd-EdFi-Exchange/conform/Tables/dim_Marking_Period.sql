CREATE TABLE [conform].[dim_Marking_Period] (
    [Calendar_Track_Cd]              VARCHAR (30)  NULL,
    [Calendar_Track_Desc]            VARCHAR (254) NULL,
    [Calendar_Track_Sort_Order]      SMALLINT      NULL,
    [Summer_School_Ind]              CHAR (1)      NULL,
    [Track_First_Instructional_Date] DATE          NULL,
    [Track_Last_Instructional_Date]  DATE          NULL,
    [Term_Cd]                        VARCHAR (30)  NULL,
    [Term_Desc]                      VARCHAR (254) NULL,
    [Term_Sort_Order]                SMALLINT      NULL,
    [Term_First_Instructional_Date]  DATE          NULL,
    [Term_Last_Instructional_Date]   DATE          NULL,
    [Marking_Period_Cd]              VARCHAR (30)  NULL,
    [Marking_Period_Desc]            VARCHAR (254) NULL,
    [Marking_Period_Sort_Order]      SMALLINT      NULL,
    [Marking_Period_Begin_Date]      DATE          NULL,
    [Marking_Period_End_Date]        DATE          NULL,
    [Calendar_Track_School_Id]       VARCHAR (16)  NULL,
    [Batch_Period]                   VARCHAR (50)  NULL,
    [SAID]                           VARCHAR (30)  NULL,
    [Date_Stamp]                     DATETIME2 (7) NULL
);

