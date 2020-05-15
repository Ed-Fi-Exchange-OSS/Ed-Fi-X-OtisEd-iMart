CREATE TABLE [edfi].[Staff] (
    [OES_Litho]                                    BIGINT           NULL,
    [SAID]                                         VARCHAR (8)      NULL,
    [StaffUSI]                                     INT              NULL,
    [PersonalTitlePrefix]                          NVARCHAR (30)    NULL,
    [FirstName]                                    NVARCHAR (75)    NULL,
    [MiddleName]                                   NVARCHAR (75)    NULL,
    [LastSurname]                                  NVARCHAR (75)    NULL,
    [GenerationCodeSuffix]                         NVARCHAR (10)    NULL,
    [MaidenName]                                   NVARCHAR (75)    NULL,
    [BirthDate]                                    DATE             NULL,
    [HispanicLatinoEthnicity]                      BIT              NULL,
    [HighestCompletedLevelOfEducationDescriptorId] INT              NULL,
    [YearsOfPriorProfessionalExperience]           DECIMAL (5, 2)   NULL,
    [YearsOfPriorTeachingExperience]               DECIMAL (5, 2)   NULL,
    [HighlyQualifiedTeacher]                       BIT              NULL,
    [LoginId]                                      NVARCHAR (60)    NULL,
    [StaffUniqueId]                                NVARCHAR (32)    NULL,
    [Id]                                           UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                             DATETIME         NULL,
    [CreateDate]                                   DATETIME         NULL,
    [CitizenshipStatusDescriptorId]                INT              NULL,
    [SexDescriptorId]                              INT              NULL,
    [OldEthnicityDescriptorId]                     INT              NULL,
    [Discriminator]                                NVARCHAR (128)   NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_USI]
    ON [edfi].[Staff]([StaffUSI] ASC)
    INCLUDE([FirstName], [LastSurname]);

