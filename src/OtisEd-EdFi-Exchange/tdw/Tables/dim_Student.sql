CREATE TABLE [tdw].[dim_Student] (
    [Student_Key]                                    INT            IDENTITY (1, 1) NOT NULL,
    [Student_Sequence]                               INT            NOT NULL,
    [Hash_Key_BK]                                    VARBINARY (16) NOT NULL,
    [Local_Student_Id]                               VARCHAR (30)   NOT NULL,
    [Student_Unique_Id]                              VARCHAR (30)   NULL,
    [Student_State_Id_Nbr]                           VARCHAR (30)   NULL,
    [Student_Current_Enrolled_Ind]                   CHAR (1)       NULL,
    [Student_First_Name]                             VARCHAR (30)   NULL,
    [Student_Middle_Name]                            VARCHAR (30)   NULL,
    [Student_Last_Name]                              VARCHAR (30)   NULL,
    [Student_Name_Suffix]                            VARCHAR (30)   NULL,
    [Student_Full_Name]                              VARCHAR (254)  NULL,
    [Student_Preferred_Name]                         VARCHAR (254)  NULL,
    [Student_Sort_Name]                              VARCHAR (254)  NULL,
    [Student_SSN]                                    VARCHAR (11)   NULL,
    [Student_Birth_Date]                             DATE           NULL,
    [Student_Birth_Year_Month]                       CHAR (7)       NULL,
    [Student_Birth_Year]                             CHAR (4)       NULL,
    [Student_Birth_Country_Cd]                       VARCHAR (30)   NULL,
    [Student_Birth_Country_Name]                     VARCHAR (254)  NULL,
    [Student_Gender_Cd]                              VARCHAR (30)   NULL,
    [Student_Gender_Desc]                            VARCHAR (254)  NULL,
    [Student_Gender_Sort_Order]                      SMALLINT       NULL,
    [American_Indian_Or_Alaska_Native_Ind]           CHAR (1)       NULL,
    [Asian_Ind]                                      CHAR (1)       NULL,
    [Black_Or_African_American_Ind]                  CHAR (1)       NULL,
    [Native_Hawaiian_Or_Other_Pacific_Islander_Ind]  CHAR (1)       NULL,
    [White_Ind]                                      CHAR (1)       NULL,
    [Hispanic_Latino_Ind]                            CHAR (1)       NULL,
    [Hispanic_Latino_Desc]                           VARCHAR (64)   NULL,
    [Race_Desc]                                      VARCHAR (132)  NULL,
    [Federal_Race_Ethnicity_Desc]                    VARCHAR (255)  NULL,
    [Number_Of_Races_Reported]                       SMALLINT       NULL,
    [Student_Immigrant_Ind]                          CHAR (1)       NULL,
    [Student_Migrant_Ind]                            CHAR (1)       NULL,
    [Student_Refugee_Ind]                            CHAR (1)       NULL,
    [Student_Current_LEP_Ind]                        CHAR (1)       NULL,
    [Student_Current_Grade_Level_Cd]                 VARCHAR (30)   NULL,
    [Student_Current_Grade_Level_Desc]               VARCHAR (254)  NULL,
    [Student_Current_Grade_Level_Sort_Order]         SMALLINT       NULL,
    [Student_Current_State_Grade_Level_Cd]           VARCHAR (30)   NULL,
    [Student_Current_State_Grade_Level_Desc]         VARCHAR (254)  NULL,
    [Student_Current_State_Grade_Level_Sort_Order]   SMALLINT       NULL,
    [Student_Current_Economically_Disadvantaged_Ind] CHAR (1)       NULL,
    [Student_Current_Free_Reduced_Meal_Cd]           VARCHAR (30)   NULL,
    [Student_Current_Free_Reduced_Meal_Desc]         VARCHAR (254)  NULL,
    [Student_Current_Free_Reduced_Meal_Sort_Order]   SMALLINT       NULL,
    [Student_Current_Disability_Ind]                 CHAR (1)       NULL,
    [Student_Date_Entered_District]                  DATE           NULL,
    [Student_Date_Entered_USA_School]                DATE           NULL,
    [Student_Resident_District]                      VARCHAR (30)   NULL,
    [Student_Citizenship_Country]                    VARCHAR (30)   NULL,
    [Student_USA_Date_Of_Entry]                      DATE           NULL,
    [Student_Primary_Language]                       VARCHAR (30)   NULL,
    [Student_Year_Entered_9th_Grade]                 CHAR (4)       NULL,
    [Student_Graduation_Ind]                         CHAR (1)       NULL,
    [Student_Graduation_Date]                        DATE           NULL,
    [Student_Diploma_Type_Cd]                        VARCHAR (30)   NULL,
    [Student_Received_Ged_Ind]                       CHAR (1)       NULL,
    [Student_Current_Title_1_Cd]                     VARCHAR (30)   NULL,
    [Student_Current_Homeless_Ind]                   CHAR (1)       NULL,
    [Student_Homeless_Unaccompanied_Youth_Ind]       CHAR (1)       NULL,
    [Student_Current_SpEd_Eligible_Ind]              CHAR (1)       NULL,
    [Student_Current_SpEd_Receiving_Ind]             CHAR (1)       NULL,
    [Student_SpEd_Area_of_Exceptionality]            VARCHAR (50)   NULL,
    [Student_State_Funding_Type]                     VARCHAR (254)  NULL,
    [Student_Current_Gifted_Ind]                     CHAR (1)       NULL,
    [Current_School_Id]                              VARCHAR (16)   NULL,
    [Current_School_Name]                            VARCHAR (60)   NULL,
    [Date_Stamp]                                     DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                                    VARBINARY (16) NOT NULL,
    [Hash_Key_T1C]                                   VARBINARY (16) NOT NULL,
    [Last_Updated_T1]                                DATETIME2 (7)  NULL,
    [Transaction_Start_Date]                         DATETIME2 (7)  NOT NULL,
    [Transaction_End_Date]                           DATETIME2 (7)  NOT NULL,
    [Current_Record_Ind]                             CHAR (1)       NOT NULL,
    [No_Longer_In_Source_Ind]                        CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_Student] PRIMARY KEY CLUSTERED ([Student_Key] ASC, [Student_Sequence] ASC)
);




GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


