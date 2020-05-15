CREATE TABLE [dbo].[CodeXref] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [CodeCategory]    NVARCHAR (50)  NOT NULL,
    [ValueColumnName] NVARCHAR (50)  NULL,
    [ValueDataType]   NVARCHAR (50)  NULL,
    [LocalCode]       NVARCHAR (50)  NOT NULL,
    [LocalValue]      NVARCHAR (254) NULL,
    [LocalSortOrder]  INT            NULL,
    [XrefCode]        NVARCHAR (50)  NULL,
    [XrefValue]       NVARCHAR (254) NULL,
    [XrefSortOrder]   INT            NULL,
    [Version]         NVARCHAR (20)  NULL,
    CONSTRAINT [PK_dbo.CodeXref] PRIMARY KEY CLUSTERED ([Id] ASC)
);

