CREATE TABLE [conform].[dim_Term] (
    [Calendar_Track_Cd]                VARCHAR (30)  NULL,
    [Calendar_Track_Desc]              VARCHAR (254) NULL,
    [Calendar_Track_Sort_Order]        SMALLINT      NULL,
    [Summer_School_Ind]                CHAR (1)      NULL,
    [Track_First_Instructional_Date]   DATE          NULL,
    [Track_Last_Instructional_Date]    DATE          NULL,
    [Track_Planned_Instructional_Days] SMALLINT      NULL,
    [Track_Actual_Instructional_Days]  SMALLINT      NULL,
    [Term_Cd]                          VARCHAR (30)  NULL,
    [Term_Desc]                        VARCHAR (254) NULL,
    [Term_Sort_Order]                  SMALLINT      NULL,
    [Term_First_Instructional_Date]    DATE          NULL,
    [Term_Last_Instructional_Date]     DATE          NULL,
    [Term_Planned_Instructional_Days]  SMALLINT      NULL,
    [Term_Actual_Instructional_Days]   SMALLINT      NULL,
    [Calendar_Track_School_Id]         VARCHAR (16)  NULL,
    [Batch_Period]                     VARCHAR (50)  NULL,
    [SAID]                             VARCHAR (30)  NULL,
    [Date_Stamp]                       DATETIME2 (7) NULL
);

