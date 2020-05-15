CREATE TABLE [edfi].[StudentSpecialEducationProgramAssociationDisability] (
    [OES_Litho]                                     BIGINT        NULL,
    [SAID]                                          VARCHAR (8)   NULL,
    [BeginDate]                                     DATE          NULL,
    [DisabilityDescriptorId]                        INT           NULL,
    [EducationOrganizationId]                       INT           NULL,
    [ProgramEducationOrganizationId]                INT           NULL,
    [ProgramName]                                   NVARCHAR (60) NULL,
    [ProgramTypeDescriptorId]                       INT           NULL,
    [StudentUSI]                                    INT           NULL,
    [DisabilityDiagnosis]                           NVARCHAR (80) NULL,
    [OrderOfDisability]                             INT           NULL,
    [DisabilityDeterminationSourceTypeDescriptorId] INT           NULL,
    [CreateDate]                                    DATETIME      NULL
);

