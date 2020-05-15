CREATE TABLE [edfi].[CourseOffering] (
    [OES_Litho]                BIGINT           NULL,
    [SAID]                     VARCHAR (8)      NULL,
    [LocalCourseCode]          NVARCHAR (60)    NULL,
    [SchoolId]                 INT              NULL,
    [SchoolYear]               SMALLINT         NULL,
    [LocalCourseTitle]         NVARCHAR (60)    NULL,
    [InstructionalTimePlanned] INT              NULL,
    [CourseCode]               NVARCHAR (60)    NULL,
    [EducationOrganizationId]  INT              NULL,
    [Id]                       UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]         DATETIME         NULL,
    [CreateDate]               DATETIME         NULL,
    [SessionName]              NVARCHAR (60)    NULL,
    [Discriminator]            NVARCHAR (128)   NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_LCCodeSchYrSession]
    ON [edfi].[CourseOffering]([LocalCourseCode] ASC, [SchoolId] ASC, [SchoolYear] ASC, [SessionName] ASC)
    INCLUDE([CourseCode]);

