CREATE TABLE [edfi].[StudentEducationOrganizationAssociation] (
    [OES_Litho]                             BIGINT           NULL,
    [SAID]                                  VARCHAR (8)      NULL,
    [StudentUSI]                            INT              NULL,
    [EducationOrganizationId]               INT              NULL,
    [Id]                                    UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                      DATETIME         NULL,
    [CreateDate]                            DATETIME         NULL,
    [ProfileThumbnail]                      NVARCHAR (255)   NULL,
    [HispanicLatinoEthnicity]               BIT              NULL,
    [LimitedEnglishProficiencyDescriptorId] INT              NULL,
    [LoginId]                               NVARCHAR (60)    NULL,
    [SexDescriptorId]                       INT              NULL,
    [OldEthnicityDescriptorId]              INT              NULL,
    [Discriminator]                         NVARCHAR (128)   NULL
);

