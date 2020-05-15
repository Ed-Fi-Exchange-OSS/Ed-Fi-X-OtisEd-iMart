CREATE TABLE [edfi].[StaffElectronicMail] (
    [OES_Litho]                      BIGINT         NULL,
    [SAID]                           VARCHAR (8)    NULL,
    [StaffUSI]                       INT            NULL,
    [ElectronicMailAddress]          NVARCHAR (128) NULL,
    [PrimaryEmailAddressIndicator]   BIT            NULL,
    [CreateDate]                     DATETIME       NULL,
    [DoNotPublishIndicator]          BIT            NULL,
    [ElectronicMailTypeDescriptorId] INT            NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_Stf]
    ON [edfi].[StaffElectronicMail]([StaffUSI] ASC)
    INCLUDE([ElectronicMailAddress]);

