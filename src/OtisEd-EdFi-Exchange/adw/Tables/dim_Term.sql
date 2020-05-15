CREATE TABLE [adw].[dim_Term] (
    [Term_Key]                         INT           NOT NULL,
    [Calendar_Track_Cd]                VARCHAR (30)  NOT NULL,
    [Calendar_Track_Desc]              VARCHAR (254) NULL,
    [Calendar_Track_Sort_Order]        SMALLINT      NULL,
    [Summer_School_Ind]                CHAR (1)      NULL,
    [Track_First_Instructional_Date]   DATE          NULL,
    [Track_Last_Instructional_Date]    DATE          NULL,
    [Track_Planned_Instructional_Days] SMALLINT      NULL,
    [Track_Actual_Instructional_Days]  SMALLINT      NULL,
    [Term_Cd]                          VARCHAR (30)  NOT NULL,
    [Term_Desc]                        VARCHAR (254) NULL,
    [Term_Sort_Order]                  SMALLINT      NULL,
    [Term_First_Instructional_Date]    DATE          NULL,
    [Term_Last_Instructional_Date]     DATE          NULL,
    [Term_Planned_Instructional_Days]  SMALLINT      NULL,
    [Term_Actual_Instructional_Days]   SMALLINT      NULL,
    [Calendar_Track_Key]               INT           NULL,
    [Last_Updated_T1]                  DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Term] PRIMARY KEY CLUSTERED ([Term_Key] ASC),
    CONSTRAINT [FK_adw.dim_Term_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY] FOREIGN KEY ([Calendar_Track_Key]) REFERENCES [adw].[dim_Calendar_Track] ([Calendar_Track_Key])
);

