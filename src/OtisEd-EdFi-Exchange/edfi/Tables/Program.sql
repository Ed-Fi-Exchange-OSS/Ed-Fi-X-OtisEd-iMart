CREATE TABLE [edfi].[Program] (
    [OES_Litho]               BIGINT           NULL,
    [SAID]                    VARCHAR (8)      NULL,
    [EducationOrganizationId] INT              NULL,
    [ProgramName]             NVARCHAR (60)    NULL,
    [ProgramId]               NVARCHAR (20)    NULL,
    [Id]                      UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]        DATETIME         NULL,
    [CreateDate]              DATETIME         NULL,
    [ProgramTypeDescriptorId] INT              NULL,
    [Discriminator]           NVARCHAR (128)   NULL
);

