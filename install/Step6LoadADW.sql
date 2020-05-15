/***  OtisEd iMart EdFi Starter Data Warehouse version 1.0 
	  Perform ADW Load (Step 6)
***/

alter table adw.[dim_Academic_Year] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Attendance] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Calendar_Day_Type] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Calendar_Track] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Course] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Course_Section] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Cycle_Day] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Date] NOCHECK CONSTRAINT ALL
alter table adw.[dim_District] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Enrollment] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Grade_Type] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Marking_Period] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Period] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Program] NOCHECK CONSTRAINT ALL
alter table adw.[dim_School] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Staff] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Student] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Term] NOCHECK CONSTRAINT ALL
alter table adw.[dim_Withdrawal] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Attendance_Daily_Activity] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Attendance_Period_Activity] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Enrollment_Pairs] NOCHECK CONSTRAINT ALL
alter table adw.[fct_School_Calendar] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Student_Course_Grade] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Student_Course_Schedule] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Student_Course_Transcript] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Student_Program_Participation] NOCHECK CONSTRAINT ALL
alter table adw.[fct_Teacher_Course_Schedule] NOCHECK CONSTRAINT ALL


delete from [adw].[dim_Academic_Year]
insert into [adw].[dim_Academic_Year] ( [Academic_Year_Key], [Academic_Year_Name], [Academic_Year_Short_Name], [Start_Year], [End_Year], [Academic_Year_Nbr_Sequence], [State_Funded_School_Days_In_Year], [Current_Academic_Year_Ind], [Last_Updated_T1])
select  [Academic_Year_Key], [Academic_Year_Name], [Academic_Year_Short_Name], [Start_Year], [End_Year], [Academic_Year_Nbr_Sequence], [State_Funded_School_Days_In_Year], [Current_Academic_Year_Ind], [Last_Updated_T1] from [tdw].[dim_Academic_Year] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Attendance]
insert into [adw].[dim_Attendance] ( [Attendance_Key], [Attendance_Category_Cd], [Attendance_State_Category_Cd], [Attendance_Cd], [Attendance_Desc], [Attendance_Sort_Order], [Attendance_State_Cd], [Attendance_State_Desc], [Last_Updated_T1])
select  [Attendance_Key], [Attendance_Category_Cd], [Attendance_State_Category_Cd], [Attendance_Cd], [Attendance_Desc], [Attendance_Sort_Order], [Attendance_State_Cd], [Attendance_State_Desc], [Last_Updated_T1] from [tdw].[dim_Attendance] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Calendar_Day_Type]
insert into [adw].[dim_Calendar_Day_Type] ( [Calendar_Day_Type_Key], [Calendar_Day_Type_Cd], [Calendar_Day_Type_Desc], [Calendar_Day_Type_Sort_Order], [School_Day_Ind], [Holiday_Ind], [Staff_Day_Ind], [Calendar_Day_Type_Planned_Make_Up_Day_Ind], [Calendar_Day_Type_Actual_Make_Up_Day_Ind], [Calendar_Day_Type_Inclement_Weather_Day_Ind], [Last_Updated_T1])
select  [Calendar_Day_Type_Key], [Calendar_Day_Type_Cd], [Calendar_Day_Type_Desc], [Calendar_Day_Type_Sort_Order], [School_Day_Ind], [Holiday_Ind], [Staff_Day_Ind], [Calendar_Day_Type_Planned_Make_Up_Day_Ind], [Calendar_Day_Type_Actual_Make_Up_Day_Ind], [Calendar_Day_Type_Inclement_Weather_Day_Ind], [Last_Updated_T1] from [tdw].[dim_Calendar_Day_Type] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Calendar_Track]
insert into [adw].[dim_Calendar_Track] ( [Calendar_Track_Key], [Calendar_Track_School_Id], [Calendar_Track_Cd], [Calendar_Track_Desc], [Calendar_Track_Sort_Order], [Summer_School_Ind], [Track_First_Instructional_Date], [Track_Last_Instructional_Date], [Track_Planned_Instructional_Days], [Track_Instructional_Minutes], [Track_Whole_Day_Absences_Minutes], [Track_Half_Day_Absences_Minutes], [Last_Updated_T1])
select  [Calendar_Track_Key], [Calendar_Track_School_Id], [Calendar_Track_Cd], [Calendar_Track_Desc], [Calendar_Track_Sort_Order], [Summer_School_Ind], [Track_First_Instructional_Date], [Track_Last_Instructional_Date], [Track_Planned_Instructional_Days], [Track_Instructional_Minutes], [Track_Whole_Day_Absences_Minutes], [Track_Half_Day_Absences_Minutes], [Last_Updated_T1] from [tdw].[dim_Calendar_Track] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Course]
insert into [adw].[dim_Course] ( [Course_Key], [Course_Cd], [Course_Title], [Course_Desc], [Course_State_Cd], [Course_State_Title], [Course_State_Code_Desc], [Course_Department_Desc], [Course_Active_Ind], [Course_Level_Cd], [Advanced_Placement_Cd], [Advanced_Placement_Desc], [SCED_Course_Cd], [SCED_Course_Subject_Cd], [SCED_Course_Sequence], [Last_Updated_T1])
select  [Course_Key], [Course_Cd], [Course_Title], [Course_Desc], [Course_State_Cd], [Course_State_Title], [Course_State_Code_Desc], [Course_Department_Desc], [Course_Active_Ind], [Course_Level_Cd], [Advanced_Placement_Cd], [Advanced_Placement_Desc], [SCED_Course_Cd], [SCED_Course_Subject_Cd], [SCED_Course_Sequence], [Last_Updated_T1] from [tdw].[dim_Course] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Course_Section]
insert into [adw].[dim_Course_Section] ( [Course_Section_Key], [Course_School_Id], [Course_Cd], [Course_Section_Identifier], [Course_Section_Cd], [Course_School_Name], [Course_Title], [Course_Desc], [Course_Sort_Order], [Course_State_Cd], [Course_State_Title], [Course_State_Code_Desc], [Course_Department_Desc], [Course_Active_Ind], [Course_Level_Cd], [Course_Level_Sort_Order], [Advanced_Placement_Cd], [Advanced_Placement_Desc], [Course_Credit_Value], [SCED_Course_Cd], [SCED_Course_Subject_Cd], [SCED_Course_Sequence], [Classroom_Identifier], [Delivery_Mode_Cd], [Delivery_Mode_Desc], [Primary_Teacher_Unique_Id], [Primary_Teacher_Full_Name], [Course_Key], [Last_Updated_T1])
select  [Course_Section_Key], [Course_School_Id], [Course_Cd], [Course_Section_Identifier], [Course_Section_Cd], [Course_School_Name], [Course_Title], [Course_Desc], [Course_Sort_Order], [Course_State_Cd], [Course_State_Title], [Course_State_Code_Desc], [Course_Department_Desc], [Course_Active_Ind], [Course_Level_Cd], [Course_Level_Sort_Order], [Advanced_Placement_Cd], [Advanced_Placement_Desc], [Course_Credit_Value], [SCED_Course_Cd], [SCED_Course_Subject_Cd], [SCED_Course_Sequence], [Classroom_Identifier], [Delivery_Mode_Cd], [Delivery_Mode_Desc], [Primary_Teacher_Unique_Id], [Primary_Teacher_Full_Name], [Course_Key], [Last_Updated_T1] from [tdw].[dim_Course_Section] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Cycle_Day]
insert into [adw].[dim_Cycle_Day] ( [Cycle_Day_Key], [Cycle_Day_Cd], [Cycle_Day_Desc], [Cycle_Day_Sort_Order], [Last_Updated_T1])
select  [Cycle_Day_Key], [Cycle_Day_Cd], [Cycle_Day_Desc], [Cycle_Day_Sort_Order], [Last_Updated_T1] from [tdw].[dim_Cycle_Day] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Date]
insert into [adw].[dim_Date] ( [Date_Key], [Date_Record_Type], [Year_Name], [Year_Number_Sequence], [Year_Begin_Date], [Year_End_Date], [Days_In_Year], [Quarter_Name], [Year_Quarter_Name], [Quarter_Number_In_Year], [Quarter_Number_Sequence], [Quarter_Begin_Date], [Quarter_End_Date], [Days_In_Quarter], [Month_Name], [Month_Year_Name], [Year_Month_Yyyy_Mm], [Month_Abbr], [Month_Year_Abbr], [Month_Number_In_Year], [Month_Number_In_Quarter], [Month_Number_Sequence], [Month_Begin_Date], [Month_End_Date], [Days_In_Month], [Week_Name], [Week_Abbr], [Year_Week_Name], [Year_Week_Abbr], [Week_Desc_Short], [Week_Desc], [Week_Begin_Date], [Week_End_Date], [Week_Number_In_Year], [Week_Number_Sequence], [Date_Of_Day], [Date_String], [Date_Desc], [Date_Desc_Short], [Day_Number_In_Year], [First_Day_In_Year_Ind], [Last_Day_In_Year_Ind], [Day_Number_In_Quarter], [First_Day_In_Quarter_Ind], [Last_Day_In_Quarter_Ind], [Day_Number_In_Month], [First_Day_In_Month_Ind], [Last_Day_In_Month_Ind], [Weekday_Name], [Weekday_Abbr], [Day_Number_In_Week], [First_Day_In_Week_Ind], [Last_Day_In_Week_Ind], [Day_Number_Sequence], [Weekday_Ind], [Last_Updated_T1])
select  [Date_Key], [Date_Record_Type], [Year_Name], [Year_Number_Sequence], [Year_Begin_Date], [Year_End_Date], [Days_In_Year], [Quarter_Name], [Year_Quarter_Name], [Quarter_Number_In_Year], [Quarter_Number_Sequence], [Quarter_Begin_Date], [Quarter_End_Date], [Days_In_Quarter], [Month_Name], [Month_Year_Name], [Year_Month_Yyyy_Mm], [Month_Abbr], [Month_Year_Abbr], [Month_Number_In_Year], [Month_Number_In_Quarter], [Month_Number_Sequence], [Month_Begin_Date], [Month_End_Date], [Days_In_Month], [Week_Name], [Week_Abbr], [Year_Week_Name], [Year_Week_Abbr], [Week_Desc_Short], [Week_Desc], [Week_Begin_Date], [Week_End_Date], [Week_Number_In_Year], [Week_Number_Sequence], [Date_Of_Day], [Date_String], [Date_Desc], [Date_Desc_Short], [Day_Number_In_Year], [First_Day_In_Year_Ind], [Last_Day_In_Year_Ind], [Day_Number_In_Quarter], [First_Day_In_Quarter_Ind], [Last_Day_In_Quarter_Ind], [Day_Number_In_Month], [First_Day_In_Month_Ind], [Last_Day_In_Month_Ind], [Weekday_Name], [Weekday_Abbr], [Day_Number_In_Week], [First_Day_In_Week_Ind], [Last_Day_In_Week_Ind], [Day_Number_Sequence], [Weekday_Ind], [Last_Updated_T1] from [tdw].[dim_Date] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_District]
insert into [adw].[dim_District] ( [District_Key], [District_Id], [District_Name], [Superintendent_Name], [State_Abbr], [State_Name], [County_Name], [REA_Name], [REA_Abbr], [District_Academic_Year_Began], [District_Academic_Year_Ended], [District_Phone], [District_Address_1], [District_Address_2], [District_City], [District_State], [District_Postal_Cd], [District_Latitude], [District_Longitude], [Last_Updated_T1])
select  [District_Key], [District_Id], [District_Name], [Superintendent_Name], [State_Abbr], [State_Name], [County_Name], [REA_Name], [REA_Abbr], [District_Academic_Year_Began], [District_Academic_Year_Ended], [District_Phone], [District_Address_1], [District_Address_2], [District_City], [District_State], [District_Postal_Cd], [District_Latitude], [District_Longitude], [Last_Updated_T1] from [tdw].[dim_District] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Enrollment]
insert into [adw].[dim_Enrollment] ( [Enrollment_Key], [Enrollment_Cd], [Enrollment_Desc], [Enrollment_State_Cd], [Enrollment_State_Desc], [Enrollment_Sort_Order], [Last_Updated_T1])
select  [Enrollment_Key], [Enrollment_Cd], [Enrollment_Desc], [Enrollment_State_Cd], [Enrollment_State_Desc], [Enrollment_Sort_Order], [Last_Updated_T1] from [tdw].[dim_Enrollment] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Grade_Type]
insert into [adw].[dim_Grade_Type] ( [Grade_Type_Key], [Grade_Type_Cd], [Grade_Type_Desc], [Grade_Type_Sort_Order], [Last_Updated_T1])
select  [Grade_Type_Key], [Grade_Type_Cd], [Grade_Type_Desc], [Grade_Type_Sort_Order], [Last_Updated_T1] from [tdw].[dim_Grade_Type] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Marking_Period]
insert into [adw].[dim_Marking_Period] ( [Marking_Period_Key], [Calendar_Track_Cd], [Calendar_Track_Desc], [Calendar_Track_Sort_Order], [Summer_School_Ind], [Track_First_Instructional_Date], [Track_Last_Instructional_Date], [Term_Cd], [Term_Desc], [Term_Sort_Order], [Term_First_Instructional_Date], [Term_Last_Instructional_Date], [Marking_Period_Cd], [Marking_Period_Desc], [Marking_Period_Sort_Order], [Marking_Period_Begin_Date], [Marking_Period_End_Date], [Calendar_Track_Key], [Term_Key], [Last_Updated_T1])
select  [Marking_Period_Key], [Calendar_Track_Cd], [Calendar_Track_Desc], [Calendar_Track_Sort_Order], [Summer_School_Ind], [Track_First_Instructional_Date], [Track_Last_Instructional_Date], [Term_Cd], [Term_Desc], [Term_Sort_Order], [Term_First_Instructional_Date], [Term_Last_Instructional_Date], [Marking_Period_Cd], [Marking_Period_Desc], [Marking_Period_Sort_Order], [Marking_Period_Begin_Date], [Marking_Period_End_Date], [Calendar_Track_Key], [Term_Key], [Last_Updated_T1] from [tdw].[dim_Marking_Period] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Period]
insert into [adw].[dim_Period] ( [Period_Key], [Period_School_Id], [Period_Cd], [Period_Desc], [Period_Sort_Order], [Period_Start_Time], [Period_End_Time], [Period_Noninstructional_Minutes], [Last_Updated_T1])
select  [Period_Key], [Period_School_Id], [Period_Cd], [Period_Desc], [Period_Sort_Order], [Period_Start_Time], [Period_End_Time], [Period_Noninstructional_Minutes], [Last_Updated_T1] from [tdw].[dim_Period] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Program]
insert into [adw].[dim_Program] ( [Program_Key], [Program_Cd], [Program_Desc], [Program_Sort_Order], [Last_Updated_T1])
select  [Program_Key], [Program_Cd], [Program_Desc], [Program_Sort_Order], [Last_Updated_T1] from [tdw].[dim_Program] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_School]
insert into [adw].[dim_School] ( [School_Key], [District_Id], [School_Id], [School_Name], [School_Grade_Cd_Low], [School_Grade_Cd_High], [School_Principal_Name], [School_Level_Cd], [School_Level_Name], [School_Level_Desc], [NCES_School_Type_Cd], [NCES_School_Type_Name], [NCES_School_Type_Desc], [School_Type_Cd], [School_Type_Name], [School_Type_Desc], [School_State_Cd], [School_Local_Cd], [School_NCES_Cd], [School_NCES_Name], [School_Sat_School_Cd], [School_Unique_Id], [School_Short_Name], [School_Academic_Year_Began], [School_Academic_Year_Ended], [School_Is_Closed_Ind], [School_Principal_Email], [School_Phone], [School_Address_1], [School_Address_2], [School_City], [School_State], [School_Postal_Cd], [School_Latitude], [School_Longitude], [School_Url], [School_Title1_Ind], [School_Title1_Cd], [School_Title1_Desc], [School_Magnet_Ind], [School_Charter_Ind], [School_Accountability_Ind], [School_NCES_Phone], [School_NCES_Grade_Span], [School_NCES_Operational_Status], [School_Special_Assistance_Status], [School_Cpr_Aed_Instruction_Ind], [School_Online_School_Ind], [School_Course_Catalog_Master_List_Name], [School_State_Reported_Ind], [Last_Updated_T1])
select  [School_Key], [District_Id], [School_Id], [School_Name], [School_Grade_Cd_Low], [School_Grade_Cd_High], [School_Principal_Name], [School_Level_Cd], [School_Level_Name], [School_Level_Desc], [NCES_School_Type_Cd], [NCES_School_Type_Name], [NCES_School_Type_Desc], [School_Type_Cd], [School_Type_Name], [School_Type_Desc], [School_State_Cd], [School_Local_Cd], [School_NCES_Cd], [School_NCES_Name], [School_Sat_School_Cd], [School_Unique_Id], [School_Short_Name], [School_Academic_Year_Began], [School_Academic_Year_Ended], [School_Is_Closed_Ind], [School_Principal_Email], [School_Phone], [School_Address_1], [School_Address_2], [School_City], [School_State], [School_Postal_Cd], [School_Latitude], [School_Longitude], [School_Url], [School_Title1_Ind], [School_Title1_Cd], [School_Title1_Desc], [School_Magnet_Ind], [School_Charter_Ind], [School_Accountability_Ind], [School_NCES_Phone], [School_NCES_Grade_Span], [School_NCES_Operational_Status], [School_Special_Assistance_Status], [School_Cpr_Aed_Instruction_Ind], [School_Online_School_Ind], [School_Course_Catalog_Master_List_Name], [School_State_Reported_Ind], [Last_Updated_T1] from [tdw].[dim_School] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Staff]
insert into [adw].[dim_Staff] ( [Staff_Key], [Local_Staff_Id], [Staff_Unique_Id], [Staff_State_Id_Nbr], [Staff_SSN], [Staff_First_Name], [Staff_Middle_Name], [Staff_Last_Name], [Staff_Name_Suffix], [Staff_Full_Name], [Staff_Preferred_Name], [Staff_Sort_Name], [Staff_Birth_Date], [Staff_Gender_Cd], [Staff_Gender_Desc], [Staff_Gender_Sort_Order], [Staff_Primary_Ethnicity_Cd], [Staff_Type_Cd], [Staff_Type_Desc], [Staff_Type_Sort_Order], [Hire_Date], [Total_Salary_Amt], [Instruction_Salary_Amt], [Total_Contract_Hours], [Last_Updated_T1])
select  [Staff_Key], [Local_Staff_Id], [Staff_Unique_Id], [Staff_State_Id_Nbr], [Staff_SSN], [Staff_First_Name], [Staff_Middle_Name], [Staff_Last_Name], [Staff_Name_Suffix], [Staff_Full_Name], [Staff_Preferred_Name], [Staff_Sort_Name], [Staff_Birth_Date], [Staff_Gender_Cd], [Staff_Gender_Desc], [Staff_Gender_Sort_Order], [Staff_Primary_Ethnicity_Cd], [Staff_Type_Cd], [Staff_Type_Desc], [Staff_Type_Sort_Order], [Hire_Date], [Total_Salary_Amt], [Instruction_Salary_Amt], [Total_Contract_Hours], [Last_Updated_T1] from [tdw].[dim_Staff] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Student]
insert into [adw].[dim_Student] ( [Student_Key], [Local_Student_Id], [Student_Unique_Id], [Student_State_Id_Nbr], [Student_Current_Enrolled_Ind], [Student_First_Name], [Student_Middle_Name], [Student_Last_Name], [Student_Name_Suffix], [Student_Full_Name], [Student_Preferred_Name], [Student_Sort_Name], [Student_SSN], [Student_Birth_Date], [Student_Birth_Year_Month], [Student_Birth_Year], [Student_Birth_Country_Cd], [Student_Birth_Country_Name], [Student_Gender_Cd], [Student_Gender_Desc], [Student_Gender_Sort_Order], [American_Indian_Or_Alaska_Native_Ind], [Asian_Ind], [Black_Or_African_American_Ind], [Native_Hawaiian_Or_Other_Pacific_Islander_Ind], [White_Ind], [Hispanic_Latino_Ind], [Hispanic_Latino_Desc], [Race_Desc], [Federal_Race_Ethnicity_Desc], [Number_Of_Races_Reported], [Student_Immigrant_Ind], [Student_Migrant_Ind], [Student_Refugee_Ind], [Student_Current_LEP_Ind], [Student_Current_Grade_Level_Cd], [Student_Current_Grade_Level_Desc], [Student_Current_Grade_Level_Sort_Order], [Student_Current_State_Grade_Level_Cd], [Student_Current_State_Grade_Level_Desc], [Student_Current_State_Grade_Level_Sort_Order], [Student_Current_Economically_Disadvantaged_Ind], [Student_Current_Free_Reduced_Meal_Cd], [Student_Current_Free_Reduced_Meal_Desc], [Student_Current_Free_Reduced_Meal_Sort_Order], [Student_Current_Disability_Ind], [Student_Date_Entered_District], [Student_Date_Entered_USA_School], [Student_Resident_District], [Student_Citizenship_Country], [Student_USA_Date_Of_Entry], [Student_Primary_Language], [Student_Year_Entered_9th_Grade], [Student_Graduation_Ind], [Student_Graduation_Date], [Student_Diploma_Type_Cd], [Student_Received_Ged_Ind], [Student_Current_Title_1_Cd], [Student_Current_Homeless_Ind], [Student_Homeless_Unaccompanied_Youth_Ind], [Student_Current_SpEd_Eligible_Ind], [Student_Current_SpEd_Receiving_Ind], [Student_SpEd_Area_of_Exceptionality], [Student_State_Funding_Type], [Student_Current_Gifted_Ind], [Current_School_Id], [Current_School_Name], [Last_Updated_T1], [Current_Record_Ind])
select  [Student_Key], [Local_Student_Id], [Student_Unique_Id], [Student_State_Id_Nbr], [Student_Current_Enrolled_Ind], [Student_First_Name], [Student_Middle_Name], [Student_Last_Name], [Student_Name_Suffix], [Student_Full_Name], [Student_Preferred_Name], [Student_Sort_Name], [Student_SSN], [Student_Birth_Date], [Student_Birth_Year_Month], [Student_Birth_Year], [Student_Birth_Country_Cd], [Student_Birth_Country_Name], [Student_Gender_Cd], [Student_Gender_Desc], [Student_Gender_Sort_Order], [American_Indian_Or_Alaska_Native_Ind], [Asian_Ind], [Black_Or_African_American_Ind], [Native_Hawaiian_Or_Other_Pacific_Islander_Ind], [White_Ind], [Hispanic_Latino_Ind], [Hispanic_Latino_Desc], [Race_Desc], [Federal_Race_Ethnicity_Desc], [Number_Of_Races_Reported], [Student_Immigrant_Ind], [Student_Migrant_Ind], [Student_Refugee_Ind], [Student_Current_LEP_Ind], [Student_Current_Grade_Level_Cd], [Student_Current_Grade_Level_Desc], [Student_Current_Grade_Level_Sort_Order], [Student_Current_State_Grade_Level_Cd], [Student_Current_State_Grade_Level_Desc], [Student_Current_State_Grade_Level_Sort_Order], [Student_Current_Economically_Disadvantaged_Ind], [Student_Current_Free_Reduced_Meal_Cd], [Student_Current_Free_Reduced_Meal_Desc], [Student_Current_Free_Reduced_Meal_Sort_Order], [Student_Current_Disability_Ind], [Student_Date_Entered_District], [Student_Date_Entered_USA_School], [Student_Resident_District], [Student_Citizenship_Country], [Student_USA_Date_Of_Entry], [Student_Primary_Language], [Student_Year_Entered_9th_Grade], [Student_Graduation_Ind], [Student_Graduation_Date], [Student_Diploma_Type_Cd], [Student_Received_Ged_Ind], [Student_Current_Title_1_Cd], [Student_Current_Homeless_Ind], [Student_Homeless_Unaccompanied_Youth_Ind], [Student_Current_SpEd_Eligible_Ind], [Student_Current_SpEd_Receiving_Ind], [Student_SpEd_Area_of_Exceptionality], [Student_State_Funding_Type], [Student_Current_Gifted_Ind], [Current_School_Id], [Current_School_Name], [Last_Updated_T1], [Current_Record_Ind] from [tdw].[dim_Student] with (nolock)
where Current_Record_Ind='Y'and No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Term]
insert into [adw].[dim_Term] ( [Term_Key], [Calendar_Track_Cd], [Calendar_Track_Desc], [Calendar_Track_Sort_Order], [Summer_School_Ind], [Track_First_Instructional_Date], [Track_Last_Instructional_Date], [Track_Planned_Instructional_Days], [Track_Actual_Instructional_Days], [Term_Cd], [Term_Desc], [Term_Sort_Order], [Term_First_Instructional_Date], [Term_Last_Instructional_Date], [Term_Planned_Instructional_Days], [Term_Actual_Instructional_Days], [Calendar_Track_Key], [Last_Updated_T1])
select  [Term_Key], [Calendar_Track_Cd], [Calendar_Track_Desc], [Calendar_Track_Sort_Order], [Summer_School_Ind], [Track_First_Instructional_Date], [Track_Last_Instructional_Date], [Track_Planned_Instructional_Days], [Track_Actual_Instructional_Days], [Term_Cd], [Term_Desc], [Term_Sort_Order], [Term_First_Instructional_Date], [Term_Last_Instructional_Date], [Term_Planned_Instructional_Days], [Term_Actual_Instructional_Days], [Calendar_Track_Key], [Last_Updated_T1] from [tdw].[dim_Term] with (nolock)
where No_Longer_In_Source_Ind='N'

