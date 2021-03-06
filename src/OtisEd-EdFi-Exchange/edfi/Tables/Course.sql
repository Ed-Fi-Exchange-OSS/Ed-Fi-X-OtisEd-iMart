﻿CREATE TABLE [edfi].[Course] (
    [OES_Litho]                              BIGINT           NULL,
    [SAID]                                   VARCHAR (8)      NULL,
    [EducationOrganizationId]                INT              NULL,
    [CourseCode]                             NVARCHAR (60)    NULL,
    [CourseTitle]                            NVARCHAR (60)    NULL,
    [NumberOfParts]                          INT              NULL,
    [AcademicSubjectDescriptorId]            INT              NULL,
    [CourseDescription]                      NVARCHAR (1024)  NULL,
    [DateCourseAdopted]                      DATE             NULL,
    [HighSchoolCourseRequirement]            BIT              NULL,
    [MinimumAvailableCreditConversion]       DECIMAL (9, 2)   NULL,
    [MinimumAvailableCredits]                DECIMAL (9, 3)   NULL,
    [MaximumAvailableCreditConversion]       DECIMAL (9, 2)   NULL,
    [MaximumAvailableCredits]                DECIMAL (9, 3)   NULL,
    [TimeRequiredForCompletion]              INT              NULL,
    [Id]                                     UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                       DATETIME         NULL,
    [CreateDate]                             DATETIME         NULL,
    [MaxCompletionsForCredit]                INT              NULL,
    [MinimumAvailableCreditTypeDescriptorId] INT              NULL,
    [MaximumAvailableCreditTypeDescriptorId] INT              NULL,
    [CourseGPAApplicabilityDescriptorId]     INT              NULL,
    [CourseDefinedByDescriptorId]            INT              NULL,
    [CareerPathwayDescriptorId]              INT              NULL,
    [Discriminator]                          NVARCHAR (128)   NULL
);

