CREATE TABLE [edfi].[StudentOtherName] (
    [OES_Litho]                 BIGINT        NULL,
    [SAID]                      VARCHAR (8)   NULL,
    [StudentUSI]                INT           NULL,
    [PersonalTitlePrefix]       NVARCHAR (30) NULL,
    [FirstName]                 NVARCHAR (75) NULL,
    [MiddleName]                NVARCHAR (75) NULL,
    [LastSurname]               NVARCHAR (75) NULL,
    [GenerationCodeSuffix]      NVARCHAR (10) NULL,
    [CreateDate]                DATETIME      NULL,
    [OtherNameTypeDescriptorId] INT           NULL
);

