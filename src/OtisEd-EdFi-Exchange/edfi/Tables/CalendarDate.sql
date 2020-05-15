CREATE TABLE [edfi].[CalendarDate] (
    [OES_Litho]        BIGINT           NULL,
    [SAID]             VARCHAR (8)      NULL,
    [SchoolId]         INT              NULL,
    [Date]             DATE             NULL,
    [Id]               UNIQUEIDENTIFIER NULL,
    [LastModifiedDate] DATETIME         NULL,
    [CreateDate]       DATETIME         NULL,
    [CalendarCode]     NVARCHAR (60)    NULL,
    [SchoolYear]       SMALLINT         NULL,
    [Discriminator]    NVARCHAR (128)   NULL
);

