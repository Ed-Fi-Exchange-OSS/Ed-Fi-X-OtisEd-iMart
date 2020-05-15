CREATE TABLE [edfi].[CourseIdentificationCode] (
    [OES_Litho]                               BIGINT        NULL,
    [SAID]                                    VARCHAR (8)   NULL,
    [EducationOrganizationId]                 INT           NULL,
    [CourseCode]                              NVARCHAR (60) NULL,
    [AssigningOrganizationIdentificationCode] NVARCHAR (60) NULL,
    [IdentificationCode]                      NVARCHAR (60) NULL,
    [CreateDate]                              DATETIME      NULL,
    [CourseIdentificationSystemDescriptorId]  INT           NULL
);

