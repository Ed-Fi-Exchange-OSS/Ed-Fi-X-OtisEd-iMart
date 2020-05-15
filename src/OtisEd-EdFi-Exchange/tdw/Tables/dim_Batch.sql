CREATE TABLE [tdw].[dim_Batch] (
    [Batch_Key]                INT           IDENTITY (1, 1) NOT NULL,
    [Batch_Period]             VARCHAR (50)  NOT NULL,
    [SAID]                     VARCHAR (30)  NOT NULL,
    [Date_Time_Last_Processed] DATETIME2 (7) NULL,
    [Date_Stamp]               DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Batch] PRIMARY KEY CLUSTERED ([Batch_Key] ASC)
);




GO



GO



GO



GO



GO



GO


