CREATE TABLE [adw].[dim_Calendar_Track] (
    [Calendar_Track_Key]               INT           NOT NULL,
    [Calendar_Track_School_Id]         VARCHAR (16)  NOT NULL,
    [Calendar_Track_Cd]                VARCHAR (30)  NOT NULL,
    [Calendar_Track_Desc]              VARCHAR (254) NULL,
    [Calendar_Track_Sort_Order]        SMALLINT      NULL,
    [Summer_School_Ind]                CHAR (1)      NULL,
    [Track_First_Instructional_Date]   DATE          NULL,
    [Track_Last_Instructional_Date]    DATE          NULL,
    [Track_Planned_Instructional_Days] SMALLINT      NULL,
    [Track_Instructional_Minutes]      SMALLINT      NULL,
    [Track_Whole_Day_Absences_Minutes] SMALLINT      NULL,
    [Track_Half_Day_Absences_Minutes]  SMALLINT      NULL,
    [Last_Updated_T1]                  DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Calendar_Track] PRIMARY KEY CLUSTERED ([Calendar_Track_Key] ASC)
);

