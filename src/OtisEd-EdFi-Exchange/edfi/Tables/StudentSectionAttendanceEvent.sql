CREATE TABLE [edfi].[StudentSectionAttendanceEvent] (
    [OES_Litho]                           BIGINT           NULL,
    [SAID]                                VARCHAR (8)      NULL,
    [AttendanceEventCategoryDescriptorId] INT              NULL,
    [EventDate]                           DATE             NULL,
    [LocalCourseCode]                     NVARCHAR (60)    NULL,
    [SchoolId]                            INT              NULL,
    [SchoolYear]                          SMALLINT         NULL,
    [SectionIdentifier]                   NVARCHAR (255)   NULL,
    [SessionName]                         NVARCHAR (60)    NULL,
    [StudentUSI]                          INT              NULL,
    [AttendanceEventReason]               NVARCHAR (40)    NULL,
    [EducationalEnvironmentDescriptorId]  INT              NULL,
    [EventDuration]                       DECIMAL (3, 2)   NULL,
    [CreateDate]                          DATETIME         NULL,
    [LastModifiedDate]                    DATETIME         NULL,
    [Id]                                  UNIQUEIDENTIFIER NULL,
    [Discriminator]                       NVARCHAR (128)   NULL
);

