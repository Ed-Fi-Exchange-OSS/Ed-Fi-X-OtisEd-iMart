CREATE TABLE [edfi].[StudentSectionAssociation] (
    [OES_Litho]                       BIGINT           NULL,
    [SAID]                            VARCHAR (8)      NULL,
    [StudentUSI]                      INT              NULL,
    [SchoolId]                        INT              NULL,
    [LocalCourseCode]                 NVARCHAR (60)    NULL,
    [SchoolYear]                      SMALLINT         NULL,
    [BeginDate]                       DATE             NULL,
    [EndDate]                         DATE             NULL,
    [HomeroomIndicator]               BIT              NULL,
    [TeacherStudentDataLinkExclusion] BIT              NULL,
    [Id]                              UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                DATETIME         NULL,
    [CreateDate]                      DATETIME         NULL,
    [SectionIdentifier]               NVARCHAR (255)   NULL,
    [SessionName]                     NVARCHAR (60)    NULL,
    [AttemptStatusDescriptorId]       INT              NULL,
    [RepeatIdentifierDescriptorId]    INT              NULL,
    [Discriminator]                   NVARCHAR (128)   NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_SchStu]
    ON [edfi].[StudentSectionAssociation]([SchoolId] ASC, [StudentUSI] ASC)
    INCLUDE([SchoolYear], [SessionName]);

