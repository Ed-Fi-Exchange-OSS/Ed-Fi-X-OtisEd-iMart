CREATE TABLE [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] (
    [OES_Litho]                               BIGINT        NULL,
    [SAID]                                    VARCHAR (8)   NULL,
    [AssigningOrganizationIdentificationCode] NVARCHAR (60) NULL,
    [EducationOrganizationId]                 INT           NULL,
    [StudentIdentificationSystemDescriptorId] INT           NULL,
    [StudentUSI]                              INT           NULL,
    [IdentificationCode]                      NVARCHAR (60) NULL,
    [CreateDate]                              DATETIME      NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_Stu]
    ON [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode]([StudentUSI] ASC);

