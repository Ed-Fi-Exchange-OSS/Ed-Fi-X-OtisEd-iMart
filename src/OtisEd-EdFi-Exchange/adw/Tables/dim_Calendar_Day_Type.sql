CREATE TABLE [adw].[dim_Calendar_Day_Type] (
    [Calendar_Day_Type_Key]                       INT           NOT NULL,
    [Calendar_Day_Type_Cd]                        VARCHAR (30)  NOT NULL,
    [Calendar_Day_Type_Desc]                      VARCHAR (254) NULL,
    [Calendar_Day_Type_Sort_Order]                SMALLINT      NULL,
    [School_Day_Ind]                              CHAR (1)      NULL,
    [Holiday_Ind]                                 CHAR (1)      NULL,
    [Staff_Day_Ind]                               CHAR (1)      NULL,
    [Calendar_Day_Type_Planned_Make_Up_Day_Ind]   CHAR (1)      NULL,
    [Calendar_Day_Type_Actual_Make_Up_Day_Ind]    CHAR (1)      NULL,
    [Calendar_Day_Type_Inclement_Weather_Day_Ind] CHAR (1)      NULL,
    [Last_Updated_T1]                             DATETIME2 (7) NULL,
    CONSTRAINT [PK_dim_Calendar_Day_Type] PRIMARY KEY CLUSTERED ([Calendar_Day_Type_Key] ASC)
);

