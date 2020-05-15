CREATE TABLE [edfi].[StudentSchoolAttendanceEvent] (
    [OES_Litho]                           BIGINT           NULL,
    [SAID]                                VARCHAR (8)      NULL,
    [StudentUSI]                          INT              NULL,
    [SchoolId]                            INT              NULL,
    [SchoolYear]                          SMALLINT         NULL,
    [EventDate]                           DATE             NULL,
    [AttendanceEventCategoryDescriptorId] INT              NULL,
    [AttendanceEventReason]               NVARCHAR (40)    NULL,
    [Id]                                  UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                    DATETIME         NULL,
    [CreateDate]                          DATETIME         NULL,
    [EventDuration]                       DECIMAL (3, 2)   NULL,
    [SessionName]                         NVARCHAR (60)    NULL,
    [EducationalEnvironmentDescriptorId]  INT              NULL,
    [Discriminator]                       NVARCHAR (128)   NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_Sch]
    ON [edfi].[StudentSchoolAttendanceEvent]([SchoolId] ASC)
    INCLUDE([AttendanceEventCategoryDescriptorId], [SchoolYear]);

