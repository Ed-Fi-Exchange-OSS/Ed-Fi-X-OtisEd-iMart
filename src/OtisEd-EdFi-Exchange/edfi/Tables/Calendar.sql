CREATE TABLE [edfi].[Calendar] (
    [OES_Litho]                BIGINT           NULL,
    [SAID]                     VARCHAR (8)      NULL,
    [CalendarCode]             NVARCHAR (60)    NULL,
    [SchoolId]                 INT              NULL,
    [SchoolYear]               SMALLINT         NULL,
    [CalendarTypeDescriptorId] INT              NULL,
    [CreateDate]               DATETIME         NULL,
    [LastModifiedDate]         DATETIME         NULL,
    [Id]                       UNIQUEIDENTIFIER NULL,
    [Discriminator]            NVARCHAR (128)   NULL
);

