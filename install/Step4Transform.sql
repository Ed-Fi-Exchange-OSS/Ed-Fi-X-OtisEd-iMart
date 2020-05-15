/***  OtisEd iMart EdFi Starter Data Warehouse version 1.0 
	  Perform Transformations (Step 4)
***/

/*
	Transformation Script - Calls each transformation stored procedure loading the conform tables with the results of each procedure.

	Notes:  Target conform table is truncated before loading
			SAID parameter is set globally (SAID - Submitting Agency Id)
			 - Assumes source data was staged using Zipline which adds the SAID to each table.
			 - If source doesn't contain SAID, then each transform should be edited to hard code an SAID and that value should be used here.
			Processing Period parameter is set globally (It is set to 2018 in this example. Need to change to match your data year) 
*/
declare @SAID nvarchar(30) = 'XYZ-EDFI3'
declare @ProcessingPeriod varchar(max) = '2018'

truncate table [conform].[dim_Academic_Year]
insert into [conform].[dim_Academic_Year] with (tablockx) ([Academic_Year_Name],[Academic_Year_Short_Name],[Start_Year],[End_Year],[Academic_Year_Nbr_Sequence],[State_Funded_School_Days_In_Year],[Current_Academic_Year_Ind],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Academic_Year_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Attendance]
insert into [conform].[dim_Attendance] with (tablockx) ([Attendance_Category_Cd],[Attendance_State_Category_Cd],[Attendance_Cd],[Attendance_Desc],[Attendance_Sort_Order],[Attendance_State_Cd],[Attendance_State_Desc],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Attendance_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Calendar_Day_Type]
insert into [conform].[dim_Calendar_Day_Type] with (tablockx) ([Calendar_Day_Type_Cd],[Calendar_Day_Type_Desc],[Calendar_Day_Type_Sort_Order],[School_Day_Ind],[Holiday_Ind],[Staff_Day_Ind],[Calendar_Day_Type_Planned_Make_Up_Day_Ind],[Calendar_Day_Type_Actual_Make_Up_Day_Ind],[Calendar_Day_Type_Inclement_Weather_Day_Ind],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Calendar_Day_Type_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Calendar_Track]
insert into [conform].[dim_Calendar_Track] with (tablockx) ([Calendar_Track_School_Id],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Instructional_Minutes],[Track_Whole_Day_Absences_Minutes],[Track_Half_Day_Absences_Minutes],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Calendar_Track_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Course]
insert into [conform].[dim_Course] with (tablockx) ([Course_Cd],[Course_Title],[Course_Desc],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Course_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Course_Section]
insert into [conform].[dim_Course_Section] with (tablockx) ([Course_School_Id],[Course_Cd],[Course_Section_Identifier],[Course_Section_Cd],[Course_School_Name],[Course_Title],[Course_Desc],[Course_Sort_Order],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Course_Level_Sort_Order],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[Course_Credit_Value],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Classroom_Identifier],[Delivery_Mode_Cd],[Delivery_Mode_Desc],[Primary_Teacher_Unique_Id],[Primary_Teacher_Full_Name],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Course_Section_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Cycle_Day]
insert into [conform].[dim_Cycle_Day] with (tablockx) ([Cycle_Day_Cd],[Cycle_Day_Desc],[Cycle_Day_Sort_Order],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Cycle_Day_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Date]
insert into [conform].[dim_Date] with (tablockx) ([Date_Record_Type],[Year_Name],[Year_Number_Sequence],[Year_Begin_Date],[Year_End_Date],[Days_In_Year],[Quarter_Name],[Year_Quarter_Name],[Quarter_Number_In_Year],[Quarter_Number_Sequence],[Quarter_Begin_Date],[Quarter_End_Date],[Days_In_Quarter],[Month_Name],[Month_Year_Name],[Year_Month_Yyyy_Mm],[Month_Abbr],[Month_Year_Abbr],[Month_Number_In_Year],[Month_Number_In_Quarter],[Month_Number_Sequence],[Month_Begin_Date],[Month_End_Date],[Days_In_Month],[Week_Name],[Week_Abbr],[Year_Week_Name],[Year_Week_Abbr],[Week_Desc_Short],[Week_Desc],[Week_Begin_Date],[Week_End_Date],[Week_Number_In_Year],[Week_Number_Sequence],[Date_Of_Day],[Date_String],[Date_Desc],[Date_Desc_Short],[Day_Number_In_Year],[First_Day_In_Year_Ind],[Last_Day_In_Year_Ind],[Day_Number_In_Quarter],[First_Day_In_Quarter_Ind],[Last_Day_In_Quarter_Ind],[Day_Number_In_Month],[First_Day_In_Month_Ind],[Last_Day_In_Month_Ind],[Weekday_Name],[Weekday_Abbr],[Day_Number_In_Week],[First_Day_In_Week_Ind],[Last_Day_In_Week_Ind],[Day_Number_Sequence],[Weekday_Ind],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Date] @BeginDate='2001-08-01', @NbrYears=30

