CREATE TABLE [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] (
    [OES_Litho]                         BIGINT        NULL,
    [SAID]                              VARCHAR (8)   NULL,
    [EducationOrganizationId]           INT           NULL,
    [StudentCharacteristicDescriptorId] INT           NULL,
    [StudentUSI]                        INT           NULL,
    [DesignatedBy]                      NVARCHAR (60) NULL,
    [CreateDate]                        DATETIME      NULL
);

