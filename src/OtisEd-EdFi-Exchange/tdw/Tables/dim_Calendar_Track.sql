CREATE TABLE [tdw].[dim_Calendar_Track] (
    [Calendar_Track_Key]               INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                      VARBINARY (16) NOT NULL,
    [Calendar_Track_School_Id]         VARCHAR (16)   NOT NULL,
    [Calendar_Track_Cd]                VARCHAR (30)   NOT NULL,
    [Calendar_Track_Desc]              VARCHAR (254)  NULL,
    [Calendar_Track_Sort_Order]        SMALLINT       NULL,
    [Summer_School_Ind]                CHAR (1)       NULL,
    [Track_First_Instructional_Date]   DATE           NULL,
    [Track_Last_Instructional_Date]    DATE           NULL,
    [Track_Planned_Instructional_Days] SMALLINT       NULL,
    [Track_Instructional_Minutes]      SMALLINT       NULL,
    [Track_Whole_Day_Absences_Minutes] SMALLINT       NULL,
    [Track_Half_Day_Absences_Minutes]  SMALLINT       NULL,
    [Date_Stamp]                       DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                      VARBINARY (16) NOT NULL,
    [Last_Updated_T1]                  DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]          CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Calendar_Track] PRIMARY KEY CLUSTERED ([Calendar_Track_Key] ASC)
);




GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


