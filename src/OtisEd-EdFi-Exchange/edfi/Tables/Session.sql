CREATE TABLE [edfi].[Session] (
    [OES_Litho]              BIGINT           NULL,
    [SAID]                   VARCHAR (8)      NULL,
    [SchoolId]               INT              NULL,
    [SchoolYear]             SMALLINT         NULL,
    [TermDescriptorId]       INT              NULL,
    [SessionName]            NVARCHAR (60)    NULL,
    [BeginDate]              DATE             NULL,
    [EndDate]                DATE             NULL,
    [TotalInstructionalDays] INT              NULL,
    [Id]                     UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]       DATETIME         NULL,
    [CreateDate]             DATETIME         NULL,
    [Discriminator]          NVARCHAR (128)   NULL
);

