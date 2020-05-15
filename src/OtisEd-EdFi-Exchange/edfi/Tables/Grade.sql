CREATE TABLE [edfi].[Grade] (
    [OES_Litho]                             BIGINT           NULL,
    [SAID]                                  VARCHAR (8)      NULL,
    [GradingPeriodDescriptorId]             INT              NULL,
    [StudentUSI]                            INT              NULL,
    [SchoolId]                              INT              NULL,
    [LocalCourseCode]                       NVARCHAR (60)    NULL,
    [SchoolYear]                            SMALLINT         NULL,
    [BeginDate]                             DATE             NULL,
    [LetterGradeEarned]                     NVARCHAR (20)    NULL,
    [NumericGradeEarned]                    DECIMAL (9, 2)   NULL,
    [DiagnosticStatement]                   NVARCHAR (1024)  NULL,
    [Id]                                    UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                      DATETIME         NULL,
    [CreateDate]                            DATETIME         NULL,
    [SectionIdentifier]                     NVARCHAR (255)   NULL,
    [SessionName]                           NVARCHAR (60)    NULL,
    [GradingPeriodSequence]                 INT              NULL,
    [GradingPeriodSchoolYear]               SMALLINT         NULL,
    [PerformanceBaseConversionDescriptorId] INT              NULL,
    [GradeTypeDescriptorId]                 INT              NULL,
    [Discriminator]                         NVARCHAR (128)   NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_SchStu]
    ON [edfi].[Grade]([SchoolId] ASC, [StudentUSI] ASC)
    INCLUDE([SAID], [GradeTypeDescriptorId], [GradingPeriodDescriptorId], [SchoolYear], [SectionIdentifier], [SessionName], [LetterGradeEarned], [NumericGradeEarned], [LastModifiedDate], [Id]);

