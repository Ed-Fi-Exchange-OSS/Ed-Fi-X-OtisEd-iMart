CREATE TABLE [edfi].[CalendarDateCalendarEvent] (
    [OES_Litho]                 BIGINT        NULL,
    [SAID]                      VARCHAR (8)   NULL,
    [SchoolId]                  INT           NULL,
    [Date]                      DATE          NULL,
    [CalendarEventDescriptorId] INT           NULL,
    [CreateDate]                DATETIME      NULL,
    [CalendarCode]              NVARCHAR (60) NULL,
    [SchoolYear]                SMALLINT      NULL
);


GO
CREATE NONCLUSTERED INDEX [Idx_DescId]
    ON [edfi].[CalendarDateCalendarEvent]([CalendarEventDescriptorId] ASC)
    INCLUDE([CalendarCode], [Date], [SchoolId], [SchoolYear]);


GO
CREATE NONCLUSTERED INDEX [Idx_CodeDateSchYr]
    ON [edfi].[CalendarDateCalendarEvent]([CalendarCode] ASC, [Date] ASC, [SchoolId] ASC, [SchoolYear] ASC)
    INCLUDE([CalendarEventDescriptorId]);

