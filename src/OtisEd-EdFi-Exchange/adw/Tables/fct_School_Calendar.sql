CREATE TABLE [adw].[fct_School_Calendar] (
    [School_Calendar_Key]   INT      NOT NULL,
    [Academic_Year_Key]     INT      NOT NULL,
    [District_Key]          INT      NOT NULL,
    [School_Key]            INT      NOT NULL,
    [Date_Key]              INT      NOT NULL,
    [Calendar_Track_Key]    INT      NOT NULL,
    [Calendar_Day_Type_Key] INT      NOT NULL,
    [Cycle_Day_Key]         INT      NOT NULL,
    [Calendar_Date]         DATE     NULL,
    [School_Day_Num]        INT      NULL,
    [Occurrence]            SMALLINT NULL,
    CONSTRAINT [PK_fct_School_Calendar] PRIMARY KEY CLUSTERED ([School_Calendar_Key] ASC)
);

