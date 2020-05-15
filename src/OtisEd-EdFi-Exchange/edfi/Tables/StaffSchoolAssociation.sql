CREATE TABLE [edfi].[StaffSchoolAssociation] (
    [OES_Litho]                     BIGINT           NULL,
    [SAID]                          VARCHAR (8)      NULL,
    [StaffUSI]                      INT              NULL,
    [ProgramAssignmentDescriptorId] INT              NULL,
    [SchoolId]                      INT              NULL,
    [SchoolYear]                    SMALLINT         NULL,
    [Id]                            UNIQUEIDENTIFIER NULL,
    [LastModifiedDate]              DATETIME         NULL,
    [CreateDate]                    DATETIME         NULL,
    [CalendarCode]                  NVARCHAR (60)    NULL,
    [Discriminator]                 NVARCHAR (128)   NULL
);

