CREATE TABLE [edfi].[StudentSpecialEducationProgramAssociation] (
    [OES_Litho]                           BIGINT         NULL,
    [SAID]                                VARCHAR (8)    NULL,
    [StudentUSI]                          INT            NULL,
    [EducationOrganizationId]             INT            NULL,
    [ProgramName]                         NVARCHAR (60)  NULL,
    [ProgramEducationOrganizationId]      INT            NULL,
    [BeginDate]                           DATE           NULL,
    [IdeaEligibility]                     BIT            NULL,
    [SpecialEducationSettingDescriptorId] INT            NULL,
    [SpecialEducationHoursPerWeek]        DECIMAL (5, 2) NULL,
    [SchoolHoursPerWeek]                  DECIMAL (5, 2) NULL,
    [MultiplyDisabled]                    BIT            NULL,
    [MedicallyFragile]                    BIT            NULL,
    [LastEvaluationDate]                  DATE           NULL,
    [IEPReviewDate]                       DATE           NULL,
    [IEPBeginDate]                        DATE           NULL,
    [IEPEndDate]                          DATE           NULL,
    [ProgramTypeDescriptorId]             INT            NULL
);