delete from [adw].[dim_Withdrawal]
insert into [adw].[dim_Withdrawal] ( [Withdrawal_Key], [Withdrawal_Cd], [Withdrawal_Desc], [Withdrawal_State_Cd], [Withdrawal_State_Desc], [Withdrawal_Sort_Order], [Last_Updated_T1])
select  [Withdrawal_Key], [Withdrawal_Cd], [Withdrawal_Desc], [Withdrawal_State_Cd], [Withdrawal_State_Desc], [Withdrawal_Sort_Order], [Last_Updated_T1] from [tdw].[dim_Withdrawal] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Attendance_Daily_Activity]
insert into [adw].[fct_Attendance_Daily_Activity] ( [Attendance_Daily_Activity_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Student_Key], [Attendance_Key], [Attendance_Date_Key], [Attendance_Calendar_Date], [Attendance_Days_Absent_Count], [Periods_Absent], [Periods_Scheduled], [Minutes_Absent], [Minutes_Scheduled])
select  [Attendance_Daily_Activity_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Student_Key], [Attendance_Key], [Attendance_Date_Key], [Attendance_Calendar_Date], [Attendance_Days_Absent_Count], [Periods_Absent], [Periods_Scheduled], [Minutes_Absent], [Minutes_Scheduled] from [tdw].[fct_Attendance_Daily_Activity] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Attendance_Period_Activity]
insert into [adw].[fct_Attendance_Period_Activity] ( [Attendance_Period_Activity_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Period_Key], [Student_Key], [Attendance_Key], [Attendance_Date_Key], [Attendance_Calendar_Date], [Attendance_Periods_Absent_Count], [Minutes_Absent], [Minutes_Scheduled])
select  [Attendance_Period_Activity_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Period_Key], [Student_Key], [Attendance_Key], [Attendance_Date_Key], [Attendance_Calendar_Date], [Attendance_Periods_Absent_Count], [Minutes_Absent], [Minutes_Scheduled] from [tdw].[fct_Attendance_Period_Activity] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Enrollment_Pairs]
insert into [adw].[fct_Enrollment_Pairs] ( [Enrollment_Pairs_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Student_Key], [Enrollment_Key], [Enrollment_Date_Key], [Withdrawal_Key], [Withdrawal_Date_Key], [Serving_District_Id], [Resident_District_Id], [Enrollment_Date], [Withdrawal_Date], [Enrolled_Grade_Level], [Current_Enrollment_Ind], [Percent_Enrolled], [Enrollment_Count], [No_Show_Count], [Calendar_Days_Enrolled], [FullYear_Enrollment_Count])
select  [Enrollment_Pairs_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Student_Key], [Enrollment_Key], [Enrollment_Date_Key], [Withdrawal_Key], [Withdrawal_Date_Key], [Serving_District_Id], [Resident_District_Id], [Enrollment_Date], [Withdrawal_Date], [Enrolled_Grade_Level], [Current_Enrollment_Ind], [Percent_Enrolled], [Enrollment_Count], [No_Show_Count], [Calendar_Days_Enrolled], [FullYear_Enrollment_Count] from [tdw].[fct_Enrollment_Pairs] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_School_Calendar]
insert into [adw].[fct_School_Calendar] ( [School_Calendar_Key], [Academic_Year_Key], [District_Key], [School_Key], [Date_Key], [Calendar_Track_Key], [Calendar_Day_Type_Key], [Cycle_Day_Key], [Calendar_Date], [School_Day_Num], [Occurrence])
select  [School_Calendar_Key], [Academic_Year_Key], [District_Key], [School_Key], [Date_Key], [Calendar_Track_Key], [Calendar_Day_Type_Key], [Cycle_Day_Key], [Calendar_Date], [School_Day_Num], [Occurrence] from [tdw].[fct_School_Calendar] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Student_Course_Grade]
insert into [adw].[fct_Student_Course_Grade] ( [Student_Course_Grade_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Term_Key], [Marking_Period_Key], [Grade_Type_Key], [Course_Section_Key], [Student_Key], [Letter_Grade], [Numeric_Grade], [Grade_Point_Max], [Passing_Grade_Ind])
select  [Student_Course_Grade_Key], [Academic_Year_Key], [District_Key], [School_Key], [Calendar_Track_Key], [Term_Key], [Marking_Period_Key], [Grade_Type_Key], [Course_Section_Key], [Student_Key], [Letter_Grade], [Numeric_Grade], [Grade_Point_Max], [Passing_Grade_Ind] from [tdw].[fct_Student_Course_Grade] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Student_Course_Schedule]
insert into [adw].[fct_Student_Course_Schedule] ( [Student_Course_Schedule_Key], [Academic_Year_Key], [District_Key], [Calendar_Track_Key], [Term_Key], [Course_Section_Key], [Student_Key], [Enrolled_School_Key], [Attending_School_Key], [Cycle_Day_Key], [Start_Period_Key], [End_Period_Key], [Entered_Date_Key], [Exited_Date_Key], [Entered_Calendar_Date], [Exited_Calendar_Date], [Course_Enroll_Count])
select  [Student_Course_Schedule_Key], [Academic_Year_Key], [District_Key], [Calendar_Track_Key], [Term_Key], [Course_Section_Key], [Student_Key], [Enrolled_School_Key], [Attending_School_Key], [Cycle_Day_Key], [Start_Period_Key], [End_Period_Key], [Entered_Date_Key], [Exited_Date_Key], [Entered_Calendar_Date], [Exited_Calendar_Date], [Course_Enroll_Count] from [tdw].[fct_Student_Course_Schedule] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Student_Course_Transcript]
insert into [adw].[fct_Student_Course_Transcript] ( [Student_Course_Grade_Key], [Academic_Year_Key], [District_Key], [School_Key], [Term_Key], [Student_Key], [Letter_Grade], [Numeric_Grade], [Credit_Attempted], [Credit_Earned], [Quality_Points_Earned], [Grade_Point_Max], [Passing_Grade_Ind], [Content_Completer_Ind])
select  [Student_Course_Grade_Key], [Academic_Year_Key], [District_Key], [School_Key], [Term_Key], [Student_Key], [Letter_Grade], [Numeric_Grade], [Credit_Attempted], [Credit_Earned], [Quality_Points_Earned], [Grade_Point_Max], [Passing_Grade_Ind], [Content_Completer_Ind] from [tdw].[fct_Student_Course_Transcript] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Student_Program_Participation]
insert into [adw].[fct_Student_Program_Participation] ( [Student_Program_Participation_Key], [Academic_Year_Key], [District_Key], [School_Key], [Program_Key], [Student_Key], [Effective_Date_Key], [Ending_Date_Key], [Occurrence], [Effective_Date], [Ending_Date])
select  [Student_Program_Participation_Key], [Academic_Year_Key], [District_Key], [School_Key], [Program_Key], [Student_Key], [Effective_Date_Key], [Ending_Date_Key], [Occurrence], [Effective_Date], [Ending_Date] from [tdw].[fct_Student_Program_Participation] with (nolock)
where No_Longer_In_Source_Ind='N'

