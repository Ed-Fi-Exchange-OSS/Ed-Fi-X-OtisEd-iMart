CREATE TABLE [edfi].[StaffEducationOrganizationAssignmentAssociation] (
    [OES_Litho]                                 BIGINT           NULL,
    [SAID]                                      VARCHAR (8)      NULL,
    [StaffUSI]                                  INT              NULL,
    [EducationOrganizationId]                   INT              NULL,
    [StaffClassificationDescriptorId]           INT              NULL,
    [BeginDate]                                 DATE             NULL,
    [PositionTitle]                             NVARCHAR (100)   NULL,
    [EndDate]                                   DATE             NULL,
    [OrderOfAssignment]                         INT              NULL,
    [EmploymentEducationOrganizationId]         INT              NULL,
    [EmploymentStatusDescriptorId]              INT              NULL,
    [EmploymentHireDate]                        DATE             NULL,
    [Id]                                        UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                          DATETIME         NULL,
    [CreateDate]                                DATETIME         NULL,
    [CredentialIdentifier]                      NVARCHAR (60)    NULL,
    [StateOfIssueStateAbbreviationDescriptorId] INT              NULL,
    [Discriminator]                             NVARCHAR (128)   NULL
);

