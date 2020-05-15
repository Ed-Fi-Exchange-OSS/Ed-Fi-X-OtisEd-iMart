CREATE TABLE [conform].[dim_Calendar_Day_Type] (
    [Calendar_Day_Type_Cd]                        VARCHAR (30)  NULL,
    [Calendar_Day_Type_Desc]                      VARCHAR (254) NULL,
    [Calendar_Day_Type_Sort_Order]                SMALLINT      NULL,
    [School_Day_Ind]                              CHAR (1)      NULL,
    [Holiday_Ind]                                 CHAR (1)      NULL,
    [Staff_Day_Ind]                               CHAR (1)      NULL,
    [Calendar_Day_Type_Planned_Make_Up_Day_Ind]   CHAR (1)      NULL,
    [Calendar_Day_Type_Actual_Make_Up_Day_Ind]    CHAR (1)      NULL,
    [Calendar_Day_Type_Inclement_Weather_Day_Ind] CHAR (1)      NULL,
    [Batch_Period]                                VARCHAR (50)  NULL,
    [SAID]                                        VARCHAR (30)  NULL,
    [Date_Stamp]                                  DATETIME2 (7) NULL
);

