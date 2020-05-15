CREATE TABLE [tdw].[dim_School] (
    [School_Key]                             INT            IDENTITY (1, 1) NOT NULL,
    [Hash_Key_BK]                            VARBINARY (16) NOT NULL,
    [District_Id]                            VARCHAR (16)   NOT NULL,
    [School_Id]                              VARCHAR (16)   NOT NULL,
    [School_Name]                            VARCHAR (60)   NULL,
    [School_Grade_Cd_Low]                    VARCHAR (5)    NULL,
    [School_Grade_Cd_High]                   VARCHAR (5)    NULL,
    [School_Principal_Name]                  VARCHAR (24)   NULL,
    [School_Level_Cd]                        VARCHAR (16)   NULL,
    [School_Level_Name]                      VARCHAR (60)   NULL,
    [School_Level_Desc]                      VARCHAR (60)   NULL,
    [NCES_School_Type_Cd]                    VARCHAR (16)   NULL,
    [NCES_School_Type_Name]                  VARCHAR (60)   NULL,
    [NCES_School_Type_Desc]                  VARCHAR (60)   NULL,
    [School_Type_Cd]                         VARCHAR (16)   NULL,
    [School_Type_Name]                       VARCHAR (60)   NULL,
    [School_Type_Desc]                       VARCHAR (60)   NULL,
    [School_State_Cd]                        VARCHAR (16)   NULL,
    [School_Local_Cd]                        VARCHAR (16)   NULL,
    [School_NCES_Cd]                         CHAR (5)       NULL,
    [School_NCES_Name]                       VARCHAR (60)   NULL,
    [School_Sat_School_Cd]                   CHAR (6)       NULL,
    [School_Unique_Id]                       VARCHAR (16)   NULL,
    [School_Short_Name]                      VARCHAR (60)   NULL,
    [School_Academic_Year_Began]             VARCHAR (9)    NULL,
    [School_Academic_Year_Ended]             VARCHAR (9)    NULL,
    [School_Is_Closed_Ind]                   CHAR (1)       NULL,
    [School_Principal_Email]                 VARCHAR (60)   NULL,
    [School_Phone]                           VARCHAR (24)   NULL,
    [School_Address_1]                       VARCHAR (36)   NULL,
    [School_Address_2]                       VARCHAR (36)   NULL,
    [School_City]                            VARCHAR (24)   NULL,
    [School_State]                           VARCHAR (2)    NULL,
    [School_Postal_Cd]                       VARCHAR (10)   NULL,
    [School_Latitude]                        DECIMAL (9, 6) NULL,
    [School_Longitude]                       DECIMAL (9, 6) NULL,
    [School_Url]                             VARCHAR (100)  NULL,
    [School_Title1_Ind]                      CHAR (1)       NULL,
    [School_Title1_Cd]                       VARCHAR (16)   NULL,
    [School_Title1_Desc]                     VARCHAR (60)   NULL,
    [School_Magnet_Ind]                      CHAR (1)       NULL,
    [School_Charter_Ind]                     CHAR (1)       NULL,
    [School_Accountability_Ind]              CHAR (1)       NULL,
    [School_NCES_Phone]                      VARCHAR (24)   NULL,
    [School_NCES_Grade_Span]                 VARCHAR (16)   NULL,
    [School_NCES_Operational_Status]         VARCHAR (60)   NULL,
    [School_Special_Assistance_Status]       VARCHAR (60)   NULL,
    [School_Cpr_Aed_Instruction_Ind]         CHAR (1)       NULL,
    [School_Online_School_Ind]               CHAR (1)       NULL,
    [School_Course_Catalog_Master_List_Name] VARCHAR (60)   NULL,
    [School_State_Reported_Ind]              CHAR (1)       NULL,
    [Date_Stamp]                             DATETIME2 (7)  NOT NULL,
    [Hash_Key_T1]                            VARBINARY (16) NOT NULL,
    [Last_Updated_T1]                        DATETIME2 (7)  NULL,
    [No_Longer_In_Source_Ind]                CHAR (1)       NOT NULL,
    CONSTRAINT [PK_dim_School] PRIMARY KEY CLUSTERED ([School_Key] ASC)
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


