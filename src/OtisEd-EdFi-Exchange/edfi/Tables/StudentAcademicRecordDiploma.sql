﻿CREATE TABLE [edfi].[StudentAcademicRecordDiploma] (
    [OES_Litho]                       BIGINT         NULL,
    [SAID]                            VARCHAR (8)    NULL,
    [StudentUSI]                      INT            NULL,
    [SchoolYear]                      SMALLINT       NULL,
    [TermDescriptorId]                INT            NULL,
    [EducationOrganizationId]         INT            NULL,
    [DiplomaAwardDate]                DATE           NULL,
    [CTECompleter]                    BIT            NULL,
    [DiplomaDescription]              NVARCHAR (80)  NULL,
    [DiplomaAwardExpiresDate]         DATE           NULL,
    [AchievementTitle]                NVARCHAR (60)  NULL,
    [AchievementCategoryDescriptorId] INT            NULL,
    [AchievementCategorySystem]       NVARCHAR (60)  NULL,
    [IssuerName]                      NVARCHAR (150) NULL,
    [IssuerOriginURL]                 NVARCHAR (255) NULL,
    [Criteria]                        NVARCHAR (150) NULL,
    [CriteriaURL]                     NVARCHAR (255) NULL,
    [EvidenceStatement]               NVARCHAR (150) NULL,
    [ImageURL]                        NVARCHAR (255) NULL,
    [CreateDate]                      DATETIME       NULL,
    [DiplomaLevelDescriptorId]        INT            NULL,
    [DiplomaTypeDescriptorId]         INT            NULL
);

