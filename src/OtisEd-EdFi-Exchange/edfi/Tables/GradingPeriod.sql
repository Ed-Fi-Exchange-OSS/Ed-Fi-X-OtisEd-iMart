CREATE TABLE [edfi].[GradingPeriod] (
    [OES_Litho]                 BIGINT           NULL,
    [SAID]                      VARCHAR (8)      NULL,
    [GradingPeriodDescriptorId] INT              NULL,
    [SchoolId]                  INT              NULL,
    [BeginDate]                 DATE             NULL,
    [TotalInstructionalDays]    INT              NULL,
    [EndDate]                   DATE             NULL,
    [PeriodSequence]            INT              NULL,
    [Id]                        UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]          DATETIME         NULL,
    [CreateDate]                DATETIME         NULL,
    [SchoolYear]                SMALLINT         NULL,
    [Discriminator]             NVARCHAR (128)   NULL
);

