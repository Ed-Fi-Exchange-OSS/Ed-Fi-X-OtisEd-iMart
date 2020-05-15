CREATE TABLE [edfi].[StaffIdentificationCode] (
    [OES_Litho]                               BIGINT        NULL,
    [SAID]                                    VARCHAR (8)   NULL,
    [StaffUSI]                                INT           NULL,
    [AssigningOrganizationIdentificationCode] NVARCHAR (60) NULL,
    [IdentificationCode]                      NVARCHAR (60) NULL,
    [CreateDate]                              DATETIME      NULL,
    [StaffIdentificationSystemDescriptorId]   INT           NULL
);

