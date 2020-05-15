﻿CREATE TABLE [edfi].[StudentSchoolAssociation] (
    [OES_Litho]                         BIGINT           NULL,
    [SAID]                              VARCHAR (8)      NULL,
    [StudentUSI]                        INT              NULL,
    [SchoolId]                          INT              NULL,
    [SchoolYear]                        SMALLINT         NULL,
    [EntryDate]                         DATE             NULL,
    [EntryGradeLevelDescriptorId]       INT              NULL,
    [EntryTypeDescriptorId]             INT              NULL,
    [RepeatGradeIndicator]              BIT              NULL,
    [SchoolChoiceTransfer]              BIT              NULL,
    [ExitWithdrawDate]                  DATE             NULL,
    [ExitWithdrawTypeDescriptorId]      INT              NULL,
    [ResidencyStatusDescriptorId]       INT              NULL,
    [PrimarySchool]                     BIT              NULL,
    [EmployedWhileEnrolled]             BIT              NULL,
    [ClassOfSchoolYear]                 SMALLINT         NULL,
    [EducationOrganizationId]           INT              NULL,
    [GraduationPlanTypeDescriptorId]    INT              NULL,
    [GraduationSchoolYear]              SMALLINT         NULL,
    [Id]                                UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]                  DATETIME         NULL,
    [CreateDate]                        DATETIME         NULL,
    [CalendarCode]                      NVARCHAR (60)    NULL,
    [EntryGradeLevelReasonDescriptorId] INT              NULL,
    [Discriminator]                     NVARCHAR (128)   NULL
);
