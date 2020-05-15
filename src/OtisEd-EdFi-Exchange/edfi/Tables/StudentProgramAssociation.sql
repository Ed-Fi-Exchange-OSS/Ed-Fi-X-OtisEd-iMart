CREATE TABLE [edfi].[StudentProgramAssociation] (
    [OES_Litho]                      BIGINT        NULL,
    [SAID]                           VARCHAR (8)   NULL,
    [StudentUSI]                     INT           NULL,
    [EducationOrganizationId]        INT           NULL,
    [ProgramName]                    NVARCHAR (60) NULL,
    [ProgramEducationOrganizationId] INT           NULL,
    [BeginDate]                      DATE          NULL,
    [ProgramTypeDescriptorId]        INT           NULL
);

