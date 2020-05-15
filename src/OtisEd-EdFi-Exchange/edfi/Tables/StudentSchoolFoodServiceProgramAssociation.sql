CREATE TABLE [edfi].[StudentSchoolFoodServiceProgramAssociation] (
    [OES_Litho]                      BIGINT        NULL,
    [SAID]                           VARCHAR (8)   NULL,
    [BeginDate]                      DATE          NULL,
    [EducationOrganizationId]        INT           NULL,
    [ProgramEducationOrganizationId] INT           NULL,
    [ProgramName]                    NVARCHAR (60) NULL,
    [ProgramTypeDescriptorId]        INT           NULL,
    [StudentUSI]                     INT           NULL,
    [DirectCertification]            BIT           NULL
);

