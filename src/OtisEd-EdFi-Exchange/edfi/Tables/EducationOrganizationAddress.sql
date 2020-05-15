CREATE TABLE [edfi].[EducationOrganizationAddress] (
    [OES_Litho]                     BIGINT         NULL,
    [SAID]                          VARCHAR (8)    NULL,
    [EducationOrganizationId]       INT            NULL,
    [StreetNumberName]              NVARCHAR (150) NULL,
    [ApartmentRoomSuiteNumber]      NVARCHAR (50)  NULL,
    [BuildingSiteNumber]            NVARCHAR (20)  NULL,
    [City]                          NVARCHAR (30)  NULL,
    [PostalCode]                    NVARCHAR (17)  NULL,
    [NameOfCounty]                  NVARCHAR (30)  NULL,
    [CountyFIPSCode]                NVARCHAR (5)   NULL,
    [Latitude]                      NVARCHAR (20)  NULL,
    [Longitude]                     NVARCHAR (20)  NULL,
    [CreateDate]                    DATETIME       NULL,
    [DoNotPublishIndicator]         BIT            NULL,
    [AddressTypeDescriptorId]       INT            NULL,
    [StateAbbreviationDescriptorId] INT            NULL,
    [CongressionalDistrict]         NVARCHAR (30)  NULL,
    [LocaleDescriptorId]            INT            NULL
);

