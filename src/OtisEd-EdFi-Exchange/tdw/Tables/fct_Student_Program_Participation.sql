CREATE TABLE [tdw].[fct_Student_Program_Participation] (
    [Student_Program_Participation_Key] INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                       VARBINARY (16) NOT NULL,
    [Academic_Year_Key]                 INT            NOT NULL,
    [District_Key]                      INT            NOT NULL,
    [School_Key]                        INT            NOT NULL,
    [Program_Key]                       INT            NOT NULL,
    [Student_Key]                       INT            NOT NULL,
    [Effective_Date_Key]                INT            NOT NULL,
    [Ending_Date_Key]                   INT            NULL,
    [Occurrence]                        TINYINT        NULL,
    [Effective_Date]                    DATE           NULL,
    [Ending_Date]                       DATE           NULL,
    [Date_Stamp]                        DATETIME2 (7)  NOT NULL,
    [Batch_Key]                         INT            NOT NULL,
    [No_Longer_In_Source_Ind]           CHAR (1)       NOT NULL,
    [Date_First_Seen]                   DATETIME2 (7)  NOT NULL,
    [Date_Last_Seen]                    DATETIME2 (7)  NOT NULL,
    [SourceIdentifier]                  VARCHAR (50)   NULL,
    CONSTRAINT [PK_fct_Student_Program_Participation] PRIMARY KEY CLUSTERED ([Student_Program_Participation_Key] ASC)
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
CREATE NONCLUSTERED INDEX [Idx_HashKey]
    ON [tdw].[fct_Student_Program_Participation]([Hash_Key_BK] ASC);

