CREATE TABLE [tdw].[fct_Attendance_Period_Activity] (
    [Attendance_Period_Activity_Key]  INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                     VARBINARY (16) NOT NULL,
    [Academic_Year_Key]               INT            NOT NULL,
    [District_Key]                    INT            NOT NULL,
    [School_Key]                      INT            NOT NULL,
    [Calendar_Track_Key]              INT            NOT NULL,
    [Period_Key]                      INT            NOT NULL,
    [Student_Key]                     INT            NOT NULL,
    [Attendance_Key]                  INT            NOT NULL,
    [Attendance_Date_Key]             INT            NOT NULL,
    [Attendance_Calendar_Date]        DATE           NULL,
    [Attendance_Periods_Absent_Count] DECIMAL (9, 2) NULL,
    [Minutes_Absent]                  SMALLINT       NULL,
    [Minutes_Scheduled]               SMALLINT       NULL,
    [Date_Stamp]                      DATETIME2 (7)  NOT NULL,
    [Batch_Key]                       INT            NOT NULL,
    [No_Longer_In_Source_Ind]         CHAR (1)       NOT NULL,
    [Date_First_Seen]                 DATETIME2 (7)  NOT NULL,
    [Date_Last_Seen]                  DATETIME2 (7)  NOT NULL,
    [SourceIdentifier]                VARCHAR (50)   NULL,
    CONSTRAINT [PK_fct_Attendance_Period_Activity] PRIMARY KEY CLUSTERED ([Attendance_Period_Activity_Key] ASC)
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
CREATE NONCLUSTERED INDEX [Idx_HashKey]
    ON [tdw].[fct_Attendance_Period_Activity]([Hash_Key_BK] ASC);