truncate table [adw].[fct_Teacher_Course_Schedule]
insert into [adw].[fct_Teacher_Course_Schedule] ( [Teacher_Course_Schedule_Key], [Academic_Year_Key], [District_Key], [Calendar_Track_Key], [Term_Key], [Course_Section_Key], [Staff_Key], [School_Key], [Cycle_Day_Key], [Start_Period_Key], [End_Period_Key], [Entered_Date_Key], [Exited_Date_Key], [Entered_Calendar_Date], [Exited_Calendar_Date], [Course_Enroll_Count], [Primary_Secondary_CD])
select  [Teacher_Course_Schedule_Key], [Academic_Year_Key], [District_Key], [Calendar_Track_Key], [Term_Key], [Course_Section_Key], [Staff_Key], [School_Key], [Cycle_Day_Key], [Start_Period_Key], [End_Period_Key], [Entered_Date_Key], [Exited_Date_Key], [Entered_Calendar_Date], [Exited_Calendar_Date], [Course_Enroll_Count], [Primary_Secondary_CD] from [tdw].[fct_Teacher_Course_Schedule] with (nolock)
where No_Longer_In_Source_Ind='N'

alter table adw.[dim_Academic_Year] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Attendance] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Calendar_Day_Type] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Calendar_Track] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Course] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Course_Section] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Cycle_Day] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Date] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_District] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Enrollment] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Grade_Type] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Marking_Period] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Period] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Program] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_School] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Staff] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Student] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Term] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[dim_Withdrawal] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Attendance_Daily_Activity] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Attendance_Period_Activity] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Enrollment_Pairs] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_School_Calendar] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Student_Course_Grade] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Student_Course_Schedule] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Student_Course_Transcript] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Student_Program_Participation] WITH CHECK CHECK CONSTRAINT ALL
alter table adw.[fct_Teacher_Course_Schedule] WITH CHECK CHECK CONSTRAINT ALL