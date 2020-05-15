CREATE TABLE [tdw].[dim_Term] (
    [Term_Key]                         INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                      VARBINARY (16) NOT NULL,
    [Calendar_Track_Cd]                VARCHAR (30)   NOT NULL,
    [Calendar_Track_Desc]              VARCHAR (254)  NULL,
    [Calendar_Track_Sort_Order]        SMALLINT       NULL,
    [Summer_School_Ind]                CHAR (1)       NULL,
    [Track_First_Instructional_Date]   DATE           NULL,
    [Track_Last_Instructional_Date]    DATE           NULL,
    [Track_Planned_Instructional_Days] SMALLINT       NULL,
    [Track_Actual_Instructional_Days]  SMALLINT       NULL,
    [Term_Cd]                          VARCHAR (30)   NOT NULL,
    [Term_Desc]                        VARCHAR (254)  NULL,
    [Term_Sort_Order]                  SMALLINT       NULL,
    [Term_First_Instructional_Date]    DATE           NULL,
    [Term_Last_Instructional_Date]     DATE           NULL,
    [Term_Planned_Instructional_Days]  SMALLINT       NULL,
    [Term_Actual_Instructional_Days]   SMALLINT       NULL,
    [Calendar_Track_Key]               INT            NULL,
    [Date_Stamp]                       DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                      VARBINARY (16) NOT NULL,
    [Last_Updated_T1]                  DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]          CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Term] PRIMARY KEY CLUSTERED ([Term_Key] ASC)
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



GO



GO



GO



GO



GO


