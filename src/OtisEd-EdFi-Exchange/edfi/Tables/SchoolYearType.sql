CREATE TABLE [edfi].[SchoolYearType] (
    [OES_Litho]             BIGINT           NULL,
    [SAID]                  VARCHAR (8)      NULL,
    [SchoolYear]            SMALLINT         NULL,
    [SchoolYearDescription] NVARCHAR (50)    NULL,
    [CurrentSchoolYear]     BIT              NULL,
    [Id]                    UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]      DATETIME         NULL,
    [CreateDate]            DATETIME         NULL
);

