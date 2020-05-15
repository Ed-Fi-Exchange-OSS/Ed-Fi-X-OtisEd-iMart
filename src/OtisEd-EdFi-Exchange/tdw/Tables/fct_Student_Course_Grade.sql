CREATE TABLE [tdw].[fct_Student_Course_Grade] (
    [Student_Course_Grade_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]              VARBINARY (16) NOT NULL,
    [Academic_Year_Key]        INT            NOT NULL,
    [District_Key]             INT            NOT NULL,
    [School_Key]               INT            NOT NULL,
    [Calendar_Track_Key]       INT            NOT NULL,
    [Term_Key]                 INT            NOT NULL,
    [Marking_Period_Key]       INT            NOT NULL,
    [Grade_Type_Key]           INT            NOT NULL,
    [Course_Section_Key]       INT            NOT NULL,
    [Student_Key]              INT            NOT NULL,
    [Letter_Grade]             VARCHAR (12)   NULL,
    [Numeric_Grade]            DECIMAL (9, 2) NULL,
    [Grade_Point_Max]          DECIMAL (9, 2) NULL,
    [Passing_Grade_Ind]        CHAR (1)       NULL,
    [Date_Stamp]               DATETIME2 (7)  NOT NULL,
    [Batch_Key]                INT            NOT NULL,
    [No_Longer_In_Source_Ind]  CHAR (1)       NOT NULL,
    [Date_First_Seen]          DATETIME2 (7)  NOT NULL,
    [Date_Last_Seen]           DATETIME2 (7)  NOT NULL,
    [SourceIdentifier]         VARCHAR (50)   NULL,
    CONSTRAINT [PK_fct_Student_Course_Grade] PRIMARY KEY CLUSTERED ([Student_Course_Grade_Key] ASC)
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
CREATE NONCLUSTERED INDEX [Idx_HashKey]
    ON [tdw].[fct_Student_Course_Grade]([Hash_Key_BK] ASC);

