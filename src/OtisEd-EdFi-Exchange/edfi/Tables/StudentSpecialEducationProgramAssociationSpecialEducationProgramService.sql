CREATE TABLE [edfi].[StudentSpecialEducationProgramAssociationSpecialEducationProgramService] (
    [OES_Litho]                                  BIGINT        NULL,
    [SAID]                                       VARCHAR (8)   NULL,
    [BeginDate]                                  DATE          NULL,
    [EducationOrganizationId]                    INT           NULL,
    [ProgramEducationOrganizationId]             INT           NULL,
    [ProgramName]                                NVARCHAR (60) NULL,
    [ProgramTypeDescriptorId]                    INT           NULL,
    [SpecialEducationProgramServiceDescriptorId] INT           NULL,
    [StudentUSI]                                 INT           NULL,
    [PrimaryIndicator]                           BIT           NULL,
    [ServiceBeginDate]                           DATE          NULL,
    [ServiceEndDate]                             DATE          NULL,
    [CreateDate]                                 DATETIME      NULL
);

