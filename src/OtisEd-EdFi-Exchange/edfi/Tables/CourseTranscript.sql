﻿CREATE TABLE [edfi].[CourseTranscript] (
    [OES_Litho]                       BIGINT           NULL,
    [SAID]                            VARCHAR (8)      NULL,
    [StudentUSI]                      INT              NULL,
    [EducationOrganizationId]         INT              NULL,
    [CourseEducationOrganizationId]   INT              NULL,
    [SchoolYear]                      SMALLINT         NULL,
    [TermDescriptorId]                INT              NULL,
    [CourseCode]                      NVARCHAR (60)    NULL,
    [AttemptedCreditConversion]       DECIMAL (9, 2)   NULL,
    [AttemptedCredits]                DECIMAL (9, 3)   NULL,
    [EarnedCreditConversion]          DECIMAL (9, 2)   NULL,
    [EarnedCredits]                   DECIMAL (9, 3)   NULL,
    [WhenTakenGradeLevelDescriptorId] INT              NULL,
    [FinalLetterGradeEarned]          NVARCHAR (20)    NULL,
    [FinalNumericGradeEarned]         DECIMAL (9, 2)   NULL,
    [CourseTitle]                     NVARCHAR (60)    NULL,
    [AlternativeCourseTitle]          NVARCHAR (60)    NULL,
    [AlternativeCourseCode]           NVARCHAR (60)    NULL,
    [Id]                              UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                DATETIME         NULL,
    [CreateDate]                      DATETIME         NULL,
    [ExternalEducationOrganizationId] INT              NULL,
    [AttemptedCreditTypeDescriptorId] INT              NULL,
    [MethodCreditEarnedDescriptorId]  INT              NULL,
    [EarnedCreditTypeDescriptorId]    INT              NULL,
    [CourseRepeatCodeDescriptorId]    INT              NULL,
    [CourseAttemptResultDescriptorId] INT              NULL,
    [Discriminator]                   NVARCHAR (128)   NULL
);
