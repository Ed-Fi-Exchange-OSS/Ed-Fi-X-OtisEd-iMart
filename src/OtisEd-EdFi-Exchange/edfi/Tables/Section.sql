CREATE TABLE [edfi].[Section] (
    [OES_Litho]                           BIGINT           NULL,
    [SAID]                                VARCHAR (8)      NULL,
    [SchoolId]                            INT              NULL,
    [LocalCourseCode]                     NVARCHAR (60)    NULL,
    [SchoolYear]                          SMALLINT         NULL,
    [SequenceOfCourse]                    INT              NULL,
    [AvailableCreditConversion]           DECIMAL (9, 2)   NULL,
    [InstructionLanguageDescriptorId]     INT              NULL,
    [AvailableCredits]                    DECIMAL (9, 3)   NULL,
    [Id]                                  UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                    DATETIME         NULL,
    [CreateDate]                          DATETIME         NULL,
    [SessionName]                         NVARCHAR (60)    NULL,
    [SectionIdentifier]                   NVARCHAR (255)   NULL,
    [LocationSchoolId]                    INT              NULL,
    [LocationClassroomIdentificationCode] NVARCHAR (60)    NULL,
    [PopulationServedDescriptorId]        INT              NULL,
    [MediumOfInstructionDescriptorId]     INT              NULL,
    [EducationalEnvironmentDescriptorId]  INT              NULL,
    [AvailableCreditTypeDescriptorId]     INT              NULL,
    [Discriminator]                       NVARCHAR (128)   NULL
);

