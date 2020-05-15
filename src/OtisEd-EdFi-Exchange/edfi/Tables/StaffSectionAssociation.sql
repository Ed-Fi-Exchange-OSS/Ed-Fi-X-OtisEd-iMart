CREATE TABLE [edfi].[StaffSectionAssociation] (
    [OES_Litho]                       BIGINT           NULL,
    [SAID]                            VARCHAR (8)      NULL,
    [StaffUSI]                        INT              NULL,
    [SchoolId]                        INT              NULL,
    [LocalCourseCode]                 NVARCHAR (60)    NULL,
    [SchoolYear]                      SMALLINT         NULL,
    [ClassroomPositionDescriptorId]   INT              NULL,
    [BeginDate]                       DATE             NULL,
    [EndDate]                         DATE             NULL,
    [HighlyQualifiedTeacher]          BIT              NULL,
    [TeacherStudentDataLinkExclusion] BIT              NULL,
    [PercentageContribution]          DECIMAL (5, 4)   NULL,
    [Id]                              UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                DATETIME         NULL,
    [CreateDate]                      DATETIME         NULL,
    [SectionIdentifier]               NVARCHAR (255)   NULL,
    [SessionName]                     NVARCHAR (60)    NULL,
    [Discriminator]                   NVARCHAR (128)   NULL
);

