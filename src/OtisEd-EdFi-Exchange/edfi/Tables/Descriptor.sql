CREATE TABLE [edfi].[Descriptor] (
    [OES_Litho]          BIGINT           NULL,
    [SAID]               VARCHAR (8)      NULL,
    [DescriptorId]       INT              NULL,
    [Namespace]          NVARCHAR (255)   NULL,
    [CodeValue]          NVARCHAR (50)    NULL,
    [ShortDescription]   NVARCHAR (75)    NULL,
    [Description]        NVARCHAR (1024)  NULL,
    [PriorDescriptorId]  INT              NULL,
    [EffectiveBeginDate] DATE             NULL,
    [EffectiveEndDate]   DATE             NULL,
    [Id]                 UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]   DATETIME         NULL,
    [CreateDate]         DATETIME         NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_Id]
    ON [edfi].[Descriptor]([DescriptorId] ASC)
    INCLUDE([CodeValue], [Description], [LastModifiedDate]);