truncate table [conform].[dim_District]
insert into [conform].[dim_District] with (tablockx) ([District_Id],[District_Name],[Superintendent_Name],[State_Abbr],[State_Name],[County_Name],[REA_Name],[REA_Abbr],[District_Academic_Year_Began],[District_Academic_Year_Ended],[District_Phone],[District_Address_1],[District_Address_2],[District_City],[District_State],[District_Postal_Cd],[District_Latitude],[District_Longitude],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_District_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Enrollment]
insert into [conform].[dim_Enrollment] with (tablockx) ([Enrollment_Cd],[Enrollment_Desc],[Enrollment_State_Cd],[Enrollment_State_Desc],[Enrollment_Sort_Order],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Enrollment_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Grade_Type]
insert into [conform].[dim_Grade_Type] with (tablockx) ([Grade_Type_Cd],[Grade_Type_Desc],[Grade_Type_Sort_Order],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Grade_Type_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Marking_Period]
insert into [conform].[dim_Marking_Period] with (tablockx) ([Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Marking_Period_Cd],[Marking_Period_Desc],[Marking_Period_Sort_Order],[Marking_Period_Begin_Date],[Marking_Period_End_Date],[Calendar_Track_School_Id],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Marking_Period_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Period]
insert into [conform].[dim_Period] with (tablockx) ([Period_School_Id],[Period_Cd],[Period_Desc],[Period_Sort_Order],[Period_Start_Time],[Period_End_Time],[Period_Noninstructional_Minutes],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Period_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Program]
insert into [conform].[dim_Program] with (tablockx) ([Program_Cd],[Program_Desc],[Program_Sort_Order],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Program_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_School]
insert into [conform].[dim_School] with (tablockx) ([District_Id],[School_Id],[School_Name],[School_Grade_Cd_Low],[School_Grade_Cd_High],[School_Principal_Name],[School_Level_Cd],[School_Level_Name],[School_Level_Desc],[NCES_School_Type_Cd],[NCES_School_Type_Name],[NCES_School_Type_Desc],[School_Type_Cd],[School_Type_Name],[School_Type_Desc],[School_State_Cd],[School_Local_Cd],[School_NCES_Cd],[School_NCES_Name],[School_Sat_School_Cd],[School_Unique_Id],[School_Short_Name],[School_Academic_Year_Began],[School_Academic_Year_Ended],[School_Is_Closed_Ind],[School_Principal_Email],[School_Phone],[School_Address_1],[School_Address_2],[School_City],[School_State],[School_Postal_Cd],[School_Latitude],[School_Longitude],[School_Url],[School_Title1_Ind],[School_Title1_Cd],[School_Title1_Desc],[School_Magnet_Ind],[School_Charter_Ind],[School_Accountability_Ind],[School_NCES_Phone],[School_NCES_Grade_Span],[School_NCES_Operational_Status],[School_Special_Assistance_Status],[School_Cpr_Aed_Instruction_Ind],[School_Online_School_Ind],[School_Course_Catalog_Master_List_Name],[School_State_Reported_Ind],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_School_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Staff]
insert into [conform].[dim_Staff] with (tablockx) ([Local_Staff_Id],[Staff_Unique_Id],[Staff_State_Id_Nbr],[Staff_SSN],[Staff_First_Name],[Staff_Middle_Name],[Staff_Last_Name],[Staff_Name_Suffix],[Staff_Full_Name],[Staff_Preferred_Name],[Staff_Sort_Name],[Staff_Birth_Date],[Staff_Gender_Cd],[Staff_Gender_Desc],[Staff_Gender_Sort_Order],[Staff_Primary_Ethnicity_Cd],[Staff_Type_Cd],[Staff_Type_Desc],[Staff_Type_Sort_Order],[Hire_Date],[Total_Salary_Amt],[Instruction_Salary_Amt],[Total_Contract_Hours],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Staff_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Student]
insert into [conform].[dim_Student] with (tablockx) ([Local_Student_Id],[Student_Unique_Id],[Student_State_Id_Nbr],[Student_Current_Enrolled_Ind],[Student_First_Name],[Student_Middle_Name],[Student_Last_Name],[Student_Name_Suffix],[Student_Full_Name],[Student_Preferred_Name],[Student_Sort_Name],[Student_SSN],[Student_Birth_Date],[Student_Birth_Year_Month],[Student_Birth_Year],[Student_Birth_Country_Cd],[Student_Birth_Country_Name],[Student_Gender_Cd],[Student_Gender_Desc],[Student_Gender_Sort_Order],[American_Indian_Or_Alaska_Native_Ind],[Asian_Ind],[Black_Or_African_American_Ind],[Native_Hawaiian_Or_Other_Pacific_Islander_Ind],[White_Ind],[Hispanic_Latino_Ind],[Hispanic_Latino_Desc],[Race_Desc],[Federal_Race_Ethnicity_Desc],[Number_Of_Races_Reported],[Student_Immigrant_Ind],[Student_Migrant_Ind],[Student_Refugee_Ind],[Student_Current_LEP_Ind],[Student_Current_Grade_Level_Cd],[Student_Current_Grade_Level_Desc],[Student_Current_Grade_Level_Sort_Order],[Student_Current_State_Grade_Level_Cd],[Student_Current_State_Grade_Level_Desc],[Student_Current_State_Grade_Level_Sort_Order],[Student_Current_Economically_Disadvantaged_Ind],[Student_Current_Free_Reduced_Meal_Cd],[Student_Current_Free_Reduced_Meal_Desc],[Student_Current_Free_Reduced_Meal_Sort_Order],[Student_Current_Disability_Ind],[Student_Date_Entered_District],[Student_Date_Entered_USA_School],[Student_Resident_District],[Student_Citizenship_Country],[Student_USA_Date_Of_Entry],[Student_Primary_Language],[Student_Year_Entered_9th_Grade],[Student_Graduation_Ind],[Student_Graduation_Date],[Student_Diploma_Type_Cd],[Student_Received_Ged_Ind],[Student_Current_Title_1_Cd],[Student_Current_Homeless_Ind],[Student_Homeless_Unaccompanied_Youth_Ind],[Student_Current_SpEd_Eligible_Ind],[Student_Current_SpEd_Receiving_Ind],[Student_SpEd_Area_of_Exceptionality],[Student_State_Funding_Type],[Student_Current_Gifted_Ind],[Current_School_Id],[Current_School_Name],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Student_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Term]
insert into [conform].[dim_Term] with (tablockx) ([Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Actual_Instructional_Days],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Term_Planned_Instructional_Days],[Term_Actual_Instructional_Days],[Calendar_Track_School_Id],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Term_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[dim_Withdrawal]
insert into [conform].[dim_Withdrawal] with (tablockx) ([Withdrawal_Cd],[Withdrawal_Desc],[Withdrawal_State_Cd],[Withdrawal_State_Desc],[Withdrawal_Sort_Order],[Batch_Period],[SAID],[Date_Stamp])
exec [dbo].[sp_iMart_Transform_dim_Withdrawal_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Attendance_Daily_Activity]
insert into [conform].[fct_Attendance_Daily_Activity] with (tablockx) ([Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Local_Student_Id],[Attendance_Category_Cd],[Attendance_Cd],[Attendance-Date_Of_Day],[Attendance_Calendar_Date],[Attendance_Days_Absent_Count],[Periods_Absent],[Periods_Scheduled],[Minutes_Absent],[Minutes_Scheduled],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Attendance_Daily_Activity_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Attendance_Period_Activity]
insert into [conform].[fct_Attendance_Period_Activity] with (tablockx) ([Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Period_Cd],[Period_School_Id],[Local_Student_Id],[Attendance_Category_Cd],[Attendance_Cd],[Attendance-Date_Of_Day],[Attendance_Calendar_Date],[Attendance_Periods_Absent_Count],[Minutes_Absent],[Minutes_Scheduled],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Attendance_Period_Activity_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Enrollment_Pairs]
insert into [conform].[fct_Enrollment_Pairs] with (tablockx) ([Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Local_Student_Id],[Enrollment_Cd],[Enrollment-Date_Of_Day],[Withdrawal_Cd],[Withdrawal-Date_Of_Day],[Serving_District_Id],[Resident_District_Id],[Enrollment_Date],[Withdrawal_Date],[Enrolled_Grade_Level],[Current_Enrollment_Ind],[Percent_Enrolled],[Enrollment_Count],[No_Show_Count],[Calendar_Days_Enrolled],[FullYear_Enrollment_Count],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Enrollment_Pairs_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_School_Calendar]
insert into [conform].[fct_School_Calendar] with (tablockx) ([Academic_Year_Name],[District_Id],[School_Id],[Date_Of_Day],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Calendar_Day_Type_Cd],[Cycle_Day_Cd],[Calendar_Date],[School_Day_Num],[Occurrence],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_School_Calendar_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Student_Course_Grade]
insert into [conform].[fct_Student_Course_Grade] with (tablockx) ([Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Term_Cd],[Marking_Period_Cd],[Grade_Type_Cd],[Course_Cd],[Course_School_Id],[Course_Section_Identifier],[Local_Student_Id],[Letter_Grade],[Numeric_Grade],[Grade_Point_Max],[Passing_Grade_Ind],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Student_Course_Grade_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Student_Course_Transcript]
insert into [conform].[fct_Student_Course_Transcript] with (tablockx) ([Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Term_Cd],[Local_Student_Id],[Letter_Grade],[Numeric_Grade],[Credit_Attempted],[Credit_Earned],[Quality_Points_Earned],[Grade_Point_Max],[Passing_Grade_Ind],[Content_Completer_Ind],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Student_Course_Transcript_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Student_Course_Schedule]
insert into [conform].[fct_Student_Course_Schedule] with (tablockx) ([Academic_Year_Name],[District_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Term_Cd],[Course_Cd],[Course_School_Id],[Course_Section_Identifier],[Local_Student_Id],[Enrolled-District_Id],[Enrolled-School_Id],[Attending-District_Id],[Attending-School_Id],[Cycle_Day_Cd],[Start-Period_Cd],[Start-Period_School_Id],[End-Period_Cd],[End-Period_School_Id],[Entered-Date_Of_Day],[Exited-Date_Of_Day],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Student_Course_Schedule_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Student_Program_Participation]
insert into [conform].[fct_Student_Program_Participation] with (tablockx) ([Academic_Year_Name],[District_Id],[School_Id],[Program_Cd],[Local_Student_Id],[Effective-Date_Of_Day],[Ending-Date_Of_Day],[Occurrence],[Effective_Date],[Ending_Date],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Student_Program_Participation_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

truncate table [conform].[fct_Teacher_Course_Schedule]
insert into [conform].[fct_Teacher_Course_Schedule] with (tablockx) ([Academic_Year_Name],[District_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Term_Cd],[Course_Cd],[Course_School_Id],[Course_Section_Identifier],[Local_Staff_Id],[School_Id],[Cycle_Day_Cd],[Start-Period_Cd],[Start-Period_School_Id],[End-Period_Cd],[End-Period_School_Id],[Entered-Date_Of_Day],[Exited-Date_Of_Day],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Primary_Secondary_CD],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier])
exec [dbo].[sp_iMart_Transform_fct_Teacher_Course_Schedule_edfi] @SAID = @SAID, @Batch_Period_List = @ProcessingPeriod

