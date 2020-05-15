CREATE TABLE [tdw].[fct_School_Calendar] (
    [School_Calendar_Key]     INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]             VARBINARY (16) NOT NULL,
    [Academic_Year_Key]       INT            NOT NULL,
    [District_Key]            INT            NOT NULL,
    [School_Key]              INT            NOT NULL,
    [Date_Key]                INT            NOT NULL,
    [Calendar_Track_Key]      INT            NOT NULL,
    [Calendar_Day_Type_Key]   INT            NOT NULL,
    [Cycle_Day_Key]           INT            NOT NULL,
    [Calendar_Date]           DATE           NULL,
    [School_Day_Num]          INT            NULL,
    [Occurrence]              SMALLINT       NULL,
    [Date_Stamp]              DATETIME2 (7)  NOT NULL,
    [Batch_Key]               INT            NOT NULL,
    [No_Longer_In_Source_Ind] CHAR (1)       NOT NULL,
    [Date_First_Seen]         DATETIME2 (7)  NOT NULL,
    [Date_Last_Seen]          DATETIME2 (7)  NOT NULL,
    [SourceIdentifier]        VARCHAR (50)   NULL,
    CONSTRAINT [PK_fct_School_Calendar] PRIMARY KEY CLUSTERED ([School_Calendar_Key] ASC)
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
    ON [tdw].[fct_School_Calendar]([Hash_Key_BK] ASC);

