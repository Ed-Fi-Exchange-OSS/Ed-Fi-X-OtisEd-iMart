CREATE TABLE [edfi].[EducationOrganization] (
    [OES_Litho]                     BIGINT           NULL,
    [SAID]                          VARCHAR (8)      NULL,
    [EducationOrganizationId]       INT              NULL,
    [NameOfInstitution]             NVARCHAR (75)    NULL,
    [ShortNameOfInstitution]        NVARCHAR (75)    NULL,
    [WebSite]                       NVARCHAR (255)   NULL,
    [Id]                            UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]              DATETIME         NULL,
    [CreateDate]                    DATETIME         NULL,
    [OperationalStatusDescriptorId] INT              NULL,
    [Discriminator]                 NVARCHAR (128)   NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_Id]
    ON [edfi].[EducationOrganization]([EducationOrganizationId] ASC);

