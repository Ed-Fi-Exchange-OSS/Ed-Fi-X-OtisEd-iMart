CREATE TABLE [edfi].[ClassPeriod] (
    [OES_Litho]                BIGINT           NULL,
    [SAID]                     VARCHAR (8)      NULL,
    [SchoolId]                 INT              NULL,
    [ClassPeriodName]          NVARCHAR (60)    NULL,
    [Id]                       UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]         DATETIME         NULL,
    [CreateDate]               DATETIME         NULL,
    [OfficialAttendancePeriod] BIT              NULL,
    [Discriminator]            NVARCHAR (128)   NULL
);

