/***  OtisEd iMart EdFi Starter Data Warehouse version 1.0 
	  Object creation script (Step 3)
***/

/*** In preparation for dropping and creating all adw tables, we need to drop all of the constraints ***/
DECLARE @sql nvarchar(MAX) = N'' 
SELECT @sql = @sql + replace(replace(replace(N'ALTER TABLE [{s}].[{t}] DROP CONSTRAINT [{cn}];' + CHAR(13) + CHAR(10)
    ,'{s}',KCU1.TABLE_SCHEMA),'{t}',KCU1.TABLE_NAME),'{cn}',rc.CONSTRAINT_NAME) 
  FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 
  JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
   AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
   AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 
 WHERE KCU1.TABLE_SCHEMA in ('ADW','TDW','EdFi')
EXECUTE(@sql) 

/*** Drop procedures ***/
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Teacher_Course_Schedule_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Teacher_Course_Schedule_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Student_Program_Participation_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Student_Program_Participation_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Student_Course_Transcript_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Student_Course_Transcript_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Student_Course_Schedule_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Student_Course_Schedule_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Student_Course_Grade_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Student_Course_Grade_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_School_Calendar_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_School_Calendar_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Enrollment_Pairs_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Enrollment_Pairs_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Attendance_Period_Activity_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Attendance_Period_Activity_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_fct_Attendance_Daily_Activity_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_fct_Attendance_Daily_Activity_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Withdrawal_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Withdrawal_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Term_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Term_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Student_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Student_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Staff_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Staff_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_School_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_School_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Program_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Program_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Period_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Period_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Marking_Period_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Marking_Period_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Grade_Type_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Grade_Type_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Enrollment_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Enrollment_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_District_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_District_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Date' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Date]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Cycle_Day_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Cycle_Day_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Course_Section_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Course_Section_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Course_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Course_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Calendar_Track_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Calendar_Track_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Calendar_Day_Type_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Calendar_Day_Type_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Attendance_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Attendance_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Transform_dim_Academic_Year_edfi' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Transform_dim_Academic_Year_edfi]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Teacher_Course_Schedule' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Teacher_Course_Schedule]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Student_Program_Participation' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Student_Program_Participation]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Student_Course_Transcript' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Student_Course_Schedule' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Student_Course_Schedule]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Student_Course_Grade' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Student_Course_Grade]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_School_Calendar' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_School_Calendar]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Enrollment_Pairs' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Attendance_Period_Activity' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Attendance_Period_Activity]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_fct_Attendance_Daily_Activity' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_fct_Attendance_Daily_Activity]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Withdrawal' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Withdrawal]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Term' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Term]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Student' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Student]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Staff' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Staff]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_School' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_School]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Program' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Program]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Period' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Period]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Marking_Period' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Marking_Period]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Grade_Type' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Grade_Type]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Enrollment' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Enrollment]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_District' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_District]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Date' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Date]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Cycle_Day' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Cycle_Day]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Course_Section' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Course_Section]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Course' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Course]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Calendar_Track' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Calendar_Track]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Calendar_Day_Type' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Attendance' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Attendance]
if exists (select * from sys.objects where type='P' and name='sp_iMart_Load_dim_Academic_Year' and schema_name(schema_id)='dbo') drop procedure [dbo].[sp_iMart_Load_dim_Academic_Year]

/*** Drop tables ***/
if exists (select * from sys.objects where type='U' and name='CodeXref' and schema_name(schema_id)='dbo') drop table [dbo].[CodeXref]
if exists (select * from sys.objects where type='U' and name='dim_Academic_Year' and schema_name(schema_id)='adw') drop table [adw].[dim_Academic_Year]
if exists (select * from sys.objects where type='U' and name='dim_Attendance' and schema_name(schema_id)='adw') drop table [adw].[dim_Attendance]
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Day_Type' and schema_name(schema_id)='adw') drop table [adw].[dim_Calendar_Day_Type]
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Track' and schema_name(schema_id)='adw') drop table [adw].[dim_Calendar_Track]
if exists (select * from sys.objects where type='U' and name='dim_Course' and schema_name(schema_id)='adw') drop table [adw].[dim_Course]
if exists (select * from sys.objects where type='U' and name='dim_Course_Section' and schema_name(schema_id)='adw') drop table [adw].[dim_Course_Section]
if exists (select * from sys.objects where type='U' and name='dim_Cycle_Day' and schema_name(schema_id)='adw') drop table [adw].[dim_Cycle_Day]
if exists (select * from sys.objects where type='U' and name='dim_Date' and schema_name(schema_id)='adw') drop table [adw].[dim_Date]
if exists (select * from sys.objects where type='U' and name='dim_District' and schema_name(schema_id)='adw') drop table [adw].[dim_District]
if exists (select * from sys.objects where type='U' and name='dim_Enrollment' and schema_name(schema_id)='adw') drop table [adw].[dim_Enrollment]
if exists (select * from sys.objects where type='U' and name='dim_Grade_Type' and schema_name(schema_id)='adw') drop table [adw].[dim_Grade_Type]
if exists (select * from sys.objects where type='U' and name='dim_Marking_Period' and schema_name(schema_id)='adw') drop table [adw].[dim_Marking_Period]
if exists (select * from sys.objects where type='U' and name='dim_Period' and schema_name(schema_id)='adw') drop table [adw].[dim_Period]
if exists (select * from sys.objects where type='U' and name='dim_Program' and schema_name(schema_id)='adw') drop table [adw].[dim_Program]
if exists (select * from sys.objects where type='U' and name='dim_School' and schema_name(schema_id)='adw') drop table [adw].[dim_School]
if exists (select * from sys.objects where type='U' and name='dim_Staff' and schema_name(schema_id)='adw') drop table [adw].[dim_Staff]
if exists (select * from sys.objects where type='U' and name='dim_Student' and schema_name(schema_id)='adw') drop table [adw].[dim_Student]
if exists (select * from sys.objects where type='U' and name='dim_Term' and schema_name(schema_id)='adw') drop table [adw].[dim_Term]
if exists (select * from sys.objects where type='U' and name='dim_Withdrawal' and schema_name(schema_id)='adw') drop table [adw].[dim_Withdrawal]
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Daily_Activity' and schema_name(schema_id)='adw') drop table [adw].[fct_Attendance_Daily_Activity]
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Period_Activity' and schema_name(schema_id)='adw') drop table [adw].[fct_Attendance_Period_Activity]
if exists (select * from sys.objects where type='U' and name='fct_Enrollment_Pairs' and schema_name(schema_id)='adw') drop table [adw].[fct_Enrollment_Pairs]
if exists (select * from sys.objects where type='U' and name='fct_School_Calendar' and schema_name(schema_id)='adw') drop table [adw].[fct_School_Calendar]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Grade' and schema_name(schema_id)='adw') drop table [adw].[fct_Student_Course_Grade]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Schedule' and schema_name(schema_id)='adw') drop table [adw].[fct_Student_Course_Schedule]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Transcript' and schema_name(schema_id)='adw') drop table [adw].[fct_Student_Course_Transcript]
if exists (select * from sys.objects where type='U' and name='fct_Student_Program_Participation' and schema_name(schema_id)='adw') drop table [adw].[fct_Student_Program_Participation]
if exists (select * from sys.objects where type='U' and name='fct_Teacher_Course_Schedule' and schema_name(schema_id)='adw') drop table [adw].[fct_Teacher_Course_Schedule]
if exists (select * from sys.objects where type='U' and name='dim_Academic_Year' and schema_name(schema_id)='conform') drop table [conform].[dim_Academic_Year]
if exists (select * from sys.objects where type='U' and name='dim_Attendance' and schema_name(schema_id)='conform') drop table [conform].[dim_Attendance]
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Day_Type' and schema_name(schema_id)='conform') drop table [conform].[dim_Calendar_Day_Type]
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Track' and schema_name(schema_id)='conform') drop table [conform].[dim_Calendar_Track]
if exists (select * from sys.objects where type='U' and name='dim_Course' and schema_name(schema_id)='conform') drop table [conform].[dim_Course]
if exists (select * from sys.objects where type='U' and name='dim_Course_Section' and schema_name(schema_id)='conform') drop table [conform].[dim_Course_Section]
if exists (select * from sys.objects where type='U' and name='dim_Cycle_Day' and schema_name(schema_id)='conform') drop table [conform].[dim_Cycle_Day]
if exists (select * from sys.objects where type='U' and name='dim_Date' and schema_name(schema_id)='conform') drop table [conform].[dim_Date]
if exists (select * from sys.objects where type='U' and name='dim_District' and schema_name(schema_id)='conform') drop table [conform].[dim_District]
if exists (select * from sys.objects where type='U' and name='dim_Enrollment' and schema_name(schema_id)='conform') drop table [conform].[dim_Enrollment]
if exists (select * from sys.objects where type='U' and name='dim_Grade_Type' and schema_name(schema_id)='conform') drop table [conform].[dim_Grade_Type]
if exists (select * from sys.objects where type='U' and name='dim_Marking_Period' and schema_name(schema_id)='conform') drop table [conform].[dim_Marking_Period]
if exists (select * from sys.objects where type='U' and name='dim_Period' and schema_name(schema_id)='conform') drop table [conform].[dim_Period]
if exists (select * from sys.objects where type='U' and name='dim_Program' and schema_name(schema_id)='conform') drop table [conform].[dim_Program]
if exists (select * from sys.objects where type='U' and name='dim_School' and schema_name(schema_id)='conform') drop table [conform].[dim_School]
if exists (select * from sys.objects where type='U' and name='dim_Staff' and schema_name(schema_id)='conform') drop table [conform].[dim_Staff]
if exists (select * from sys.objects where type='U' and name='dim_Student' and schema_name(schema_id)='conform') drop table [conform].[dim_Student]
if exists (select * from sys.objects where type='U' and name='dim_Term' and schema_name(schema_id)='conform') drop table [conform].[dim_Term]
if exists (select * from sys.objects where type='U' and name='dim_Withdrawal' and schema_name(schema_id)='conform') drop table [conform].[dim_Withdrawal]
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Daily_Activity' and schema_name(schema_id)='conform') drop table [conform].[fct_Attendance_Daily_Activity]
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Period_Activity' and schema_name(schema_id)='conform') drop table [conform].[fct_Attendance_Period_Activity]
if exists (select * from sys.objects where type='U' and name='fct_Enrollment_Pairs' and schema_name(schema_id)='conform') drop table [conform].[fct_Enrollment_Pairs]
if exists (select * from sys.objects where type='U' and name='fct_School_Calendar' and schema_name(schema_id)='conform') drop table [conform].[fct_School_Calendar]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Grade' and schema_name(schema_id)='conform') drop table [conform].[fct_Student_Course_Grade]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Schedule' and schema_name(schema_id)='conform') drop table [conform].[fct_Student_Course_Schedule]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Transcript' and schema_name(schema_id)='conform') drop table [conform].[fct_Student_Course_Transcript]
if exists (select * from sys.objects where type='U' and name='fct_Student_Program_Participation' and schema_name(schema_id)='conform') drop table [conform].[fct_Student_Program_Participation]
if exists (select * from sys.objects where type='U' and name='fct_Teacher_Course_Schedule' and schema_name(schema_id)='conform') drop table [conform].[fct_Teacher_Course_Schedule]
if exists (select * from sys.objects where type='U' and name='dim_Batch' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Batch]
if exists (select * from sys.objects where type='U' and name='dim_Academic_Year' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Academic_Year]
if exists (select * from sys.objects where type='U' and name='dim_Attendance' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Attendance]
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Day_Type' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Calendar_Day_Type]
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Track' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Calendar_Track]
if exists (select * from sys.objects where type='U' and name='dim_Course' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Course]
if exists (select * from sys.objects where type='U' and name='dim_Course_Section' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Course_Section]
if exists (select * from sys.objects where type='U' and name='dim_Cycle_Day' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Cycle_Day]
if exists (select * from sys.objects where type='U' and name='dim_Date' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Date]
if exists (select * from sys.objects where type='U' and name='dim_District' and schema_name(schema_id)='tdw') drop table [tdw].[dim_District]
if exists (select * from sys.objects where type='U' and name='dim_Enrollment' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Enrollment]
if exists (select * from sys.objects where type='U' and name='dim_Grade_Type' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Grade_Type]
if exists (select * from sys.objects where type='U' and name='dim_Marking_Period' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Marking_Period]
if exists (select * from sys.objects where type='U' and name='dim_Period' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Period]
if exists (select * from sys.objects where type='U' and name='dim_Program' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Program]
if exists (select * from sys.objects where type='U' and name='dim_School' and schema_name(schema_id)='tdw') drop table [tdw].[dim_School]
if exists (select * from sys.objects where type='U' and name='dim_Staff' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Staff]
if exists (select * from sys.objects where type='U' and name='dim_Student' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Student]
if exists (select * from sys.objects where type='U' and name='dim_Term' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Term]
if exists (select * from sys.objects where type='U' and name='dim_Withdrawal' and schema_name(schema_id)='tdw') drop table [tdw].[dim_Withdrawal]
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Daily_Activity' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Attendance_Daily_Activity]
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Period_Activity' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Attendance_Period_Activity]
if exists (select * from sys.objects where type='U' and name='fct_Enrollment_Pairs' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Enrollment_Pairs]
if exists (select * from sys.objects where type='U' and name='fct_School_Calendar' and schema_name(schema_id)='tdw') drop table [tdw].[fct_School_Calendar]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Grade' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Student_Course_Grade]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Schedule' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Student_Course_Schedule]
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Transcript' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Student_Course_Transcript]
if exists (select * from sys.objects where type='U' and name='fct_Student_Program_Participation' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Student_Program_Participation]
if exists (select * from sys.objects where type='U' and name='fct_Teacher_Course_Schedule' and schema_name(schema_id)='tdw') drop table [tdw].[fct_Teacher_Course_Schedule]


/*** Create Necessary Schemas ***/
IF (SCHEMA_ID('adw') IS NULL) EXEC ('CREATE SCHEMA [adw] AUTHORIZATION [dbo]')
IF (SCHEMA_ID('conform') IS NULL) EXEC ('CREATE SCHEMA [conform] AUTHORIZATION [dbo]')
IF (SCHEMA_ID('discard') IS NULL) EXEC ('CREATE SCHEMA [discard] AUTHORIZATION [dbo]')
IF (SCHEMA_ID('ready') IS NULL) EXEC ('CREATE SCHEMA [ready] AUTHORIZATION [dbo]')
IF (SCHEMA_ID('tdw') IS NULL) EXEC ('CREATE SCHEMA [tdw] AUTHORIZATION [dbo]')
GO

/*** Create Tables ***/

/****** Object:  Table [dbo].[CodeXref]    Script Date: 4/29/2019 8:36:32 AM ******/
CREATE TABLE [dbo].[CodeXref](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodeCategory] [nvarchar](50) NOT NULL,
	[ValueColumnName] [nvarchar](50) NULL,
	[ValueDataType] [nvarchar](50) NULL,
	[LocalCode] [nvarchar](50) NOT NULL,
	[LocalValue] [nvarchar](254) NULL,
	[LocalSortOrder] [int] NULL,
	[XrefCode] [nvarchar](50) NULL,
	[XrefValue] [nvarchar](254) NULL,
	[XrefSortOrder] [int] NULL,
	[Version] [nvarchar](20) NULL,
 CONSTRAINT [PK_dbo.CodeXref] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]
GO

/****** Object:  Table [adw].[dim_Academic_Year]    Script Date: 4:40:34 PM ******/
CREATE TABLE [adw].[dim_Academic_Year](
	[Academic_Year_Key] [int] NOT NULL,
	[Academic_Year_Name] [char](9) NOT NULL,
	[Academic_Year_Short_Name] [char](5) NULL,
	[Start_Year] [int] NULL,
	[End_Year] [int] NULL,
	[Academic_Year_Nbr_Sequence] [int] NULL,
	[State_Funded_School_Days_In_Year] [int] NULL,
	[Current_Academic_Year_Ind] [char](1) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Academic_Year] PRIMARY KEY CLUSTERED 
(
	[Academic_Year_Key] ASC
)
) ON [PRIMARY]
GO

/****** Object:  Table [adw].[dim_Attendance]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Attendance](
	[Attendance_Key] [int] NOT NULL,
	[Attendance_Category_Cd] [varchar](30) NOT NULL,
	[Attendance_State_Category_Cd] [varchar](30) NULL,
	[Attendance_Cd] [varchar](30) NOT NULL,
	[Attendance_Desc] [varchar](254) NULL,
	[Attendance_Sort_Order] [smallint] NULL,
	[Attendance_State_Cd] [varchar](30) NULL,
	[Attendance_State_Desc] [varchar](254) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Attendance] PRIMARY KEY CLUSTERED 
(
	[Attendance_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Calendar_Day_Type]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Calendar_Day_Type](
	[Calendar_Day_Type_Key] [int] NOT NULL,
	[Calendar_Day_Type_Cd] [varchar](30) NOT NULL,
	[Calendar_Day_Type_Desc] [varchar](254) NULL,
	[Calendar_Day_Type_Sort_Order] [smallint] NULL,
	[School_Day_Ind] [char](1) NULL,
	[Holiday_Ind] [char](1) NULL,
	[Staff_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Planned_Make_Up_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Actual_Make_Up_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Inclement_Weather_Day_Ind] [char](1) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Calendar_Day_Type] PRIMARY KEY CLUSTERED 
(
	[Calendar_Day_Type_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Calendar_Track]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Calendar_Track](
	[Calendar_Track_Key] [int] NOT NULL,
	[Calendar_Track_School_Id] [varchar](16) NOT NULL,
	[Calendar_Track_Cd] [varchar](30) NOT NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Track_Planned_Instructional_Days] [smallint] NULL,
	[Track_Instructional_Minutes] [smallint] NULL,
	[Track_Whole_Day_Absences_Minutes] [smallint] NULL,
	[Track_Half_Day_Absences_Minutes] [smallint] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Calendar_Track] PRIMARY KEY CLUSTERED 
(
	[Calendar_Track_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Course]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Course](
	[Course_Key] [int] NOT NULL,
	[Course_Cd] [varchar](30) NOT NULL,
	[Course_Title] [varchar](60) NULL,
	[Course_Desc] [varchar](254) NULL,
	[Course_State_Cd] [varchar](30) NULL,
	[Course_State_Title] [varchar](60) NULL,
	[Course_State_Code_Desc] [varchar](254) NULL,
	[Course_Department_Desc] [varchar](60) NULL,
	[Course_Active_Ind] [char](1) NULL,
	[Course_Level_Cd] [varchar](30) NULL,
	[Advanced_Placement_Cd] [varchar](60) NULL,
	[Advanced_Placement_Desc] [varchar](254) NULL,
	[SCED_Course_Cd] [char](5) NULL,
	[SCED_Course_Subject_Cd] [char](2) NULL,
	[SCED_Course_Sequence] [varchar](10) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Course] PRIMARY KEY CLUSTERED 
(
	[Course_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Course_Section]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Course_Section](
	[Course_Section_Key] [int] NOT NULL,
	[Course_School_Id] [varchar](16) NOT NULL,
	[Course_Cd] [varchar](30) NOT NULL,
	[Course_Section_Identifier] [varchar](50) NOT NULL,
	[Course_Section_Cd] [varchar](30) NULL,
	[Course_School_Name] [varchar](60) NULL,
	[Course_Title] [varchar](60) NULL,
	[Course_Desc] [varchar](254) NULL,
	[Course_Sort_Order] [smallint] NULL,
	[Course_State_Cd] [varchar](30) NULL,
	[Course_State_Title] [varchar](60) NULL,
	[Course_State_Code_Desc] [varchar](254) NULL,
	[Course_Department_Desc] [varchar](60) NULL,
	[Course_Active_Ind] [char](1) NULL,
	[Course_Level_Cd] [varchar](30) NULL,
	[Course_Level_Sort_Order] [smallint] NULL,
	[Advanced_Placement_Cd] [varchar](60) NULL,
	[Advanced_Placement_Desc] [varchar](254) NULL,
	[Course_Credit_Value] [decimal](9, 2) NULL,
	[SCED_Course_Cd] [char](5) NULL,
	[SCED_Course_Subject_Cd] [char](2) NULL,
	[SCED_Course_Sequence] [varchar](10) NULL,
	[Classroom_Identifier] [varchar](30) NULL,
	[Delivery_Mode_Cd] [varchar](30) NULL,
	[Delivery_Mode_Desc] [varchar](254) NULL,
	[Primary_Teacher_Unique_Id] [varchar](30) NULL,
	[Primary_Teacher_Full_Name] [varchar](254) NULL,
	[Course_Key] [int] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Course_Section] PRIMARY KEY CLUSTERED 
(
	[Course_Section_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Cycle_Day]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Cycle_Day](
	[Cycle_Day_Key] [int] NOT NULL,
	[Cycle_Day_Cd] [varchar](30) NOT NULL,
	[Cycle_Day_Desc] [varchar](254) NULL,
	[Cycle_Day_Sort_Order] [smallint] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Cycle_Day] PRIMARY KEY CLUSTERED 
(
	[Cycle_Day_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Date]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Date](
	[Date_Key] [int] NOT NULL,
	[Date_Record_Type] [char](1) NULL,
	[Year_Name] [char](4) NULL,
	[Year_Number_Sequence] [int] NULL,
	[Year_Begin_Date] [date] NULL,
	[Year_End_Date] [date] NULL,
	[Days_In_Year] [smallint] NULL,
	[Quarter_Name] [char](2) NULL,
	[Year_Quarter_Name] [char](7) NULL,
	[Quarter_Number_In_Year] [tinyint] NULL,
	[Quarter_Number_Sequence] [int] NULL,
	[Quarter_Begin_Date] [date] NULL,
	[Quarter_End_Date] [date] NULL,
	[Days_In_Quarter] [tinyint] NULL,
	[Month_Name] [varchar](9) NULL,
	[Month_Year_Name] [varchar](14) NULL,
	[Year_Month_Yyyy_Mm] [char](7) NULL,
	[Month_Abbr] [char](3) NULL,
	[Month_Year_Abbr] [char](8) NULL,
	[Month_Number_In_Year] [tinyint] NULL,
	[Month_Number_In_Quarter] [tinyint] NULL,
	[Month_Number_Sequence] [int] NULL,
	[Month_Begin_Date] [date] NULL,
	[Month_End_Date] [date] NULL,
	[Days_In_Month] [tinyint] NULL,
	[Week_Name] [char](7) NULL,
	[Week_Abbr] [char](4) NULL,
	[Year_Week_Name] [char](12) NULL,
	[Year_Week_Abbr] [char](9) NULL,
	[Week_Desc_Short] [char](19) NULL,
	[Week_Desc] [char](32) NULL,
	[Week_Begin_Date] [date] NULL,
	[Week_End_Date] [date] NULL,
	[Week_Number_In_Year] [tinyint] NULL,
	[Week_Number_Sequence] [int] NULL,
	[Date_Of_Day] [date] NOT NULL,
	[Date_String] [char](10) NULL,
	[Date_Desc] [varchar](30) NULL,
	[Date_Desc_Short] [char](16) NULL,
	[Day_Number_In_Year] [smallint] NULL,
	[First_Day_In_Year_Ind] [char](1) NULL,
	[Last_Day_In_Year_Ind] [char](1) NULL,
	[Day_Number_In_Quarter] [tinyint] NULL,
	[First_Day_In_Quarter_Ind] [char](1) NULL,
	[Last_Day_In_Quarter_Ind] [char](1) NULL,
	[Day_Number_In_Month] [tinyint] NULL,
	[First_Day_In_Month_Ind] [char](1) NULL,
	[Last_Day_In_Month_Ind] [char](1) NULL,
	[Weekday_Name] [char](9) NULL,
	[Weekday_Abbr] [char](3) NULL,
	[Day_Number_In_Week] [tinyint] NULL,
	[First_Day_In_Week_Ind] [char](1) NULL,
	[Last_Day_In_Week_Ind] [char](1) NULL,
	[Day_Number_Sequence] [int] NULL,
	[Weekday_Ind] [char](1) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Date] PRIMARY KEY CLUSTERED 
(
	[Date_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_District]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_District](
	[District_Key] [int] NOT NULL,
	[District_Id] [varchar](16) NOT NULL,
	[District_Name] [varchar](60) NULL,
	[Superintendent_Name] [varchar](36) NULL,
	[State_Abbr] [char](2) NULL,
	[State_Name] [varchar](50) NULL,
	[County_Name] [varchar](50) NULL,
	[REA_Name] [varchar](60) NULL,
	[REA_Abbr] [varchar](36) NULL,
	[District_Academic_Year_Began] [varchar](9) NULL,
	[District_Academic_Year_Ended] [varchar](9) NULL,
	[District_Phone] [varchar](24) NULL,
	[District_Address_1] [varchar](36) NULL,
	[District_Address_2] [varchar](36) NULL,
	[District_City] [varchar](24) NULL,
	[District_State] [varchar](2) NULL,
	[District_Postal_Cd] [varchar](10) NULL,
	[District_Latitude] [decimal](9, 6) NULL,
	[District_Longitude] [decimal](9, 6) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_District] PRIMARY KEY CLUSTERED 
(
	[District_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Enrollment]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Enrollment](
	[Enrollment_Key] [int] NOT NULL,
	[Enrollment_Cd] [varchar](30) NOT NULL,
	[Enrollment_Desc] [varchar](254) NULL,
	[Enrollment_State_Cd] [varchar](30) NULL,
	[Enrollment_State_Desc] [varchar](254) NULL,
	[Enrollment_Sort_Order] [smallint] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Enrollment] PRIMARY KEY CLUSTERED 
(
	[Enrollment_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Grade_Type]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Grade_Type](
	[Grade_Type_Key] [int] NOT NULL,
	[Grade_Type_Cd] [varchar](30) NOT NULL,
	[Grade_Type_Desc] [varchar](254) NULL,
	[Grade_Type_Sort_Order] [smallint] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Grade_Type] PRIMARY KEY CLUSTERED 
(
	[Grade_Type_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Marking_Period]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Marking_Period](
	[Marking_Period_Key] [int] NOT NULL,
	[Calendar_Track_Cd] [varchar](30) NOT NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Term_Cd] [varchar](30) NOT NULL,
	[Term_Desc] [varchar](254) NULL,
	[Term_Sort_Order] [smallint] NULL,
	[Term_First_Instructional_Date] [date] NULL,
	[Term_Last_Instructional_Date] [date] NULL,
	[Marking_Period_Cd] [varchar](30) NOT NULL,
	[Marking_Period_Desc] [varchar](254) NULL,
	[Marking_Period_Sort_Order] [smallint] NULL,
	[Marking_Period_Begin_Date] [date] NULL,
	[Marking_Period_End_Date] [date] NULL,
	[Calendar_Track_Key] [int] NULL,
	[Term_Key] [int] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Marking_Period] PRIMARY KEY CLUSTERED 
(
	[Marking_Period_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Period]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Period](
	[Period_Key] [int] NOT NULL,
	[Period_School_Id] [varchar](16) NOT NULL,
	[Period_Cd] [varchar](30) NOT NULL,
	[Period_Desc] [varchar](254) NULL,
	[Period_Sort_Order] [smallint] NULL,
	[Period_Start_Time] [time](7) NULL,
	[Period_End_Time] [time](7) NULL,
	[Period_Noninstructional_Minutes] [smallint] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Period] PRIMARY KEY CLUSTERED 
(
	[Period_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Program]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Program](
	[Program_Key] [int] NOT NULL,
	[Program_Cd] [varchar](30) NOT NULL,
	[Program_Desc] [varchar](254) NULL,
	[Program_Sort_Order] [smallint] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Program] PRIMARY KEY CLUSTERED 
(
	[Program_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_School]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_School](
	[School_Key] [int] NOT NULL,
	[District_Id] [varchar](16) NOT NULL,
	[School_Id] [varchar](16) NOT NULL,
	[School_Name] [varchar](60) NULL,
	[School_Grade_Cd_Low] [varchar](5) NULL,
	[School_Grade_Cd_High] [varchar](5) NULL,
	[School_Principal_Name] [varchar](24) NULL,
	[School_Level_Cd] [varchar](16) NULL,
	[School_Level_Name] [varchar](60) NULL,
	[School_Level_Desc] [varchar](60) NULL,
	[NCES_School_Type_Cd] [varchar](16) NULL,
	[NCES_School_Type_Name] [varchar](60) NULL,
	[NCES_School_Type_Desc] [varchar](60) NULL,
	[School_Type_Cd] [varchar](16) NULL,
	[School_Type_Name] [varchar](60) NULL,
	[School_Type_Desc] [varchar](60) NULL,
	[School_State_Cd] [varchar](16) NULL,
	[School_Local_Cd] [varchar](16) NULL,
	[School_NCES_Cd] [char](5) NULL,
	[School_NCES_Name] [varchar](60) NULL,
	[School_Sat_School_Cd] [char](6) NULL,
	[School_Unique_Id] [varchar](16) NULL,
	[School_Short_Name] [varchar](60) NULL,
	[School_Academic_Year_Began] [varchar](9) NULL,
	[School_Academic_Year_Ended] [varchar](9) NULL,
	[School_Is_Closed_Ind] [char](1) NULL,
	[School_Principal_Email] [varchar](60) NULL,
	[School_Phone] [varchar](24) NULL,
	[School_Address_1] [varchar](36) NULL,
	[School_Address_2] [varchar](36) NULL,
	[School_City] [varchar](24) NULL,
	[School_State] [varchar](2) NULL,
	[School_Postal_Cd] [varchar](10) NULL,
	[School_Latitude] [decimal](9, 6) NULL,
	[School_Longitude] [decimal](9, 6) NULL,
	[School_Url] [varchar](100) NULL,
	[School_Title1_Ind] [char](1) NULL,
	[School_Title1_Cd] [varchar](16) NULL,
	[School_Title1_Desc] [varchar](60) NULL,
	[School_Magnet_Ind] [char](1) NULL,
	[School_Charter_Ind] [char](1) NULL,
	[School_Accountability_Ind] [char](1) NULL,
	[School_NCES_Phone] [varchar](24) NULL,
	[School_NCES_Grade_Span] [varchar](16) NULL,
	[School_NCES_Operational_Status] [varchar](60) NULL,
	[School_Special_Assistance_Status] [varchar](60) NULL,
	[School_Cpr_Aed_Instruction_Ind] [char](1) NULL,
	[School_Online_School_Ind] [char](1) NULL,
	[School_Course_Catalog_Master_List_Name] [varchar](60) NULL,
	[School_State_Reported_Ind] [char](1) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_School] PRIMARY KEY CLUSTERED 
(
	[School_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Staff]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Staff](
	[Staff_Key] [int] NOT NULL,
	[Local_Staff_Id] [varchar](32) NULL,
	[Staff_Unique_Id] [varchar](32) NULL,
	[Staff_State_Id_Nbr] [varchar](32) NULL,
	[Staff_SSN] [varchar](11) NULL,
	[Staff_First_Name] [varchar](30) NULL,
	[Staff_Middle_Name] [varchar](30) NULL,
	[Staff_Last_Name] [varchar](30) NULL,
	[Staff_Name_Suffix] [varchar](30) NULL,
	[Staff_Full_Name] [varchar](254) NULL,
	[Staff_Preferred_Name] [varchar](254) NULL,
	[Staff_Sort_Name] [varchar](254) NULL,
	[Staff_Birth_Date] [date] NULL,
	[Staff_Gender_Cd] [varchar](30) NULL,
	[Staff_Gender_Desc] [varchar](254) NULL,
	[Staff_Gender_Sort_Order] [smallint] NULL,
	[Staff_Primary_Ethnicity_Cd] [varchar](30) NULL,
	[Staff_Type_Cd] [varchar](30) NULL,
	[Staff_Type_Desc] [varchar](254) NULL,
	[Staff_Type_Sort_Order] [smallint] NULL,
	[Hire_Date] [date] NULL,
	[Total_Salary_Amt] [decimal](9, 2) NULL,
	[Instruction_Salary_Amt] [decimal](9, 2) NULL,
	[Total_Contract_Hours] [decimal](9, 2) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Staff] PRIMARY KEY CLUSTERED 
(
	[Staff_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Student]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Student](
	[Student_Key] [int] NOT NULL,
	[Local_Student_Id] [varchar](30) NOT NULL,
	[Student_Unique_Id] [varchar](30) NULL,
	[Student_State_Id_Nbr] [varchar](30) NULL,
	[Student_Current_Enrolled_Ind] [char](1) NULL,
	[Student_First_Name] [varchar](30) NULL,
	[Student_Middle_Name] [varchar](30) NULL,
	[Student_Last_Name] [varchar](30) NULL,
	[Student_Name_Suffix] [varchar](30) NULL,
	[Student_Full_Name] [varchar](254) NULL,
	[Student_Preferred_Name] [varchar](254) NULL,
	[Student_Sort_Name] [varchar](254) NULL,
	[Student_SSN] [varchar](11) NULL,
	[Student_Birth_Date] [date] NULL,
	[Student_Birth_Year_Month] [char](7) NULL,
	[Student_Birth_Year] [char](4) NULL,
	[Student_Birth_Country_Cd] [varchar](30) NULL,
	[Student_Birth_Country_Name] [varchar](254) NULL,
	[Student_Gender_Cd] [varchar](30) NULL,
	[Student_Gender_Desc] [varchar](254) NULL,
	[Student_Gender_Sort_Order] [smallint] NULL,
	[American_Indian_Or_Alaska_Native_Ind] [char](1) NULL,
	[Asian_Ind] [char](1) NULL,
	[Black_Or_African_American_Ind] [char](1) NULL,
	[Native_Hawaiian_Or_Other_Pacific_Islander_Ind] [char](1) NULL,
	[White_Ind] [char](1) NULL,
	[Hispanic_Latino_Ind] [char](1) NULL,
	[Hispanic_Latino_Desc] [varchar](64) NULL,
	[Race_Desc] [varchar](132) NULL,
	[Federal_Race_Ethnicity_Desc] [varchar](255) NULL,
	[Number_Of_Races_Reported] [smallint] NULL,
	[Student_Immigrant_Ind] [char](1) NULL,
	[Student_Migrant_Ind] [char](1) NULL,
	[Student_Refugee_Ind] [char](1) NULL,
	[Student_Current_LEP_Ind] [char](1) NULL,
	[Student_Current_Grade_Level_Cd] [varchar](30) NULL,
	[Student_Current_Grade_Level_Desc] [varchar](254) NULL,
	[Student_Current_Grade_Level_Sort_Order] [smallint] NULL,
	[Student_Current_State_Grade_Level_Cd] [varchar](30) NULL,
	[Student_Current_State_Grade_Level_Desc] [varchar](254) NULL,
	[Student_Current_State_Grade_Level_Sort_Order] [smallint] NULL,
	[Student_Current_Economically_Disadvantaged_Ind] [char](1) NULL,
	[Student_Current_Free_Reduced_Meal_Cd] [varchar](30) NULL,
	[Student_Current_Free_Reduced_Meal_Desc] [varchar](254) NULL,
	[Student_Current_Free_Reduced_Meal_Sort_Order] [smallint] NULL,
	[Student_Current_Disability_Ind] [char](1) NULL,
	[Student_Date_Entered_District] [date] NULL,
	[Student_Date_Entered_USA_School] [date] NULL,
	[Student_Resident_District] [varchar](30) NULL,
	[Student_Citizenship_Country] [varchar](30) NULL,
	[Student_USA_Date_Of_Entry] [date] NULL,
	[Student_Primary_Language] [varchar](30) NULL,
	[Student_Year_Entered_9th_Grade] [char](4) NULL,
	[Student_Graduation_Ind] [char](1) NULL,
	[Student_Graduation_Date] [date] NULL,
	[Student_Diploma_Type_Cd] [varchar](30) NULL,
	[Student_Received_Ged_Ind] [char](1) NULL,
	[Student_Current_Title_1_Cd] [varchar](30) NULL,
	[Student_Current_Homeless_Ind] [char](1) NULL,
	[Student_Homeless_Unaccompanied_Youth_Ind] [char](1) NULL,
	[Student_Current_SpEd_Eligible_Ind] [char](1) NULL,
	[Student_Current_SpEd_Receiving_Ind] [char](1) NULL,
	[Student_SpEd_Area_of_Exceptionality] [varchar](50) NULL,
	[Student_State_Funding_Type] [varchar](254) NULL,
	[Student_Current_Gifted_Ind] [char](1) NULL,
	[Current_School_Id] [varchar](16) NULL,
	[Current_School_Name] [varchar](60) NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[Current_Record_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Student] PRIMARY KEY CLUSTERED 
(
	[Student_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Term]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Term](
	[Term_Key] [int] NOT NULL,
	[Calendar_Track_Cd] [varchar](30) NOT NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Track_Planned_Instructional_Days] [smallint] NULL,
	[Track_Actual_Instructional_Days] [smallint] NULL,
	[Term_Cd] [varchar](30) NOT NULL,
	[Term_Desc] [varchar](254) NULL,
	[Term_Sort_Order] [smallint] NULL,
	[Term_First_Instructional_Date] [date] NULL,
	[Term_Last_Instructional_Date] [date] NULL,
	[Term_Planned_Instructional_Days] [smallint] NULL,
	[Term_Actual_Instructional_Days] [smallint] NULL,
	[Calendar_Track_Key] [int] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Term] PRIMARY KEY CLUSTERED 
(
	[Term_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[dim_Withdrawal]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[dim_Withdrawal](
	[Withdrawal_Key] [int] NOT NULL,
	[Withdrawal_Cd] [varchar](30) NOT NULL,
	[Withdrawal_Desc] [varchar](254) NULL,
	[Withdrawal_State_Cd] [varchar](30) NULL,
	[Withdrawal_State_Desc] [varchar](254) NULL,
	[Withdrawal_Sort_Order] [smallint] NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Withdrawal] PRIMARY KEY CLUSTERED 
(
	[Withdrawal_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Attendance_Daily_Activity]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[fct_Attendance_Daily_Activity](
	[Attendance_Daily_Activity_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Attendance_Key] [int] NOT NULL,
	[Attendance_Date_Key] [int] NOT NULL,
	[Attendance_Calendar_Date] [date] NULL,
	[Attendance_Days_Absent_Count] [decimal](9, 2) NULL,
	[Periods_Absent] [smallint] NULL,
	[Periods_Scheduled] [smallint] NULL,
	[Minutes_Absent] [smallint] NULL,
	[Minutes_Scheduled] [smallint] NULL,
 CONSTRAINT [PK_fct_Attendance_Daily_Activity] PRIMARY KEY CLUSTERED 
(
	[Attendance_Daily_Activity_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Attendance_Period_Activity]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[fct_Attendance_Period_Activity](
	[Attendance_Period_Activity_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Period_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Attendance_Key] [int] NOT NULL,
	[Attendance_Date_Key] [int] NOT NULL,
	[Attendance_Calendar_Date] [date] NULL,
	[Attendance_Periods_Absent_Count] [decimal](9, 2) NULL,
	[Minutes_Absent] [smallint] NULL,
	[Minutes_Scheduled] [smallint] NULL,
 CONSTRAINT [PK_fct_Attendance_Period_Activity] PRIMARY KEY CLUSTERED 
(
	[Attendance_Period_Activity_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Enrollment_Pairs]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[fct_Enrollment_Pairs](
	[Enrollment_Pairs_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Enrollment_Key] [int] NOT NULL,
	[Enrollment_Date_Key] [int] NOT NULL,
	[Withdrawal_Key] [int] NULL,
	[Withdrawal_Date_Key] [int] NULL,
	[Serving_District_Id] [varchar](16) NULL,
	[Resident_District_Id] [varchar](16) NULL,
	[Enrollment_Date] [date] NULL,
	[Withdrawal_Date] [date] NULL,
	[Enrolled_Grade_Level] [varchar](30) NULL,
	[Current_Enrollment_Ind] [char](1) NULL,
	[Percent_Enrolled] [decimal](9, 2) NULL,
	[Enrollment_Count] [smallint] NULL,
	[No_Show_Count] [smallint] NULL,
	[Calendar_Days_Enrolled] [smallint] NULL,
	[FullYear_Enrollment_Count] [tinyint] NULL,
 CONSTRAINT [PK_fct_Enrollment_Pairs] PRIMARY KEY CLUSTERED 
(
	[Enrollment_Pairs_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_School_Calendar]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[fct_School_Calendar](
	[School_Calendar_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Date_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Calendar_Day_Type_Key] [int] NOT NULL,
	[Cycle_Day_Key] [int] NOT NULL,
	[Calendar_Date] [date] NULL,
	[School_Day_Num] [int] NULL,
	[Occurrence] [smallint] NULL,
 CONSTRAINT [PK_fct_School_Calendar] PRIMARY KEY CLUSTERED 
(
	[School_Calendar_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Student_Course_Grade]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[fct_Student_Course_Grade](
	[Student_Course_Grade_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Marking_Period_Key] [int] NOT NULL,
	[Grade_Type_Key] [int] NOT NULL,
	[Course_Section_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Letter_Grade] [varchar](12) NULL,
	[Numeric_Grade] [decimal](9, 2) NULL,
	[Grade_Point_Max] [decimal](9, 2) NULL,
	[Passing_Grade_Ind] [char](1) NULL,
 CONSTRAINT [PK_fct_Student_Course_Grade] PRIMARY KEY CLUSTERED 
(
	[Student_Course_Grade_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Student_Course_Schedule]    Script Date: 4:40:35 PM ******/
CREATE TABLE [adw].[fct_Student_Course_Schedule](
	[Student_Course_Schedule_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Course_Section_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Enrolled_School_Key] [int] NOT NULL,
	[Attending_School_Key] [int] NOT NULL,
	[Cycle_Day_Key] [int] NOT NULL,
	[Start_Period_Key] [int] NOT NULL,
	[End_Period_Key] [int] NOT NULL,
	[Entered_Date_Key] [int] NOT NULL,
	[Exited_Date_Key] [int] NOT NULL,
	[Entered_Calendar_Date] [date] NULL,
	[Exited_Calendar_Date] [date] NULL,
	[Course_Enroll_Count] [decimal](9, 2) NULL,
 CONSTRAINT [PK_fct_Student_Course_Schedule] PRIMARY KEY CLUSTERED 
(
	[Student_Course_Schedule_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Student_Course_Transcript]    Script Date: 4:40:36 PM ******/
CREATE TABLE [adw].[fct_Student_Course_Transcript](
	[Student_Course_Grade_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Letter_Grade] [varchar](12) NULL,
	[Numeric_Grade] [decimal](9, 2) NULL,
	[Credit_Attempted] [decimal](5, 2) NULL,
	[Credit_Earned] [decimal](5, 2) NULL,
	[Quality_Points_Earned] [decimal](5, 2) NULL,
	[Grade_Point_Max] [decimal](9, 2) NULL,
	[Passing_Grade_Ind] [char](1) NULL,
	[Content_Completer_Ind] [char](1) NULL,
 CONSTRAINT [PK_fct_Student_Course_Transcript] PRIMARY KEY CLUSTERED 
(
	[Student_Course_Grade_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Student_Program_Participation]    Script Date: 4:40:36 PM ******/
CREATE TABLE [adw].[fct_Student_Program_Participation](
	[Student_Program_Participation_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Program_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Effective_Date_Key] [int] NOT NULL,
	[Ending_Date_Key] [int] NULL,
	[Occurrence] [tinyint] NULL,
	[Effective_Date] [date] NULL,
	[Ending_Date] [date] NULL,
 CONSTRAINT [PK_fct_Student_Program_Participation] PRIMARY KEY CLUSTERED 
(
	[Student_Program_Participation_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [adw].[fct_Teacher_Course_Schedule]    Script Date: 4:40:36 PM ******/
CREATE TABLE [adw].[fct_Teacher_Course_Schedule](
	[Teacher_Course_Schedule_Key] [int] NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Course_Section_Key] [int] NOT NULL,
	[Staff_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Cycle_Day_Key] [int] NOT NULL,
	[Start_Period_Key] [int] NOT NULL,
	[End_Period_Key] [int] NOT NULL,
	[Entered_Date_Key] [int] NOT NULL,
	[Exited_Date_Key] [int] NULL,
	[Entered_Calendar_Date] [date] NULL,
	[Exited_Calendar_Date] [date] NULL,
	[Course_Enroll_Count] [decimal](9, 2) NULL,
	[Primary_Secondary_CD] [char](2) NULL,
 CONSTRAINT [PK_fct_Teacher_Course_Schedule] PRIMARY KEY CLUSTERED 
(
	[Teacher_Course_Schedule_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Academic_Year]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Academic_Year](
	[Academic_Year_Name] [char](9) NULL,
	[Academic_Year_Short_Name] [char](5) NULL,
	[Start_Year] [int] NULL,
	[End_Year] [int] NULL,
	[Academic_Year_Nbr_Sequence] [int] NULL,
	[State_Funded_School_Days_In_Year] [int] NULL,
	[Current_Academic_Year_Ind] [char](1) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Attendance]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Attendance](
	[Attendance_Category_Cd] [varchar](30) NULL,
	[Attendance_State_Category_Cd] [varchar](30) NULL,
	[Attendance_Cd] [varchar](30) NULL,
	[Attendance_Desc] [varchar](254) NULL,
	[Attendance_Sort_Order] [smallint] NULL,
	[Attendance_State_Cd] [varchar](30) NULL,
	[Attendance_State_Desc] [varchar](254) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Calendar_Day_Type]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Calendar_Day_Type](
	[Calendar_Day_Type_Cd] [varchar](30) NULL,
	[Calendar_Day_Type_Desc] [varchar](254) NULL,
	[Calendar_Day_Type_Sort_Order] [smallint] NULL,
	[School_Day_Ind] [char](1) NULL,
	[Holiday_Ind] [char](1) NULL,
	[Staff_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Planned_Make_Up_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Actual_Make_Up_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Inclement_Weather_Day_Ind] [char](1) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Calendar_Track]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Calendar_Track](
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Track_Planned_Instructional_Days] [smallint] NULL,
	[Track_Instructional_Minutes] [smallint] NULL,
	[Track_Whole_Day_Absences_Minutes] [smallint] NULL,
	[Track_Half_Day_Absences_Minutes] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Course]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Course](
	[Course_Cd] [varchar](30) NULL,
	[Course_Title] [varchar](60) NULL,
	[Course_Desc] [varchar](254) NULL,
	[Course_State_Cd] [varchar](30) NULL,
	[Course_State_Title] [varchar](60) NULL,
	[Course_State_Code_Desc] [varchar](254) NULL,
	[Course_Department_Desc] [varchar](60) NULL,
	[Course_Active_Ind] [char](1) NULL,
	[Course_Level_Cd] [varchar](30) NULL,
	[Advanced_Placement_Cd] [varchar](60) NULL,
	[Advanced_Placement_Desc] [varchar](254) NULL,
	[SCED_Course_Cd] [char](5) NULL,
	[SCED_Course_Subject_Cd] [char](2) NULL,
	[SCED_Course_Sequence] [varchar](10) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Course_Section]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Course_Section](
	[Course_School_Id] [varchar](16) NULL,
	[Course_Cd] [varchar](30) NULL,
	[Course_Section_Identifier] [varchar](50) NULL,
	[Course_Section_Cd] [varchar](30) NULL,
	[Course_School_Name] [varchar](60) NULL,
	[Course_Title] [varchar](60) NULL,
	[Course_Desc] [varchar](254) NULL,
	[Course_Sort_Order] [smallint] NULL,
	[Course_State_Cd] [varchar](30) NULL,
	[Course_State_Title] [varchar](60) NULL,
	[Course_State_Code_Desc] [varchar](254) NULL,
	[Course_Department_Desc] [varchar](60) NULL,
	[Course_Active_Ind] [char](1) NULL,
	[Course_Level_Cd] [varchar](30) NULL,
	[Course_Level_Sort_Order] [smallint] NULL,
	[Advanced_Placement_Cd] [varchar](60) NULL,
	[Advanced_Placement_Desc] [varchar](254) NULL,
	[Course_Credit_Value] [decimal](9, 2) NULL,
	[SCED_Course_Cd] [char](5) NULL,
	[SCED_Course_Subject_Cd] [char](2) NULL,
	[SCED_Course_Sequence] [varchar](10) NULL,
	[Classroom_Identifier] [varchar](30) NULL,
	[Delivery_Mode_Cd] [varchar](30) NULL,
	[Delivery_Mode_Desc] [varchar](254) NULL,
	[Primary_Teacher_Unique_Id] [varchar](30) NULL,
	[Primary_Teacher_Full_Name] [varchar](254) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Cycle_Day]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Cycle_Day](
	[Cycle_Day_Cd] [varchar](30) NULL,
	[Cycle_Day_Desc] [varchar](254) NULL,
	[Cycle_Day_Sort_Order] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Date]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Date](
	[Date_Record_Type] [char](1) NULL,
	[Year_Name] [char](4) NULL,
	[Year_Number_Sequence] [int] NULL,
	[Year_Begin_Date] [date] NULL,
	[Year_End_Date] [date] NULL,
	[Days_In_Year] [smallint] NULL,
	[Quarter_Name] [char](2) NULL,
	[Year_Quarter_Name] [char](7) NULL,
	[Quarter_Number_In_Year] [tinyint] NULL,
	[Quarter_Number_Sequence] [int] NULL,
	[Quarter_Begin_Date] [date] NULL,
	[Quarter_End_Date] [date] NULL,
	[Days_In_Quarter] [tinyint] NULL,
	[Month_Name] [varchar](9) NULL,
	[Month_Year_Name] [varchar](14) NULL,
	[Year_Month_Yyyy_Mm] [char](7) NULL,
	[Month_Abbr] [char](3) NULL,
	[Month_Year_Abbr] [char](8) NULL,
	[Month_Number_In_Year] [tinyint] NULL,
	[Month_Number_In_Quarter] [tinyint] NULL,
	[Month_Number_Sequence] [int] NULL,
	[Month_Begin_Date] [date] NULL,
	[Month_End_Date] [date] NULL,
	[Days_In_Month] [tinyint] NULL,
	[Week_Name] [char](7) NULL,
	[Week_Abbr] [char](4) NULL,
	[Year_Week_Name] [char](12) NULL,
	[Year_Week_Abbr] [char](9) NULL,
	[Week_Desc_Short] [char](19) NULL,
	[Week_Desc] [char](32) NULL,
	[Week_Begin_Date] [date] NULL,
	[Week_End_Date] [date] NULL,
	[Week_Number_In_Year] [tinyint] NULL,
	[Week_Number_Sequence] [int] NULL,
	[Date_Of_Day] [date] NULL,
	[Date_String] [char](10) NULL,
	[Date_Desc] [varchar](30) NULL,
	[Date_Desc_Short] [char](16) NULL,
	[Day_Number_In_Year] [smallint] NULL,
	[First_Day_In_Year_Ind] [char](1) NULL,
	[Last_Day_In_Year_Ind] [char](1) NULL,
	[Day_Number_In_Quarter] [tinyint] NULL,
	[First_Day_In_Quarter_Ind] [char](1) NULL,
	[Last_Day_In_Quarter_Ind] [char](1) NULL,
	[Day_Number_In_Month] [tinyint] NULL,
	[First_Day_In_Month_Ind] [char](1) NULL,
	[Last_Day_In_Month_Ind] [char](1) NULL,
	[Weekday_Name] [char](9) NULL,
	[Weekday_Abbr] [char](3) NULL,
	[Day_Number_In_Week] [tinyint] NULL,
	[First_Day_In_Week_Ind] [char](1) NULL,
	[Last_Day_In_Week_Ind] [char](1) NULL,
	[Day_Number_Sequence] [int] NULL,
	[Weekday_Ind] [char](1) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_District]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_District](
	[District_Id] [varchar](16) NULL,
	[District_Name] [varchar](60) NULL,
	[Superintendent_Name] [varchar](36) NULL,
	[State_Abbr] [char](2) NULL,
	[State_Name] [varchar](50) NULL,
	[County_Name] [varchar](50) NULL,
	[REA_Name] [varchar](60) NULL,
	[REA_Abbr] [varchar](36) NULL,
	[District_Academic_Year_Began] [varchar](9) NULL,
	[District_Academic_Year_Ended] [varchar](9) NULL,
	[District_Phone] [varchar](24) NULL,
	[District_Address_1] [varchar](36) NULL,
	[District_Address_2] [varchar](36) NULL,
	[District_City] [varchar](24) NULL,
	[District_State] [varchar](2) NULL,
	[District_Postal_Cd] [varchar](10) NULL,
	[District_Latitude] [decimal](9, 6) NULL,
	[District_Longitude] [decimal](9, 6) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Enrollment]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Enrollment](
	[Enrollment_Cd] [varchar](30) NULL,
	[Enrollment_Desc] [varchar](254) NULL,
	[Enrollment_State_Cd] [varchar](30) NULL,
	[Enrollment_State_Desc] [varchar](254) NULL,
	[Enrollment_Sort_Order] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Grade_Type]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Grade_Type](
	[Grade_Type_Cd] [varchar](30) NULL,
	[Grade_Type_Desc] [varchar](254) NULL,
	[Grade_Type_Sort_Order] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Marking_Period]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Marking_Period](
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Term_Cd] [varchar](30) NULL,
	[Term_Desc] [varchar](254) NULL,
	[Term_Sort_Order] [smallint] NULL,
	[Term_First_Instructional_Date] [date] NULL,
	[Term_Last_Instructional_Date] [date] NULL,
	[Marking_Period_Cd] [varchar](30) NULL,
	[Marking_Period_Desc] [varchar](254) NULL,
	[Marking_Period_Sort_Order] [smallint] NULL,
	[Marking_Period_Begin_Date] [date] NULL,
	[Marking_Period_End_Date] [date] NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Period]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Period](
	[Period_School_Id] [varchar](16) NULL,
	[Period_Cd] [varchar](30) NULL,
	[Period_Desc] [varchar](254) NULL,
	[Period_Sort_Order] [smallint] NULL,
	[Period_Start_Time] [time](7) NULL,
	[Period_End_Time] [time](7) NULL,
	[Period_Noninstructional_Minutes] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Program]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Program](
	[Program_Cd] [varchar](30) NULL,
	[Program_Desc] [varchar](254) NULL,
	[Program_Sort_Order] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_School]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_School](
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[School_Name] [varchar](60) NULL,
	[School_Grade_Cd_Low] [varchar](5) NULL,
	[School_Grade_Cd_High] [varchar](5) NULL,
	[School_Principal_Name] [varchar](24) NULL,
	[School_Level_Cd] [varchar](16) NULL,
	[School_Level_Name] [varchar](60) NULL,
	[School_Level_Desc] [varchar](60) NULL,
	[NCES_School_Type_Cd] [varchar](16) NULL,
	[NCES_School_Type_Name] [varchar](60) NULL,
	[NCES_School_Type_Desc] [varchar](60) NULL,
	[School_Type_Cd] [varchar](16) NULL,
	[School_Type_Name] [varchar](60) NULL,
	[School_Type_Desc] [varchar](60) NULL,
	[School_State_Cd] [varchar](16) NULL,
	[School_Local_Cd] [varchar](16) NULL,
	[School_NCES_Cd] [char](5) NULL,
	[School_NCES_Name] [varchar](60) NULL,
	[School_Sat_School_Cd] [char](6) NULL,
	[School_Unique_Id] [varchar](16) NULL,
	[School_Short_Name] [varchar](60) NULL,
	[School_Academic_Year_Began] [varchar](9) NULL,
	[School_Academic_Year_Ended] [varchar](9) NULL,
	[School_Is_Closed_Ind] [char](1) NULL,
	[School_Principal_Email] [varchar](60) NULL,
	[School_Phone] [varchar](24) NULL,
	[School_Address_1] [varchar](36) NULL,
	[School_Address_2] [varchar](36) NULL,
	[School_City] [varchar](24) NULL,
	[School_State] [varchar](2) NULL,
	[School_Postal_Cd] [varchar](10) NULL,
	[School_Latitude] [decimal](9, 6) NULL,
	[School_Longitude] [decimal](9, 6) NULL,
	[School_Url] [varchar](100) NULL,
	[School_Title1_Ind] [char](1) NULL,
	[School_Title1_Cd] [varchar](16) NULL,
	[School_Title1_Desc] [varchar](60) NULL,
	[School_Magnet_Ind] [char](1) NULL,
	[School_Charter_Ind] [char](1) NULL,
	[School_Accountability_Ind] [char](1) NULL,
	[School_NCES_Phone] [varchar](24) NULL,
	[School_NCES_Grade_Span] [varchar](16) NULL,
	[School_NCES_Operational_Status] [varchar](60) NULL,
	[School_Special_Assistance_Status] [varchar](60) NULL,
	[School_Cpr_Aed_Instruction_Ind] [char](1) NULL,
	[School_Online_School_Ind] [char](1) NULL,
	[School_Course_Catalog_Master_List_Name] [varchar](60) NULL,
	[School_State_Reported_Ind] [char](1) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Staff]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Staff](
	[Local_Staff_Id] [varchar](32) NULL,
	[Staff_Unique_Id] [varchar](32) NULL,
	[Staff_State_Id_Nbr] [varchar](32) NULL,
	[Staff_SSN] [varchar](11) NULL,
	[Staff_First_Name] [varchar](30) NULL,
	[Staff_Middle_Name] [varchar](30) NULL,
	[Staff_Last_Name] [varchar](30) NULL,
	[Staff_Name_Suffix] [varchar](30) NULL,
	[Staff_Full_Name] [varchar](254) NULL,
	[Staff_Preferred_Name] [varchar](254) NULL,
	[Staff_Sort_Name] [varchar](254) NULL,
	[Staff_Birth_Date] [date] NULL,
	[Staff_Gender_Cd] [varchar](30) NULL,
	[Staff_Gender_Desc] [varchar](254) NULL,
	[Staff_Gender_Sort_Order] [smallint] NULL,
	[Staff_Primary_Ethnicity_Cd] [varchar](30) NULL,
	[Staff_Type_Cd] [varchar](30) NULL,
	[Staff_Type_Desc] [varchar](254) NULL,
	[Staff_Type_Sort_Order] [smallint] NULL,
	[Hire_Date] [date] NULL,
	[Total_Salary_Amt] [decimal](9, 2) NULL,
	[Instruction_Salary_Amt] [decimal](9, 2) NULL,
	[Total_Contract_Hours] [decimal](9, 2) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Student]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Student](
	[Local_Student_Id] [varchar](30) NULL,
	[Student_Unique_Id] [varchar](30) NULL,
	[Student_State_Id_Nbr] [varchar](30) NULL,
	[Student_Current_Enrolled_Ind] [char](1) NULL,
	[Student_First_Name] [varchar](30) NULL,
	[Student_Middle_Name] [varchar](30) NULL,
	[Student_Last_Name] [varchar](30) NULL,
	[Student_Name_Suffix] [varchar](30) NULL,
	[Student_Full_Name] [varchar](254) NULL,
	[Student_Preferred_Name] [varchar](254) NULL,
	[Student_Sort_Name] [varchar](254) NULL,
	[Student_SSN] [varchar](11) NULL,
	[Student_Birth_Date] [date] NULL,
	[Student_Birth_Year_Month] [char](7) NULL,
	[Student_Birth_Year] [char](4) NULL,
	[Student_Birth_Country_Cd] [varchar](30) NULL,
	[Student_Birth_Country_Name] [varchar](254) NULL,
	[Student_Gender_Cd] [varchar](30) NULL,
	[Student_Gender_Desc] [varchar](254) NULL,
	[Student_Gender_Sort_Order] [smallint] NULL,
	[American_Indian_Or_Alaska_Native_Ind] [char](1) NULL,
	[Asian_Ind] [char](1) NULL,
	[Black_Or_African_American_Ind] [char](1) NULL,
	[Native_Hawaiian_Or_Other_Pacific_Islander_Ind] [char](1) NULL,
	[White_Ind] [char](1) NULL,
	[Hispanic_Latino_Ind] [char](1) NULL,
	[Hispanic_Latino_Desc] [varchar](64) NULL,
	[Race_Desc] [varchar](132) NULL,
	[Federal_Race_Ethnicity_Desc] [varchar](255) NULL,
	[Number_Of_Races_Reported] [smallint] NULL,
	[Student_Immigrant_Ind] [char](1) NULL,
	[Student_Migrant_Ind] [char](1) NULL,
	[Student_Refugee_Ind] [char](1) NULL,
	[Student_Current_LEP_Ind] [char](1) NULL,
	[Student_Current_Grade_Level_Cd] [varchar](30) NULL,
	[Student_Current_Grade_Level_Desc] [varchar](254) NULL,
	[Student_Current_Grade_Level_Sort_Order] [smallint] NULL,
	[Student_Current_State_Grade_Level_Cd] [varchar](30) NULL,
	[Student_Current_State_Grade_Level_Desc] [varchar](254) NULL,
	[Student_Current_State_Grade_Level_Sort_Order] [smallint] NULL,
	[Student_Current_Economically_Disadvantaged_Ind] [char](1) NULL,
	[Student_Current_Free_Reduced_Meal_Cd] [varchar](30) NULL,
	[Student_Current_Free_Reduced_Meal_Desc] [varchar](254) NULL,
	[Student_Current_Free_Reduced_Meal_Sort_Order] [smallint] NULL,
	[Student_Current_Disability_Ind] [char](1) NULL,
	[Student_Date_Entered_District] [date] NULL,
	[Student_Date_Entered_USA_School] [date] NULL,
	[Student_Resident_District] [varchar](30) NULL,
	[Student_Citizenship_Country] [varchar](30) NULL,
	[Student_USA_Date_Of_Entry] [date] NULL,
	[Student_Primary_Language] [varchar](30) NULL,
	[Student_Year_Entered_9th_Grade] [char](4) NULL,
	[Student_Graduation_Ind] [char](1) NULL,
	[Student_Graduation_Date] [date] NULL,
	[Student_Diploma_Type_Cd] [varchar](30) NULL,
	[Student_Received_Ged_Ind] [char](1) NULL,
	[Student_Current_Title_1_Cd] [varchar](30) NULL,
	[Student_Current_Homeless_Ind] [char](1) NULL,
	[Student_Homeless_Unaccompanied_Youth_Ind] [char](1) NULL,
	[Student_Current_SpEd_Eligible_Ind] [char](1) NULL,
	[Student_Current_SpEd_Receiving_Ind] [char](1) NULL,
	[Student_SpEd_Area_of_Exceptionality] [varchar](50) NULL,
	[Student_State_Funding_Type] [varchar](254) NULL,
	[Student_Current_Gifted_Ind] [char](1) NULL,
	[Current_School_Id] [varchar](16) NULL,
	[Current_School_Name] [varchar](60) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Term]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Term](
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Track_Planned_Instructional_Days] [smallint] NULL,
	[Track_Actual_Instructional_Days] [smallint] NULL,
	[Term_Cd] [varchar](30) NULL,
	[Term_Desc] [varchar](254) NULL,
	[Term_Sort_Order] [smallint] NULL,
	[Term_First_Instructional_Date] [date] NULL,
	[Term_Last_Instructional_Date] [date] NULL,
	[Term_Planned_Instructional_Days] [smallint] NULL,
	[Term_Actual_Instructional_Days] [smallint] NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[dim_Withdrawal]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[dim_Withdrawal](
	[Withdrawal_Cd] [varchar](30) NULL,
	[Withdrawal_Desc] [varchar](254) NULL,
	[Withdrawal_State_Cd] [varchar](30) NULL,
	[Withdrawal_State_Desc] [varchar](254) NULL,
	[Withdrawal_Sort_Order] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Attendance_Daily_Activity]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[fct_Attendance_Daily_Activity](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Local_Student_Id] [varchar](30) NULL,
	[Attendance_Category_Cd] [varchar](30) NULL,
	[Attendance_Cd] [varchar](30) NULL,
	[Attendance-Date_Of_Day] [date] NULL,
	[Attendance_Calendar_Date] [date] NULL,
	[Attendance_Days_Absent_Count] [decimal](9, 2) NULL,
	[Periods_Absent] [smallint] NULL,
	[Periods_Scheduled] [smallint] NULL,
	[Minutes_Absent] [smallint] NULL,
	[Minutes_Scheduled] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Attendance_Period_Activity]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[fct_Attendance_Period_Activity](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Period_Cd] [varchar](30) NULL,
	[Period_School_Id] [varchar](16) NULL,
	[Local_Student_Id] [varchar](30) NULL,
	[Attendance_Category_Cd] [varchar](30) NULL,
	[Attendance_Cd] [varchar](30) NULL,
	[Attendance-Date_Of_Day] [date] NULL,
	[Attendance_Calendar_Date] [date] NULL,
	[Attendance_Periods_Absent_Count] [decimal](9, 2) NULL,
	[Minutes_Absent] [smallint] NULL,
	[Minutes_Scheduled] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Enrollment_Pairs]    Script Date: 4:40:36 PM ******/
CREATE TABLE [conform].[fct_Enrollment_Pairs](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Local_Student_Id] [varchar](30) NULL,
	[Enrollment_Cd] [varchar](30) NULL,
	[Enrollment-Date_Of_Day] [date] NULL,
	[Withdrawal_Cd] [varchar](30) NULL,
	[Withdrawal-Date_Of_Day] [date] NULL,
	[Serving_District_Id] [varchar](16) NULL,
	[Resident_District_Id] [varchar](16) NULL,
	[Enrollment_Date] [date] NULL,
	[Withdrawal_Date] [date] NULL,
	[Enrolled_Grade_Level] [varchar](30) NULL,
	[Current_Enrollment_Ind] [char](1) NULL,
	[Percent_Enrolled] [decimal](9, 2) NULL,
	[Enrollment_Count] [smallint] NULL,
	[No_Show_Count] [smallint] NULL,
	[Calendar_Days_Enrolled] [smallint] NULL,
	[FullYear_Enrollment_Count] [tinyint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_School_Calendar]    Script Date: 4:40:37 PM ******/
CREATE TABLE [conform].[fct_School_Calendar](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[Date_Of_Day] [date] NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Calendar_Day_Type_Cd] [varchar](30) NULL,
	[Cycle_Day_Cd] [varchar](30) NULL,
	[Calendar_Date] [date] NULL,
	[School_Day_Num] [int] NULL,
	[Occurrence] [smallint] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Student_Course_Grade]    Script Date: 4:40:37 PM ******/
CREATE TABLE [conform].[fct_Student_Course_Grade](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Term_Cd] [varchar](30) NULL,
	[Marking_Period_Cd] [varchar](30) NULL,
	[Grade_Type_Cd] [varchar](30) NULL,
	[Course_Cd] [varchar](30) NULL,
	[Course_School_Id] [varchar](16) NULL,
	[Course_Section_Identifier] [varchar](50) NULL,
	[Local_Student_Id] [varchar](30) NULL,
	[Letter_Grade] [varchar](12) NULL,
	[Numeric_Grade] [decimal](9, 2) NULL,
	[Grade_Point_Max] [decimal](9, 2) NULL,
	[Passing_Grade_Ind] [char](1) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Student_Course_Schedule]    Script Date: 4:40:37 PM ******/
CREATE TABLE [conform].[fct_Student_Course_Schedule](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Term_Cd] [varchar](30) NULL,
	[Course_Cd] [varchar](30) NULL,
	[Course_School_Id] [varchar](16) NULL,
	[Course_Section_Identifier] [varchar](50) NULL,
	[Local_Student_Id] [varchar](30) NULL,
	[Enrolled-District_Id] [varchar](16) NULL,
	[Enrolled-School_Id] [varchar](16) NULL,
	[Attending-District_Id] [varchar](16) NULL,
	[Attending-School_Id] [varchar](16) NULL,
	[Cycle_Day_Cd] [varchar](30) NULL,
	[Start-Period_Cd] [varchar](30) NULL,
	[Start-Period_School_Id] [varchar](16) NULL,
	[End-Period_Cd] [varchar](30) NULL,
	[End-Period_School_Id] [varchar](16) NULL,
	[Entered-Date_Of_Day] [date] NULL,
	[Exited-Date_Of_Day] [date] NULL,
	[Entered_Calendar_Date] [date] NULL,
	[Exited_Calendar_Date] [date] NULL,
	[Course_Enroll_Count] [decimal](9, 2) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Student_Course_Transcript]    Script Date: 4:40:37 PM ******/
CREATE TABLE [conform].[fct_Student_Course_Transcript](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Term_Cd] [varchar](30) NULL,
	[Local_Student_Id] [varchar](30) NULL,
	[Letter_Grade] [varchar](12) NULL,
	[Numeric_Grade] [decimal](9, 2) NULL,
	[Credit_Attempted] [decimal](5, 2) NULL,
	[Credit_Earned] [decimal](5, 2) NULL,
	[Quality_Points_Earned] [decimal](5, 2) NULL,
	[Grade_Point_Max] [decimal](9, 2) NULL,
	[Passing_Grade_Ind] [char](1) NULL,
	[Content_Completer_Ind] [char](1) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Student_Program_Participation]    Script Date: 4:40:37 PM ******/
CREATE TABLE [conform].[fct_Student_Program_Participation](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[School_Id] [varchar](16) NULL,
	[Program_Cd] [varchar](30) NULL,
	[Local_Student_Id] [varchar](30) NULL,
	[Effective-Date_Of_Day] [date] NULL,
	[Ending-Date_Of_Day] [date] NULL,
	[Occurrence] [tinyint] NULL,
	[Effective_Date] [date] NULL,
	[Ending_Date] [date] NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [conform].[fct_Teacher_Course_Schedule]    Script Date: 4:40:37 PM ******/
CREATE TABLE [conform].[fct_Teacher_Course_Schedule](
	[Academic_Year_Name] [char](9) NULL,
	[District_Id] [varchar](16) NULL,
	[Calendar_Track_Cd] [varchar](30) NULL,
	[Calendar_Track_School_Id] [varchar](16) NULL,
	[Term_Cd] [varchar](30) NULL,
	[Course_Cd] [varchar](30) NULL,
	[Course_School_Id] [varchar](16) NULL,
	[Course_Section_Identifier] [varchar](50) NULL,
	[Local_Staff_Id] [varchar](32) NULL,
	[School_Id] [varchar](16) NULL,
	[Cycle_Day_Cd] [varchar](30) NULL,
	[Start-Period_Cd] [varchar](30) NULL,
	[Start-Period_School_Id] [varchar](16) NULL,
	[End-Period_Cd] [varchar](30) NULL,
	[End-Period_School_Id] [varchar](16) NULL,
	[Entered-Date_Of_Day] [date] NULL,
	[Exited-Date_Of_Day] [date] NULL,
	[Entered_Calendar_Date] [date] NULL,
	[Exited_Calendar_Date] [date] NULL,
	[Course_Enroll_Count] [decimal](9, 2) NULL,
	[Primary_Secondary_CD] [char](2) NULL,
	[Batch_Period] [varchar](50) NULL,
	[SAID] [varchar](30) NULL,
	[Date_Stamp] [datetime2](7) NULL,
	[SourceIdentifier] [varchar](50) NULL
) ON [PRIMARY]
GO


/****** Object:  Table [tdw].[dim_Academic_Year]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Academic_Year](
	[Academic_Year_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Name] [char](9) NOT NULL,
	[Academic_Year_Short_Name] [char](5) NULL,
	[Start_Year] [int] NULL,
	[End_Year] [int] NULL,
	[Academic_Year_Nbr_Sequence] [int] NULL,
	[State_Funded_School_Days_In_Year] [int] NULL,
	[Current_Academic_Year_Ind] [char](1) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Academic_Year] PRIMARY KEY CLUSTERED 
(
	[Academic_Year_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Attendance]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Attendance](
	[Attendance_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Attendance_Category_Cd] [varchar](30) NOT NULL,
	[Attendance_State_Category_Cd] [varchar](30) NULL,
	[Attendance_Cd] [varchar](30) NOT NULL,
	[Attendance_Desc] [varchar](254) NULL,
	[Attendance_Sort_Order] [smallint] NULL,
	[Attendance_State_Cd] [varchar](30) NULL,
	[Attendance_State_Desc] [varchar](254) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Attendance] PRIMARY KEY CLUSTERED 
(
	[Attendance_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Batch]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Batch](
	[Batch_Key] [int] IDENTITY(1,1) NOT NULL,
	[Batch_Period] [varchar](50) NOT NULL,
	[SAID] [varchar](30) NOT NULL,
	[Date_Time_Last_Processed] [datetime2](7) NULL,
	[Date_Stamp] [datetime2](7) NULL,
 CONSTRAINT [PK_dim_Batch] PRIMARY KEY CLUSTERED 
(
	[Batch_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Calendar_Day_Type]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Calendar_Day_Type](
	[Calendar_Day_Type_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Calendar_Day_Type_Cd] [varchar](30) NOT NULL,
	[Calendar_Day_Type_Desc] [varchar](254) NULL,
	[Calendar_Day_Type_Sort_Order] [smallint] NULL,
	[School_Day_Ind] [char](1) NULL,
	[Holiday_Ind] [char](1) NULL,
	[Staff_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Planned_Make_Up_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Actual_Make_Up_Day_Ind] [char](1) NULL,
	[Calendar_Day_Type_Inclement_Weather_Day_Ind] [char](1) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Calendar_Day_Type] PRIMARY KEY CLUSTERED 
(
	[Calendar_Day_Type_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Calendar_Track]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Calendar_Track](
	[Calendar_Track_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Calendar_Track_School_Id] [varchar](16) NOT NULL,
	[Calendar_Track_Cd] [varchar](30) NOT NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Track_Planned_Instructional_Days] [smallint] NULL,
	[Track_Instructional_Minutes] [smallint] NULL,
	[Track_Whole_Day_Absences_Minutes] [smallint] NULL,
	[Track_Half_Day_Absences_Minutes] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Calendar_Track] PRIMARY KEY CLUSTERED 
(
	[Calendar_Track_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Course]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Course](
	[Course_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Course_Cd] [varchar](30) NOT NULL,
	[Course_Title] [varchar](60) NULL,
	[Course_Desc] [varchar](254) NULL,
	[Course_State_Cd] [varchar](30) NULL,
	[Course_State_Title] [varchar](60) NULL,
	[Course_State_Code_Desc] [varchar](254) NULL,
	[Course_Department_Desc] [varchar](60) NULL,
	[Course_Active_Ind] [char](1) NULL,
	[Course_Level_Cd] [varchar](30) NULL,
	[Advanced_Placement_Cd] [varchar](60) NULL,
	[Advanced_Placement_Desc] [varchar](254) NULL,
	[SCED_Course_Cd] [char](5) NULL,
	[SCED_Course_Subject_Cd] [char](2) NULL,
	[SCED_Course_Sequence] [varchar](10) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Course] PRIMARY KEY CLUSTERED 
(
	[Course_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Course_Section]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Course_Section](
	[Course_Section_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Course_School_Id] [varchar](16) NOT NULL,
	[Course_Cd] [varchar](30) NOT NULL,
	[Course_Section_Identifier] [varchar](50) NOT NULL,
	[Course_Section_Cd] [varchar](30) NULL,
	[Course_School_Name] [varchar](60) NULL,
	[Course_Title] [varchar](60) NULL,
	[Course_Desc] [varchar](254) NULL,
	[Course_Sort_Order] [smallint] NULL,
	[Course_State_Cd] [varchar](30) NULL,
	[Course_State_Title] [varchar](60) NULL,
	[Course_State_Code_Desc] [varchar](254) NULL,
	[Course_Department_Desc] [varchar](60) NULL,
	[Course_Active_Ind] [char](1) NULL,
	[Course_Level_Cd] [varchar](30) NULL,
	[Course_Level_Sort_Order] [smallint] NULL,
	[Advanced_Placement_Cd] [varchar](60) NULL,
	[Advanced_Placement_Desc] [varchar](254) NULL,
	[Course_Credit_Value] [decimal](9, 2) NULL,
	[SCED_Course_Cd] [char](5) NULL,
	[SCED_Course_Subject_Cd] [char](2) NULL,
	[SCED_Course_Sequence] [varchar](10) NULL,
	[Classroom_Identifier] [varchar](30) NULL,
	[Delivery_Mode_Cd] [varchar](30) NULL,
	[Delivery_Mode_Desc] [varchar](254) NULL,
	[Primary_Teacher_Unique_Id] [varchar](30) NULL,
	[Primary_Teacher_Full_Name] [varchar](254) NULL,
	[Course_Key] [int] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Course_Section] PRIMARY KEY CLUSTERED 
(
	[Course_Section_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Cycle_Day]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Cycle_Day](
	[Cycle_Day_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Cycle_Day_Cd] [varchar](30) NOT NULL,
	[Cycle_Day_Desc] [varchar](254) NULL,
	[Cycle_Day_Sort_Order] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Cycle_Day] PRIMARY KEY CLUSTERED 
(
	[Cycle_Day_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Date]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Date](
	[Date_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Date_Record_Type] [char](1) NULL,
	[Year_Name] [char](4) NULL,
	[Year_Number_Sequence] [int] NULL,
	[Year_Begin_Date] [date] NULL,
	[Year_End_Date] [date] NULL,
	[Days_In_Year] [smallint] NULL,
	[Quarter_Name] [char](2) NULL,
	[Year_Quarter_Name] [char](7) NULL,
	[Quarter_Number_In_Year] [tinyint] NULL,
	[Quarter_Number_Sequence] [int] NULL,
	[Quarter_Begin_Date] [date] NULL,
	[Quarter_End_Date] [date] NULL,
	[Days_In_Quarter] [tinyint] NULL,
	[Month_Name] [varchar](9) NULL,
	[Month_Year_Name] [varchar](14) NULL,
	[Year_Month_Yyyy_Mm] [char](7) NULL,
	[Month_Abbr] [char](3) NULL,
	[Month_Year_Abbr] [char](8) NULL,
	[Month_Number_In_Year] [tinyint] NULL,
	[Month_Number_In_Quarter] [tinyint] NULL,
	[Month_Number_Sequence] [int] NULL,
	[Month_Begin_Date] [date] NULL,
	[Month_End_Date] [date] NULL,
	[Days_In_Month] [tinyint] NULL,
	[Week_Name] [char](7) NULL,
	[Week_Abbr] [char](4) NULL,
	[Year_Week_Name] [char](12) NULL,
	[Year_Week_Abbr] [char](9) NULL,
	[Week_Desc_Short] [char](19) NULL,
	[Week_Desc] [char](32) NULL,
	[Week_Begin_Date] [date] NULL,
	[Week_End_Date] [date] NULL,
	[Week_Number_In_Year] [tinyint] NULL,
	[Week_Number_Sequence] [int] NULL,
	[Date_Of_Day] [date] NOT NULL,
	[Date_String] [char](10) NULL,
	[Date_Desc] [varchar](30) NULL,
	[Date_Desc_Short] [char](16) NULL,
	[Day_Number_In_Year] [smallint] NULL,
	[First_Day_In_Year_Ind] [char](1) NULL,
	[Last_Day_In_Year_Ind] [char](1) NULL,
	[Day_Number_In_Quarter] [tinyint] NULL,
	[First_Day_In_Quarter_Ind] [char](1) NULL,
	[Last_Day_In_Quarter_Ind] [char](1) NULL,
	[Day_Number_In_Month] [tinyint] NULL,
	[First_Day_In_Month_Ind] [char](1) NULL,
	[Last_Day_In_Month_Ind] [char](1) NULL,
	[Weekday_Name] [char](9) NULL,
	[Weekday_Abbr] [char](3) NULL,
	[Day_Number_In_Week] [tinyint] NULL,
	[First_Day_In_Week_Ind] [char](1) NULL,
	[Last_Day_In_Week_Ind] [char](1) NULL,
	[Day_Number_Sequence] [int] NULL,
	[Weekday_Ind] [char](1) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Date] PRIMARY KEY CLUSTERED 
(
	[Date_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_District]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_District](
	[District_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[District_Id] [varchar](16) NOT NULL,
	[District_Name] [varchar](60) NULL,
	[Superintendent_Name] [varchar](36) NULL,
	[State_Abbr] [char](2) NULL,
	[State_Name] [varchar](50) NULL,
	[County_Name] [varchar](50) NULL,
	[REA_Name] [varchar](60) NULL,
	[REA_Abbr] [varchar](36) NULL,
	[District_Academic_Year_Began] [varchar](9) NULL,
	[District_Academic_Year_Ended] [varchar](9) NULL,
	[District_Phone] [varchar](24) NULL,
	[District_Address_1] [varchar](36) NULL,
	[District_Address_2] [varchar](36) NULL,
	[District_City] [varchar](24) NULL,
	[District_State] [varchar](2) NULL,
	[District_Postal_Cd] [varchar](10) NULL,
	[District_Latitude] [decimal](9, 6) NULL,
	[District_Longitude] [decimal](9, 6) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_District] PRIMARY KEY CLUSTERED 
(
	[District_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Enrollment]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Enrollment](
	[Enrollment_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Enrollment_Cd] [varchar](30) NOT NULL,
	[Enrollment_Desc] [varchar](254) NULL,
	[Enrollment_State_Cd] [varchar](30) NULL,
	[Enrollment_State_Desc] [varchar](254) NULL,
	[Enrollment_Sort_Order] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Enrollment] PRIMARY KEY CLUSTERED 
(
	[Enrollment_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Grade_Type]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Grade_Type](
	[Grade_Type_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Grade_Type_Cd] [varchar](30) NOT NULL,
	[Grade_Type_Desc] [varchar](254) NULL,
	[Grade_Type_Sort_Order] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Grade_Type] PRIMARY KEY CLUSTERED 
(
	[Grade_Type_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Marking_Period]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Marking_Period](
	[Marking_Period_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Calendar_Track_Cd] [varchar](30) NOT NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Term_Cd] [varchar](30) NOT NULL,
	[Term_Desc] [varchar](254) NULL,
	[Term_Sort_Order] [smallint] NULL,
	[Term_First_Instructional_Date] [date] NULL,
	[Term_Last_Instructional_Date] [date] NULL,
	[Marking_Period_Cd] [varchar](30) NOT NULL,
	[Marking_Period_Desc] [varchar](254) NULL,
	[Marking_Period_Sort_Order] [smallint] NULL,
	[Marking_Period_Begin_Date] [date] NULL,
	[Marking_Period_End_Date] [date] NULL,
	[Calendar_Track_Key] [int] NULL,
	[Term_Key] [int] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Marking_Period] PRIMARY KEY CLUSTERED 
(
	[Marking_Period_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Period]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Period](
	[Period_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Period_School_Id] [varchar](16) NOT NULL,
	[Period_Cd] [varchar](30) NOT NULL,
	[Period_Desc] [varchar](254) NULL,
	[Period_Sort_Order] [smallint] NULL,
	[Period_Start_Time] [time](7) NULL,
	[Period_End_Time] [time](7) NULL,
	[Period_Noninstructional_Minutes] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Period] PRIMARY KEY CLUSTERED 
(
	[Period_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Program]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Program](
	[Program_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Program_Cd] [varchar](30) NOT NULL,
	[Program_Desc] [varchar](254) NULL,
	[Program_Sort_Order] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Program] PRIMARY KEY CLUSTERED 
(
	[Program_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_School]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_School](
	[School_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[District_Id] [varchar](16) NOT NULL,
	[School_Id] [varchar](16) NOT NULL,
	[School_Name] [varchar](60) NULL,
	[School_Grade_Cd_Low] [varchar](5) NULL,
	[School_Grade_Cd_High] [varchar](5) NULL,
	[School_Principal_Name] [varchar](24) NULL,
	[School_Level_Cd] [varchar](16) NULL,
	[School_Level_Name] [varchar](60) NULL,
	[School_Level_Desc] [varchar](60) NULL,
	[NCES_School_Type_Cd] [varchar](16) NULL,
	[NCES_School_Type_Name] [varchar](60) NULL,
	[NCES_School_Type_Desc] [varchar](60) NULL,
	[School_Type_Cd] [varchar](16) NULL,
	[School_Type_Name] [varchar](60) NULL,
	[School_Type_Desc] [varchar](60) NULL,
	[School_State_Cd] [varchar](16) NULL,
	[School_Local_Cd] [varchar](16) NULL,
	[School_NCES_Cd] [char](5) NULL,
	[School_NCES_Name] [varchar](60) NULL,
	[School_Sat_School_Cd] [char](6) NULL,
	[School_Unique_Id] [varchar](16) NULL,
	[School_Short_Name] [varchar](60) NULL,
	[School_Academic_Year_Began] [varchar](9) NULL,
	[School_Academic_Year_Ended] [varchar](9) NULL,
	[School_Is_Closed_Ind] [char](1) NULL,
	[School_Principal_Email] [varchar](60) NULL,
	[School_Phone] [varchar](24) NULL,
	[School_Address_1] [varchar](36) NULL,
	[School_Address_2] [varchar](36) NULL,
	[School_City] [varchar](24) NULL,
	[School_State] [varchar](2) NULL,
	[School_Postal_Cd] [varchar](10) NULL,
	[School_Latitude] [decimal](9, 6) NULL,
	[School_Longitude] [decimal](9, 6) NULL,
	[School_Url] [varchar](100) NULL,
	[School_Title1_Ind] [char](1) NULL,
	[School_Title1_Cd] [varchar](16) NULL,
	[School_Title1_Desc] [varchar](60) NULL,
	[School_Magnet_Ind] [char](1) NULL,
	[School_Charter_Ind] [char](1) NULL,
	[School_Accountability_Ind] [char](1) NULL,
	[School_NCES_Phone] [varchar](24) NULL,
	[School_NCES_Grade_Span] [varchar](16) NULL,
	[School_NCES_Operational_Status] [varchar](60) NULL,
	[School_Special_Assistance_Status] [varchar](60) NULL,
	[School_Cpr_Aed_Instruction_Ind] [char](1) NULL,
	[School_Online_School_Ind] [char](1) NULL,
	[School_Course_Catalog_Master_List_Name] [varchar](60) NULL,
	[School_State_Reported_Ind] [char](1) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_School] PRIMARY KEY CLUSTERED 
(
	[School_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Staff]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Staff](
	[Staff_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Local_Staff_Id] [varchar](32) NULL,
	[Staff_Unique_Id] [varchar](32) NULL,
	[Staff_State_Id_Nbr] [varchar](32) NULL,
	[Staff_SSN] [varchar](11) NULL,
	[Staff_First_Name] [varchar](30) NULL,
	[Staff_Middle_Name] [varchar](30) NULL,
	[Staff_Last_Name] [varchar](30) NULL,
	[Staff_Name_Suffix] [varchar](30) NULL,
	[Staff_Full_Name] [varchar](254) NULL,
	[Staff_Preferred_Name] [varchar](254) NULL,
	[Staff_Sort_Name] [varchar](254) NULL,
	[Staff_Birth_Date] [date] NULL,
	[Staff_Gender_Cd] [varchar](30) NULL,
	[Staff_Gender_Desc] [varchar](254) NULL,
	[Staff_Gender_Sort_Order] [smallint] NULL,
	[Staff_Primary_Ethnicity_Cd] [varchar](30) NULL,
	[Staff_Type_Cd] [varchar](30) NULL,
	[Staff_Type_Desc] [varchar](254) NULL,
	[Staff_Type_Sort_Order] [smallint] NULL,
	[Hire_Date] [date] NULL,
	[Total_Salary_Amt] [decimal](9, 2) NULL,
	[Instruction_Salary_Amt] [decimal](9, 2) NULL,
	[Total_Contract_Hours] [decimal](9, 2) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Staff] PRIMARY KEY CLUSTERED 
(
	[Staff_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Student]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Student](
	[Student_Key] [int] IDENTITY(1,1) NOT NULL,
	[Student_Sequence] [int] NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Local_Student_Id] [varchar](30) NOT NULL,
	[Student_Unique_Id] [varchar](30) NULL,
	[Student_State_Id_Nbr] [varchar](30) NULL,
	[Student_Current_Enrolled_Ind] [char](1) NULL,
	[Student_First_Name] [varchar](30) NULL,
	[Student_Middle_Name] [varchar](30) NULL,
	[Student_Last_Name] [varchar](30) NULL,
	[Student_Name_Suffix] [varchar](30) NULL,
	[Student_Full_Name] [varchar](254) NULL,
	[Student_Preferred_Name] [varchar](254) NULL,
	[Student_Sort_Name] [varchar](254) NULL,
	[Student_SSN] [varchar](11) NULL,
	[Student_Birth_Date] [date] NULL,
	[Student_Birth_Year_Month] [char](7) NULL,
	[Student_Birth_Year] [char](4) NULL,
	[Student_Birth_Country_Cd] [varchar](30) NULL,
	[Student_Birth_Country_Name] [varchar](254) NULL,
	[Student_Gender_Cd] [varchar](30) NULL,
	[Student_Gender_Desc] [varchar](254) NULL,
	[Student_Gender_Sort_Order] [smallint] NULL,
	[American_Indian_Or_Alaska_Native_Ind] [char](1) NULL,
	[Asian_Ind] [char](1) NULL,
	[Black_Or_African_American_Ind] [char](1) NULL,
	[Native_Hawaiian_Or_Other_Pacific_Islander_Ind] [char](1) NULL,
	[White_Ind] [char](1) NULL,
	[Hispanic_Latino_Ind] [char](1) NULL,
	[Hispanic_Latino_Desc] [varchar](64) NULL,
	[Race_Desc] [varchar](132) NULL,
	[Federal_Race_Ethnicity_Desc] [varchar](255) NULL,
	[Number_Of_Races_Reported] [smallint] NULL,
	[Student_Immigrant_Ind] [char](1) NULL,
	[Student_Migrant_Ind] [char](1) NULL,
	[Student_Refugee_Ind] [char](1) NULL,
	[Student_Current_LEP_Ind] [char](1) NULL,
	[Student_Current_Grade_Level_Cd] [varchar](30) NULL,
	[Student_Current_Grade_Level_Desc] [varchar](254) NULL,
	[Student_Current_Grade_Level_Sort_Order] [smallint] NULL,
	[Student_Current_State_Grade_Level_Cd] [varchar](30) NULL,
	[Student_Current_State_Grade_Level_Desc] [varchar](254) NULL,
	[Student_Current_State_Grade_Level_Sort_Order] [smallint] NULL,
	[Student_Current_Economically_Disadvantaged_Ind] [char](1) NULL,
	[Student_Current_Free_Reduced_Meal_Cd] [varchar](30) NULL,
	[Student_Current_Free_Reduced_Meal_Desc] [varchar](254) NULL,
	[Student_Current_Free_Reduced_Meal_Sort_Order] [smallint] NULL,
	[Student_Current_Disability_Ind] [char](1) NULL,
	[Student_Date_Entered_District] [date] NULL,
	[Student_Date_Entered_USA_School] [date] NULL,
	[Student_Resident_District] [varchar](30) NULL,
	[Student_Citizenship_Country] [varchar](30) NULL,
	[Student_USA_Date_Of_Entry] [date] NULL,
	[Student_Primary_Language] [varchar](30) NULL,
	[Student_Year_Entered_9th_Grade] [char](4) NULL,
	[Student_Graduation_Ind] [char](1) NULL,
	[Student_Graduation_Date] [date] NULL,
	[Student_Diploma_Type_Cd] [varchar](30) NULL,
	[Student_Received_Ged_Ind] [char](1) NULL,
	[Student_Current_Title_1_Cd] [varchar](30) NULL,
	[Student_Current_Homeless_Ind] [char](1) NULL,
	[Student_Homeless_Unaccompanied_Youth_Ind] [char](1) NULL,
	[Student_Current_SpEd_Eligible_Ind] [char](1) NULL,
	[Student_Current_SpEd_Receiving_Ind] [char](1) NULL,
	[Student_SpEd_Area_of_Exceptionality] [varchar](50) NULL,
	[Student_State_Funding_Type] [varchar](254) NULL,
	[Student_Current_Gifted_Ind] [char](1) NULL,
	[Current_School_Id] [varchar](16) NULL,
	[Current_School_Name] [varchar](60) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Hash_Key_T1C] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[Transaction_Start_Date] [datetime2](7) NOT NULL,
	[Transaction_End_Date] [datetime2](7) NOT NULL,
	[Current_Record_Ind] [char](1) NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Student] PRIMARY KEY CLUSTERED 
(
	[Student_Key] ASC,
	[Student_Sequence] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Term]    Script Date: 4:40:39 PM ******/
CREATE TABLE [tdw].[dim_Term](
	[Term_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Calendar_Track_Cd] [varchar](30) NOT NULL,
	[Calendar_Track_Desc] [varchar](254) NULL,
	[Calendar_Track_Sort_Order] [smallint] NULL,
	[Summer_School_Ind] [char](1) NULL,
	[Track_First_Instructional_Date] [date] NULL,
	[Track_Last_Instructional_Date] [date] NULL,
	[Track_Planned_Instructional_Days] [smallint] NULL,
	[Track_Actual_Instructional_Days] [smallint] NULL,
	[Term_Cd] [varchar](30) NOT NULL,
	[Term_Desc] [varchar](254) NULL,
	[Term_Sort_Order] [smallint] NULL,
	[Term_First_Instructional_Date] [date] NULL,
	[Term_Last_Instructional_Date] [date] NULL,
	[Term_Planned_Instructional_Days] [smallint] NULL,
	[Term_Actual_Instructional_Days] [smallint] NULL,
	[Calendar_Track_Key] [int] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Term] PRIMARY KEY CLUSTERED 
(
	[Term_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[dim_Withdrawal]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[dim_Withdrawal](
	[Withdrawal_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Withdrawal_Cd] [varchar](30) NOT NULL,
	[Withdrawal_Desc] [varchar](254) NULL,
	[Withdrawal_State_Cd] [varchar](30) NULL,
	[Withdrawal_State_Desc] [varchar](254) NULL,
	[Withdrawal_Sort_Order] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Hash_Key_T1] [varbinary](16) NOT NULL,
	[Last_Updated_T1] [datetime2](7) NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
 CONSTRAINT [PK_dim_Withdrawal] PRIMARY KEY CLUSTERED 
(
	[Withdrawal_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Attendance_Daily_Activity]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Attendance_Daily_Activity](
	[Attendance_Daily_Activity_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Attendance_Key] [int] NOT NULL,
	[Attendance_Date_Key] [int] NOT NULL,
	[Attendance_Calendar_Date] [date] NULL,
	[Attendance_Days_Absent_Count] [decimal](9, 2) NULL,
	[Periods_Absent] [smallint] NULL,
	[Periods_Scheduled] [smallint] NULL,
	[Minutes_Absent] [smallint] NULL,
	[Minutes_Scheduled] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Attendance_Daily_Activity] PRIMARY KEY CLUSTERED 
(
	[Attendance_Daily_Activity_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Attendance_Period_Activity]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Attendance_Period_Activity](
	[Attendance_Period_Activity_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Period_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Attendance_Key] [int] NOT NULL,
	[Attendance_Date_Key] [int] NOT NULL,
	[Attendance_Calendar_Date] [date] NULL,
	[Attendance_Periods_Absent_Count] [decimal](9, 2) NULL,
	[Minutes_Absent] [smallint] NULL,
	[Minutes_Scheduled] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Attendance_Period_Activity] PRIMARY KEY CLUSTERED 
(
	[Attendance_Period_Activity_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Enrollment_Pairs]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Enrollment_Pairs](
	[Enrollment_Pairs_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Enrollment_Key] [int] NOT NULL,
	[Enrollment_Date_Key] [int] NOT NULL,
	[Withdrawal_Key] [int] NULL,
	[Withdrawal_Date_Key] [int] NULL,
	[Serving_District_Id] [varchar](16) NULL,
	[Resident_District_Id] [varchar](16) NULL,
	[Enrollment_Date] [date] NULL,
	[Withdrawal_Date] [date] NULL,
	[Enrolled_Grade_Level] [varchar](30) NULL,
	[Current_Enrollment_Ind] [char](1) NULL,
	[Percent_Enrolled] [decimal](9, 2) NULL,
	[Enrollment_Count] [smallint] NULL,
	[No_Show_Count] [smallint] NULL,
	[Calendar_Days_Enrolled] [smallint] NULL,
	[FullYear_Enrollment_Count] [tinyint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Enrollment_Pairs] PRIMARY KEY CLUSTERED 
(
	[Enrollment_Pairs_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_School_Calendar]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_School_Calendar](
	[School_Calendar_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Date_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Calendar_Day_Type_Key] [int] NOT NULL,
	[Cycle_Day_Key] [int] NOT NULL,
	[Calendar_Date] [date] NULL,
	[School_Day_Num] [int] NULL,
	[Occurrence] [smallint] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_School_Calendar] PRIMARY KEY CLUSTERED 
(
	[School_Calendar_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Student_Course_Grade]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Student_Course_Grade](
	[Student_Course_Grade_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Marking_Period_Key] [int] NOT NULL,
	[Grade_Type_Key] [int] NOT NULL,
	[Course_Section_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Letter_Grade] [varchar](12) NULL,
	[Numeric_Grade] [decimal](9, 2) NULL,
	[Grade_Point_Max] [decimal](9, 2) NULL,
	[Passing_Grade_Ind] [char](1) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Student_Course_Grade] PRIMARY KEY CLUSTERED 
(
	[Student_Course_Grade_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Student_Course_Schedule]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Student_Course_Schedule](
	[Student_Course_Schedule_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Course_Section_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Enrolled_School_Key] [int] NOT NULL,
	[Attending_School_Key] [int] NOT NULL,
	[Cycle_Day_Key] [int] NOT NULL,
	[Start_Period_Key] [int] NOT NULL,
	[End_Period_Key] [int] NOT NULL,
	[Entered_Date_Key] [int] NOT NULL,
	[Exited_Date_Key] [int] NOT NULL,
	[Entered_Calendar_Date] [date] NULL,
	[Exited_Calendar_Date] [date] NULL,
	[Course_Enroll_Count] [decimal](9, 2) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Student_Course_Schedule] PRIMARY KEY CLUSTERED 
(
	[Student_Course_Schedule_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Student_Course_Transcript]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Student_Course_Transcript](
	[Student_Course_Grade_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Letter_Grade] [varchar](12) NULL,
	[Numeric_Grade] [decimal](9, 2) NULL,
	[Credit_Attempted] [decimal](5, 2) NULL,
	[Credit_Earned] [decimal](5, 2) NULL,
	[Quality_Points_Earned] [decimal](5, 2) NULL,
	[Grade_Point_Max] [decimal](9, 2) NULL,
	[Passing_Grade_Ind] [char](1) NULL,
	[Content_Completer_Ind] [char](1) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Student_Course_Transcript] PRIMARY KEY CLUSTERED 
(
	[Student_Course_Grade_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Student_Program_Participation]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Student_Program_Participation](
	[Student_Program_Participation_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Program_Key] [int] NOT NULL,
	[Student_Key] [int] NOT NULL,
	[Effective_Date_Key] [int] NOT NULL,
	[Ending_Date_Key] [int] NULL,
	[Occurrence] [tinyint] NULL,
	[Effective_Date] [date] NULL,
	[Ending_Date] [date] NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Student_Program_Participation] PRIMARY KEY CLUSTERED 
(
	[Student_Program_Participation_Key] ASC
)
) ON [PRIMARY]
GO
/****** Object:  Table [tdw].[fct_Teacher_Course_Schedule]    Script Date: 4:40:40 PM ******/
CREATE TABLE [tdw].[fct_Teacher_Course_Schedule](
	[Teacher_Course_Schedule_Key] [int] IDENTITY(1,1) NOT NULL,
	[Hash_Key_BK] [varbinary](16) NOT NULL,
	[Academic_Year_Key] [int] NOT NULL,
	[District_Key] [int] NOT NULL,
	[Calendar_Track_Key] [int] NOT NULL,
	[Term_Key] [int] NOT NULL,
	[Course_Section_Key] [int] NOT NULL,
	[Staff_Key] [int] NOT NULL,
	[School_Key] [int] NOT NULL,
	[Cycle_Day_Key] [int] NOT NULL,
	[Start_Period_Key] [int] NOT NULL,
	[End_Period_Key] [int] NOT NULL,
	[Entered_Date_Key] [int] NOT NULL,
	[Exited_Date_Key] [int] NULL,
	[Entered_Calendar_Date] [date] NULL,
	[Exited_Calendar_Date] [date] NULL,
	[Course_Enroll_Count] [decimal](9, 2) NULL,
	[Primary_Secondary_CD] [char](2) NULL,
	[Date_Stamp] [datetime2](7) NOT NULL,
	[Batch_Key] [int] NOT NULL,
	[No_Longer_In_Source_Ind] [char](1) NOT NULL,
	[Date_First_Seen] [datetime2](7) NOT NULL,
	[Date_Last_Seen] [datetime2](7) NOT NULL,
	[SourceIdentifier] [varchar](50) NULL,
 CONSTRAINT [PK_fct_Teacher_Course_Schedule] PRIMARY KEY CLUSTERED 
(
	[Teacher_Course_Schedule_Key] ASC
)
) ON [PRIMARY]
GO
ALTER TABLE [adw].[dim_Course_Section]  WITH CHECK ADD  CONSTRAINT [FK_adw.dim_Course_Section_adw.dim_Course_Course_Key] FOREIGN KEY([Course_Key])
REFERENCES [adw].[dim_Course] ([Course_Key])
GO
ALTER TABLE [adw].[dim_Course_Section] CHECK CONSTRAINT [FK_adw.dim_Course_Section_adw.dim_Course_Course_Key]
GO
ALTER TABLE [adw].[dim_Marking_Period]  WITH CHECK ADD  CONSTRAINT [FK_adw.dim_Marking_Period_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY] FOREIGN KEY([Calendar_Track_Key])
REFERENCES [adw].[dim_Calendar_Track] ([Calendar_Track_Key])
GO
ALTER TABLE [adw].[dim_Marking_Period] CHECK CONSTRAINT [FK_adw.dim_Marking_Period_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY]
GO
ALTER TABLE [adw].[dim_Marking_Period]  WITH CHECK ADD  CONSTRAINT [FK_adw.dim_Marking_Period_adw.DIM_TERM_TERM_KEY] FOREIGN KEY([Term_Key])
REFERENCES [adw].[dim_Term] ([Term_Key])
GO
ALTER TABLE [adw].[dim_Marking_Period] CHECK CONSTRAINT [FK_adw.dim_Marking_Period_adw.DIM_TERM_TERM_KEY]
GO
ALTER TABLE [adw].[dim_Term]  WITH CHECK ADD  CONSTRAINT [FK_adw.dim_Term_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY] FOREIGN KEY([Calendar_Track_Key])
REFERENCES [adw].[dim_Calendar_Track] ([Calendar_Track_Key])
GO
ALTER TABLE [adw].[dim_Term] CHECK CONSTRAINT [FK_adw.dim_Term_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_ACADEMIC_YEAR_ACADEMIC_YEAR_KEY] FOREIGN KEY([Academic_Year_Key])
REFERENCES [adw].[dim_Academic_Year] ([Academic_Year_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_ACADEMIC_YEAR_ACADEMIC_YEAR_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY] FOREIGN KEY([Calendar_Track_Key])
REFERENCES [adw].[dim_Calendar_Track] ([Calendar_Track_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_CALENDAR_TRACK_CALENDAR_TRACK_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_COURSE_SECTION_COURSE_SECTION_KEY] FOREIGN KEY([Course_Section_Key])
REFERENCES [adw].[dim_Course_Section] ([Course_Section_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_COURSE_SECTION_COURSE_SECTION_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_DISTRICT_DISTRICT_KEY] FOREIGN KEY([District_Key])
REFERENCES [adw].[dim_District] ([District_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_DISTRICT_DISTRICT_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_GRADE_TYPE_GRADE_TYPE_KEY] FOREIGN KEY([Grade_Type_Key])
REFERENCES [adw].[dim_Grade_Type] ([Grade_Type_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_GRADE_TYPE_GRADE_TYPE_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_MARKING_PERIOD_MARKING_PERIOD_KEY] FOREIGN KEY([Marking_Period_Key])
REFERENCES [adw].[dim_Marking_Period] ([Marking_Period_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_MARKING_PERIOD_MARKING_PERIOD_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.dim_School_School_Key] FOREIGN KEY([School_Key])
REFERENCES [adw].[dim_School] ([School_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.dim_School_School_Key]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_STUDENT_STUDENT_KEY] FOREIGN KEY([Student_Key])
REFERENCES [adw].[dim_Student] ([Student_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_STUDENT_STUDENT_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Grade]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_TERM_TERM_KEY] FOREIGN KEY([Term_Key])
REFERENCES [adw].[dim_Term] ([Term_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Grade] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Grade_adw.DIM_TERM_TERM_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_ACADEMIC_YEAR_ACADEMIC_YEAR_KEY] FOREIGN KEY([Academic_Year_Key])
REFERENCES [adw].[dim_Academic_Year] ([Academic_Year_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_ACADEMIC_YEAR_ACADEMIC_YEAR_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_DISTRICT_DISTRICT_KEY] FOREIGN KEY([District_Key])
REFERENCES [adw].[dim_District] ([District_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_DISTRICT_DISTRICT_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.dim_School_School_Key] FOREIGN KEY([School_Key])
REFERENCES [adw].[dim_School] ([School_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.dim_School_School_Key]
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_STUDENT_STUDENT_KEY] FOREIGN KEY([Student_Key])
REFERENCES [adw].[dim_Student] ([Student_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_STUDENT_STUDENT_KEY]
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript]  WITH CHECK ADD  CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_TERM_TERM_KEY] FOREIGN KEY([Term_Key])
REFERENCES [adw].[dim_Term] ([Term_Key])
GO
ALTER TABLE [adw].[fct_Student_Course_Transcript] CHECK CONSTRAINT [FK_adw.fct_Student_Course_Transcript_adw.DIM_TERM_TERM_KEY]
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Attendance_Daily_Activity] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Attendance_Period_Activity] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Enrollment_Pairs] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_School_Calendar] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Student_Course_Grade] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Student_Course_Schedule] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Student_Course_Transcript] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Student_Program_Participation] ([Hash_Key_BK] ASC)
GO
CREATE NONCLUSTERED INDEX [Idx_HashKey] ON [tdw].[fct_Teacher_Course_Schedule] ([Hash_Key_BK] ASC)
GO

/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Academic_Year]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Academic_Year]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Academic_Year]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Academic_Year_Name], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Academic_Year_Short_Name], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Start_Year]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[End_Year]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Academic_Year_Nbr_Sequence]), '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [Academic_Year_Short_Name]=A.[Academic_Year_Short_Name],
    [Start_Year]=A.[Start_Year],
    [End_Year]=A.[End_Year],
    [Academic_Year_Nbr_Sequence]=A.[Academic_Year_Nbr_Sequence],
    [State_Funded_School_Days_In_Year]=A.[State_Funded_School_Days_In_Year],
    [Current_Academic_Year_Ind]=A.[Current_Academic_Year_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Academic_Year] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Name] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Name] ORDER BY sd.[Date_Stamp] DESC),
    [Academic_Year_Key_Temp]=k1.[Academic_Year_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Academic_Year_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Academic_Year] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Academic_Year_Key]=dm.[Academic_Year_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Attendance]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Attendance]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Attendance]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Attendance_Category_Cd], '?') + CHAR(9)
    + IsNull(A.[Attendance_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Attendance_State_Category_Cd], '?') + CHAR(9)
    + IsNull(A.[Attendance_Desc], '?') + CHAR(9)
    + IsNull(A.[Attendance_State_Cd], '?') + CHAR(9)
    + IsNull(A.[Attendance_State_Desc], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Attendance_Category_Cd]=A.[Attendance_Category_Cd],
    [Attendance_State_Category_Cd]=A.[Attendance_State_Category_Cd],
    [Attendance_Cd]=A.[Attendance_Cd],
    [Attendance_Desc]=A.[Attendance_Desc],
    [Attendance_Sort_Order]=A.[Attendance_Sort_Order],
    [Attendance_State_Cd]=A.[Attendance_State_Cd],
    [Attendance_State_Desc]=A.[Attendance_State_Desc],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Attendance] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Attendance_Category_Cd] IS NULL OR sd.[Attendance_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Attendance_Category_Cd], sd.[Attendance_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Attendance_Key_Temp]=k1.[Attendance_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Attendance_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Attendance] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Attendance_Key]=dm.[Attendance_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Day_Type_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Day_Type_Desc], '?') + CHAR(9)
    + IsNull(A.[School_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Holiday_Ind], '?') + CHAR(9)
    + IsNull(A.[Staff_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Calendar_Day_Type_Planned_Make_Up_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Calendar_Day_Type_Actual_Make_Up_Day_Ind], '?') + CHAR(9)
    + IsNull(A.[Calendar_Day_Type_Inclement_Weather_Day_Ind], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Calendar_Day_Type_Cd]=A.[Calendar_Day_Type_Cd],
    [Calendar_Day_Type_Desc]=A.[Calendar_Day_Type_Desc],
    [Calendar_Day_Type_Sort_Order]=A.[Calendar_Day_Type_Sort_Order],
    [School_Day_Ind]=A.[School_Day_Ind],
    [Holiday_Ind]=A.[Holiday_Ind],
    [Staff_Day_Ind]=A.[Staff_Day_Ind],
    [Calendar_Day_Type_Planned_Make_Up_Day_Ind]=A.[Calendar_Day_Type_Planned_Make_Up_Day_Ind],
    [Calendar_Day_Type_Actual_Make_Up_Day_Ind]=A.[Calendar_Day_Type_Actual_Make_Up_Day_Ind],
    [Calendar_Day_Type_Inclement_Weather_Day_Ind]=A.[Calendar_Day_Type_Inclement_Weather_Day_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Calendar_Day_Type] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Calendar_Day_Type_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Calendar_Day_Type_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Calendar_Day_Type_Key_Temp]=k1.[Calendar_Day_Type_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Calendar_Day_Type_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Calendar_Day_Type] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Calendar_Day_Type_Key]=dm.[Calendar_Day_Type_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Calendar_Track]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Calendar_Track]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Calendar_Track]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Track_School_Id], '?') + CHAR(9)
    + IsNull(A.[Calendar_Track_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Track_Desc], '?') + CHAR(9)
    + IsNull(A.[Summer_School_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_First_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Last_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Planned_Instructional_Days]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Instructional_Minutes]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Whole_Day_Absences_Minutes]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Half_Day_Absences_Minutes]), '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_Desc]=A.[Calendar_Track_Desc],
    [Calendar_Track_Sort_Order]=A.[Calendar_Track_Sort_Order],
    [Summer_School_Ind]=A.[Summer_School_Ind],
    [Track_First_Instructional_Date]=A.[Track_First_Instructional_Date],
    [Track_Last_Instructional_Date]=A.[Track_Last_Instructional_Date],
    [Track_Planned_Instructional_Days]=A.[Track_Planned_Instructional_Days],
    [Track_Instructional_Minutes]=A.[Track_Instructional_Minutes],
    [Track_Whole_Day_Absences_Minutes]=A.[Track_Whole_Day_Absences_Minutes],
    [Track_Half_Day_Absences_Minutes]=A.[Track_Half_Day_Absences_Minutes],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Calendar_Track] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Calendar_Track_School_Id] IS NULL OR sd.[Calendar_Track_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Calendar_Track_School_Id], sd.[Calendar_Track_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Calendar_Track_Key_Temp]=k1.[Calendar_Track_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Calendar_Track_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Calendar_Track] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Calendar_Track_Key]=dm.[Calendar_Track_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Course]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Course]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Course]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Course_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Course_Title], '?') + CHAR(9)
    + IsNull(A.[Course_Desc], '?') + CHAR(9)
    + IsNull(A.[Course_State_Cd], '?') + CHAR(9)
    + IsNull(A.[Course_State_Title], '?') + CHAR(9)
    + IsNull(A.[Course_State_Code_Desc], '?') + CHAR(9)
    + IsNull(A.[Course_Department_Desc], '?') + CHAR(9)
    + IsNull(A.[Course_Active_Ind], '?') + CHAR(9)
    + IsNull(A.[Course_Level_Cd], '?') + CHAR(9)
    + IsNull(A.[Advanced_Placement_Cd], '?') + CHAR(9)
    + IsNull(A.[Advanced_Placement_Desc], '?') + CHAR(9)
    + IsNull(A.[SCED_Course_Cd], '?') + CHAR(9)
    + IsNull(A.[SCED_Course_Subject_Cd], '?') + CHAR(9)
    + IsNull(A.[SCED_Course_Sequence], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Course_Cd]=A.[Course_Cd],
    [Course_Title]=A.[Course_Title],
    [Course_Desc]=A.[Course_Desc],
    [Course_State_Cd]=A.[Course_State_Cd],
    [Course_State_Title]=A.[Course_State_Title],
    [Course_State_Code_Desc]=A.[Course_State_Code_Desc],
    [Course_Department_Desc]=A.[Course_Department_Desc],
    [Course_Active_Ind]=A.[Course_Active_Ind],
    [Course_Level_Cd]=A.[Course_Level_Cd],
    [Advanced_Placement_Cd]=A.[Advanced_Placement_Cd],
    [Advanced_Placement_Desc]=A.[Advanced_Placement_Desc],
    [SCED_Course_Cd]=A.[SCED_Course_Cd],
    [SCED_Course_Subject_Cd]=A.[SCED_Course_Subject_Cd],
    [SCED_Course_Sequence]=A.[SCED_Course_Sequence],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Course] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Course_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Course_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Course_Key_Temp]=k1.[Course_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Course_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Course] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Course_Key]=dm.[Course_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Course_Section]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Course_Section]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Course_Section]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Course_School_Id], '?') + CHAR(9)
    + IsNull(A.[Course_Cd], '?') + CHAR(9)
    + IsNull(A.[Course_Section_Identifier], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Course_Section_Cd], '?') + CHAR(9)
    + IsNull(A.[Course_School_Name], '?') + CHAR(9)
    + IsNull(A.[Course_Title], '?') + CHAR(9)
    + IsNull(A.[Course_Desc], '?') + CHAR(9)
    + IsNull(A.[Course_State_Cd], '?') + CHAR(9)
    + IsNull(A.[Course_State_Title], '?') + CHAR(9)
    + IsNull(A.[Course_State_Code_Desc], '?') + CHAR(9)
    + IsNull(A.[Course_Department_Desc], '?') + CHAR(9)
    + IsNull(A.[Course_Active_Ind], '?') + CHAR(9)
    + IsNull(A.[Course_Level_Cd], '?') + CHAR(9)
    + IsNull(A.[Advanced_Placement_Cd], '?') + CHAR(9)
    + IsNull(A.[Advanced_Placement_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Course_Credit_Value]), '?') + CHAR(9)
    + IsNull(A.[SCED_Course_Cd], '?') + CHAR(9)
    + IsNull(A.[SCED_Course_Subject_Cd], '?') + CHAR(9)
    + IsNull(A.[SCED_Course_Sequence], '?') + CHAR(9)
    + IsNull(A.[Classroom_Identifier], '?') + CHAR(9)
    + IsNull(A.[Delivery_Mode_Cd], '?') + CHAR(9)
    + IsNull(A.[Delivery_Mode_Desc], '?') + CHAR(9)
    + IsNull(A.[Primary_Teacher_Unique_Id], '?') + CHAR(9)
    + IsNull(A.[Primary_Teacher_Full_Name], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T29.[Course_Key]), '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Course_Key]=T29.[Course_Key],

    -- All Conform Table Columns
    [Course_School_Id]=A.[Course_School_Id],
    [Course_Cd]=A.[Course_Cd],
    [Course_Section_Identifier]=A.[Course_Section_Identifier],
    [Course_Section_Cd]=A.[Course_Section_Cd],
    [Course_School_Name]=A.[Course_School_Name],
    [Course_Title]=A.[Course_Title],
    [Course_Desc]=A.[Course_Desc],
    [Course_Sort_Order]=A.[Course_Sort_Order],
    [Course_State_Cd]=A.[Course_State_Cd],
    [Course_State_Title]=A.[Course_State_Title],
    [Course_State_Code_Desc]=A.[Course_State_Code_Desc],
    [Course_Department_Desc]=A.[Course_Department_Desc],
    [Course_Active_Ind]=A.[Course_Active_Ind],
    [Course_Level_Cd]=A.[Course_Level_Cd],
    [Course_Level_Sort_Order]=A.[Course_Level_Sort_Order],
    [Advanced_Placement_Cd]=A.[Advanced_Placement_Cd],
    [Advanced_Placement_Desc]=A.[Advanced_Placement_Desc],
    [Course_Credit_Value]=A.[Course_Credit_Value],
    [SCED_Course_Cd]=A.[SCED_Course_Cd],
    [SCED_Course_Subject_Cd]=A.[SCED_Course_Subject_Cd],
    [SCED_Course_Sequence]=A.[SCED_Course_Sequence],
    [Classroom_Identifier]=A.[Classroom_Identifier],
    [Delivery_Mode_Cd]=A.[Delivery_Mode_Cd],
    [Delivery_Mode_Desc]=A.[Delivery_Mode_Desc],
    [Primary_Teacher_Unique_Id]=A.[Primary_Teacher_Unique_Id],
    [Primary_Teacher_Full_Name]=A.[Primary_Teacher_Full_Name],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Course_Section] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Course] T29
     ON T29.[Course_Cd]=A.[Course_Cd]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Course_School_Id] IS NULL OR sd.[Course_Cd] IS NULL OR sd.[Course_Section_Identifier] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Course_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Course_School_Id], sd.[Course_Cd], sd.[Course_Section_Identifier] ORDER BY sd.[Date_Stamp] DESC),
    [Course_Section_Key_Temp]=k1.[Course_Section_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Course_Section_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Course_Section] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Course_Section_Key]=dm.[Course_Section_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Cycle_Day]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Cycle_Day]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Cycle_Day]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Cycle_Day_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Cycle_Day_Desc], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Cycle_Day_Cd]=A.[Cycle_Day_Cd],
    [Cycle_Day_Desc]=A.[Cycle_Day_Desc],
    [Cycle_Day_Sort_Order]=A.[Cycle_Day_Sort_Order],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Cycle_Day] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Cycle_Day_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Cycle_Day_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Cycle_Day_Key_Temp]=k1.[Cycle_Day_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Cycle_Day_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Cycle_Day] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Cycle_Day_Key]=dm.[Cycle_Day_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Date]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Date]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Date]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, A.[Date_Of_Day]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Date_Record_Type], '?') + CHAR(9)
    + IsNull(A.[Year_Name], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Year_Number_Sequence]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Year_Begin_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Year_End_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Days_In_Year]), '?') + CHAR(9)
    + IsNull(A.[Quarter_Name], '?') + CHAR(9)
    + IsNull(A.[Year_Quarter_Name], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Quarter_Number_In_Year]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Quarter_Number_Sequence]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Quarter_Begin_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Quarter_End_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Days_In_Quarter]), '?') + CHAR(9)
    + IsNull(A.[Month_Name], '?') + CHAR(9)
    + IsNull(A.[Month_Year_Name], '?') + CHAR(9)
    + IsNull(A.[Year_Month_Yyyy_Mm], '?') + CHAR(9)
    + IsNull(A.[Month_Abbr], '?') + CHAR(9)
    + IsNull(A.[Month_Year_Abbr], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Month_Number_In_Year]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Month_Number_In_Quarter]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Month_Number_Sequence]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Month_Begin_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Month_End_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Days_In_Month]), '?') + CHAR(9)
    + IsNull(A.[Week_Name], '?') + CHAR(9)
    + IsNull(A.[Week_Abbr], '?') + CHAR(9)
    + IsNull(A.[Year_Week_Name], '?') + CHAR(9)
    + IsNull(A.[Year_Week_Abbr], '?') + CHAR(9)
    + IsNull(A.[Week_Desc_Short], '?') + CHAR(9)
    + IsNull(A.[Week_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Week_Begin_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Week_End_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Week_Number_In_Year]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Week_Number_Sequence]), '?') + CHAR(9)
    + IsNull(A.[Date_String], '?') + CHAR(9)
    + IsNull(A.[Date_Desc], '?') + CHAR(9)
    + IsNull(A.[Date_Desc_Short], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Day_Number_In_Year]), '?') + CHAR(9)
    + IsNull(A.[First_Day_In_Year_Ind], '?') + CHAR(9)
    + IsNull(A.[Last_Day_In_Year_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Day_Number_In_Quarter]), '?') + CHAR(9)
    + IsNull(A.[First_Day_In_Quarter_Ind], '?') + CHAR(9)
    + IsNull(A.[Last_Day_In_Quarter_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Day_Number_In_Month]), '?') + CHAR(9)
    + IsNull(A.[First_Day_In_Month_Ind], '?') + CHAR(9)
    + IsNull(A.[Last_Day_In_Month_Ind], '?') + CHAR(9)
    + IsNull(A.[Weekday_Name], '?') + CHAR(9)
    + IsNull(A.[Weekday_Abbr], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Day_Number_In_Week]), '?') + CHAR(9)
    + IsNull(A.[First_Day_In_Week_Ind], '?') + CHAR(9)
    + IsNull(A.[Last_Day_In_Week_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Day_Number_Sequence]), '?') + CHAR(9)
    + IsNull(A.[Weekday_Ind], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Date_Record_Type]=A.[Date_Record_Type],
    [Year_Name]=A.[Year_Name],
    [Year_Number_Sequence]=A.[Year_Number_Sequence],
    [Year_Begin_Date]=A.[Year_Begin_Date],
    [Year_End_Date]=A.[Year_End_Date],
    [Days_In_Year]=A.[Days_In_Year],
    [Quarter_Name]=A.[Quarter_Name],
    [Year_Quarter_Name]=A.[Year_Quarter_Name],
    [Quarter_Number_In_Year]=A.[Quarter_Number_In_Year],
    [Quarter_Number_Sequence]=A.[Quarter_Number_Sequence],
    [Quarter_Begin_Date]=A.[Quarter_Begin_Date],
    [Quarter_End_Date]=A.[Quarter_End_Date],
    [Days_In_Quarter]=A.[Days_In_Quarter],
    [Month_Name]=A.[Month_Name],
    [Month_Year_Name]=A.[Month_Year_Name],
    [Year_Month_Yyyy_Mm]=A.[Year_Month_Yyyy_Mm],
    [Month_Abbr]=A.[Month_Abbr],
    [Month_Year_Abbr]=A.[Month_Year_Abbr],
    [Month_Number_In_Year]=A.[Month_Number_In_Year],
    [Month_Number_In_Quarter]=A.[Month_Number_In_Quarter],
    [Month_Number_Sequence]=A.[Month_Number_Sequence],
    [Month_Begin_Date]=A.[Month_Begin_Date],
    [Month_End_Date]=A.[Month_End_Date],
    [Days_In_Month]=A.[Days_In_Month],
    [Week_Name]=A.[Week_Name],
    [Week_Abbr]=A.[Week_Abbr],
    [Year_Week_Name]=A.[Year_Week_Name],
    [Year_Week_Abbr]=A.[Year_Week_Abbr],
    [Week_Desc_Short]=A.[Week_Desc_Short],
    [Week_Desc]=A.[Week_Desc],
    [Week_Begin_Date]=A.[Week_Begin_Date],
    [Week_End_Date]=A.[Week_End_Date],
    [Week_Number_In_Year]=A.[Week_Number_In_Year],
    [Week_Number_Sequence]=A.[Week_Number_Sequence],
    [Date_Of_Day]=A.[Date_Of_Day],
    [Date_String]=A.[Date_String],
    [Date_Desc]=A.[Date_Desc],
    [Date_Desc_Short]=A.[Date_Desc_Short],
    [Day_Number_In_Year]=A.[Day_Number_In_Year],
    [First_Day_In_Year_Ind]=A.[First_Day_In_Year_Ind],
    [Last_Day_In_Year_Ind]=A.[Last_Day_In_Year_Ind],
    [Day_Number_In_Quarter]=A.[Day_Number_In_Quarter],
    [First_Day_In_Quarter_Ind]=A.[First_Day_In_Quarter_Ind],
    [Last_Day_In_Quarter_Ind]=A.[Last_Day_In_Quarter_Ind],
    [Day_Number_In_Month]=A.[Day_Number_In_Month],
    [First_Day_In_Month_Ind]=A.[First_Day_In_Month_Ind],
    [Last_Day_In_Month_Ind]=A.[Last_Day_In_Month_Ind],
    [Weekday_Name]=A.[Weekday_Name],
    [Weekday_Abbr]=A.[Weekday_Abbr],
    [Day_Number_In_Week]=A.[Day_Number_In_Week],
    [First_Day_In_Week_Ind]=A.[First_Day_In_Week_Ind],
    [Last_Day_In_Week_Ind]=A.[Last_Day_In_Week_Ind],
    [Day_Number_Sequence]=A.[Day_Number_Sequence],
    [Weekday_Ind]=A.[Weekday_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Date] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Date_Of_Day] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Date_Of_Day] ORDER BY sd.[Date_Stamp] DESC),
    [Date_Key_Temp]=k1.[Date_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Date_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Date] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Date_Key]=dm.[Date_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_District]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_District]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_District]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[District_Id], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[District_Name], '?') + CHAR(9)
    + IsNull(A.[Superintendent_Name], '?') + CHAR(9)
    + IsNull(A.[State_Abbr], '?') + CHAR(9)
    + IsNull(A.[State_Name], '?') + CHAR(9)
    + IsNull(A.[County_Name], '?') + CHAR(9)
    + IsNull(A.[REA_Name], '?') + CHAR(9)
    + IsNull(A.[REA_Abbr], '?') + CHAR(9)
    + IsNull(A.[District_Academic_Year_Began], '?') + CHAR(9)
    + IsNull(A.[District_Academic_Year_Ended], '?') + CHAR(9)
    + IsNull(A.[District_Phone], '?') + CHAR(9)
    + IsNull(A.[District_Address_1], '?') + CHAR(9)
    + IsNull(A.[District_Address_2], '?') + CHAR(9)
    + IsNull(A.[District_City], '?') + CHAR(9)
    + IsNull(A.[District_State], '?') + CHAR(9)
    + IsNull(A.[District_Postal_Cd], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [District_Id]=A.[District_Id],
    [District_Name]=A.[District_Name],
    [Superintendent_Name]=A.[Superintendent_Name],
    [State_Abbr]=A.[State_Abbr],
    [State_Name]=A.[State_Name],
    [County_Name]=A.[County_Name],
    [REA_Name]=A.[REA_Name],
    [REA_Abbr]=A.[REA_Abbr],
    [District_Academic_Year_Began]=A.[District_Academic_Year_Began],
    [District_Academic_Year_Ended]=A.[District_Academic_Year_Ended],
    [District_Phone]=A.[District_Phone],
    [District_Address_1]=A.[District_Address_1],
    [District_Address_2]=A.[District_Address_2],
    [District_City]=A.[District_City],
    [District_State]=A.[District_State],
    [District_Postal_Cd]=A.[District_Postal_Cd],
    [District_Latitude]=A.[District_Latitude],
    [District_Longitude]=A.[District_Longitude],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_District] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[District_Id] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[District_Id] ORDER BY sd.[Date_Stamp] DESC),
    [District_Key_Temp]=k1.[District_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[District_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_District] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [District_Key]=dm.[District_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Enrollment]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Enrollment]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Enrollment]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Enrollment_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Enrollment_Desc], '?') + CHAR(9)
    + IsNull(A.[Enrollment_State_Cd], '?') + CHAR(9)
    + IsNull(A.[Enrollment_State_Desc], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Enrollment_Cd]=A.[Enrollment_Cd],
    [Enrollment_Desc]=A.[Enrollment_Desc],
    [Enrollment_State_Cd]=A.[Enrollment_State_Cd],
    [Enrollment_State_Desc]=A.[Enrollment_State_Desc],
    [Enrollment_Sort_Order]=A.[Enrollment_Sort_Order],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Enrollment] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Enrollment_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Enrollment_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Enrollment_Key_Temp]=k1.[Enrollment_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Enrollment_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Enrollment] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Enrollment_Key]=dm.[Enrollment_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Grade_Type]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Grade_Type]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Grade_Type]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Grade_Type_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Grade_Type_Desc], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Grade_Type_Cd]=A.[Grade_Type_Cd],
    [Grade_Type_Desc]=A.[Grade_Type_Desc],
    [Grade_Type_Sort_Order]=A.[Grade_Type_Sort_Order],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Grade_Type] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Grade_Type_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Grade_Type_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Grade_Type_Key_Temp]=k1.[Grade_Type_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Grade_Type_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Grade_Type] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Grade_Type_Key]=dm.[Grade_Type_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Marking_Period]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Marking_Period]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Marking_Period]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Track_Cd], '?') + CHAR(9)
    + IsNull(A.[Term_Cd], '?') + CHAR(9)
    + IsNull(A.[Marking_Period_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Track_Desc], '?') + CHAR(9)
    + IsNull(A.[Summer_School_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_First_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Last_Instructional_Date]), '?') + CHAR(9)
    + IsNull(A.[Term_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Term_First_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Term_Last_Instructional_Date]), '?') + CHAR(9)
    + IsNull(A.[Marking_Period_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Marking_Period_Begin_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Marking_Period_End_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T19.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T20.[TERM_KEY]), '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Calendar_Track_Key]=T19.[CALENDAR_TRACK_KEY],
    [Term_Key]=T20.[TERM_KEY],

    -- All Conform Table Columns
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_Desc]=A.[Calendar_Track_Desc],
    [Calendar_Track_Sort_Order]=A.[Calendar_Track_Sort_Order],
    [Summer_School_Ind]=A.[Summer_School_Ind],
    [Track_First_Instructional_Date]=A.[Track_First_Instructional_Date],
    [Track_Last_Instructional_Date]=A.[Track_Last_Instructional_Date],
    [Term_Cd]=A.[Term_Cd],
    [Term_Desc]=A.[Term_Desc],
    [Term_Sort_Order]=A.[Term_Sort_Order],
    [Term_First_Instructional_Date]=A.[Term_First_Instructional_Date],
    [Term_Last_Instructional_Date]=A.[Term_Last_Instructional_Date],
    [Marking_Period_Cd]=A.[Marking_Period_Cd],
    [Marking_Period_Desc]=A.[Marking_Period_Desc],
    [Marking_Period_Sort_Order]=A.[Marking_Period_Sort_Order],
    [Marking_Period_Begin_Date]=A.[Marking_Period_Begin_Date],
    [Marking_Period_End_Date]=A.[Marking_Period_End_Date],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Marking_Period] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T19
     ON T19.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T19.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Term] T20
     ON T20.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
    AND T20.[Term_Cd]=A.[Term_Cd]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Calendar_Track_Cd] IS NULL OR sd.[Term_Cd] IS NULL OR sd.[Marking_Period_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Calendar_Track_Key] IS NULL OR sd.[Term_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Calendar_Track_Cd], sd.[Term_Cd], sd.[Marking_Period_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Marking_Period_Key_Temp]=k1.[Marking_Period_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Marking_Period_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Marking_Period] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Marking_Period_Key]=dm.[Marking_Period_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Period]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Period]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Period]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Period_School_Id], '?') + CHAR(9)
    + IsNull(A.[Period_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Period_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Period_Start_Time]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Period_End_Time]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Period_Noninstructional_Minutes]), '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Period_School_Id]=A.[Period_School_Id],
    [Period_Cd]=A.[Period_Cd],
    [Period_Desc]=A.[Period_Desc],
    [Period_Sort_Order]=A.[Period_Sort_Order],
    [Period_Start_Time]=A.[Period_Start_Time],
    [Period_End_Time]=A.[Period_End_Time],
    [Period_Noninstructional_Minutes]=A.[Period_Noninstructional_Minutes],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Period] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Period_School_Id] IS NULL OR sd.[Period_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Period_School_Id], sd.[Period_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Period_Key_Temp]=k1.[Period_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Period_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Period] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Period_Key]=dm.[Period_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Program]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Program]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Program]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Program_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Program_Desc], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Program_Cd]=A.[Program_Cd],
    [Program_Desc]=A.[Program_Desc],
    [Program_Sort_Order]=A.[Program_Sort_Order],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Program] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Program_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Program_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Program_Key_Temp]=k1.[Program_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Program_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Program] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Program_Key]=dm.[Program_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_School]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_School]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_School]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[District_Id], '?') + CHAR(9)
    + IsNull(A.[School_Id], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[School_Name], '?') + CHAR(9)
    + IsNull(A.[School_Grade_Cd_Low], '?') + CHAR(9)
    + IsNull(A.[School_Grade_Cd_High], '?') + CHAR(9)
    + IsNull(A.[School_Principal_Name], '?') + CHAR(9)
    + IsNull(A.[School_Level_Cd], '?') + CHAR(9)
    + IsNull(A.[School_Level_Name], '?') + CHAR(9)
    + IsNull(A.[School_Level_Desc], '?') + CHAR(9)
    + IsNull(A.[NCES_School_Type_Cd], '?') + CHAR(9)
    + IsNull(A.[NCES_School_Type_Name], '?') + CHAR(9)
    + IsNull(A.[NCES_School_Type_Desc], '?') + CHAR(9)
    + IsNull(A.[School_Type_Cd], '?') + CHAR(9)
    + IsNull(A.[School_Type_Name], '?') + CHAR(9)
    + IsNull(A.[School_Type_Desc], '?') + CHAR(9)
    + IsNull(A.[School_State_Cd], '?') + CHAR(9)
    + IsNull(A.[School_Local_Cd], '?') + CHAR(9)
    + IsNull(A.[School_NCES_Cd], '?') + CHAR(9)
    + IsNull(A.[School_NCES_Name], '?') + CHAR(9)
    + IsNull(A.[School_Sat_School_Cd], '?') + CHAR(9)
    + IsNull(A.[School_Unique_Id], '?') + CHAR(9)
    + IsNull(A.[School_Short_Name], '?') + CHAR(9)
    + IsNull(A.[School_Academic_Year_Began], '?') + CHAR(9)
    + IsNull(A.[School_Academic_Year_Ended], '?') + CHAR(9)
    + IsNull(A.[School_Is_Closed_Ind], '?') + CHAR(9)
    + IsNull(A.[School_Principal_Email], '?') + CHAR(9)
    + IsNull(A.[School_Phone], '?') + CHAR(9)
    + IsNull(A.[School_Address_1], '?') + CHAR(9)
    + IsNull(A.[School_Address_2], '?') + CHAR(9)
    + IsNull(A.[School_City], '?') + CHAR(9)
    + IsNull(A.[School_State], '?') + CHAR(9)
    + IsNull(A.[School_Postal_Cd], '?') + CHAR(9)
    + IsNull(A.[School_Url], '?') + CHAR(9)
    + IsNull(A.[School_Title1_Ind], '?') + CHAR(9)
    + IsNull(A.[School_Title1_Cd], '?') + CHAR(9)
    + IsNull(A.[School_Title1_Desc], '?') + CHAR(9)
    + IsNull(A.[School_Magnet_Ind], '?') + CHAR(9)
    + IsNull(A.[School_Charter_Ind], '?') + CHAR(9)
    + IsNull(A.[School_Accountability_Ind], '?') + CHAR(9)
    + IsNull(A.[School_NCES_Phone], '?') + CHAR(9)
    + IsNull(A.[School_NCES_Grade_Span], '?') + CHAR(9)
    + IsNull(A.[School_NCES_Operational_Status], '?') + CHAR(9)
    + IsNull(A.[School_Special_Assistance_Status], '?') + CHAR(9)
    + IsNull(A.[School_Cpr_Aed_Instruction_Ind], '?') + CHAR(9)
    + IsNull(A.[School_Online_School_Ind], '?') + CHAR(9)
    + IsNull(A.[School_Course_Catalog_Master_List_Name], '?') + CHAR(9)
    + IsNull(A.[School_State_Reported_Ind], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [School_Name]=A.[School_Name],
    [School_Grade_Cd_Low]=A.[School_Grade_Cd_Low],
    [School_Grade_Cd_High]=A.[School_Grade_Cd_High],
    [School_Principal_Name]=A.[School_Principal_Name],
    [School_Level_Cd]=A.[School_Level_Cd],
    [School_Level_Name]=A.[School_Level_Name],
    [School_Level_Desc]=A.[School_Level_Desc],
    [NCES_School_Type_Cd]=A.[NCES_School_Type_Cd],
    [NCES_School_Type_Name]=A.[NCES_School_Type_Name],
    [NCES_School_Type_Desc]=A.[NCES_School_Type_Desc],
    [School_Type_Cd]=A.[School_Type_Cd],
    [School_Type_Name]=A.[School_Type_Name],
    [School_Type_Desc]=A.[School_Type_Desc],
    [School_State_Cd]=A.[School_State_Cd],
    [School_Local_Cd]=A.[School_Local_Cd],
    [School_NCES_Cd]=A.[School_NCES_Cd],
    [School_NCES_Name]=A.[School_NCES_Name],
    [School_Sat_School_Cd]=A.[School_Sat_School_Cd],
    [School_Unique_Id]=A.[School_Unique_Id],
    [School_Short_Name]=A.[School_Short_Name],
    [School_Academic_Year_Began]=A.[School_Academic_Year_Began],
    [School_Academic_Year_Ended]=A.[School_Academic_Year_Ended],
    [School_Is_Closed_Ind]=A.[School_Is_Closed_Ind],
    [School_Principal_Email]=A.[School_Principal_Email],
    [School_Phone]=A.[School_Phone],
    [School_Address_1]=A.[School_Address_1],
    [School_Address_2]=A.[School_Address_2],
    [School_City]=A.[School_City],
    [School_State]=A.[School_State],
    [School_Postal_Cd]=A.[School_Postal_Cd],
    [School_Latitude]=A.[School_Latitude],
    [School_Longitude]=A.[School_Longitude],
    [School_Url]=A.[School_Url],
    [School_Title1_Ind]=A.[School_Title1_Ind],
    [School_Title1_Cd]=A.[School_Title1_Cd],
    [School_Title1_Desc]=A.[School_Title1_Desc],
    [School_Magnet_Ind]=A.[School_Magnet_Ind],
    [School_Charter_Ind]=A.[School_Charter_Ind],
    [School_Accountability_Ind]=A.[School_Accountability_Ind],
    [School_NCES_Phone]=A.[School_NCES_Phone],
    [School_NCES_Grade_Span]=A.[School_NCES_Grade_Span],
    [School_NCES_Operational_Status]=A.[School_NCES_Operational_Status],
    [School_Special_Assistance_Status]=A.[School_Special_Assistance_Status],
    [School_Cpr_Aed_Instruction_Ind]=A.[School_Cpr_Aed_Instruction_Ind],
    [School_Online_School_Ind]=A.[School_Online_School_Ind],
    [School_Course_Catalog_Master_List_Name]=A.[School_Course_Catalog_Master_List_Name],
    [School_State_Reported_Ind]=A.[School_State_Reported_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_School] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[District_Id] IS NULL OR sd.[School_Id] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[District_Id], sd.[School_Id] ORDER BY sd.[Date_Stamp] DESC),
    [School_Key_Temp]=k1.[School_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[School_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_School] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [School_Key]=dm.[School_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Staff]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Staff]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Staff]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Local_Staff_Id], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Staff_Unique_Id], '?') + CHAR(9)
    + IsNull(A.[Staff_State_Id_Nbr], '?') + CHAR(9)
    + IsNull(A.[Staff_SSN], '?') + CHAR(9)
    + IsNull(A.[Staff_First_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Middle_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Last_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Name_Suffix], '?') + CHAR(9)
    + IsNull(A.[Staff_Full_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Preferred_Name], '?') + CHAR(9)
    + IsNull(A.[Staff_Sort_Name], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Staff_Birth_Date]), '?') + CHAR(9)
    + IsNull(A.[Staff_Gender_Cd], '?') + CHAR(9)
    + IsNull(A.[Staff_Gender_Desc], '?') + CHAR(9)
    + IsNull(A.[Staff_Primary_Ethnicity_Cd], '?') + CHAR(9)
    + IsNull(A.[Staff_Type_Cd], '?') + CHAR(9)
    + IsNull(A.[Staff_Type_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Hire_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Total_Salary_Amt]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Instruction_Salary_Amt]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Total_Contract_Hours]), '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Local_Staff_Id]=A.[Local_Staff_Id],
    [Staff_Unique_Id]=A.[Staff_Unique_Id],
    [Staff_State_Id_Nbr]=A.[Staff_State_Id_Nbr],
    [Staff_SSN]=A.[Staff_SSN],
    [Staff_First_Name]=A.[Staff_First_Name],
    [Staff_Middle_Name]=A.[Staff_Middle_Name],
    [Staff_Last_Name]=A.[Staff_Last_Name],
    [Staff_Name_Suffix]=A.[Staff_Name_Suffix],
    [Staff_Full_Name]=A.[Staff_Full_Name],
    [Staff_Preferred_Name]=A.[Staff_Preferred_Name],
    [Staff_Sort_Name]=A.[Staff_Sort_Name],
    [Staff_Birth_Date]=A.[Staff_Birth_Date],
    [Staff_Gender_Cd]=A.[Staff_Gender_Cd],
    [Staff_Gender_Desc]=A.[Staff_Gender_Desc],
    [Staff_Gender_Sort_Order]=A.[Staff_Gender_Sort_Order],
    [Staff_Primary_Ethnicity_Cd]=A.[Staff_Primary_Ethnicity_Cd],
    [Staff_Type_Cd]=A.[Staff_Type_Cd],
    [Staff_Type_Desc]=A.[Staff_Type_Desc],
    [Staff_Type_Sort_Order]=A.[Staff_Type_Sort_Order],
    [Hire_Date]=A.[Hire_Date],
    [Total_Salary_Amt]=A.[Total_Salary_Amt],
    [Instruction_Salary_Amt]=A.[Instruction_Salary_Amt],
    [Total_Contract_Hours]=A.[Total_Contract_Hours],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Staff] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Local_Staff_Id] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Local_Staff_Id] ORDER BY sd.[Date_Stamp] DESC),
    [Staff_Key_Temp]=k1.[Staff_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Staff_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Staff] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Staff_Key]=dm.[Staff_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Student]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Student]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Student]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Local_Student_Id], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Student_Current_Enrolled_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Birth_Country_Cd], '?') + CHAR(9)
    + IsNull(A.[Student_Birth_Country_Name], '?') + CHAR(9)
    + IsNull(A.[American_Indian_Or_Alaska_Native_Ind], '?') + CHAR(9)
    + IsNull(A.[Asian_Ind], '?') + CHAR(9)
    + IsNull(A.[Black_Or_African_American_Ind], '?') + CHAR(9)
    + IsNull(A.[Native_Hawaiian_Or_Other_Pacific_Islander_Ind], '?') + CHAR(9)
    + IsNull(A.[White_Ind], '?') + CHAR(9)
    + IsNull(A.[Hispanic_Latino_Ind], '?') + CHAR(9)
    + IsNull(A.[Hispanic_Latino_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Number_Of_Races_Reported]), '?') + CHAR(9)
    + IsNull(A.[Student_Immigrant_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Migrant_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Refugee_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Current_LEP_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Grade_Level_Cd], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Grade_Level_Desc], '?') + CHAR(9)
    + IsNull(A.[Student_Current_State_Grade_Level_Cd], '?') + CHAR(9)
    + IsNull(A.[Student_Current_State_Grade_Level_Desc], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Economically_Disadvantaged_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Free_Reduced_Meal_Cd], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Free_Reduced_Meal_Desc], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Disability_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Student_Date_Entered_District]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Student_Date_Entered_USA_School]), '?') + CHAR(9)
    + IsNull(A.[Student_Resident_District], '?') + CHAR(9)
    + IsNull(A.[Student_Citizenship_Country], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Student_USA_Date_Of_Entry]), '?') + CHAR(9)
    + IsNull(A.[Student_Primary_Language], '?') + CHAR(9)
    + IsNull(A.[Student_Year_Entered_9th_Grade], '?') + CHAR(9)
    + IsNull(A.[Student_Graduation_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Student_Graduation_Date]), '?') + CHAR(9)
    + IsNull(A.[Student_Diploma_Type_Cd], '?') + CHAR(9)
    + IsNull(A.[Student_Received_Ged_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Title_1_Cd], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Homeless_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Homeless_Unaccompanied_Youth_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Current_SpEd_Eligible_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_Current_SpEd_Receiving_Ind], '?') + CHAR(9)
    + IsNull(A.[Student_SpEd_Area_of_Exceptionality], '?') + CHAR(9)
    + IsNull(A.[Student_State_Funding_Type], '?') + CHAR(9)
    + IsNull(A.[Student_Current_Gifted_Ind], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    [HASH_KEY_T1C]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Student_State_Id_Nbr], '?') + CHAR(9)
    + IsNull(A.[Student_First_Name], '?') + CHAR(9)
    + IsNull(A.[Student_Middle_Name], '?') + CHAR(9)
    + IsNull(A.[Student_Last_Name], '?') + CHAR(9)
    + IsNull(A.[Student_Name_Suffix], '?') + CHAR(9)
    + IsNull(A.[Student_Full_Name], '?') + CHAR(9)
    + IsNull(A.[Student_Preferred_Name], '?') + CHAR(9)
    + IsNull(A.[Student_Sort_Name], '?') + CHAR(9)
    + IsNull(A.[Student_SSN], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Student_Birth_Date]), '?') + CHAR(9)
    + IsNull(A.[Student_Birth_Year_Month], '?') + CHAR(9)
    + IsNull(A.[Student_Birth_Year], '?') + CHAR(9)
    + IsNull(A.[Student_Gender_Cd], '?') + CHAR(9)
    + IsNull(A.[Student_Gender_Desc], '?') + CHAR(9)
    + IsNull(A.[Race_Desc], '?') + CHAR(9)
    + IsNull(A.[Federal_Race_Ethnicity_Desc], '?') + CHAR(9)
    )), -- T1C hash key

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Local_Student_Id]=A.[Local_Student_Id],
    [Student_Unique_Id]=A.[Student_Unique_Id],
    [Student_State_Id_Nbr]=A.[Student_State_Id_Nbr],
    [Student_Current_Enrolled_Ind]=A.[Student_Current_Enrolled_Ind],
    [Student_First_Name]=A.[Student_First_Name],
    [Student_Middle_Name]=A.[Student_Middle_Name],
    [Student_Last_Name]=A.[Student_Last_Name],
    [Student_Name_Suffix]=A.[Student_Name_Suffix],
    [Student_Full_Name]=A.[Student_Full_Name],
    [Student_Preferred_Name]=A.[Student_Preferred_Name],
    [Student_Sort_Name]=A.[Student_Sort_Name],
    [Student_SSN]=A.[Student_SSN],
    [Student_Birth_Date]=A.[Student_Birth_Date],
    [Student_Birth_Year_Month]=A.[Student_Birth_Year_Month],
    [Student_Birth_Year]=A.[Student_Birth_Year],
    [Student_Birth_Country_Cd]=A.[Student_Birth_Country_Cd],
    [Student_Birth_Country_Name]=A.[Student_Birth_Country_Name],
    [Student_Gender_Cd]=A.[Student_Gender_Cd],
    [Student_Gender_Desc]=A.[Student_Gender_Desc],
    [Student_Gender_Sort_Order]=A.[Student_Gender_Sort_Order],
    [American_Indian_Or_Alaska_Native_Ind]=A.[American_Indian_Or_Alaska_Native_Ind],
    [Asian_Ind]=A.[Asian_Ind],
    [Black_Or_African_American_Ind]=A.[Black_Or_African_American_Ind],
    [Native_Hawaiian_Or_Other_Pacific_Islander_Ind]=A.[Native_Hawaiian_Or_Other_Pacific_Islander_Ind],
    [White_Ind]=A.[White_Ind],
    [Hispanic_Latino_Ind]=A.[Hispanic_Latino_Ind],
    [Hispanic_Latino_Desc]=A.[Hispanic_Latino_Desc],
    [Race_Desc]=A.[Race_Desc],
    [Federal_Race_Ethnicity_Desc]=A.[Federal_Race_Ethnicity_Desc],
    [Number_Of_Races_Reported]=A.[Number_Of_Races_Reported],
    [Student_Immigrant_Ind]=A.[Student_Immigrant_Ind],
    [Student_Migrant_Ind]=A.[Student_Migrant_Ind],
    [Student_Refugee_Ind]=A.[Student_Refugee_Ind],
    [Student_Current_LEP_Ind]=A.[Student_Current_LEP_Ind],
    [Student_Current_Grade_Level_Cd]=A.[Student_Current_Grade_Level_Cd],
    [Student_Current_Grade_Level_Desc]=A.[Student_Current_Grade_Level_Desc],
    [Student_Current_Grade_Level_Sort_Order]=A.[Student_Current_Grade_Level_Sort_Order],
    [Student_Current_State_Grade_Level_Cd]=A.[Student_Current_State_Grade_Level_Cd],
    [Student_Current_State_Grade_Level_Desc]=A.[Student_Current_State_Grade_Level_Desc],
    [Student_Current_State_Grade_Level_Sort_Order]=A.[Student_Current_State_Grade_Level_Sort_Order],
    [Student_Current_Economically_Disadvantaged_Ind]=A.[Student_Current_Economically_Disadvantaged_Ind],
    [Student_Current_Free_Reduced_Meal_Cd]=A.[Student_Current_Free_Reduced_Meal_Cd],
    [Student_Current_Free_Reduced_Meal_Desc]=A.[Student_Current_Free_Reduced_Meal_Desc],
    [Student_Current_Free_Reduced_Meal_Sort_Order]=A.[Student_Current_Free_Reduced_Meal_Sort_Order],
    [Student_Current_Disability_Ind]=A.[Student_Current_Disability_Ind],
    [Student_Date_Entered_District]=A.[Student_Date_Entered_District],
    [Student_Date_Entered_USA_School]=A.[Student_Date_Entered_USA_School],
    [Student_Resident_District]=A.[Student_Resident_District],
    [Student_Citizenship_Country]=A.[Student_Citizenship_Country],
    [Student_USA_Date_Of_Entry]=A.[Student_USA_Date_Of_Entry],
    [Student_Primary_Language]=A.[Student_Primary_Language],
    [Student_Year_Entered_9th_Grade]=A.[Student_Year_Entered_9th_Grade],
    [Student_Graduation_Ind]=A.[Student_Graduation_Ind],
    [Student_Graduation_Date]=A.[Student_Graduation_Date],
    [Student_Diploma_Type_Cd]=A.[Student_Diploma_Type_Cd],
    [Student_Received_Ged_Ind]=A.[Student_Received_Ged_Ind],
    [Student_Current_Title_1_Cd]=A.[Student_Current_Title_1_Cd],
    [Student_Current_Homeless_Ind]=A.[Student_Current_Homeless_Ind],
    [Student_Homeless_Unaccompanied_Youth_Ind]=A.[Student_Homeless_Unaccompanied_Youth_Ind],
    [Student_Current_SpEd_Eligible_Ind]=A.[Student_Current_SpEd_Eligible_Ind],
    [Student_Current_SpEd_Receiving_Ind]=A.[Student_Current_SpEd_Receiving_Ind],
    [Student_SpEd_Area_of_Exceptionality]=A.[Student_SpEd_Area_of_Exceptionality],
    [Student_State_Funding_Type]=A.[Student_State_Funding_Type],
    [Student_Current_Gifted_Ind]=A.[Student_Current_Gifted_Ind],
    [Current_School_Id]=A.[Current_School_Id],
    [Current_School_Name]=A.[Current_School_Name],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Student] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Local_Student_Id] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Local_Student_Id] ORDER BY sd.[Date_Stamp] DESC),
    [Student_Key_Temp]=k1.[Student_Key],
    [Student_Sequence]=IsNull(K1.[Student_Sequence]+1,1),
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=CASE WHEN sd.[Hash_Key_T1C] != k1.[Hash_Key_T1C] THEN 1 ELSE 0 END,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Student_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Student] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK] and K1.Current_Record_Ind='Y'

)

SELECT *,
    [Student_Key]=dm.[Student_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Term]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Term]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Term]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Track_Cd], '?') + CHAR(9)
    + IsNull(A.[Term_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Calendar_Track_Desc], '?') + CHAR(9)
    + IsNull(A.[Summer_School_Ind], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_First_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Last_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Planned_Instructional_Days]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Track_Actual_Instructional_Days]), '?') + CHAR(9)
    + IsNull(A.[Term_Desc], '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Term_First_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Term_Last_Instructional_Date]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Term_Planned_Instructional_Days]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, A.[Term_Actual_Instructional_Days]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T18.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Calendar_Track_Key]=T18.[CALENDAR_TRACK_KEY],

    -- All Conform Table Columns
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_Desc]=A.[Calendar_Track_Desc],
    [Calendar_Track_Sort_Order]=A.[Calendar_Track_Sort_Order],
    [Summer_School_Ind]=A.[Summer_School_Ind],
    [Track_First_Instructional_Date]=A.[Track_First_Instructional_Date],
    [Track_Last_Instructional_Date]=A.[Track_Last_Instructional_Date],
    [Track_Planned_Instructional_Days]=A.[Track_Planned_Instructional_Days],
    [Track_Actual_Instructional_Days]=A.[Track_Actual_Instructional_Days],
    [Term_Cd]=A.[Term_Cd],
    [Term_Desc]=A.[Term_Desc],
    [Term_Sort_Order]=A.[Term_Sort_Order],
    [Term_First_Instructional_Date]=A.[Term_First_Instructional_Date],
    [Term_Last_Instructional_Date]=A.[Term_Last_Instructional_Date],
    [Term_Planned_Instructional_Days]=A.[Term_Planned_Instructional_Days],
    [Term_Actual_Instructional_Days]=A.[Term_Actual_Instructional_Days],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Term] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T18
     ON T18.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T18.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Calendar_Track_Cd] IS NULL OR sd.[Term_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Calendar_Track_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Calendar_Track_Cd], sd.[Term_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Term_Key_Temp]=k1.[Term_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Term_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Term] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Term_Key]=dm.[Term_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_dim_Withdrawal]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_dim_Withdrawal]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_dim_Withdrawal]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Withdrawal_Cd], '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    [HASH_KEY_T1]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(A.[Withdrawal_Desc], '?') + CHAR(9)
    + IsNull(A.[Withdrawal_State_Cd], '?') + CHAR(9)
    + IsNull(A.[Withdrawal_State_Desc], '?') + CHAR(9)
    )), -- T1 hash key

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    -- No Foreign Keys Found

    -- All Conform Table Columns
    [Withdrawal_Cd]=A.[Withdrawal_Cd],
    [Withdrawal_Desc]=A.[Withdrawal_Desc],
    [Withdrawal_State_Cd]=A.[Withdrawal_State_Cd],
    [Withdrawal_State_Desc]=A.[Withdrawal_State_Desc],
    [Withdrawal_Sort_Order]=A.[Withdrawal_Sort_Order],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[dim_Withdrawal] A (NOLOCK)

),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Withdrawal_Cd] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=0,
    [DupCount]=Row_Number() OVER(partition BY sd.[Withdrawal_Cd] ORDER BY sd.[Date_Stamp] DESC),
    [Withdrawal_Key_Temp]=k1.[Withdrawal_Key],
    [UpdateFlag]=CASE WHEN sd.[Hash_Key_T1] != k1.[Hash_Key_T1] THEN 1 ELSE 0 END,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Withdrawal_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[dim_Withdrawal] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Withdrawal_Key]=dm.[Withdrawal_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Attendance_Daily_Activity]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Attendance_Daily_Activity]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Attendance_Daily_Activity]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[STUDENT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[ATTENDANCE_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[DATE_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Calendar_Track_Key]=T6.[CALENDAR_TRACK_KEY],
    [Student_Key]=T7.[STUDENT_KEY],
    [Attendance_Key]=T8.[ATTENDANCE_KEY],
    [Attendance_Date_Key]=T9.[DATE_KEY],
    [Batch_Key]=T17.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Attendance_Category_Cd]=A.[Attendance_Category_Cd],
    [Attendance_Cd]=A.[Attendance_Cd],
    [Attendance-Date_Of_Day]=A.[Attendance-Date_Of_Day],
    [Attendance_Calendar_Date]=A.[Attendance_Calendar_Date],
    [Attendance_Days_Absent_Count]=A.[Attendance_Days_Absent_Count],
    [Periods_Absent]=A.[Periods_Absent],
    [Periods_Scheduled]=A.[Periods_Scheduled],
    [Minutes_Absent]=A.[Minutes_Absent],
    [Minutes_Scheduled]=A.[Minutes_Scheduled],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Attendance_Daily_Activity] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T6
     ON T6.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Student] T7
     ON T7.[Local_Student_Id]=A.[Local_Student_Id]
    AND T7.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Attendance] T8
     ON T8.[Attendance_Category_Cd]=A.[Attendance_Category_Cd]
    AND T8.[Attendance_Cd]=A.[Attendance_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T9
     ON T9.[Date_Of_Day]=A.[Attendance-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Batch] T17
     ON T17.[Batch_Period]=A.[Batch_Period]
    AND T17.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Attendance_Key] IS NULL OR sd.[Attendance_Date_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Attendance_Key] IS NULL OR sd.[Attendance_Date_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Calendar_Track_Key], sd.[Student_Key], sd.[Attendance_Key], sd.[Attendance_Date_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Attendance_Daily_Activity_Key_Temp]=k1.[Attendance_Daily_Activity_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Attendance_Daily_Activity_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Attendance_Daily_Activity] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Attendance_Daily_Activity_Key]=dm.[Attendance_Daily_Activity_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Attendance_Period_Activity]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Attendance_Period_Activity]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Attendance_Period_Activity]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[PERIOD_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[STUDENT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[ATTENDANCE_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T10.[DATE_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Calendar_Track_Key]=T6.[CALENDAR_TRACK_KEY],
    [Period_Key]=T7.[PERIOD_KEY],
    [Student_Key]=T8.[STUDENT_KEY],
    [Attendance_Key]=T9.[ATTENDANCE_KEY],
    [Attendance_Date_Key]=T10.[DATE_KEY],
    [Batch_Key]=T16.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Period_Cd]=A.[Period_Cd],
    [Period_School_Id]=A.[Period_School_Id],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Attendance_Category_Cd]=A.[Attendance_Category_Cd],
    [Attendance_Cd]=A.[Attendance_Cd],
    [Attendance-Date_Of_Day]=A.[Attendance-Date_Of_Day],
    [Attendance_Calendar_Date]=A.[Attendance_Calendar_Date],
    [Attendance_Periods_Absent_Count]=A.[Attendance_Periods_Absent_Count],
    [Minutes_Absent]=A.[Minutes_Absent],
    [Minutes_Scheduled]=A.[Minutes_Scheduled],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Attendance_Period_Activity] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T6
     ON T6.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Period] T7
     ON T7.[Period_School_Id]=A.[Period_School_Id]
    AND T7.[Period_Cd]=A.[Period_Cd]

LEFT OUTER JOIN [tdw].[dim_Student] T8
     ON T8.[Local_Student_Id]=A.[Local_Student_Id]
    AND T8.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Attendance] T9
     ON T9.[Attendance_Category_Cd]=A.[Attendance_Category_Cd]
    AND T9.[Attendance_Cd]=A.[Attendance_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T10
     ON T10.[Date_Of_Day]=A.[Attendance-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Batch] T16
     ON T16.[Batch_Period]=A.[Batch_Period]
    AND T16.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Period_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Attendance_Key] IS NULL OR sd.[Attendance_Date_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Period_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Attendance_Key] IS NULL OR sd.[Attendance_Date_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Calendar_Track_Key], sd.[Period_Key], sd.[Student_Key], sd.[Attendance_Key], sd.[Attendance_Date_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Attendance_Period_Activity_Key_Temp]=k1.[Attendance_Period_Activity_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Attendance_Period_Activity_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Attendance_Period_Activity] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Attendance_Period_Activity_Key]=dm.[Attendance_Period_Activity_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[STUDENT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[ENROLLMENT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[DATE_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Calendar_Track_Key]=T6.[CALENDAR_TRACK_KEY],
    [Student_Key]=T7.[STUDENT_KEY],
    [Enrollment_Key]=T8.[ENROLLMENT_KEY],
    [Enrollment_Date_Key]=T9.[DATE_KEY],
    [Withdrawal_Key]=T10.[WITHDRAWAL_KEY],
    [Withdrawal_Date_Key]=T11.[DATE_KEY],
    [Batch_Key]=T24.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Enrollment_Cd]=A.[Enrollment_Cd],
    [Enrollment-Date_Of_Day]=A.[Enrollment-Date_Of_Day],
    [Withdrawal_Cd]=A.[Withdrawal_Cd],
    [Withdrawal-Date_Of_Day]=A.[Withdrawal-Date_Of_Day],
    [Serving_District_Id]=A.[Serving_District_Id],
    [Resident_District_Id]=A.[Resident_District_Id],
    [Enrollment_Date]=A.[Enrollment_Date],
    [Withdrawal_Date]=A.[Withdrawal_Date],
    [Enrolled_Grade_Level]=A.[Enrolled_Grade_Level],
    [Current_Enrollment_Ind]=A.[Current_Enrollment_Ind],
    [Percent_Enrolled]=A.[Percent_Enrolled],
    [Enrollment_Count]=A.[Enrollment_Count],
    [No_Show_Count]=A.[No_Show_Count],
    [Calendar_Days_Enrolled]=A.[Calendar_Days_Enrolled],
    [FullYear_Enrollment_Count]=A.[FullYear_Enrollment_Count],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Enrollment_Pairs] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T6
     ON T6.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Student] T7
     ON T7.[Local_Student_Id]=A.[Local_Student_Id]
    AND T7.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Enrollment] T8
     ON T8.[Enrollment_Cd]=A.[Enrollment_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T9
     ON T9.[Date_Of_Day]=A.[Enrollment-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Withdrawal] T10
     ON T10.[Withdrawal_Cd]=A.[Withdrawal_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T11
     ON T11.[Date_Of_Day]=A.[Withdrawal-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Batch] T24
     ON T24.[Batch_Period]=A.[Batch_Period]
    AND T24.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Enrollment_Key] IS NULL OR sd.[Enrollment_Date_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Enrollment_Key] IS NULL OR sd.[Enrollment_Date_Key] IS NULL OR sd.[Withdrawal_Key] IS NULL OR sd.[Withdrawal_Date_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Calendar_Track_Key], sd.[Student_Key], sd.[Enrollment_Key], sd.[Enrollment_Date_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Enrollment_Pairs_Key_Temp]=k1.[Enrollment_Pairs_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Enrollment_Pairs_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Enrollment_Pairs] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Enrollment_Pairs_Key]=dm.[Enrollment_Pairs_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_School_Calendar]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_School_Calendar]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_School_Calendar]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[DATE_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[CALENDAR_DAY_TYPE_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[CYCLE_DAY_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Date_Key]=T6.[DATE_KEY],
    [Calendar_Track_Key]=T7.[CALENDAR_TRACK_KEY],
    [Calendar_Day_Type_Key]=T8.[CALENDAR_DAY_TYPE_KEY],
    [Cycle_Day_Key]=T9.[CYCLE_DAY_KEY],
    [Batch_Key]=T14.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Date_Of_Day]=A.[Date_Of_Day],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Calendar_Day_Type_Cd]=A.[Calendar_Day_Type_Cd],
    [Cycle_Day_Cd]=A.[Cycle_Day_Cd],
    [Calendar_Date]=A.[Calendar_Date],
    [School_Day_Num]=A.[School_Day_Num],
    [Occurrence]=A.[Occurrence],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_School_Calendar] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Date] T6
     ON T6.[Date_Of_Day]=A.[Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T7
     ON T7.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T7.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Calendar_Day_Type] T8
     ON T8.[Calendar_Day_Type_Cd]=A.[Calendar_Day_Type_Cd]

LEFT OUTER JOIN [tdw].[dim_Cycle_Day] T9
     ON T9.[Cycle_Day_Cd]=A.[Cycle_Day_Cd]

LEFT OUTER JOIN [tdw].[dim_Batch] T14
     ON T14.[Batch_Period]=A.[Batch_Period]
    AND T14.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Date_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Calendar_Day_Type_Key] IS NULL OR sd.[Cycle_Day_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Date_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Calendar_Day_Type_Key] IS NULL OR sd.[Cycle_Day_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Date_Key], sd.[Calendar_Track_Key], sd.[Calendar_Day_Type_Key], sd.[Cycle_Day_Key] ORDER BY sd.[Date_Stamp] DESC),
    [School_Calendar_Key_Temp]=k1.[School_Calendar_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[School_Calendar_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_School_Calendar] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [School_Calendar_Key]=dm.[School_Calendar_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Student_Course_Grade]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Student_Course_Grade]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Student_Course_Grade]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[TERM_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[MARKING_PERIOD_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[GRADE_TYPE_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T10.[COURSE_SECTION_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T11.[STUDENT_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Calendar_Track_Key]=T6.[CALENDAR_TRACK_KEY],
    [Term_Key]=T7.[TERM_KEY],
    [Marking_Period_Key]=T8.[MARKING_PERIOD_KEY],
    [Grade_Type_Key]=T9.[GRADE_TYPE_KEY],
    [Course_Section_Key]=T10.[COURSE_SECTION_KEY],
    [Student_Key]=T11.[STUDENT_KEY],
    [Batch_Key]=T17.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Term_Cd]=A.[Term_Cd],
    [Marking_Period_Cd]=A.[Marking_Period_Cd],
    [Grade_Type_Cd]=A.[Grade_Type_Cd],
    [Course_Cd]=A.[Course_Cd],
    [Course_School_Id]=A.[Course_School_Id],
    [Course_Section_Identifier]=A.[Course_Section_Identifier],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Letter_Grade]=A.[Letter_Grade],
    [Numeric_Grade]=A.[Numeric_Grade],
    [Grade_Point_Max]=A.[Grade_Point_Max],
    [Passing_Grade_Ind]=A.[Passing_Grade_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Student_Course_Grade] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T6
     ON T6.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Term] T7
     ON T7.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
    AND T7.[Term_Cd]=A.[Term_Cd]

LEFT OUTER JOIN [tdw].[dim_Marking_Period] T8
     ON T8.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
    AND T8.[Term_Cd]=A.[Term_Cd]
    AND T8.[Marking_Period_Cd]=A.[Marking_Period_Cd]

LEFT OUTER JOIN [tdw].[dim_Grade_Type] T9
     ON T9.[Grade_Type_Cd]=A.[Grade_Type_Cd]

LEFT OUTER JOIN [tdw].[dim_Course_Section] T10
     ON T10.[Course_School_Id]=A.[Course_School_Id]
    AND T10.[Course_Cd]=A.[Course_Cd]
    AND T10.[Course_Section_Identifier]=A.[Course_Section_Identifier]

LEFT OUTER JOIN [tdw].[dim_Student] T11
     ON T11.[Local_Student_Id]=A.[Local_Student_Id]
    AND T11.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Batch] T17
     ON T17.[Batch_Period]=A.[Batch_Period]
    AND T17.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Marking_Period_Key] IS NULL OR sd.[Grade_Type_Key] IS NULL OR sd.[Course_Section_Key] IS NULL OR sd.[Student_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Marking_Period_Key] IS NULL OR sd.[Grade_Type_Key] IS NULL OR sd.[Course_Section_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Calendar_Track_Key], sd.[Term_Key], sd.[Marking_Period_Key], sd.[Grade_Type_Key], sd.[Course_Section_Key], sd.[Student_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Student_Course_Grade_Key_Temp]=k1.[Student_Course_Grade_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Student_Course_Grade_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Student_Course_Grade] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Student_Course_Grade_Key]=dm.[Student_Course_Grade_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Student_Course_Schedule]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Student_Course_Schedule]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Student_Course_Schedule]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[TERM_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[COURSE_SECTION_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[STUDENT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[SCHOOL_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T10.[SCHOOL_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T11.[CYCLE_DAY_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T12.[PERIOD_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T13.[PERIOD_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T14.[DATE_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T15.[DATE_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [Calendar_Track_Key]=T5.[CALENDAR_TRACK_KEY],
    [Term_Key]=T6.[TERM_KEY],
    [Course_Section_Key]=T7.[COURSE_SECTION_KEY],
    [Student_Key]=T8.[STUDENT_KEY],
    [Enrolled_School_Key]=T9.[SCHOOL_KEY],
    [Attending_School_Key]=T10.[SCHOOL_KEY],
    [Cycle_Day_Key]=T11.[CYCLE_DAY_KEY],
    [Start_Period_Key]=T12.[PERIOD_KEY],
    [End_Period_Key]=T13.[PERIOD_KEY],
    [Entered_Date_Key]=T14.[DATE_KEY],
    [Exited_Date_Key]=T15.[DATE_KEY],
    [Batch_Key]=T20.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Term_Cd]=A.[Term_Cd],
    [Course_Cd]=A.[Course_Cd],
    [Course_School_Id]=A.[Course_School_Id],
    [Course_Section_Identifier]=A.[Course_Section_Identifier],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Enrolled-District_Id]=A.[Enrolled-District_Id],
    [Enrolled-School_Id]=A.[Enrolled-School_Id],
    [Attending-District_Id]=A.[Attending-District_Id],
    [Attending-School_Id]=A.[Attending-School_Id],
    [Cycle_Day_Cd]=A.[Cycle_Day_Cd],
    [Start-Period_Cd]=A.[Start-Period_Cd],
    [Start-Period_School_Id]=A.[Start-Period_School_Id],
    [End-Period_Cd]=A.[End-Period_Cd],
    [End-Period_School_Id]=A.[End-Period_School_Id],
    [Entered-Date_Of_Day]=A.[Entered-Date_Of_Day],
    [Exited-Date_Of_Day]=A.[Exited-Date_Of_Day],
    [Entered_Calendar_Date]=A.[Entered_Calendar_Date],
    [Exited_Calendar_Date]=A.[Exited_Calendar_Date],
    [Course_Enroll_Count]=A.[Course_Enroll_Count],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Student_Course_Schedule] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T5
     ON T5.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T5.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Term] T6
     ON T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
    AND T6.[Term_Cd]=A.[Term_Cd]

LEFT OUTER JOIN [tdw].[dim_Course_Section] T7
     ON T7.[Course_School_Id]=A.[Course_School_Id]
    AND T7.[Course_Cd]=A.[Course_Cd]
    AND T7.[Course_Section_Identifier]=A.[Course_Section_Identifier]

LEFT OUTER JOIN [tdw].[dim_Student] T8
     ON T8.[Local_Student_Id]=A.[Local_Student_Id]
    AND T8.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_School] T9
     ON T9.[District_Id]=A.[Enrolled-District_Id]
    AND T9.[School_Id]=A.[Enrolled-School_Id]

LEFT OUTER JOIN [tdw].[dim_School] T10
     ON T10.[District_Id]=A.[Attending-District_Id]
    AND T10.[School_Id]=A.[Attending-School_Id]

LEFT OUTER JOIN [tdw].[dim_Cycle_Day] T11
     ON T11.[Cycle_Day_Cd]=A.[Cycle_Day_Cd]

LEFT OUTER JOIN [tdw].[dim_Period] T12
     ON T12.[Period_School_Id]=A.[Start-Period_School_Id]
    AND T12.[Period_Cd]=A.[Start-Period_Cd]

LEFT OUTER JOIN [tdw].[dim_Period] T13
     ON T13.[Period_School_Id]=A.[End-Period_School_Id]
    AND T13.[Period_Cd]=A.[End-Period_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T14
     ON T14.[Date_Of_Day]=A.[Entered-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Date] T15
     ON T15.[Date_Of_Day]=A.[Exited-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Batch] T20
     ON T20.[Batch_Period]=A.[Batch_Period]
    AND T20.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Course_Section_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Enrolled_School_Key] IS NULL OR sd.[Attending_School_Key] IS NULL OR sd.[Cycle_Day_Key] IS NULL OR sd.[Start_Period_Key] IS NULL OR sd.[End_Period_Key] IS NULL OR sd.[Entered_Date_Key] IS NULL OR sd.[Exited_Date_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Course_Section_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Enrolled_School_Key] IS NULL OR sd.[Attending_School_Key] IS NULL OR sd.[Cycle_Day_Key] IS NULL OR sd.[Start_Period_Key] IS NULL OR sd.[End_Period_Key] IS NULL OR sd.[Entered_Date_Key] IS NULL OR sd.[Exited_Date_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[Calendar_Track_Key], sd.[Term_Key], sd.[Course_Section_Key], sd.[Student_Key], sd.[Enrolled_School_Key], sd.[Attending_School_Key], sd.[Cycle_Day_Key], sd.[Start_Period_Key], sd.[End_Period_Key], sd.[Entered_Date_Key], sd.[Exited_Date_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Student_Course_Schedule_Key_Temp]=k1.[Student_Course_Schedule_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Student_Course_Schedule_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Student_Course_Schedule] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Student_Course_Schedule_Key]=dm.[Student_Course_Schedule_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[TERM_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[STUDENT_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Term_Key]=T6.[TERM_KEY],
    [Student_Key]=T7.[STUDENT_KEY],
    [Batch_Key]=T17.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Term_Cd]=A.[Term_Cd],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Letter_Grade]=A.[Letter_Grade],
    [Numeric_Grade]=A.[Numeric_Grade],
    [Credit_Attempted]=A.[Credit_Attempted],
    [Credit_Earned]=A.[Credit_Earned],
    [Quality_Points_Earned]=A.[Quality_Points_Earned],
    [Grade_Point_Max]=A.[Grade_Point_Max],
    [Passing_Grade_Ind]=A.[Passing_Grade_Ind],
    [Content_Completer_Ind]=A.[Content_Completer_Ind],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Student_Course_Transcript] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Term] T6
     ON T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
    AND T6.[Term_Cd]=A.[Term_Cd]

LEFT OUTER JOIN [tdw].[dim_Student] T7
     ON T7.[Local_Student_Id]=A.[Local_Student_Id]
    AND T7.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Batch] T17
     ON T17.[Batch_Period]=A.[Batch_Period]
    AND T17.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Student_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Term_Key], sd.[Student_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Student_Course_Grade_Key_Temp]=k1.[Student_Course_Grade_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Student_Course_Grade_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Student_Course_Transcript] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Student_Course_Grade_Key]=dm.[Student_Course_Grade_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Student_Program_Participation]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Student_Program_Participation]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Student_Program_Participation]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[Academic_Year_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[Program_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[Student_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[Date_Key]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[Academic_Year_Key],
    [District_Key]=T4.[DISTRICT_KEY],
    [School_Key]=T5.[School_Key],
    [Program_Key]=T6.[Program_Key],
    [Student_Key]=T7.[Student_Key],
    [Effective_Date_Key]=T8.[Date_Key],
    [Ending_Date_Key]=T9.[Date_Key],
    [Batch_Key]=T14.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [School_Id]=A.[School_Id],
    [Program_Cd]=A.[Program_Cd],
    [Local_Student_Id]=A.[Local_Student_Id],
    [Effective-Date_Of_Day]=A.[Effective-Date_Of_Day],
    [Ending-Date_Of_Day]=A.[Ending-Date_Of_Day],
    [Occurrence]=A.[Occurrence],
    [Effective_Date]=A.[Effective_Date],
    [Ending_Date]=A.[Ending_Date],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Student_Program_Participation] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_School] T5
     ON T5.[District_Id]=A.[District_Id]
    AND T5.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Program] T6
     ON T6.[Program_Cd]=A.[Program_Cd]

LEFT OUTER JOIN [tdw].[dim_Student] T7
     ON T7.[Local_Student_Id]=A.[Local_Student_Id]
    AND T7.[Current_Record_Ind]='Y'

LEFT OUTER JOIN [tdw].[dim_Date] T8
     ON T8.[Date_Of_Day]=A.[Effective-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Date] T9
     ON T9.[Date_Of_Day]=A.[Ending-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Batch] T14
     ON T14.[Batch_Period]=A.[Batch_Period]
    AND T14.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Program_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Effective_Date_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Program_Key] IS NULL OR sd.[Student_Key] IS NULL OR sd.[Effective_Date_Key] IS NULL OR sd.[Ending_Date_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[School_Key], sd.[Program_Key], sd.[Student_Key], sd.[Effective_Date_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Student_Program_Participation_Key_Temp]=k1.[Student_Program_Participation_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Student_Program_Participation_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Student_Program_Participation] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Student_Program_Participation_Key]=dm.[Student_Program_Participation_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Load_fct_Teacher_Course_Schedule]    Script Date: 4:40:40 PM ******/
CREATE PROCEDURE [dbo].[sp_iMart_Load_fct_Teacher_Course_Schedule]
AS

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example: EXEC [dbo].[sp_iMart_Load_fct_Teacher_Course_Schedule]

WITH StageData
AS (
SELECT
    -- Business Id (Concatenate Context and all Business Keys)
    -- Business Id deprecated

    -- Natural Key
    [HASH_KEY_BK]=CONVERT(Binary(16), HASHBYTES('MD5',
    IsNull(CONVERT(VARCHAR, T3.[ACADEMIC_YEAR_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T4.[DISTRICT_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T5.[CALENDAR_TRACK_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T6.[TERM_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T7.[COURSE_SECTION_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T8.[STAFF_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T9.[School_Key]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T10.[CYCLE_DAY_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T11.[PERIOD_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T12.[PERIOD_KEY]), '?') + CHAR(9)
    + IsNull(CONVERT(VARCHAR, T13.[DATE_KEY]), '?') + CHAR(9)
    )), -- BK hash key

    -- Type 1 Field Hash
    -- No T1 Fields Found

    -- Type 1 C (Track Changes with Sequence) Field Hash
    -- No T1C Fields Found

    -- Type 2 Field Hash
    -- No T2 Fields Found

    -- Type 12 (Update with T2 band) Field Hash
    -- No T12 Fields Found

    -- Foreign Key Columns
    [Academic_Year_Key]=T3.[ACADEMIC_YEAR_KEY],
    [District_Key]=T4.[DISTRICT_KEY],
    [Calendar_Track_Key]=T5.[CALENDAR_TRACK_KEY],
    [Term_Key]=T6.[TERM_KEY],
    [Course_Section_Key]=T7.[COURSE_SECTION_KEY],
    [Staff_Key]=T8.[STAFF_KEY],
    [School_Key]=T9.[School_Key],
    [Cycle_Day_Key]=T10.[CYCLE_DAY_KEY],
    [Start_Period_Key]=T11.[PERIOD_KEY],
    [End_Period_Key]=T12.[PERIOD_KEY],
    [Entered_Date_Key]=T13.[DATE_KEY],
    [Exited_Date_Key]=T14.[DATE_KEY],
    [Batch_Key]=T20.[Batch_Key],

    -- All Conform Table Columns
    [Academic_Year_Name]=A.[Academic_Year_Name],
    [District_Id]=A.[District_Id],
    [Calendar_Track_Cd]=A.[Calendar_Track_Cd],
    [Calendar_Track_School_Id]=A.[Calendar_Track_School_Id],
    [Term_Cd]=A.[Term_Cd],
    [Course_Cd]=A.[Course_Cd],
    [Course_School_Id]=A.[Course_School_Id],
    [Course_Section_Identifier]=A.[Course_Section_Identifier],
    [Local_Staff_Id]=A.[Local_Staff_Id],
    [School_Id]=A.[School_Id],
    [Cycle_Day_Cd]=A.[Cycle_Day_Cd],
    [Start-Period_Cd]=A.[Start-Period_Cd],
    [Start-Period_School_Id]=A.[Start-Period_School_Id],
    [End-Period_Cd]=A.[End-Period_Cd],
    [End-Period_School_Id]=A.[End-Period_School_Id],
    [Entered-Date_Of_Day]=A.[Entered-Date_Of_Day],
    [Exited-Date_Of_Day]=A.[Exited-Date_Of_Day],
    [Entered_Calendar_Date]=A.[Entered_Calendar_Date],
    [Exited_Calendar_Date]=A.[Exited_Calendar_Date],
    [Course_Enroll_Count]=A.[Course_Enroll_Count],
    [Primary_Secondary_CD]=A.[Primary_Secondary_CD],
    [Batch_Period]=A.[Batch_Period],
    [SAID]=A.[SAID],
    [Date_Stamp]=A.[Date_Stamp],
    [SourceIdentifier]=A.[SourceIdentifier],

    OES_Litho=Row_Number() OVER (ORDER BY (SELECT 1))
FROM [conform].[fct_Teacher_Course_Schedule] A (NOLOCK)
LEFT OUTER JOIN [tdw].[dim_Academic_Year] T3
     ON T3.[Academic_Year_Name]=A.[Academic_Year_Name]

LEFT OUTER JOIN [tdw].[dim_District] T4
     ON T4.[District_Id]=A.[District_Id]

LEFT OUTER JOIN [tdw].[dim_Calendar_Track] T5
     ON T5.[Calendar_Track_School_Id]=A.[Calendar_Track_School_Id]
    AND T5.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]

LEFT OUTER JOIN [tdw].[dim_Term] T6
     ON T6.[Calendar_Track_Cd]=A.[Calendar_Track_Cd]
    AND T6.[Term_Cd]=A.[Term_Cd]

LEFT OUTER JOIN [tdw].[dim_Course_Section] T7
     ON T7.[Course_School_Id]=A.[Course_School_Id]
    AND T7.[Course_Cd]=A.[Course_Cd]
    AND T7.[Course_Section_Identifier]=A.[Course_Section_Identifier]

LEFT OUTER JOIN [tdw].[dim_Staff] T8
     ON T8.[Local_Staff_Id]=A.[Local_Staff_Id]

LEFT OUTER JOIN [tdw].[dim_School] T9
     ON T9.[District_Id]=A.[District_Id]
    AND T9.[School_Id]=A.[School_Id]

LEFT OUTER JOIN [tdw].[dim_Cycle_Day] T10
     ON T10.[Cycle_Day_Cd]=A.[Cycle_Day_Cd]

LEFT OUTER JOIN [tdw].[dim_Period] T11
     ON T11.[Period_School_Id]=A.[Start-Period_School_Id]
    AND T11.[Period_Cd]=A.[Start-Period_Cd]

LEFT OUTER JOIN [tdw].[dim_Period] T12
     ON T12.[Period_School_Id]=A.[End-Period_School_Id]
    AND T12.[Period_Cd]=A.[End-Period_Cd]

LEFT OUTER JOIN [tdw].[dim_Date] T13
     ON T13.[Date_Of_Day]=A.[Entered-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Date] T14
     ON T14.[Date_Of_Day]=A.[Exited-Date_Of_Day]

LEFT OUTER JOIN [tdw].[dim_Batch] T20
     ON T20.[Batch_Period]=A.[Batch_Period]
    AND T20.[SAID]=A.[SAID]
),

DataMerge AS (
SELECT
    [MissingBusinessKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Course_Section_Key] IS NULL OR sd.[Staff_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Cycle_Day_Key] IS NULL OR sd.[Start_Period_Key] IS NULL OR sd.[End_Period_Key] IS NULL OR sd.[Entered_Date_Key] IS NULL THEN 1 ELSE 0 END,
    [MissingForeignKey]=CASE WHEN sd.[Academic_Year_Key] IS NULL OR sd.[District_Key] IS NULL OR sd.[Calendar_Track_Key] IS NULL OR sd.[Term_Key] IS NULL OR sd.[Course_Section_Key] IS NULL OR sd.[Staff_Key] IS NULL OR sd.[School_Key] IS NULL OR sd.[Cycle_Day_Key] IS NULL OR sd.[Start_Period_Key] IS NULL OR sd.[End_Period_Key] IS NULL OR sd.[Entered_Date_Key] IS NULL OR sd.[Exited_Date_Key] IS NULL OR sd.[Batch_Key] IS NULL THEN 1 ELSE 0 END,
    [DupCount]=Row_Number() OVER(partition BY sd.[Academic_Year_Key], sd.[District_Key], sd.[Calendar_Track_Key], sd.[Term_Key], sd.[Course_Section_Key], sd.[Staff_Key], sd.[School_Key], sd.[Cycle_Day_Key], sd.[Start_Period_Key], sd.[End_Period_Key], sd.[Entered_Date_Key] ORDER BY sd.[Date_Stamp] DESC),
    [Teacher_Course_Schedule_Key_Temp]=k1.[Teacher_Course_Schedule_Key],
    [UpdateFlag]=1,
    [NewSeqFlag]=0,
    [NewKeyFlag]=0,
    [NewRowFlag]=CASE WHEN k1.[Teacher_Course_Schedule_Key] IS NULL THEN 1 ELSE 0 END,
    sd.*
FROM StageData sd
left outer join [tdw].[fct_Teacher_Course_Schedule] K1
    on sd.[Hash_Key_BK] = K1.[Hash_Key_BK]

)

SELECT *,
    [Teacher_Course_Schedule_Key]=dm.[Teacher_Course_Schedule_Key_Temp],
    [DISCARDFLAG]=CASE WHEN [MissingForeignKey] = 1 OR [MissingBusinessKey] = 1 OR [DUPCOUNT] > 1 THEN 1 ELSE 0 END
FROM DataMerge dm
WHERE [NewRowFlag] = 1 --New Entity
   OR [NewKeyFlag] = 1 --New ADW Key (T2)
   OR [NewSeqFlag] = 1 --New Sequence (T1C)
   OR [UpdateFlag] = 1 --T1 Update
   OR [MissingBusinessKey] = 1 OR [DupCount] > 1 OR [MissingForeignKey] = 1 --Discard Record
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Academic_Year_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Academic_Year_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 15:54:59
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Academic_Year_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Academic_Year"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[edfi].[SchoolYearType].SchoolYear-1) + '-'+ convert(varchar,[edfi].[SchoolYearType].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[Academic_Year_Short_Name]=convert(Char(5),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Short_Name">
    right(convert(varchar,[edfi].[SchoolYearType].SchoolYear-1),2) + '-'+ right(convert(varchar,[edfi].[SchoolYearType].SchoolYear),2)
    --</MappingInfoStatus>
    )

    ,[Start_Year]=convert(Int,
    --<MappingInfoStatus Status="C" Column="Start_Year">
    [edfi].[SchoolYearType].SchoolYear-1
    --</MappingInfoStatus>
    )

    ,[End_Year]=convert(Int,
    --<MappingInfoStatus Status="C" Column="End_Year">
    [edfi].[SchoolYearType].SchoolYear
    --</MappingInfoStatus>
    )

    ,[Academic_Year_Nbr_Sequence]=convert(Int,
    --<MappingInfoStatus Status="C" Column="Academic_Year_Nbr_Sequence">
    [edfi].[SchoolYearType].SchoolYear-1990
    --</MappingInfoStatus>
    )

    ,[State_Funded_School_Days_In_Year]=convert(Int,
    --<MappingInfoStatus Status="I" Column="State_Funded_School_Days_In_Year">
    0 -- Managed out of Process.  Updated post load.
    --</MappingInfoStatus>
    )

    ,[Current_Academic_Year_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Current_Academic_Year_Ind">
    case when [edfi].[SchoolYearType].CurrentSchoolYear=1
		 then 'Y'
		 else 'N' end
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[SchoolYearType].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[SchoolYearType].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[SchoolYearType].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[SchoolYearType]
 where (@Batch_Period_List='all' or [edfi].[SchoolYearType].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or[edfi].[SchoolYearType].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Attendance_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Attendance_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Attendance_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Attendance"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Attendance_Category_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_Category_Cd">
    Case when [AttendanceEvent_lkp].CodeValue like '%Absence%' then 'A'
		 when [AttendanceEvent_lkp].CodeValue like '%Tardy%' then 'T'
		 else 'P' end
    --</MappingInfoStatus>
    )

    ,[Attendance_State_Category_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_State_Category_Cd">
    Case when [AttendanceEvent_lkp].CodeValue like '%Absence%' then 'A'
		 when [AttendanceEvent_lkp].CodeValue like '%Tardy%' then 'T'
		 else 'P' end
    --</MappingInfoStatus>
    )

    ,[Attendance_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_Cd">
    [AttendanceEvent_lkp].CodeValue
    --</MappingInfoStatus>
    )

    ,[Attendance_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Attendance_Desc">
    [AttendanceEvent_lkp].Description
    --</MappingInfoStatus>
    )

    ,[Attendance_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Attendance_Sort_Order">
    IsNull((
	select top (1) x.LocalSortOrder
	  from dbo.CodeXRef x
	 where x.CodeCategory='Attendance Code - Local to State' -- 
	   and x.LocalCode=[AttendanceEvent_lkp].CodeValue
	),[AttendanceEvent_lkp].DescriptorId  -- Assumes if No Crosswalk from Local to State we will use descriptorid.
	)
    --</MappingInfoStatus>
    )

    ,[Attendance_State_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_State_Cd">
    IsNull((
	select top (1) x.XrefCode
	  from dbo.CodeXRef x
	 where x.CodeCategory='Attendance Code - Local to State' -- 
	   and x.LocalCode=[AttendanceEvent_lkp].CodeValue
	),[AttendanceEvent_lkp].CodeValue  -- Assumes if No Crosswalk from Local to State we will use local code.
	)
    --</MappingInfoStatus>
    )

    ,[Attendance_State_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Attendance_State_Desc">
    IsNull((
	select top (1) x.XrefValue
	  from dbo.CodeXRef x
	 where x.CodeCategory='Attendance Code - Local to State' -- 
	   and x.LocalCode=[AttendanceEvent_lkp].CodeValue
	),[AttendanceEvent_lkp].Description  -- Assumes if No Crosswalk from Local to State we will use local desc.
	)
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [AttendanceEvent_lkp].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [AttendanceEvent_lkp].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [AttendanceEvent_lkp].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>  -- select *
  from (
    select distinct s.LocalEducationAgencyId, d.SAID, d.CodeValue, d.Description, d.LastModifiedDate, ae.SchoolYear, d.DescriptorId
	  from [edfi].[StudentSectionAttendanceEvent] ae
	  join [edfi].[School] s on s.SchoolId=ae.SchoolId
	  join [edfi].[Descriptor] d on d.DescriptorId=ae.AttendanceEventCategoryDescriptorId
	union
    select distinct s.LocalEducationAgencyId, d.SAID, d.CodeValue, d.Description, d.LastModifiedDate, ae.SchoolYear, d.DescriptorId
	  from [edfi].[StudentSchoolAttendanceEvent] ae
	  join [edfi].[School] s on s.SchoolId=ae.SchoolId
	  join [edfi].[Descriptor] d on d.DescriptorId=ae.AttendanceEventCategoryDescriptorId
	   ) [AttendanceEvent_lkp]
  where (@Batch_Period_List='all' or [AttendanceEvent_lkp].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [AttendanceEvent_lkp].SAID in (select SAID from @SAIDtable) )  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Calendar_Day_Type_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Calendar_Day_Type_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Calendar_Day_Type_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Calendar_Day_Type"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Calendar_Day_Type_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Day_Type_Cd">
    [CalendarEvent_lkp].CodeValue
    --</MappingInfoStatus>
    )

    ,[Calendar_Day_Type_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Calendar_Day_Type_Desc">
    [CalendarEvent_lkp].Description
    --</MappingInfoStatus>
    )

    ,[Calendar_Day_Type_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Calendar_Day_Type_Sort_Order">
    [CalendarEvent_lkp].DescriptorId
    --</MappingInfoStatus>
    )

    ,[School_Day_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="School_Day_Ind">
    case when [CalendarEvent_lkp].CodeValue in ('Instructional day','Membership Day','I')
		 then 'Y'
		 else 'N' end
    --</MappingInfoStatus>
    )

    ,[Holiday_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Holiday_Ind">
    case when [CalendarEvent_lkp].CodeValue in ('Holiday','Vacation Day','Break')
		 then 'Y'
		 else 'N' end
    --</MappingInfoStatus>
    )

    ,[Staff_Day_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Staff_Day_Ind">
    case when [CalendarEvent_lkp].CodeValue in ('Instructional day','Membership Day','I','In-Service Day','Staff Development','Teacher only day')
		 then 'Y'
		 else 'N' end
    --</MappingInfoStatus>
    )

    ,[Calendar_Day_Type_Planned_Make_Up_Day_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Calendar_Day_Type_Planned_Make_Up_Day_Ind">
    case when [CalendarEvent_lkp].CodeValue in ('Make-up day')
		 then 'Y'
		 else 'N' end
    --</MappingInfoStatus>
    )

    ,[Calendar_Day_Type_Actual_Make_Up_Day_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Calendar_Day_Type_Actual_Make_Up_Day_Ind">
    case when [CalendarEvent_lkp].CodeValue in ('Make-up day')
		 then 'Y'
		 else 'N' end
    --</MappingInfoStatus>
    )

    ,[Calendar_Day_Type_Inclement_Weather_Day_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Calendar_Day_Type_Inclement_Weather_Day_Ind">
    case when [CalendarEvent_lkp].CodeValue in ('Weather day')
		 then 'Y'
		 else 'N' end
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    @ActiveSchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[CalendarEventDescriptor].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [CalendarEvent_lkp].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[CalendarEventDescriptor]
  join [edfi].[Descriptor] [CalendarEvent_lkp] on [CalendarEvent_lkp].DescriptorId=[edfi].[CalendarEventDescriptor].CalendarEventDescriptorId

  where (@Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable))
    and (IsNull(@SAID,'all') in ('all','any') or [edfi].[CalendarEventDescriptor].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Calendar_Track_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Calendar_Track_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Calendar_Track_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Calendar_Track"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[Calendar].SchoolId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    [edfi].[Calendar].CalendarCode
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Desc">
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Calendar].CalendarTypeDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Sort_Order">
    [edfi].[Calendar].CalendarTypeDescriptorId-(select min(ct.CalendarTypeDescriptorId) from [edfi].[CalendarTypeDescriptor] ct)
    --</MappingInfoStatus>
    )

    ,[Summer_School_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Summer_School_Ind">
    case when exists(
	select *
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Calendar].CalendarTypeDescriptorId
	   and d.CodeValue in ('S','Summer')
	) then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Track_First_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Track_First_Instructional_Date">
    IsNull((
	select min(a.Date)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue='Instructional day'
	   and a.SchoolId=[edfi].[Calendar].SchoolId
	   and a.SchoolYear=[edfi].[Calendar].SchoolYear
	   and a.CalendarCode=[edfi].[Calendar].CalendarCode
	),'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Track_Last_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Track_Last_Instructional_Date">
    IsNull((
	select max(a.Date)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue='Instructional day'
	   and a.SchoolId=[edfi].[Calendar].SchoolId
	   and a.SchoolYear=[edfi].[Calendar].SchoolYear
	   and a.CalendarCode=[edfi].[Calendar].CalendarCode
	),'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Track_Planned_Instructional_Days]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Track_Planned_Instructional_Days">
    IsNull((
	select count(*)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue='Instructional day'
	   and a.SchoolId=[edfi].[Calendar].SchoolId
	   and a.SchoolYear=[edfi].[Calendar].SchoolYear
	   and a.CalendarCode=[edfi].[Calendar].CalendarCode
	),0)
    --</MappingInfoStatus>
    )

    ,[Track_Instructional_Minutes]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Track_Instructional_Minutes">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Track_Whole_Day_Absences_Minutes]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Track_Whole_Day_Absences_Minutes">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Track_Half_Day_Absences_Minutes]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Track_Half_Day_Absences_Minutes">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[Calendar].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[Calendar].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    convert(date,[edfi].[Calendar].LastModifiedDate)
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select count(*) -- select *
  from [edfi].[Calendar]
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[Calendar].SchoolId
 where (@Batch_Period_List='all' or [edfi].[Calendar].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[Calendar].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Course_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Course_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Course_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Course"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select distinct
     [Course_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_Cd">
    [edfi].[CourseOffering].CourseCode
    --</MappingInfoStatus>
    )

    ,[Course_Title]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="Course_Title">
    [edfi].[Course].CourseTitle
    --</MappingInfoStatus>
    )

    ,[Course_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Course_Desc">
    [edfi].[Course].CourseDescription
    --</MappingInfoStatus>
    )

    ,[Course_State_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_State_Cd">
    IsNull((
	select top(1) x.IdentificationCode
	  from [edfi].[CourseIdentificationCode] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseIdentificationSystemDescriptorId  
	   and d.CodeValue='State course code'
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[Course_State_Title]=convert(VarChar(60),
    --<MappingInfoStatus Status="H" Column="Course_State_Title">
    '' -- Not found in EdFi. Consider CodeXRef.
    --</MappingInfoStatus>
    )

    ,[Course_State_Code_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="H" Column="Course_State_Code_Desc">
    '' -- Not found in EdFi. Consider CodeXRef.
    --</MappingInfoStatus>
    )

    ,[Course_Department_Desc]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="Course_Department_Desc">
	-- Gets mapped to Subject
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Course].AcademicSubjectDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Course_Active_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Course_Active_Ind">
    case -- If we find an section assigned with this course then it is active
	when exists (
	select x.*
	  from [edfi].[Section] x
	  where x.SchoolId=[edfi].[CourseOffering].SchoolId
		and x.SchoolYear=[edfi].[CourseOffering].SchoolYear
		and x.SessionName=[edfi].[CourseOffering].SessionName
		and x.LocalCourseCode=[edfi].[CourseOffering].LocalCourseCode
	) then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Course_Level_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_Level_Cd">
    IsNull((
	select top(1) d.CodeValue 
	  from [edfi].[CourseLevelCharacteristic] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseLevelCharacteristicDescriptorId 
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[Advanced_Placement_Cd]=convert(VarChar(60),
    --<MappingInfoStatus Status="I" Column="Advanced_Placement_Cd">
    -- Indistinguishable from Course Level in EdFi
    IsNull((
	select top(1) d.CodeValue 
	  from [edfi].[CourseLevelCharacteristic] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseLevelCharacteristicDescriptorId 
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[Advanced_Placement_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="I" Column="Advanced_Placement_Desc">
    -- Indistinguishable from Course Level in EdFi
    IsNull((
	select top(1) d.Description 
	  from [edfi].[CourseLevelCharacteristic] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseLevelCharacteristicDescriptorId 
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[SCED_Course_Cd]=convert(Char(5),
    --<MappingInfoStatus Status="C" Column="SCED_Course_Cd">
    IsNull((
	select top(1) x.IdentificationCode
	  from [edfi].[CourseIdentificationCode] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseIdentificationSystemDescriptorId  
	   and d.CodeValue='SCED course code'
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[SCED_Course_Subject_Cd]=convert(Char(2),
    --<MappingInfoStatus Status="H" Column="SCED_Course_Subject_Cd">
	-- Needs to be place in CodeXref or in EdFi
    IsNull(
	case (
			select top (1) d.CodeValue
			  from [edfi].[Descriptor] d 
			 where d.DescriptorId=[edfi].[Course].AcademicSubjectDescriptorId
		  )
		when 'English Language Arts' then '01'
		when 'Mathematics' then '02'
		when 'Life and Physical Sciences' then '03'
		when 'Social Sciences and History' then '04'
		when 'Fine and Performing Arts' then '05'
		when 'Foreign Language and Literature' then '06'
		when 'Religious Education and Theology' then '07'
		when 'Physical, Health, and Safety Education' then '08'
		when 'Military Science' then '09'
		when 'Computer and Information Sciences' then '10'
		when 'Communications and Audio/Visual Technology' then '11'
		when 'Business and Marketing' then '12'
		when 'Manufacturing' then '13'
		when 'Health Care Sciences' then '14'
		when 'Public, Protective, and Government Service' then '15'
		when 'Hospitality and Tourism' then '16'
		when 'Architecture and Construction' then '17'
		when 'Agriculture, Food, and Natural Resources' then '18'
		when 'Human Services' then '19'
		when 'Transportation, Distribution and Logistics' then '20'
		when 'Engineering and Technology' then '21'
		when 'Miscellaneous' then '22'
		else '' end
	,'')
    --</MappingInfoStatus>
    )

    ,[SCED_Course_Sequence]=convert(VarChar(10),
    --<MappingInfoStatus Status="H" Column="SCED_Course_Sequence">
    '--' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[CourseOffering].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[CourseOffering].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[CourseOffering].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> 
  from [edfi].[CourseOffering] 
  join [edfi].[Course]
    on [edfi].[Course].EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
   and [edfi].[Course].CourseCode=[edfi].[CourseOffering].CourseCode 

  where (@Batch_Period_List='all' or [edfi].[CourseOffering].[SchoolYear] in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[CourseOffering].[SAID] in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Course_Section_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Course_Section_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Course_Section_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Course_Section"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select distinct
     [Course_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Course_School_Id">
    [edfi].[Section].SchoolId
    --</MappingInfoStatus>
    )

    ,[Course_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_Cd">
    [edfi].[CourseOffering].CourseCode
    --</MappingInfoStatus>
    )

    ,[Course_Section_Identifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Course_Section_Identifier">
    [edfi].[Section].SectionIdentifier
    --</MappingInfoStatus>
    )

    ,[Course_Section_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="I" Column="Course_Section_Cd">
    '--' -- Use Course_Section_Identifier
    --</MappingInfoStatus>
    )

    ,[Course_School_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="Course_School_Name">
    IsNull((
	select top (1) eo.NameOfInstitution
	  from [edfi].[EducationOrganization] eo
	 where eo.EducationOrganizationId=[edfi].[Section].LocationSchoolId
	 ),'')
    --</MappingInfoStatus>
    )

    ,[Course_Title]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="Course_Title">
     [edfi].[Course].CourseTitle
    --</MappingInfoStatus>
    )

    ,[Course_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Course_Desc">
    [edfi].[Course].CourseDescription
    --</MappingInfoStatus>
    )

    ,[Course_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Course_Sort_Order">
    0 -- Managed out of process.
    --</MappingInfoStatus>
    )

    ,[Course_State_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_State_Cd">
    IsNull((
	select top(1) x.IdentificationCode
	  from [edfi].[CourseIdentificationCode] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseIdentificationSystemDescriptorId  
	   and d.CodeValue='State course code'
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[Course_State_Title]=convert(VarChar(60),
    --<MappingInfoStatus Status="H" Column="Course_State_Title">
    '' -- Not found in EdFi. Consider CodeXRef.
    --</MappingInfoStatus>
    )

    ,[Course_State_Code_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="H" Column="Course_State_Code_Desc">
    '' -- Not found in EdFi. Consider CodeXRef.
    --</MappingInfoStatus>
    )

    ,[Course_Department_Desc]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="Course_Department_Desc">
	-- Gets mapped to Subject
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Course].AcademicSubjectDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Course_Active_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Course_Active_Ind">
    'Y' -- We consider all Sections defined in [edfi].[Section] as Active
    --</MappingInfoStatus>
    )

    ,[Course_Level_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_Level_Cd">
    IsNull((
	select top(1) d.CodeValue 
	  from [edfi].[CourseLevelCharacteristic] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseLevelCharacteristicDescriptorId 
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[Course_Level_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Course_Level_Sort_Order">
    0 -- Managed out of process.
    --</MappingInfoStatus>
    )

    ,[Advanced_Placement_Cd]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="Advanced_Placement_Cd">
    -- Indistinguishable from Course Level in EdFi
    IsNull((
	select top(1) d.CodeValue 
	  from [edfi].[CourseLevelCharacteristic] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseLevelCharacteristicDescriptorId 
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[Advanced_Placement_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Advanced_Placement_Desc">
    -- Indistinguishable from Course Level in EdFi
    IsNull((
	select top(1) d.Description 
	  from [edfi].[CourseLevelCharacteristic] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseLevelCharacteristicDescriptorId 
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[Course_Credit_Value]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="C" Column="Course_Credit_Value">
    [edfi].[Section].AvailableCredits
    --</MappingInfoStatus>
    )

    ,[SCED_Course_Cd]=convert(Char(5),
    --<MappingInfoStatus Status="C" Column="SCED_Course_Cd">
    IsNull((
	select top(1) x.IdentificationCode
	  from [edfi].[CourseIdentificationCode] x
	  join [edfi].[Descriptor] d 
		on d.DescriptorId=x.CourseIdentificationSystemDescriptorId  
	   and d.CodeValue='SCED course code'
	 where x.EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
	   and x.CourseCode=[edfi].[CourseOffering].CourseCode 
	),'')
    --</MappingInfoStatus>
    )

    ,[SCED_Course_Subject_Cd]=convert(Char(2),
    --<MappingInfoStatus Status="C" Column="SCED_Course_Subject_Cd">
	-- Needs to be place in CodeXref or in EdFi
    IsNull((
	select top (1) case d.CodeValue
					when 'English Language Arts' then '01'
					when 'Mathematics' then '02'
					when 'Life and Physical Sciences' then '03'
					when 'Social Sciences and History' then '04'
					when 'Fine and Performing Arts' then '05'
					when 'Foreign Language and Literature' then '06'
					when 'Religious Education and Theology' then '07'
					when 'Physical, Health, and Safety Education' then '08'
					when 'Military Science' then '09'
					when 'Computer and Information Sciences' then '10'
					when 'Communications and Audio/Visual Technology' then '11'
					when 'Business and Marketing' then '12'
					when 'Manufacturing' then '13'
					when 'Health Care Sciences' then '14'
					when 'Public, Protective, and Government Service' then '15'
					when 'Hospitality and Tourism' then '16'
					when 'Architecture and Construction' then '17'
					when 'Agriculture, Food, and Natural Resources' then '18'
					when 'Human Services' then '19'
					when 'Transportation, Distribution and Logistics' then '20'
					when 'Engineering and Technology' then '21'
					when 'Miscellaneous' then '22'
					else '' end
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Course].AcademicSubjectDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[SCED_Course_Sequence]=convert(VarChar(10),
    --<MappingInfoStatus Status="I" Column="SCED_Course_Sequence">
    '--' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Classroom_Identifier]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Classroom_Identifier">
    [edfi].[Section].LocationClassroomIdentificationCode
    --</MappingInfoStatus>
    )

    ,[Delivery_Mode_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Delivery_Mode_Cd">
    IsNull((
	select top (1) d.CodeValue
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Section].MediumOfInstructionDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Delivery_Mode_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Delivery_Mode_Desc">
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Section].MediumOfInstructionDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Primary_Teacher_Unique_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Primary_Teacher_Unique_Id">
    IsNull((
	select top(1) s.StaffUniqueId
	  from [edfi].[StaffSectionAssociation] x
	  join [edfi].[Staff] s on s.StaffUSI=x.StaffUSI
	  join [edfi].[Descriptor] d on d.DescriptorId=x.ClassroomPositionDescriptorId
	   and d.CodeValue='Teacher of Record'
	  where x.SchoolId=[edfi].[Section].SchoolId
		and x.SchoolYear=[edfi].[Section].SchoolYear
		and x.SessionName=[edfi].[Section].SessionName
		and x.SectionIdentifier=[edfi].[Section].SectionIdentifier
	),'')
    --</MappingInfoStatus>
    )

    ,[Primary_Teacher_Full_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Primary_Teacher_Full_Name">
    IsNull((
	select top(1) s.LastSurname+', '+s.FirstName
	  from [edfi].[StaffSectionAssociation] x
	  join [edfi].[Staff] s on s.StaffUSI=x.StaffUSI
	  join [edfi].[Descriptor] d on d.DescriptorId=x.ClassroomPositionDescriptorId
	   and d.CodeValue='Teacher of Record'
	  where x.SchoolId=[edfi].[Section].SchoolId
		and x.SchoolYear=[edfi].[Section].SchoolYear
		and x.SessionName=[edfi].[Section].SessionName
		and x.SectionIdentifier=[edfi].[Section].SectionIdentifier
	),'')
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[Section].[SchoolYear]
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[Section].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[Section].LastModifiedDate
    --</MappingInfoStatus>
    )


  --<MappingInfoFrom>
  from [edfi].[Section]
  join [edfi].[CourseOffering]
	on [edfi].[CourseOffering].SchoolId=[edfi].[Section].SchoolId
   and [edfi].[CourseOffering].SchoolYear=[edfi].[Section].SchoolYear
   and [edfi].[CourseOffering].SessionName=[edfi].[Section].SessionName
   and [edfi].[CourseOffering].LocalCourseCode=[edfi].[Section].LocalCourseCode
  join [edfi].[Course]
    on [edfi].[Course].EducationOrganizationId=[edfi].[CourseOffering].EducationOrganizationId 
   and [edfi].[Course].CourseCode=[edfi].[CourseOffering].CourseCode 

 where (@Batch_Period_List='all' or [edfi].[Section].[SchoolYear] in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[Section].[SAID] in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Cycle_Day_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Cycle_Day_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Cycle_Day_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Cycle_Day"> 

--<MappingInfoCommon>
declare @ds datetime2 = getdate()
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select distinct
     [Cycle_Day_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="H" Column="Cycle_Day_Cd">
    '--' -- Hold till Bell Schedules and Cycle Days (A day, B day) are implemented.
    --</MappingInfoStatus>
    )

    ,[Cycle_Day_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="H" Column="Cycle_Day_Desc">
    '--' -- Hold till Bell Schedules and Cycle Days (A day, B day) are implemented.
    --</MappingInfoStatus>
    )

    ,[Cycle_Day_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="H" Column="Cycle_Day_Sort_Order">
    0 -- Hold till Bell Schedules and Cycle Days (A day, B day) are implemented.
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    @ActiveSchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[LocalEducationAgency].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="H" Column="Date_Stamp">
    @ds
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[LocalEducationAgency]
  where (@Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[LocalEducationAgency].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Date]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Date]
(
	@BeginDate date = '2001-08-01',
	@nbrYears int = 1
)
as

-- ============================================================================
-- Script UTC date: 2019-03-28 13:35:45
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_DIM_DATE] @BeginDate='2001-01-01', @nbrYears=30
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing

--<MappingInfo Table="dim_Date"> 

--<MappingInfoCommon>
if @BeginDate is null set @BeginDate = '2001-08-01'
if @nbrYears is null set @nbrYears = 1

declare @datetable table ( [date] date, seq int IDENTITY(1,1)) 
declare @loopdate date = @BeginDate
declare @EndDate date = dateadd(YEAR,@nbrYears,@BeginDate)

while @loopdate < @EndDate
begin  
  insert into @datetable ([date]) values (@loopdate)
  set @loopdate=dateadd(day,1,@loopdate)
end 
-- Including Unknown low date and Unknown high date
insert into @datetable ([date]) values ('1753-01-01'),('9999-12-31')
--</MappingInfoCommon>

select
     [Date_Record_Type]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Date_Record_Type">
    'C'
    --</MappingInfoStatus>
    )

    ,[Year_Name]=convert(Char(4),
    --<MappingInfoStatus Status="C" Column="Year_Name">
    datepart(year,x.date)
    --</MappingInfoStatus>
    )

    ,[Year_Number_Sequence]=convert(Int,
    --<MappingInfoStatus Status="C" Column="Year_Number_Sequence">
    datepart(year,x.date)
    --</MappingInfoStatus>
    )

    ,[Year_Begin_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Year_Begin_Date">
    convert(varchar,datepart(year,x.date)) + '-01-01'
    --</MappingInfoStatus>
    )

    ,[Year_End_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Year_End_Date">
    convert(varchar,datepart(year,x.date)) + '-12-31'
    --</MappingInfoStatus>
    )

    ,[Days_In_Year]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Days_In_Year">
    IIF(DAY(EOMONTH(DATEFROMPARTS(datepart(year,x.date),2,1))) = 29,366,365)
    --</MappingInfoStatus>
    )

    ,[Quarter_Name]=convert(Char(2),
    --<MappingInfoStatus Status="C" Column="Quarter_Name">
    'Q' + convert(varchar,convert(tinyint,datepart(quarter,x.date)))
    --</MappingInfoStatus>
    )

    ,[Year_Quarter_Name]=convert(Char(7),
    --<MappingInfoStatus Status="C" Column="Year_Quarter_Name">
    convert(varchar,year(x.date)) + '-Q' + convert(varchar,datepart(quarter,x.date))
    --</MappingInfoStatus>
    )

    ,[Quarter_Number_In_Year]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Quarter_Number_In_Year">
    datepart(quarter,x.date)
    --</MappingInfoStatus>
    )

    ,[Quarter_Number_Sequence]=convert(Int,
    --<MappingInfoStatus Status="C" Column="Quarter_Number_Sequence">
    convert(varchar,year(x.date)) + convert(varchar,datepart(quarter,x.date))
    --</MappingInfoStatus>
    )

    ,[Quarter_Begin_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Quarter_Begin_Date">
    DATEADD(qq, DATEDIFF(qq, 0, x.date), 0)
    --</MappingInfoStatus>
    )

    ,[Quarter_End_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Quarter_End_Date">
    case when x.date in ('1753-01-01','9999-12-31') then null else DATEADD (dd, -1, DATEADD(qq, DATEDIFF(qq, 0, x.date) +1, 0)) end
    --</MappingInfoStatus>
    )

    ,[Days_In_Quarter]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Days_In_Quarter">
    case when x.date in ('1753-01-01','9999-12-31') then null 
	else 
	DateDiff(dd,
	convert(date,DATEADD(qq, DATEDIFF(qq, 0, x.date), 0)),
	convert(date,DATEADD (dd, -1, DATEADD(qq, DATEDIFF(qq, 0, x.date) +1, 0))) )
	end
    --</MappingInfoStatus>
    )

    ,[Month_Name]=convert(VarChar(9),
    --<MappingInfoStatus Status="C" Column="Month_Name">
    datename(month,x.date)
    --</MappingInfoStatus>
    )

    ,[Month_Year_Name]=convert(VarChar(14),
    --<MappingInfoStatus Status="C" Column="Month_Year_Name">
    datename(month,x.date) + ' ' + convert(varchar,year(x.date))
    --</MappingInfoStatus>
    )

    ,[Year_Month_Yyyy_Mm]=convert(Char(7),
    --<MappingInfoStatus Status="C" Column="Year_Month_Yyyy_Mm">
    convert(varchar,year(x.date)) + '-' + convert(varchar(2),right('00' + convert(varchar,month(x.date)),2))
    --</MappingInfoStatus>
    )

    ,[Month_Abbr]=convert(Char(3),
    --<MappingInfoStatus Status="C" Column="Month_Abbr">
    datename(month,x.date)
    --</MappingInfoStatus>
    )

    ,[Month_Year_Abbr]=convert(Char(8),
    --<MappingInfoStatus Status="C" Column="Month_Year_Abbr">
    left(datename(month,x.date),3) + ' ' + convert(VARCHAR(4),year(x.date))
    --</MappingInfoStatus>
    )

    ,[Month_Number_In_Year]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Month_Number_In_Year">
    datepart(m,x.date)
    --</MappingInfoStatus>
    )

    ,[Month_Number_In_Quarter]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Month_Number_In_Quarter">
    case when datepart(m,x.date) in (1,4,7,10) then 1
		 when datepart(m,x.date) in  (2,5,8,11) then 2 else 3 end
    --</MappingInfoStatus>
    )

    ,[Month_Number_Sequence]=convert(Int,
    --<MappingInfoStatus Status="C" Column="Month_Number_Sequence">
    convert(varchar,year(x.date)) + convert(varchar,month(x.date))
    --</MappingInfoStatus>
    )

    ,[Month_Begin_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Month_Begin_Date">
    dateadd(dd,1,eomonth(x.date,-1))
    --</MappingInfoStatus>
    )

    ,[Month_End_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Month_End_Date">
    eomonth(x.date)
    --</MappingInfoStatus>
    )

    ,[Days_In_Month]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Days_In_Month">
    day(eomonth(x.date))
    --</MappingInfoStatus>
    )

    ,[Week_Name]=convert(Char(7),
    --<MappingInfoStatus Status="C" Column="Week_Name">
    'Week ' + convert(varchar, datepart(ww,x.date))
    --</MappingInfoStatus>
    )

    ,[Week_Abbr]=convert(Char(4),
    --<MappingInfoStatus Status="C" Column="Week_Abbr">
    'WK ' + convert(varchar,Datepart(ww,x.date))
    --</MappingInfoStatus>
    )

    ,[Year_Week_Name]=convert(Char(12),
    --<MappingInfoStatus Status="C" Column="Year_Week_Name">
    convert(varchar,year(x.date)) + ' Wk ' + convert(varchar,datepart(ww,x.date))
    --</MappingInfoStatus>
    )

    ,[Year_Week_Abbr]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Year_Week_Abbr">
    convert(varchar,year(x.date)) + '-' + right('00' + convert(varchar,datepart(week,x.date)),2)
    --</MappingInfoStatus>
    )

    ,[Week_Desc_Short]=convert(Char(19),
    --<MappingInfoStatus Status="C" Column="Week_Desc_Short">
    'WK ' + convert(varchar, Datepart(ww,x.date))
    --</MappingInfoStatus>
    )

    ,[Week_Desc]=convert(Char(32),
    --<MappingInfoStatus Status="C" Column="Week_Desc">
    'Week ' + convert(varchar,datepart(ww,x.date))
    --</MappingInfoStatus>
    )

    ,[Week_Begin_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Week_Begin_Date">
    case when x.date in ('1753-01-01','9999-12-31') then null 
	else 
    DATEADD(wk,DATEDIFF(wk,0,x.date),-1)
	end
    --</MappingInfoStatus>
    )

    ,[Week_End_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Week_End_Date">
    case when x.date in ('1753-01-01','9999-12-31') then null 
	else 
    DATEADD(wk,DATEDIFF(wk,0,x.date),5)
	end
    --</MappingInfoStatus>
    )

    ,[Week_Number_In_Year]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Week_Number_In_Year">
    datepart(ww,x.date)
    --</MappingInfoStatus>
    )

    ,[Week_Number_Sequence]=convert(Int,
    --<MappingInfoStatus Status="C" Column="Week_Number_Sequence">
    datepart(ww,x.date)
    --</MappingInfoStatus>
    )

    ,[Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Date_Of_Day">
    x.date
    --</MappingInfoStatus>
    )

    ,[Date_String]=convert(Char(10),
    --<MappingInfoStatus Status="C" Column="Date_String">
    convert(date,x.date,120)
    --</MappingInfoStatus>
    )

    ,[Date_Desc]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Date_Desc">
    x.date
    --</MappingInfoStatus>
    )

    ,[Date_Desc_Short]=convert(Char(16),
    --<MappingInfoStatus Status="C" Column="Date_Desc_Short">
    convert(date,x.date,102)
    --</MappingInfoStatus>
    )

    ,[Day_Number_In_Year]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Day_Number_In_Year">
    datepart(dy,x.date)
    --</MappingInfoStatus>
    )

    ,[First_Day_In_Year_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="First_Day_In_Year_Ind">
    case when datepart(d,x.date) = '01' and datepart(m,x.date) = '01' then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Last_Day_In_Year_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Last_Day_In_Year_Ind">
    case when datepart(d,x.date) = '31' and datepart(m,x.date) = '12' then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Day_Number_In_Quarter]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Day_Number_In_Quarter">
    DateDiff(dd,CONVERT(DATE,dateadd(qq, datediff(qq,0, x.date),0)),x.date)+1
    --</MappingInfoStatus>
    )

    ,[First_Day_In_Quarter_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="First_Day_In_Quarter_Ind">
    case when convert(tinyint,DateDiff(dd,CONVERT(DATE,dateadd(qq, datediff(qq,0, x.date),0)),x.date)+1) = 1 then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Last_Day_In_Quarter_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Last_Day_In_Quarter_Ind">
    case when DATEADD(qq,DATEDIFF(qq,-1,x.date),-1) = x.date then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Day_Number_In_Month]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Day_Number_In_Month">
    day(x.date)
    --</MappingInfoStatus>
    )

    ,[First_Day_In_Month_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="First_Day_In_Month_Ind">
    case when day(x.date) = 1 then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Last_Day_In_Month_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Last_Day_In_Month_Ind">
    case when eomonth(x.date) = x.date then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Weekday_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Weekday_Name">
    DateName(WEEKDAY,x.date)
    --</MappingInfoStatus>
    )

    ,[Weekday_Abbr]=convert(Char(3),
    --<MappingInfoStatus Status="C" Column="Weekday_Abbr">
    left(DateName(WEEKDAY,x.date),3)
    --</MappingInfoStatus>
    )

    ,[Day_Number_In_Week]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Day_Number_In_Week">
    DATEPART(DW,X.DATE)
    --</MappingInfoStatus>
    )

    ,[First_Day_In_Week_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="First_Day_In_Week_Ind">
    CASE WHEN DATEPART(day,X.DATE) = 1 THEN 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Last_Day_In_Week_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Last_Day_In_Week_Ind">
    CASE WHEN DATEPART(day,X.DATE) = 7 THEN 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Day_Number_Sequence]=convert(Int,
    --<MappingInfoStatus Status="C" Column="Day_Number_Sequence">
    datepart(yyyy,x.date)*1000 + datepart(dy,x.date)
    --</MappingInfoStatus>
    )

    ,[Weekday_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Weekday_Ind">
    case when datepart(dw,x.date) in (1,7) then 'N' else 'Y' end
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    'Static'
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    'OES-Zip'
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    Getdate()
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from @datetable X
  order by X.date
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_District_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_District_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_District_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_District"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[EducationOrganization].EducationOrganizationId
    --</MappingInfoStatus>
    )

    ,[District_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="District_Name">
    [edfi].[EducationOrganization].NameOfInstitution
    --</MappingInfoStatus>
    )

    ,[Superintendent_Name]=convert(VarChar(36),
    --<MappingInfoStatus Status="C" Column="Superintendent_Name">
	IsNull((
	select top (1) s.LastSurname + ', '+s.FirstName
	  from [edfi].[StaffEducationOrganizationAssignmentAssociation] a
	  join [edfi].[Staff] s on s.StaffUSI=a.StaffUSI
	  join edfi.descriptor d 
		on d.descriptorid=a.StaffClassificationDescriptorId and d.CodeValue='Superintendent'
	  where a.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
    --</MappingInfoStatus>
    )

    ,[State_Abbr]=convert(Char(2),
    --<MappingInfoStatus Status="C" Column="State_Abbr">
	IsNull((
	select top (1) eo.ShortNameOfInstitution
	  from [edfi].[EducationOrganization] eo 
	 where eo.EducationOrganizationId=[edfi].[LocalEducationAgency].StateEducationAgencyId
	 ),'')
    --</MappingInfoStatus>
    )

    ,[State_Name]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="State_Name">
	IsNull((
	select top (1) eo.NameOfInstitution
	  from [edfi].[EducationOrganization] eo 
	 where eo.EducationOrganizationId=[edfi].[LocalEducationAgency].StateEducationAgencyId
	 ),'')
    --</MappingInfoStatus>
    )

    ,[County_Name]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="County_Name">
    IsNull((
	select top (1) addr.NameOfCounty
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
    --</MappingInfoStatus>
    )

    ,[REA_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="REA_Name">
	IsNull((
	select top (1) eo.NameOfInstitution
	  from [edfi].[EducationOrganization] eo 
	 where eo.EducationOrganizationId=[edfi].[LocalEducationAgency].EducationServiceCenterId
	 ),[edfi].[LocalEducationAgency].EducationServiceCenterId)
    --</MappingInfoStatus>
    )

    ,[REA_Abbr]=convert(VarChar(36),
    --<MappingInfoStatus Status="C" Column="REA_Abbr">
	IsNull((
	select top (1) eo.ShortNameOfInstitution
	  from [edfi].[EducationOrganization] eo 
	 where eo.EducationOrganizationId=[edfi].[LocalEducationAgency].EducationServiceCenterId
	 ),[edfi].[LocalEducationAgency].EducationServiceCenterId)
    --</MappingInfoStatus>
    )

    ,[District_Academic_Year_Began]=convert(VarChar(9),
    --<MappingInfoStatus Status="I" Column="District_Academic_Year_Began">
    0 -- No source in EdFi
    --</MappingInfoStatus>
    )

    ,[District_Academic_Year_Ended]=convert(VarChar(9),
    --<MappingInfoStatus Status="I" Column="District_Academic_Year_Ended">
    0 -- No source in EdFi
    --</MappingInfoStatus>
    )

    ,[District_Phone]=convert(VarChar(24),
    --<MappingInfoStatus Status="C" Column="District_Phone">
	IsNull((
	select top (1) t.TelephoneNumber
	  from [edfi].[EducationOrganizationInstitutionTelephone] t
	  join [edfi].[Descriptor] d on d.DescriptorId=t.InstitutionTelephoneNumberTypeDescriptorId and d.CodeValue='Main'
	 where t.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
	--</MappingInfoStatus>
    )

    ,[District_Address_1]=convert(VarChar(36),
    --<MappingInfoStatus Status="C" Column="District_Address_1">
    IsNull((
	select top (1) addr.StreetNumberName
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
    --</MappingInfoStatus>
    )

    ,[District_Address_2]=convert(VarChar(36),
    --<MappingInfoStatus Status="C" Column="District_Address_2">
    IsNull((
	select top (1) addr.ApartmentRoomSuiteNumber
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
    --</MappingInfoStatus>
    )

    ,[District_City]=convert(VarChar(24),
    --<MappingInfoStatus Status="C" Column="District_City">
    IsNull((
	select top (1) addr.City
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
    --</MappingInfoStatus>
    )

    ,[District_State]=convert(VarChar(2),
    --<MappingInfoStatus Status="C" Column="District_State">
    IsNull((
	select top (1) st_d.CodeValue
	  from [edfi].[EducationOrganizationAddress] addr
	  join [edfi].[Descriptor] st_d on st_d.DescriptorId=addr.StateAbbreviationDescriptorId
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
    --</MappingInfoStatus>
    )

    ,[District_Postal_Cd]=convert(VarChar(10),
    --<MappingInfoStatus Status="C" Column="District_Postal_Cd">
    IsNull((
	select top (1) addr.PostalCode
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),'')
    --</MappingInfoStatus>
    )

    ,[District_Latitude]=convert(Decimal(9,6),
    --<MappingInfoStatus Status="C" Column="District_Latitude">
    IsNull((
	select top (1) addr.Latitude
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),0.0)
    --</MappingInfoStatus>
    )

    ,[District_Longitude]=convert(Decimal(9,6),
    --<MappingInfoStatus Status="C" Column="District_Longitude">
    IsNull((
	select top (1) addr.Longitude
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[EducationOrganization].EducationOrganizationId
	),0.0)
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    @ActiveSchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[LocalEducationAgency].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[EducationOrganization].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select count(*) -- Select top (10) *
  FROM [edfi].[LocalEducationAgency]
  join [edfi].[EducationOrganization] 
    on [edfi].[EducationOrganization].EducationOrganizationId=[edfi].[LocalEducationAgency].LocalEducationAgencyId
  --join [edfi].[EducationOrganizationCategory] eoc
  --  on eo.EducationOrganizationId=eoc.EducationOrganizationId
  --join edfi.Descriptor os on os.DescriptorId=eo.OperationalStatusDescriptorId
  --join edfi.Descriptor leatype on leatype.DescriptorId=lea.LocalEducationAgencyCategoryDescriptorId
 where (@Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[LocalEducationAgency].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Enrollment_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Enrollment_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 15:54:59
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Enrollment_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Enrollment"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear smallint = (select top (1) SchoolYear from [edfi].[SchoolYearType] where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Enrollment_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Enrollment_Cd">
    [EntryCodes].EntryCodeValue
    --</MappingInfoStatus>
    )

    ,[Enrollment_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Enrollment_Desc">
    [EntryCodes].EntryDesc
    --</MappingInfoStatus>
    )

    ,[Enrollment_State_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Enrollment_State_Cd">
    IsNull((
	select top (1) XrefCode
	  from dbo.CodeXRef 
	 where CodeCategory='Entry Code - Local to State' -- 
	   and LocalCode=[EntryCodes].EntryCodeValue
	),[EntryCodes].EntryCodeValue  -- Assumes if No Crosswalk from Local to State we will us local code.
	)
    --</MappingInfoStatus>
    )

    ,[Enrollment_State_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Enrollment_State_Desc">
    IsNull((
	select top (1) XrefValue
	  from dbo.CodeXRef 
	 where CodeCategory='Entry Code - Local to State' -- 
	   and LocalCode=[EntryCodes].EntryCodeValue
	),[EntryCodes].EntryDesc  -- Assumes if No Crosswalk from Local to State we will us local description.
	)
    --</MappingInfoStatus>
    )

    ,[Enrollment_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Enrollment_Sort_Order">
    [EntryCodes].SortOrder
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    coalesce([EntryCodes].SchoolYear,@ActiveSchoolYear)
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [EntryCodes].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    IsNull([EntryCodes].LastModifiedDate,getdate())
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select count(*)  -- select top (10) * 
  from (
	select EntryCodeValue=IsNull(d.CodeValue,'UNK'), 
		   EntryDesc=IsNull(d.[Description],'Unknown'),
		   LastModifiedDate=max(d.LastModifiedDate), 
		   sa.SchoolYear, sa.SAID, 
		   SortOrder=IsNull(max(d.DescriptorId),-1)
	  from [edfi].[StudentSchoolAssociation]  sa
	  left join [edfi].[Descriptor] d on d.DescriptorId=sa.EntryTypeDescriptorId
	 group by IsNull(d.CodeValue,'UNK'), IsNull(d.[Description],'Unknown'), sa.SchoolYear, sa.SAID
  ) [EntryCodes] 

 where (@Batch_Period_List='all' or IsNull([EntryCodes].SchoolYear,@ActiveSchoolYear) in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [EntryCodes].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Grade_Type_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Grade_Type_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Grade_Type_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Grade_Type"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Grade_Type_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Grade_Type_Cd">
    [GradeTypeDescriptor_lkp].CodeValue
    --</MappingInfoStatus>
    )

    ,[Grade_Type_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Grade_Type_Desc">
    [GradeTypeDescriptor_lkp].Description
    --</MappingInfoStatus>
    )

    ,[Grade_Type_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Grade_Type_Sort_Order">
    [GradeTypeDescriptor_lkp].DescriptorId-(select min(GradeTypeDescriptorId) from [edfi].[GradeTypeDescriptor])
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    @ActiveSchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [GradeTypeDescriptor_lkp].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [GradeTypeDescriptor_lkp].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[GradeTypeDescriptor]
  join [edfi].[Descriptor] [GradeTypeDescriptor_lkp] 
    on [GradeTypeDescriptor_lkp].DescriptorId=[edfi].[GradeTypeDescriptor].GradeTypeDescriptorId

 where (@Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [GradeTypeDescriptor_lkp].SAID in (select SAID from @SAIDtable)) 
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Marking_Period_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Marking_Period_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Marking_Period_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Marking_Period"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    IsNull([CalendarSession_lkp].CalendarCode,'')
     --</MappingInfoStatus>
    )

    ,[Calendar_Track_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Desc">
    IsNull((
	select top (1) d.Description
	  from [edfi].[Calendar] cal
	  join [edfi].[Descriptor] d on d.DescriptorId=cal.CalendarTypeDescriptorId
	 where cal.CalendarCode=[CalendarSession_lkp].CalendarCode
	   and cal.SchoolId=[CalendarSession_lkp].SchoolId
	   and cal.SchoolYear=[CalendarSession_lkp].SchoolYear
	),'')
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Sort_Order">
    IsNull((
	select top (1) cal.CalendarTypeDescriptorId-(select min(ct.CalendarTypeDescriptorId) from [edfi].[CalendarTypeDescriptor] ct)
	  from [edfi].[Calendar] cal
	 where cal.CalendarCode=[CalendarSession_lkp].CalendarCode
	   and cal.SchoolId=[CalendarSession_lkp].SchoolId
	   and cal.SchoolYear=[CalendarSession_lkp].SchoolYear
	),0)
    --</MappingInfoStatus>
    )

    ,[Summer_School_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Summer_School_Ind">
    case when exists(
	select *
	  from [edfi].[Calendar] cal
	  join [edfi].[Descriptor] d on d.DescriptorId=cal.CalendarTypeDescriptorId
	 where cal.CalendarCode=[CalendarSession_lkp].CalendarCode
	   and cal.SchoolId=[CalendarSession_lkp].SchoolId
	   and cal.SchoolYear=[CalendarSession_lkp].SchoolYear
	   and d.CodeValue in ('S','Summer')
	) then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Track_First_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Track_First_Instructional_Date">
    IsNull((
	select min(a.Date)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue in ('Instructional day','Membership day')
	   and a.SchoolId=[CalendarSession_lkp].SchoolId
	   and a.SchoolYear=[CalendarSession_lkp].SchoolYear
	   and a.CalendarCode=[CalendarSession_lkp].CalendarCode
	),'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Track_Last_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Track_Last_Instructional_Date">
    IsNull((
	select max(a.Date)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue in ('Instructional day','Membership day')
	   and a.SchoolId=[CalendarSession_lkp].SchoolId
	   and a.SchoolYear=[CalendarSession_lkp].SchoolYear
	   and a.CalendarCode=[CalendarSession_lkp].CalendarCode
	),'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Term_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Term_Cd">
    IsNull((
	select top (1) d.CodeValue
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[CalendarSession_lkp].TermDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Term_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Term_Desc">
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[CalendarSession_lkp].TermDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Term_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Term_Sort_Order">
    [CalendarSession_lkp].TermDescriptorId-(select min(TermDescriptorId) from [edfi].[TermDescriptor])
    --</MappingInfoStatus>
    )

    ,[Term_First_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Term_First_Instructional_Date">
    IsNull([CalendarSession_lkp].BeginDate,'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Term_Last_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Term_Last_Instructional_Date">
    IsNull([CalendarSession_lkp].EndDate,'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Marking_Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Marking_Period_Cd">
    IsNull((
	select top (1) d.CodeValue
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[GradingPeriod].GradingPeriodDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Marking_Period_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Marking_Period_Desc">
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[GradingPeriod].GradingPeriodDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Marking_Period_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Marking_Period_Sort_Order">
    [edfi].[GradingPeriod].GradingPeriodDescriptorId - (select min(GradingPeriodDescriptorId) from [edfi].[GradingPeriodDescriptor])
    --</MappingInfoStatus>
    )

    ,[Marking_Period_Begin_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Marking_Period_Begin_Date">
    IsNull([edfi].[GradingPeriod].BeginDate,'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Marking_Period_End_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Marking_Period_End_Date">
    IsNull([edfi].[GradingPeriod].EndDate,'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[GradingPeriod].SchoolId
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[GradingPeriod].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[GradingPeriod].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[GradingPeriod].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>  -- select count(*) -- select *
  from [edfi].[GradingPeriod]
  join [edfi].[Descriptor] [GradingPeriod_lkp] on [GradingPeriod_lkp].DescriptorId=[edfi].[GradingPeriod].GradingPeriodDescriptorId
  join (
		select distinct 
			   sec.SchoolId, sec.SchoolYear, sec.SessionName, ses.BeginDate, ses.EndDate, ses.TermDescriptorId,
			   CalendarCode=IsNull(sch.CalendarCode,(select top (1) CalendarCode from [edfi].[Calendar] cal
													  where cal.SchoolId=sec.SchoolId and cal.SchoolYear=sec.SchoolYear))
		  from [edfi].[StudentSectionAssociation] sec
		  join [edfi].[StudentSchoolAssociation] sch
			on sch.SchoolId=sec.SchoolId
		   and sch.StudentUSI=sec.StudentUSI
		  join [edfi].[Session] ses 
		    on ses.SchoolId=sec.SchoolId
		   and ses.SchoolYear=sec.SchoolYear
		   and ses.SessionName=sec.SessionName
	   ) [CalendarSession_lkp] 
    on [CalendarSession_lkp].SchoolId=[edfi].[GradingPeriod].SchoolId
   and [CalendarSession_lkp].SchoolYear=[edfi].[GradingPeriod].SchoolYear
   and [edfi].[GradingPeriod].BeginDate between [CalendarSession_lkp].BeginDate and [CalendarSession_lkp].EndDate

 where (@Batch_Period_List='all' or [edfi].[GradingPeriod].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[GradingPeriod].SAID in (select SAID from @SAIDtable)) 
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Period_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Period_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Period_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Period"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Period_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Period_School_Id">
    [edfi].[ClassPeriod].SchoolId
    --</MappingInfoStatus>
    )

    ,[Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Period_Cd">
    [edfi].[ClassPeriod].ClassPeriodName
    --</MappingInfoStatus>
    )

    ,[Period_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Period_Desc">
    [edfi].[ClassPeriod].ClassPeriodName
    --</MappingInfoStatus>
    )

    ,[Period_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Period_Sort_Order">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Period_Start_Time]=convert(Time(7),
    --<MappingInfoStatus Status="C" Column="Period_Start_Time">
    IsNull([edfi].[ClassPeriodMeetingTime].StartTime,'12:00:00')
    --</MappingInfoStatus>
    )

    ,[Period_End_Time]=convert(Time(7),
    --<MappingInfoStatus Status="C" Column="Period_End_Time">
    IsNull([edfi].[ClassPeriodMeetingTime].EndTime,'12:00:00')
    --</MappingInfoStatus>
    )

    ,[Period_Noninstructional_Minutes]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Period_Noninstructional_Minutes">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    @ActiveSchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[ClassPeriod].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[ClassPeriod].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select *
  from [edfi].[ClassPeriod]
  left outer
  join [edfi].[ClassPeriodMeetingTime] 
    on [edfi].[ClassPeriodMeetingTime].ClassPeriodName=[edfi].[ClassPeriod].ClassPeriodName
   and [edfi].[ClassPeriodMeetingTime].SchoolId=[edfi].[ClassPeriod].SchoolId

  where (@Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable))
    and (IsNull(@SAID,'all') in ('all','any') or [edfi].[ClassPeriod].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Program_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Program_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Program_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Program"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Program_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Program_Cd">
    [edfi].[Program].ProgramId
    --</MappingInfoStatus>
    )

    ,[Program_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Program_Desc">
    [edfi].[Program].ProgramName
    --</MappingInfoStatus>
    )

    ,[Program_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Program_Sort_Order">
    [edfi].[Program].ProgramTypeDescriptorId - (select min(ProgramTypeDescriptorId) from [edfi].[ProgramTypeDescriptor])
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    @ActiveSchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[Program].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[Program].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[Program]

 where (@Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[Program].SAID in (select SAID from @SAIDtable)) 
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_School_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_School_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_School_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_School"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[School_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Name">
    IsNull((
	select top (1) eo.NameOfInstitution 
	  from [edfi].EducationOrganization eo 
	 where eo.EducationOrganizationId=[edfi].[School].SchoolId
	 ),'')
    --</MappingInfoStatus>
    )

    ,[School_Grade_Cd_Low]=convert(VarChar(5),
    --<MappingInfoStatus Status="C" Column="School_Grade_Cd_Low">
	IsNull((
	select top (1) coalesce(x.XrefCode,d.CodeValue)
	  from [edfi].[SchoolGradeLevel] sgl
	  join [edfi].[Descriptor] d 
		on d.[DescriptorId]=sgl.GradeLevelDescriptorId
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where sgl.SchoolId=[edfi].[School].SchoolId
	 order by IsNull(x.XrefSortOrder,d.DescriptorId)
	 ),'')
	--</MappingInfoStatus>
    )

    ,[School_Grade_Cd_High]=convert(VarChar(5),
    --<MappingInfoStatus Status="C" Column="School_Grade_Cd_High">
	IsNull((
	select top (1) coalesce(x.XrefCode,d.CodeValue)
	  from [edfi].[SchoolGradeLevel] sgl
	  join [edfi].[Descriptor] d 
		on d.[DescriptorId]=sgl.GradeLevelDescriptorId
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where sgl.SchoolId=[edfi].[School].SchoolId
	 order by IsNull(x.XrefSortOrder,d.DescriptorId) desc
	 ),'')
    --</MappingInfoStatus>
    )

    ,[School_Principal_Name]=convert(VarChar(24),
    --<MappingInfoStatus Status="C" Column="School_Principal_Name">
	IsNull((
	select top (1) s.LastSurname + ', '+s.FirstName
	  from [edfi].[StaffEducationOrganizationAssignmentAssociation] a
	  join [edfi].[Staff] s on s.StaffUSI=a.StaffUSI
	  join edfi.descriptor d 
		on d.descriptorid=a.StaffClassificationDescriptorId and d.CodeValue='Principal'
	  where a.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Level_Cd]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Level_Cd">
	IsNull((
	select top (1) scd.CodeValue
	  from [edfi].[SchoolCategory] sc
	  join [edfi].Descriptor scd on scd.DescriptorId=sc.SchoolCategoryDescriptorId
	  where sc.SchoolId=[edfi].[School].SchoolId
	),'unk')
    --</MappingInfoStatus>
    )

    ,[School_Level_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Level_Name">
	IsNull((
	select top (1) scd.ShortDescription
	  from [edfi].[SchoolCategory] sc
	  join [edfi].Descriptor scd on scd.DescriptorId=sc.SchoolCategoryDescriptorId
	  where sc.SchoolId=[edfi].[School].SchoolId
	),'unknown')
    --</MappingInfoStatus>
    )

    ,[School_Level_Desc]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Level_Desc">
	IsNull((
	select top (1) scd.Description
	  from [edfi].[SchoolCategory] sc
	  join [edfi].Descriptor scd on scd.DescriptorId=sc.SchoolCategoryDescriptorId
	  where sc.SchoolId=[edfi].[School].SchoolId
	),'unknown')
     --</MappingInfoStatus>
    )

    ,[NCES_School_Type_Cd]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="NCES_School_Type_Cd">
    IsNull((
	select top (1) XrefCode
	  from dbo.CodeXRef x
	 where CodeCategory='School Type Codes - Local to NCES' -- 
	   and LocalCode=(select top (1) d.CodeValue
					    from [edfi].[Descriptor] d
					   where d.DescriptorId=[edfi].[School].SchoolTypeDescriptorId)
	),'')
    --</MappingInfoStatus>
    )

    ,[NCES_School_Type_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="NCES_School_Type_Name">
    IsNull((
	select top (1) XrefValue
	  from dbo.CodeXRef x
	 where CodeCategory='School Type Codes - Local to NCES' -- 
	   and LocalCode=(select top (1) d.CodeValue
					    from [edfi].[Descriptor] d
					   where d.DescriptorId=[edfi].[School].SchoolTypeDescriptorId)
	),'')
    --</MappingInfoStatus>
    )

    ,[NCES_School_Type_Desc]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="NCES_School_Type_Desc">
    IsNull((
	select top (1) XrefValue
	  from dbo.CodeXRef x
	 where CodeCategory='School Type Codes - Local to NCES' -- 
	   and LocalCode=(select top (1) d.CodeValue
					    from [edfi].[Descriptor] d
					   where d.DescriptorId=[edfi].[School].SchoolTypeDescriptorId)
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Type_Cd]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Type_Cd">
    IsNull((
	select top (1) d.CodeValue
	  from [edfi].[Descriptor] d
	 where d.DescriptorId=[edfi].[School].SchoolTypeDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Type_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Type_Name">
    IsNull((
	select top (1) d.ShortDescription
	  from [edfi].[Descriptor] d
	 where d.DescriptorId=[edfi].[School].SchoolTypeDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Type_Desc]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Type_Desc">
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d
	 where d.DescriptorId=[edfi].[School].SchoolTypeDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_State_Cd]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_State_Cd">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[EducationOrganizationIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.EducationOrganizationIdentificationSystemDescriptorId
	 where ic.EducationOrganizationId=[edfi].[School].SchoolId
	   and d.CodeValue='SEA'
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Local_Cd]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Local_Cd">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[EducationOrganizationIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.EducationOrganizationIdentificationSystemDescriptorId
	 where ic.EducationOrganizationId=[edfi].[School].SchoolId
	   and d.CodeValue='LEA'
	),'')
    --</MappingInfoStatus>
    )

    ,[School_NCES_Cd]=convert(Char(5),
    --<MappingInfoStatus Status="C" Column="School_NCES_Cd">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[EducationOrganizationIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.EducationOrganizationIdentificationSystemDescriptorId
	 where ic.EducationOrganizationId=[edfi].[School].SchoolId
	   and d.CodeValue='NCES'
	),'')
    --</MappingInfoStatus>
    )

    ,[School_NCES_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="I" Column="School_NCES_Name">
    '' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Sat_School_Cd]=convert(Char(6),
    --<MappingInfoStatus Status="C" Column="School_Sat_School_Cd">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[EducationOrganizationIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.EducationOrganizationIdentificationSystemDescriptorId
	 where ic.EducationOrganizationId=[edfi].[School].SchoolId
	   and d.CodeValue='SAT'
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Unique_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="I" Column="School_Unique_Id">
    '' -- Installation/Client specific mapping
    --</MappingInfoStatus>
    )

    ,[School_Short_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Short_Name">
	IsNull((
	select top (1) eo.ShortNameOfInstitution
	  from [edfi].[EducationOrganization] eo 
	 where eo.EducationOrganizationId=[edfi].[School].SchoolId
	 ),'')
    --</MappingInfoStatus>
    )

    ,[School_Academic_Year_Began]=convert(VarChar(9),
    --<MappingInfoStatus Status="I" Column="School_Academic_Year_Began">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Academic_Year_Ended]=convert(VarChar(9),
    --<MappingInfoStatus Status="I" Column="School_Academic_Year_Ended">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Is_Closed_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="I" Column="School_Is_Closed_Ind">
    '-' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Principal_Email]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Principal_Email">
	IsNull((
	select top (1) email.ElectronicMailAddress
	  from [edfi].[StaffEducationOrganizationAssignmentAssociation] a
	  join [edfi].[Staff] s on s.StaffUSI=a.StaffUSI
	  join edfi.descriptor d 
		on d.descriptorid=a.StaffClassificationDescriptorId and d.CodeValue='Principal'
	  join [edfi].[StaffElectronicMail] email on email.StaffUSI=s.StaffUSI
	  where a.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Phone]=convert(VarChar(24),
    --<MappingInfoStatus Status="C" Column="School_Phone">
	IsNull((
	select top (1) t.TelephoneNumber
	  from [edfi].[EducationOrganizationInstitutionTelephone] t
	  join [edfi].[Descriptor] d on d.DescriptorId=t.InstitutionTelephoneNumberTypeDescriptorId and d.CodeValue='Main'
	 where t.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Address_1]=convert(VarChar(36),
    --<MappingInfoStatus Status="C" Column="School_Address_1">
    IsNull((
	select top (1) addr.StreetNumberName
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Address_2]=convert(VarChar(36),
    --<MappingInfoStatus Status="C" Column="School_Address_2">
    IsNull((
	select top (1) addr.ApartmentRoomSuiteNumber
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_City]=convert(VarChar(24),
    --<MappingInfoStatus Status="C" Column="School_City">
    IsNull((
	select top (1) addr.City
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_State]=convert(VarChar(2),
    --<MappingInfoStatus Status="C" Column="School_State">
    IsNull((
	select top (1) st_d.CodeValue
	  from [edfi].[EducationOrganizationAddress] addr
	  join [edfi].[Descriptor] st_d on st_d.DescriptorId=addr.StateAbbreviationDescriptorId
	 where addr.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Postal_Cd]=convert(VarChar(10),
    --<MappingInfoStatus Status="C" Column="School_Postal_Cd">
    IsNull((
	select top (1) addr.PostalCode
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
     --</MappingInfoStatus>
    )

    ,[School_Latitude]=convert(Decimal(9,6),
    --<MappingInfoStatus Status="C" Column="School_Latitude">
    IsNull((
	select top (1) addr.Latitude
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[School].SchoolId
	),0.0)
    --</MappingInfoStatus>
    )

    ,[School_Longitude]=convert(Decimal(9,6),
    --<MappingInfoStatus Status="C" Column="School_Longitude">
    IsNull((
	select top (1) addr.Longitude
	  from [edfi].[EducationOrganizationAddress] addr
	 where addr.EducationOrganizationId=[edfi].[School].SchoolId
	),0.0)
    --</MappingInfoStatus>
    )

    ,[School_Url]=convert(VarChar(100),
    --<MappingInfoStatus Status="C" Column="School_Url">
    IsNull((
	select top (1) WebSite
	  from [edfi].[EducationOrganization] eo
	 where eo.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Title1_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="School_Title1_Ind">
	case when exists (
		select *          
		from [edfi].[Descriptor] d
	   where d.DescriptorId=[edfi].[School].TitleIPartASchoolDesignationDescriptorId
	     and d.CodeValue not in ('Not A Title I School','Missing'))
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[School_Title1_Cd]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Title1_Cd">
    IsNull((
	select top (1) d.CodeValue          
	  from [edfi].[Descriptor] d
	 where d.DescriptorId=[edfi].[School].TitleIPartASchoolDesignationDescriptorId
	   and d.CodeValue not in ('Not A Title I School','Missing')
	 order by d.DescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Title1_Desc]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="School_Title1_Desc">
    IsNull((
	select top (1) d.Description          
	  from [edfi].[Descriptor] d
	 where d.DescriptorId=[edfi].[School].TitleIPartASchoolDesignationDescriptorId
	   and d.CodeValue not in ('Not A Title I School','Missing')
	 order by d.DescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Magnet_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="School_Magnet_Ind">
	case when exists (
		select *          
		from [edfi].[Descriptor] d
	   where d.DescriptorId=[edfi].[School].MagnetSpecialProgramEmphasisSchoolDescriptorId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[School_Charter_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="School_Charter_Ind">
	case when exists (
		select *          
		from [edfi].[Descriptor] d
	   where d.DescriptorId=[edfi].[School].TitleIPartASchoolDesignationDescriptorId
	     and d.CodeValue = 'Charter School' )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[School_Accountability_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="I" Column="School_Accountability_Ind">
    '-' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_NCES_Phone]=convert(VarChar(24),
    --<MappingInfoStatus Status="C" Column="School_NCES_Phone">
	IsNull((
	select top (1) t.TelephoneNumber
	  from [edfi].[EducationOrganizationInstitutionTelephone] t
	  join [edfi].[Descriptor] d on d.DescriptorId=t.InstitutionTelephoneNumberTypeDescriptorId and d.CodeValue='Main'
	 where t.EducationOrganizationId=[edfi].[School].SchoolId
	),'')
    --</MappingInfoStatus>
    )

    ,[School_NCES_Grade_Span]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_NCES_Grade_Span">
	IsNull((
	select top (1) coalesce(x.XrefCode,d.CodeValue)
	  from [edfi].[SchoolGradeLevel] sgl
	  join [edfi].[Descriptor] d 
		on d.[DescriptorId]=sgl.GradeLevelDescriptorId
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where sgl.SchoolId=[edfi].[School].SchoolId
	 order by IsNull(x.XrefSortOrder,d.DescriptorId)
	 ),'')
			+' - '+
	IsNull((
	select top (1) coalesce(x.XrefCode,d.CodeValue)
	  from [edfi].[SchoolGradeLevel] sgl
	  join [edfi].[Descriptor] d 
		on d.[DescriptorId]=sgl.GradeLevelDescriptorId
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where sgl.SchoolId=[edfi].[School].SchoolId
	 order by IsNull(x.XrefSortOrder,d.DescriptorId) desc
	 ),'')
    --</MappingInfoStatus>
    )

    ,[School_NCES_Operational_Status]=convert(VarChar(60),
    --<MappingInfoStatus Status="I" Column="School_NCES_Operational_Status">
    '--' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Special_Assistance_Status]=convert(VarChar(60),
    --<MappingInfoStatus Status="I" Column="School_Special_Assistance_Status">
    '-' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Cpr_Aed_Instruction_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="I" Column="School_Cpr_Aed_Instruction_Ind">
    '-' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Online_School_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="I" Column="School_Online_School_Ind">
    '-' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_Course_Catalog_Master_List_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="I" Column="School_Course_Catalog_Master_List_Name">
    '-' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[School_State_Reported_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="I" Column="School_State_Reported_Ind">
    '-' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    @ActiveSchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[School].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    getdate()
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[School]
 where (@Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[School].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Staff_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Staff_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Staff_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Staff"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Local_Staff_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Staff_Id">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StaffIdentificationCode] ic
	  join [edfi].[Descriptor] d 
	    on d.DescriptorId=ic.StaffIdentificationSystemDescriptorId
	 where d.CodeValue in ('District','School')
	   and ic.StaffUSI=[edfi].[Staff].StaffUSI
	   and ic.AssigningOrganizationIdentificationCode=[edfi].[StaffSchoolAssociation].SchoolId
	 order by case when d.CodeValue='District' then 1 else 2 end
	),'')
    --</MappingInfoStatus>
    )

    ,[Staff_Unique_Id]=convert(VarChar(32),
    --<MappingInfoStatus Status="C" Column="Staff_Unique_Id">
    [edfi].[Staff].StaffUniqueId
    --</MappingInfoStatus>
    )

    ,[Staff_State_Id_Nbr]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_State_Id_Nbr">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StaffIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StaffIdentificationSystemDescriptorId
	 where d.CodeValue='State'
	),'')
    --</MappingInfoStatus>
    )

    ,[Staff_SSN]=convert(VarChar(11),
    --<MappingInfoStatus Status="C" Column="Staff_SSN">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StaffIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StaffIdentificationSystemDescriptorId
	 where d.CodeValue='SSN'
	),'')
    --</MappingInfoStatus>
    )

    ,[Staff_First_Name]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_First_Name">
    [edfi].[Staff].FirstName
    --</MappingInfoStatus>
    )

    ,[Staff_Middle_Name]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_Middle_Name">
    IsNull([edfi].[Staff].MiddleName,'')
    --</MappingInfoStatus>
    )

    ,[Staff_Last_Name]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_Last_Name">
    [edfi].[Staff].LastSurname
    --</MappingInfoStatus>
    )

    ,[Staff_Name_Suffix]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_Name_Suffix">
    IsNull([edfi].[Staff].GenerationCodeSuffix,'')
    --</MappingInfoStatus>
    )

    ,[Staff_Full_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Staff_Full_Name">
    IsNull([edfi].[Staff].FirstName+' ','') + 
	IsNull([edfi].[Staff].MiddleName+' ','') + 
	IsNull([edfi].[Staff].LastSurname,'') + 
	IsNull(' '+[edfi].[Staff].GenerationCodeSuffix,'')
    --</MappingInfoStatus>
    )

    ,[Staff_Preferred_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Staff_Preferred_Name">
    IsNull((select FirstName 
			  from [edfi].[StudentOtherName] x 
			  join [edFi].[Descriptor] d on d.DescriptorId=x.OtherNameTypeDescriptorId 
			 where x.StudentUSI=[edfi].[Staff].StaffUSI and d.CodeValue='Nickname'),'')
    --</MappingInfoStatus>
    )

    ,[Staff_Sort_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Staff_Sort_Name">
	IsNull([edfi].[Staff].LastSurname,'') + 
	IsNull(' '+[edfi].[Staff].GenerationCodeSuffix,'')+','+
    IsNull(' '+[edfi].[Staff].FirstName,'') + 
	IsNull(' '+[edfi].[Staff].MiddleName,'')
    --</MappingInfoStatus>
    )

    ,[Staff_Birth_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Staff_Birth_Date">
    [edfi].[Staff].BirthDate
    --</MappingInfoStatus>
    )

    ,[Staff_Gender_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_Gender_Cd">
    IsNull((
	select top (1) d.[CodeValue]
      from [edFi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Staff].SexDescriptorId 
	),'--')
    --</MappingInfoStatus>
    )

    ,[Staff_Gender_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Staff_Gender_Desc">
    IsNull((
	select top (1) d.[Description]
      from [edFi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Staff].SexDescriptorId 
	),'--')
    --</MappingInfoStatus>
    )

    ,[Staff_Gender_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Staff_Gender_Sort_Order">
    IsNull((
	select top (1) coalesce(x.XrefSortOrder,d.DescriptorId-(select min(SexDescriptorId) from [edfi].[SexDescriptor]))
      from [edFi].[Descriptor] d 
	  left outer
	  join CodeXref x on x.CodeCategory='Gender - Local to State' and x.LocalCode=d.CodeValue
	 where d.DescriptorId=[edfi].[Staff].SexDescriptorId 
	),0)
    --</MappingInfoStatus>
    )

    ,[Staff_Primary_Ethnicity_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_Primary_Ethnicity_Cd">
    IsNull((select top (1) d.[CodeValue]
                   from [edfi].[StudentEducationOrganizationAssociationRace] x 
                   join [edfi].[Descriptor] d on d.DescriptorId=x.RaceDescriptorId
                  where x.StudentUSI=[edfi].[Staff].StaffUSI),'--')
    --</MappingInfoStatus>
    )

    ,[Staff_Type_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Staff_Type_Cd">
    IsNull((
	select top (1) d.[CodeValue]
      from [edfi].[StaffEducationOrganizationAssignmentAssociation] x
	  join [edFi].[Descriptor] d on d.DescriptorId=x.StaffClassificationDescriptorId
	 where x.StaffUSI=[edfi].[Staff].StaffUSI
	   and x.EducationOrganizationId=[edfi].[StaffSchoolAssociation].SchoolId
	 order by x.OrderOfAssignment
	),'--')
    --</MappingInfoStatus>
    )

    ,[Staff_Type_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Staff_Type_Desc">
    IsNull((
	select top (1) d.[Description]
      from [edfi].[StaffEducationOrganizationAssignmentAssociation] x
	  join [edFi].[Descriptor] d on d.DescriptorId=x.StaffClassificationDescriptorId
	 where x.StaffUSI=[edfi].[Staff].StaffUSI
	   and x.EducationOrganizationId=[edfi].[StaffSchoolAssociation].SchoolId
	 order by x.OrderOfAssignment
	),'--')
    --</MappingInfoStatus>
    )

    ,[Staff_Type_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Staff_Type_Sort_Order">
    IsNull((
	select top (1) coalesce(x.XrefSortOrder,d.DescriptorId-(select min(StaffClassificationDescriptorId) from [edfi].[StaffClassificationDescriptor]))
      from [edfi].[StaffEducationOrganizationAssignmentAssociation] a
	  join [edFi].[Descriptor] d on d.DescriptorId=a.StaffClassificationDescriptorId
	  left outer
	  join CodeXref x on x.CodeCategory='StaffType - Local to State' and x.LocalCode=d.CodeValue
	 where a.StaffUSI=[edfi].[Staff].StaffUSI
	   and a.EducationOrganizationId=[edfi].[StaffSchoolAssociation].SchoolId
	 order by a.OrderOfAssignment
	),0)
    --</MappingInfoStatus>
    )

    ,[Hire_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Hire_Date">
    IsNull((
	select top (1) x.EmploymentHireDate
      from [edfi].[StaffEducationOrganizationAssignmentAssociation] x
	 where x.StaffUSI=[edfi].[Staff].StaffUSI
	   and x.EducationOrganizationId=[edfi].[StaffSchoolAssociation].SchoolId
	 order by x.OrderOfAssignment
	),'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Total_Salary_Amt]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="H" Column="Total_Salary_Amt">
    0.0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Instruction_Salary_Amt]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="H" Column="Instruction_Salary_Amt">
    0.0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Total_Contract_Hours]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="H" Column="Total_Contract_Hours">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[StaffSchoolAssociation].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[StaffSchoolAssociation].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="c" Column="Date_Stamp">
    [edfi].[StaffSchoolAssociation].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[StaffSchoolAssociation]
  join [edfi].[Staff] on [edfi].[Staff].StaffUSI=[edfi].[StaffSchoolAssociation].StaffUSI

 where (@Batch_Period_List='all' or [edfi].[StaffSchoolAssociation].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StaffSchoolAssociation].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Student_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Student_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Student_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Student"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear smallint = (select top (1) SchoolYear from [edfi].[SchoolYearType] where CurrentSchoolYear=1)
declare @CalendarFirstLastDay table (SchoolYear smallint, SchoolId int, CalendarCode nvarchar(50), FirstDay date, LastDay date, primary key(SchoolYear, SchoolId, CalendarCode))
insert into @CalendarFirstLastDay (SchoolYear, SchoolId, CalendarCode, FirstDay, LastDay)
select ce.SchoolYear, ce.SchoolId, ce.CalendarCode, FirstDay=min(ce.Date), LastDay=max(ce.Date)
  from edfi.CalendarDateCalendarEvent ce
  join edfi.Descriptor d on d.DescriptorId=ce.CalendarEventDescriptorId
 where d.[Description]='Membership Day'
 group by ce.CalendarCode, ce.SchoolId, ce.SchoolYear
--</MappingInfoCommon>

select
     [Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="LOCAL_STUDENT_ID">
    IsNull((
	select top (1) ic.IdentificationCode -- select *
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[Student].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Student_Unique_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Unique_Id">
    ltrim(rtrim([edfi].[Student].StudentUniqueId))
    --</MappingInfoStatus>
    )

    ,[Student_State_Id_Nbr]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_State_Id_Nbr">
    IsNull((
	select top(1) ic.IdentificationCode -- select *
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='State'
	),'')
    --</MappingInfoStatus>
    )

    ,[Student_Current_Enrolled_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_Enrolled_Ind">
    case 
	when [StudentSchoolAssociation_MostRecent].ExitWithdrawDate is null 
	  or [StudentSchoolAssociation_MostRecent].ExitWithdrawDate >= (
				select top 1 LastDay from @CalendarFirstLastDay ld 
				 where ld.SchoolYear=[StudentSchoolAssociation_MostRecent].SchoolYear
				   and ld.SchoolId=[StudentSchoolAssociation_MostRecent].SchoolId
				   and ld.CalendarCode=[StudentSchoolAssociation_MostRecent].CalendarCode)
	then 'Y' 
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_First_Name]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_First_Name">
    [edfi].[Student].FirstName
    --</MappingInfoStatus>
    )

    ,[Student_Middle_Name]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Middle_Name">
    IsNull([edfi].[Student].MiddleName,'')
    --</MappingInfoStatus>
    )

    ,[Student_Last_Name]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Last_Name">
    [edfi].[Student].LastSurname
    --</MappingInfoStatus>
    )

    ,[Student_Name_Suffix]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Name_Suffix">
    IsNull([edfi].[Student].GenerationCodeSuffix,'')
    --</MappingInfoStatus>
    )

    ,[Student_Full_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Full_Name">
    IsNull([edfi].[Student].FirstName+' ','') + 
	IsNull([edfi].[Student].MiddleName+' ','') + 
	IsNull([edfi].[Student].LastSurname,'') + 
	IsNull(' '+[edfi].[Student].GenerationCodeSuffix,'')
    --</MappingInfoStatus>
    )

    ,[Student_Preferred_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Preferred_Name">
    IsNull((select FirstName 
			  from [edfi].[StudentOtherName] x 
			  join [edFi].[Descriptor] d on d.DescriptorId=x.OtherNameTypeDescriptorId 
			 where x.StudentUSI=[edfi].[Student].StudentUSI and d.CodeValue='Nickname'),'')
    --</MappingInfoStatus>
    )

    ,[Student_Sort_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Sort_Name">
	IsNull([edfi].[Student].LastSurname,'') + 
	IsNull(' '+[edfi].[Student].GenerationCodeSuffix,'')+','+
    IsNull(' '+[edfi].[Student].FirstName,'') + 
	IsNull(' '+[edfi].[Student].MiddleName,'')
    --</MappingInfoStatus>
    )

    ,[Student_SSN]=convert(VarChar(11),
    --<MappingInfoStatus Status="C" Column="Student_SSN">
    IsNull((
	select top (1) IdentificationCode
      from edfi.[StudentEducationOrganizationAssociationStudentIdentificationCode] x 
      join edFi.Descriptor d on d.DescriptorId=x.StudentIdentificationSystemDescriptorId 
     where x.StudentUSI=[edfi].[Student].StudentUSI and d.CodeValue='SSN'
	),'--') 
    --</MappingInfoStatus>
    )

    ,[Student_Birth_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Student_Birth_Date">
    IsNull([edfi].[Student].BirthDate,'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Student_Birth_Year_Month]=convert(Char(7),
    --<MappingInfoStatus Status="C" Column="Student_Birth_Year_Month">
    convert(char(4),datepart(year,IsNull([edfi].[Student].BirthDate,'1753-01-01')))
	+'-'
	+right('00'+convert(varchar,datepart(month,IsNull([edfi].[Student].BirthDate,'1753-01-01'))),2)
    --</MappingInfoStatus>
    )

    ,[Student_Birth_Year]=convert(Char(4),
    --<MappingInfoStatus Status="C" Column="Student_Birth_Year">
    datepart(year,IsNull([edfi].[Student].BirthDate,'1753-01-01'))
    --</MappingInfoStatus>
    )

    ,[Student_Birth_Country_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Birth_Country_Cd">
    IsNull((
	select top (1) d.[CodeValue]
      from edFi.Descriptor d 
	 where d.DescriptorId=[edfi].[Student].BirthCountryDescriptorId
	),'--')
    --</MappingInfoStatus>
    )

    ,[Student_Birth_Country_Name]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Birth_Country_Name">
    IsNull((
	select top (1) d.[Description]
      from edFi.Descriptor d 
	 where d.DescriptorId=[edfi].[Student].BirthCountryDescriptorId
	),'--')
    --</MappingInfoStatus>
    )

    ,[Student_Gender_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Gender_Cd">
    IsNull((
	select top (1) d.CodeValue
      from [edFi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[StudentEducationOrganizationAssociation].SexDescriptorId 
	),'--')
    --</MappingInfoStatus>
    )

    ,[Student_Gender_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Gender_Desc">
    IsNull((
	select top (1) d.[Description]
      from [edFi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[StudentEducationOrganizationAssociation].SexDescriptorId 
	),'--')
    --</MappingInfoStatus>
    )

    ,[Student_Gender_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Student_Gender_Sort_Order">
    IsNull((
	select top (1) coalesce(x.XrefSortOrder,d.DescriptorId-(select min(SexDescriptorId) from [edfi].[SexDescriptor]))
      from [edFi].[Descriptor] d 
	  left outer
	  join CodeXref x on x.CodeCategory='Gender - Local to State' and x.LocalCode=d.CodeValue
	 where d.DescriptorId=[edfi].[StudentEducationOrganizationAssociation].SexDescriptorId 
	),0)
    --</MappingInfoStatus>
    )

    ,[American_Indian_Or_Alaska_Native_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="American_Indian_Or_Alaska_Native_Ind">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociationRace] x 
		  join edFi.Descriptor d on d.DescriptorId=x.RaceDescriptorId and d.Namespace='uri://ed-fi.org/RaceDescriptor'
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
		   and d.CodeValue='American Indian - Alaska Native' )
		 then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Asian_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Asian_Ind">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociationRace] x 
		  join edFi.Descriptor d on d.DescriptorId=x.RaceDescriptorId and d.Namespace='uri://ed-fi.org/RaceDescriptor'
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
		   and d.CodeValue='Asian' )
		 then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Black_Or_African_American_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Black_Or_African_American_Ind">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociationRace] x 
		  join edFi.Descriptor d on d.DescriptorId=x.RaceDescriptorId and d.Namespace='uri://ed-fi.org/RaceDescriptor'
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
		   and d.CodeValue='Black - African American' )
		 then 'Y'
	else 'N' end
     --</MappingInfoStatus>
    )

    ,[Native_Hawaiian_Or_Other_Pacific_Islander_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Native_Hawaiian_Or_Other_Pacific_Islander_Ind">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociationRace] x 
		  join edFi.Descriptor d on d.DescriptorId=x.RaceDescriptorId and d.Namespace='uri://ed-fi.org/RaceDescriptor'
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
		   and d.CodeValue='Native Hawaiian - Pacific Islander' )
		 then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[White_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="White_Ind">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociationRace] x 
		  join edFi.Descriptor d on d.DescriptorId=x.RaceDescriptorId and d.Namespace='uri://ed-fi.org/RaceDescriptor'
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
		   and d.CodeValue='White' )
		 then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Hispanic_Latino_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Hispanic_Latino_Ind">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociation] x 
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
		   and x.HispanicLatinoEthnicity=1 )
		 then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Hispanic_Latino_Desc]=convert(VarChar(64),
    --<MappingInfoStatus Status="C" Column="Hispanic_Latino_Desc">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociation] x 
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
		   and x.HispanicLatinoEthnicity=1 )
		 then 'Hispanic/Latino'
	else 'Not Hispanic/Latino' end
    --</MappingInfoStatus>
    )

    ,[Race_Desc]=convert(VarChar(132),
    --<MappingInfoStatus Status="C" Column="RACE_DESC">
    IsNull((select top (1) d.[Description]
                   from [edfi].[StudentEducationOrganizationAssociationRace] x 
                   join [edfi].[Descriptor] d on d.DescriptorId=x.RaceDescriptorId
                  where x.StudentUSI=edfi.student.StudentUSI),'--')
    --</MappingInfoStatus>
    )

    ,[Federal_Race_Ethnicity_Desc]=convert(VarChar(255),
    --<MappingInfoStatus Status="I" Column="Federal_Race_Ethnicity_Desc">
    '--'  -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Number_Of_Races_Reported]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Number_Of_Races_Reported">
    IsNull((
	select count(*)
	  from edfi.[StudentEducationOrganizationAssociationRace] x 
	  join edFi.Descriptor d on d.DescriptorId=x.RaceDescriptorId and d.Namespace='uri://ed-fi.org/RaceDescriptor'
	 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
	   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
	),0)
    --</MappingInfoStatus>
    )

    ,[Student_Immigrant_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Immigrant_Ind">
	case when exists (
		select *
		  from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.StudentCharacteristicDescriptorId and d.CodeValue='Immigrant'
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Migrant_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Migrant_Ind">
	case when exists (
		select *
		  from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.StudentCharacteristicDescriptorId and d.CodeValue='Migrant'
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Refugee_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Refugee_Ind">
	case when exists (
		select *
		  from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.StudentCharacteristicDescriptorId and d.CodeValue='Refugee'
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Current_LEP_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_LEP_Ind">
	case 
	when exists (
		select *
		  from edfi.[StudentEducationOrganizationAssociation] x 
		  join [edfi].[Descriptor] d on d.DescriptorId=x.LimitedEnglishProficiencyDescriptorId
		   and d.CodeValue not in ('NotLimited')
		 where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI 
		   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
		 then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Current_Grade_Level_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Current_Grade_Level_Cd">
    IsNull((
	select top (1) CodeValue from [edfi].[Descriptor] d where d.DescriptorId=[StudentSchoolAssociation_MostRecent].EntryGradeLevelDescriptorId
	),'--') 
    --</MappingInfoStatus>
    )

    ,[Student_Current_Grade_Level_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Current_Grade_Level_Desc">
    IsNull((
	select top (1) Description from [edfi].[Descriptor] d where d.DescriptorId=[StudentSchoolAssociation_MostRecent].EntryGradeLevelDescriptorId
	),'--') 
    --</MappingInfoStatus>
    )

    ,[Student_Current_Grade_Level_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Student_Current_Grade_Level_Sort_Order">
    IsNull((
	select top (1) coalesce(x.LocalSortOrder,d.DescriptorId) 
	  from [edfi].[Descriptor] d 
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where d.DescriptorId=[StudentSchoolAssociation_MostRecent].EntryGradeLevelDescriptorId
	),0) 
    --</MappingInfoStatus>
    )

    ,[Student_Current_State_Grade_Level_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Current_State_Grade_Level_Cd">
    IsNull((
	select top (1) x.XrefCode 
	  from [edfi].[Descriptor] d 
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where d.DescriptorId=[StudentSchoolAssociation_MostRecent].EntryGradeLevelDescriptorId
	),'') 
    --</MappingInfoStatus>
    )

    ,[Student_Current_State_Grade_Level_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Current_State_Grade_Level_Desc">
    IsNull((
	select top (1) x.XrefValue
	  from [edfi].[Descriptor] d 
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where d.DescriptorId=[StudentSchoolAssociation_MostRecent].EntryGradeLevelDescriptorId
	),'') 
    --</MappingInfoStatus>
    )

    ,[Student_Current_State_Grade_Level_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Student_Current_State_Grade_Level_Sort_Order">
    IsNull((
	select top (1) x.XrefSortOrder 
	  from [edfi].[Descriptor] d 
	  left outer
	  join CodeXref x on x.CodeCategory='Grade Level - Local to State' and x.LocalCode=d.CodeValue
	 where d.DescriptorId=[StudentSchoolAssociation_MostRecent].EntryGradeLevelDescriptorId
	),'') 
    --</MappingInfoStatus>
    )

    ,[Student_Current_Economically_Disadvantaged_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_Economically_Disadvantaged_Ind">
	case when exists (
		select *
		  from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.StudentCharacteristicDescriptorId and d.CodeValue='Economic Disadvantaged'
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Current_Free_Reduced_Meal_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Current_Free_Reduced_Meal_Cd">
	IsNull((
		select top (1) d.CodeValue
		  from [edfi].[StudentSchoolFoodServiceProgramAssociation] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.ProgramTypeDescriptorId 
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
	),'')
    --</MappingInfoStatus>
    )

    ,[Student_Current_Free_Reduced_Meal_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Student_Current_Free_Reduced_Meal_Desc">
	IsNull((
		select top (1) d.Description
		  from [edfi].[StudentSchoolFoodServiceProgramAssociation] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.ProgramTypeDescriptorId 
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
	),'')
    --</MappingInfoStatus>
    )

    ,[Student_Current_Free_Reduced_Meal_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Student_Current_Free_Reduced_Meal_Sort_Order">
	IsNull((
		select top (1) d.DescriptorId
		  from [edfi].[StudentSchoolFoodServiceProgramAssociation] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.ProgramTypeDescriptorId 
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
	),0)
    --</MappingInfoStatus>
    )

    ,[Student_Current_Disability_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_Disability_Ind">
	case when exists (
		select *          
		from edfi.StudentSpecialEducationProgramAssociation pa
	   where pa.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and pa.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId
	     and IsNull([StudentSchoolAssociation_MostRecent].EntryDate,'1753-01-01') <= IsNull(pa.IEPEndDate,'9999-12-31') 
		 and IsNull(pa.IEPBeginDate,'1753-01-01') <= IsNull([StudentSchoolAssociation_MostRecent].ExitWithdrawDate,'9999-12-31') 
		 and (pa.IEPBeginDate is not null or pa.IEPEndDate is not null) )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Date_Entered_District]=convert(Date,
    --<MappingInfoStatus Status="I" Column="Student_Date_Entered_District">
    '1753-01-01' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Student_Date_Entered_USA_School]=convert(Date,
    --<MappingInfoStatus Status="I" Column="Student_Date_Entered_USA_School">
    '1753-01-01' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Student_Resident_District]=convert(VarChar(30),
    --<MappingInfoStatus Status="I" Column="Student_Resident_District">
    '--'  -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Student_Citizenship_Country]=convert(VarChar(30),
    --<MappingInfoStatus Status="I" Column="Student_Citizenship_Country">
    '--'  -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Student_USA_Date_Of_Entry]=convert(Date,
    --<MappingInfoStatus Status="I" Column="Student_USA_Date_Of_Entry">
    '1753-01-01' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Student_Primary_Language]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Primary_Language">
    IsNull((
	select top (1) ld.Description
	  from [edfi].[StudentEducationOrganizationAssociationLanguageUse] x
	  join [edfi].[Descriptor] ld on ld.DescriptorId=x.LanguageDescriptorId 
	  join [edfi].[Descriptor] lud on lud.DescriptorId=x.LanguageUseDescriptorId
	 where x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId
	   and x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	 order by case lud.CodeValue when 'Dominant language' then 1
								 when 'Home language' then 2
								 when 'Native language' then 3
								 else 99 end
	),'')  
    --</MappingInfoStatus>
    )

    ,[Student_Year_Entered_9th_Grade]=convert(Char(4),
    --<MappingInfoStatus Status="I" Column="Student_Year_Entered_9th_Grade">
    '1753' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Student_Graduation_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Graduation_Ind">
	case when exists (
		select *          
		from [edfi].[StudentAcademicRecordDiploma] x
		join [edfi].[Descriptor] d on d.DescriptorId=x.DiplomaTypeDescriptorId
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Graduation_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Student_Graduation_Date">
    IsNull((
	select top (1) x.DiplomaAwardDate
	  from [edfi].[StudentAcademicRecordDiploma] x
	  join [edfi].[Descriptor] dt on dt.DescriptorId=x.DiplomaTypeDescriptorId 
	 where x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId
	   and x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	),'9999-12-31')  
    --</MappingInfoStatus>
    )

    ,[Student_Diploma_Type_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Diploma_Type_Cd">
	IsNull((
	select top (1) dt.CodeValue
	  from [edfi].[StudentAcademicRecordDiploma] x
	  join [edfi].[Descriptor] dt on dt.DescriptorId=x.DiplomaTypeDescriptorId 
	 where x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId
	   and x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	),'--')
    --</MappingInfoStatus>
    )

    ,[Student_Received_Ged_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Received_Ged_Ind">
	case when exists (
		select *          
		from [edfi].[StudentAcademicRecordDiploma] x
		join [edfi].[Descriptor] d on d.DescriptorId=x.DiplomaTypeDescriptorId
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId
	     and d.CodeValue in ('General Educational Development (GED) credential') )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Current_Title_1_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Student_Current_Title_1_Cd">
	case when exists (
		select *
		  from [edfi].[StudentTitleIPartAProgramAssociation] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.TitleIPartAParticipantDescriptorId and d.CodeValue not in ('Was not served')
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Current_Homeless_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_Homeless_Ind">
	case when exists (
		select *
		  from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.StudentCharacteristicDescriptorId and d.CodeValue='Homeless'
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Homeless_Unaccompanied_Youth_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Homeless_Unaccompanied_Youth_Ind">
	case when exists (
		select *
		  from [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.StudentCharacteristicDescriptorId and d.CodeValue='Unaccompanied Youth'
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Current_SpEd_Eligible_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_SpEd_Eligible_Ind">
	case when exists (
		select *
		  from [edfi].[StudentSpecialEducationProgramAssociation] x
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId
		 and x.IEPBeginDate is not null )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_Current_SpEd_Receiving_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_SpEd_Receiving_Ind">
	case when exists (
		select *
		  from [edfi].[StudentSpecialEducationProgramAssociationSpecialEducationProgramService] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.SpecialEducationProgramServiceDescriptorId
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Student_SpEd_Area_of_Exceptionality]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Student_SpEd_Area_of_Exceptionality">
    IsNull((
	select top (1) dc.CodeValue
	  from [edfi].[StudentSpecialEducationProgramAssociationDisability] x 
	  join [edfi].[Descriptor] dc on dc.DescriptorId=x.DisabilityDescriptorId
	 where x.OrderofDisability=1 
	   and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId 
	   and x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	),'--') 
    --</MappingInfoStatus>
    )

    ,[Student_State_Funding_Type]=convert(VarChar(254),
    --<MappingInfoStatus Status="I" Column="Student_State_Funding_Type">
    '--' -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Student_Current_Gifted_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Student_Current_Gifted_Ind">
	case when exists (
		select *
		  from [edfi].[StudentProgramAssociation] x
		  join [edfi].[Descriptor] d on d.DescriptorId=x.ProgramTypeDescriptorId and d.CodeValue='Gifted and Talented'
	   where x.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	     and x.EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId )
	   then 'Y' else 'N' end
    --</MappingInfoStatus>
    )

    ,[Current_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Current_School_Id">
    IsNull((
	select top (1) SchoolId
	  from [edfi].[StudentSchoolAssociation] ssa
	 where ssa.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	 order by ssa.EntryDate desc
	),0)
    --</MappingInfoStatus>
    )

    ,[Current_School_Name]=convert(VarChar(60),
    --<MappingInfoStatus Status="C" Column="Current_School_Name">
    IsNull((
	select top (1) eo.NameOfInstitution
	  from [edfi].[StudentSchoolAssociation] ssa
	  join [edfi].[EducationOrganization] eo on eo.EducationOrganizationId=ssa.SchoolId
	 where ssa.StudentUSI=[StudentSchoolAssociation_MostRecent].StudentUSI
	 order by ssa.EntryDate desc
	),0)
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    IsNull([StudentSchoolAssociation_MostRecent].SchoolYear,@ActiveSchoolYear)
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[Student].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    convert(date,[StudentSchoolAssociation_MostRecent].LastModifiedDate)
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select count(*) -- select top 10 *
  from [edfi].[Student] -- 21628
  join (
	  select EnrollOrderDesc=Row_Number() over (partition by SAID, STUDENTUSI order by EntryDate desc), *
	    from [edfi].[StudentSchoolAssociation]
	   ) [StudentSchoolAssociation_MostRecent]
		on [StudentSchoolAssociation_MostRecent].EnrollOrderDesc=1 
	   and [StudentSchoolAssociation_MostRecent].StudentUSI = [edfi].[Student].StudentUSI --21630
  join [edfi].[StudentEducationOrganizationAssociation] 
    on [edfi].[StudentEducationOrganizationAssociation].StudentUSI=[edfi].[Student].StudentUSI
   and [edfi].[StudentEducationOrganizationAssociation].EducationOrganizationId=[StudentSchoolAssociation_MostRecent].EducationOrganizationId -- 21630

 where (@Batch_Period_List='all' or IsNull([StudentSchoolAssociation_MostRecent].SchoolYear,@ActiveSchoolYear) in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[Student].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Term_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Term_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Term_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Term"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    [edfi].[Calendar].[CalendarCode]
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Desc">
    IsNull((
	select top (1) d.Description
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Calendar].CalendarTypeDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Sort_Order">
    [edfi].[Calendar].CalendarTypeDescriptorId-(select min(ct.CalendarTypeDescriptorId) from [edfi].[CalendarTypeDescriptor] ct)
    --</MappingInfoStatus>
    )

    ,[Summer_School_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Summer_School_Ind">
    case when exists(
	select *
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Calendar].CalendarTypeDescriptorId
	   and d.CodeValue in ('S','Summer')
	) then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Track_First_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Track_First_Instructional_Date">
    IsNull((
	select min(a.Date)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue='Instructional day'
	   and a.SchoolId=[edfi].[Calendar].SchoolId
	   and a.SchoolYear=[edfi].[Calendar].SchoolYear
	   and a.CalendarCode=[edfi].[Calendar].CalendarCode
	),'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Track_Last_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Track_Last_Instructional_Date">
    IsNull((
	select max(a.Date)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue='Instructional day'
	   and a.SchoolId=[edfi].[Calendar].SchoolId
	   and a.SchoolYear=[edfi].[Calendar].SchoolYear
	   and a.CalendarCode=[edfi].[Calendar].CalendarCode
	),'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Track_Planned_Instructional_Days]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Track_Planned_Instructional_Days">
    IsNull((
	select count(*)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue='Instructional day'
	   and a.SchoolId=[edfi].[Calendar].SchoolId
	   and a.SchoolYear=[edfi].[Calendar].SchoolYear
	   and a.CalendarCode=[edfi].[Calendar].CalendarCode
	),0)
    --</MappingInfoStatus>
    )

    ,[Track_Actual_Instructional_Days]=convert(SmallInt,
    --<MappingInfoStatus Status="H" Column="Track_Actual_Instructional_Days">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Term_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Term_Cd">
    [SessionTerm_lkp].[CodeValue]
    --</MappingInfoStatus>
    )

    ,[Term_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Term_Desc">
    [SessionTerm_lkp].[Description]
    --</MappingInfoStatus>
    )

    ,[Term_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Term_Sort_Order">
    [SessionTerm_lkp].DescriptorId-(select min(td.TermDescriptorId) from [edfi].[TermDescriptor] td)
    --</MappingInfoStatus>
    )

    ,[Term_First_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Term_First_Instructional_Date">
    coalesce([CalendarFirstLastDay].FirstDay,[edfi].[Session].BeginDate)
    --</MappingInfoStatus>
    )

    ,[Term_Last_Instructional_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Term_Last_Instructional_Date">
    coalesce([CalendarFirstLastDay].LastDay,[edfi].[Session].EndDate)
    --</MappingInfoStatus>
    )

    ,[Term_Planned_Instructional_Days]=convert(SmallInt,
    --<MappingInfoStatus Status="H" Column="Term_Planned_Instructional_Days">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Term_Actual_Instructional_Days]=convert(SmallInt,
    --<MappingInfoStatus Status="H" Column="Term_Actual_Instructional_Days">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[Session].[SchoolYear]
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[Session].[SAID]
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [SessionTerm_lkp].LastModifiedDate
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  FROM [edfi].[Session]
  join [edfi].[Descriptor] [SessionTerm_lkp] on [SessionTerm_lkp].DescriptorId=[edfi].[Session].TermDescriptorId
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[Session].SchoolId
  join [edfi].[Calendar] on [edfi].[Calendar].SchoolId=[edfi].[Session].SchoolId and [edfi].[Calendar].SchoolYear=[edfi].[Session].SchoolYear
  left outer
  join (
	select cdce.CalendarCode, cdce.SchoolId, cdce.SchoolYear, FirstDay=min(cdce.Date), LastDay=max(cdce.Date)
	  from edfi.CalendarDateCalendarEvent cdce
	  join edfi.Descriptor d on d.DescriptorId=cdce.CalendarEventDescriptorId --and d.CodeValue='Membership Day'
	 group by cdce.CalendarCode, cdce.SchoolId, cdce.SchoolYear
  ) [CalendarFirstLastDay] on [CalendarFirstLastDay].CalendarCode=[edfi].[Calendar].CalendarCode and [edfi].[Calendar].SchoolId=[CalendarFirstLastDay].SchoolId and [edfi].[Calendar].SchoolYear=[CalendarFirstLastDay].SchoolYear

  where (@Batch_Period_List='all' or [edfi].[Session].[SchoolYear] in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[Session].[SAID] in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Withdrawal_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_dim_Withdrawal_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_dim_Withdrawal_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="dim_Withdrawal"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear smallint = (select top (1) SchoolYear from [edfi].[SchoolYearType] where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Withdrawal_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Withdrawal_Cd">
    [ExitWithdraw].ExitWithdrawCodeValue
    --</MappingInfoStatus>
    )

    ,[Withdrawal_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Withdrawal_Desc">
    [ExitWithdraw].ExitWithdrawDesc
    --</MappingInfoStatus>
    )

    ,[Withdrawal_State_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Withdrawal_State_Cd">
    IsNull((
	select top (1) XrefCode
	  from dbo.CodeXRef 
	 where CodeCategory='Exit Codes - Local to State' -- 
	   and LocalCode=[ExitWithdraw].ExitWithdrawCodeValue
	),[ExitWithdraw].ExitWithdrawCodeValue  -- Assumes if No Crosswalk from Local to State we will us local code.
	)
    --</MappingInfoStatus>
    )

    ,[Withdrawal_State_Desc]=convert(VarChar(254),
    --<MappingInfoStatus Status="C" Column="Withdrawal_State_Desc">
    IsNull((
	select top (1) XrefValue
	  from dbo.CodeXRef 
	 where CodeCategory='Entry Codes - Local to State' -- 
	   and LocalCode=[ExitWithdraw].ExitWithdrawCodeValue
	),[ExitWithdraw].ExitWithdrawDesc  -- Assumes if No Crosswalk from Local to State we will us local description.
	)
    --</MappingInfoStatus>
    )

    ,[Withdrawal_Sort_Order]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Withdrawal_Sort_Order">
    [ExitWithdraw].SortOrder
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    coalesce([ExitWithdraw].SchoolYear,@ActiveSchoolYear)
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [ExitWithdraw].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    IsNull([ExitWithdraw].LastModifiedDate,getdate())
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select count(*)  -- select top (10) * 
  from (
	select ExitWithdrawCodeValue=IsNull(d.CodeValue,'UNK'), 
		   ExitWithdrawDesc=IsNull(d.[Description],'Unknown'),
		   LastModifiedDate=max(d.LastModifiedDate), 
		   sa.SchoolYear, sa.SAID, 
		   SortOrder=IsNull(max(d.DescriptorId),-1)
	  from [edfi].[StudentSchoolAssociation]  sa
	  left join [edfi].[Descriptor] d on d.DescriptorId=sa.ExitWithdrawTypeDescriptorId
	 group by IsNull(d.CodeValue,'UNK'), IsNull(d.[Description],'Unknown'), sa.SchoolYear, sa.SAID
  ) [ExitWithdraw] 

 where (@Batch_Period_List='all' or IsNull([ExitWithdraw].SchoolYear,@ActiveSchoolYear) in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [ExitWithdraw].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Attendance_Daily_Activity_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Attendance_Daily_Activity_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_Attendance_Daily_Activity_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Attendance_Daily_Activity"> 

--<MappingInfoCommon/>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[edfi].[StudentSchoolAttendanceEvent].SchoolYear-1) + '-'+ convert(varchar,[edfi].[StudentSchoolAttendanceEvent].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="H" Column="Calendar_Track_Cd">
    IsNull((
	select top (1) CalendarCode
	  from [edfi].[Calendar] cal
	 where cal.SchoolId=[edfi].[StudentSchoolAttendanceEvent].SchoolId
	   and cal.SchoolYear=[edfi].[StudentSchoolAttendanceEvent].SchoolYear
	),'') -- No link between Session Class Period and Calendars found in EdFi.
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Student_Id">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[StudentSchoolAttendanceEvent].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Attendance_Category_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_Category_Cd">
    Case when [AttendanceEvent_lkp].CodeValue like '%Absence%' then 'A'
		 when [AttendanceEvent_lkp].CodeValue like '%Tardy%' then 'T'
		 else 'P' end
    --</MappingInfoStatus>
    )

    ,[Attendance_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_Cd">
    [AttendanceEvent_lkp].CodeValue
    --</MappingInfoStatus>
    )

    ,[Attendance-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Attendance-Date_Of_Day">
    [edfi].[StudentSchoolAttendanceEvent].EventDate
    --</MappingInfoStatus>
    )

    ,[Attendance_Calendar_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Attendance_Calendar_Date">
    [edfi].[StudentSchoolAttendanceEvent].EventDate
    --</MappingInfoStatus>
    )

    ,[Attendance_Days_Absent_Count]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="C" Column="Attendance_Days_Absent_Count">
    IsNull([edfi].[StudentSchoolAttendanceEvent].EventDuration,0)
    --</MappingInfoStatus>
    )

    ,[Periods_Absent]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Periods_Absent">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Periods_Scheduled]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Periods_Scheduled">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Minutes_Absent]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Minutes_Absent">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Minutes_Scheduled]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Minutes_Scheduled">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[StudentSchoolAttendanceEvent].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[StudentSchoolAttendanceEvent].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[StudentSchoolAttendanceEvent].LastModifiedDate
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [edfi].[StudentSchoolAttendanceEvent].Id
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[StudentSchoolAttendanceEvent]
  join [edfi].[Descriptor] [AttendanceEvent_lkp] on [AttendanceEvent_lkp].DescriptorId=[edfi].[StudentSchoolAttendanceEvent].AttendanceEventCategoryDescriptorId
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[StudentSchoolAttendanceEvent].SchoolId

  where (@Batch_Period_List='all' or [edfi].[StudentSchoolAttendanceEvent].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StudentSchoolAttendanceEvent].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Attendance_Period_Activity_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Attendance_Period_Activity_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_Attendance_Period_Activity_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Attendance_Period_Activity"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[edfi].[StudentSectionAttendanceEvent].SchoolYear-1) + '-'+ convert(varchar,[edfi].[StudentSectionAttendanceEvent].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="H" Column="Calendar_Track_Cd">
    IsNull((
	select top (1) CalendarCode
	  from [edfi].[Calendar] cal
	 where cal.SchoolId=[edfi].[StudentSectionAttendanceEvent].SchoolId
	   and cal.SchoolYear=[edfi].[StudentSectionAttendanceEvent].SchoolYear
	),'') -- No link between Session Class Period and Calendars found in EdFi.
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Period_Cd">
    [edfi].[SectionClassPeriod].ClassPeriodName
    --</MappingInfoStatus>
    )

    ,[Period_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Period_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Student_Id">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[StudentSectionAttendanceEvent].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Attendance_Category_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_Category_Cd">
    Case when [AttendanceEvent_lkp].CodeValue like '%Absence%' then 'A'
		 when [AttendanceEvent_lkp].CodeValue like '%Tardy%' then 'T'
		 else 'P' end
    --</MappingInfoStatus>
    )

    ,[Attendance_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Attendance_Cd">
    [AttendanceEvent_lkp].CodeValue
    --</MappingInfoStatus>
    )

    ,[Attendance-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Attendance-Date_Of_Day">
    [edfi].[StudentSectionAttendanceEvent].EventDate
    --</MappingInfoStatus>
    )

    ,[Attendance_Calendar_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Attendance_Calendar_Date">
    [edfi].[StudentSectionAttendanceEvent].EventDate
    --</MappingInfoStatus>
    )

    ,[Attendance_Periods_Absent_Count]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="H" Column="Attendance_Periods_Absent_Count">
    1 -- Not found in EdFi when absence spans class with multiple periods. Set to 1
    --</MappingInfoStatus>
    )

    ,[Minutes_Absent]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Minutes_Absent">
    IsNull([edfi].[StudentSectionAttendanceEvent].EventDuration,0)
    --</MappingInfoStatus>
    )

    ,[Minutes_Scheduled]=convert(SmallInt,
    --<MappingInfoStatus Status="I" Column="Minutes_Scheduled">
    0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[StudentSectionAttendanceEvent].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[StudentSectionAttendanceEvent].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[StudentSectionAttendanceEvent].LastModifiedDate
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [edfi].[StudentSectionAttendanceEvent].Id
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[StudentSectionAttendanceEvent]
  join [edfi].[StudentSectionAssociation]
    on [edfi].[StudentSectionAssociation].SectionIdentifier=[edfi].[StudentSectionAttendanceEvent].SectionIdentifier
   and [edfi].[StudentSectionAssociation].StudentUSI=[edfi].[StudentSectionAttendanceEvent].StudentUSI
   and [edfi].[StudentSectionAssociation].SchoolId=[edfi].[StudentSectionAttendanceEvent].SchoolId
   and [edfi].[StudentSectionAssociation].SchoolYear=[edfi].[StudentSectionAttendanceEvent].SchoolYear
   and [edfi].[StudentSectionAssociation].SessionName=[edfi].[StudentSectionAttendanceEvent].SessionName
   and [edfi].[StudentSectionAttendanceEvent].EventDate between [edfi].[StudentSectionAssociation].BeginDate and [edfi].[StudentSectionAssociation].EndDate
  join [edfi].[Descriptor] [AttendanceEvent_lkp] on [AttendanceEvent_lkp].DescriptorId=[edfi].[StudentSectionAttendanceEvent].AttendanceEventCategoryDescriptorId
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[StudentSectionAttendanceEvent].SchoolId
  join [edfi].[SectionClassPeriod] -- 1129363
    on [edfi].[SectionClassPeriod].SectionIdentifier=[edfi].[StudentSectionAttendanceEvent].SectionIdentifier
   and [edfi].[SectionClassPeriod].SchoolId=[edfi].[StudentSectionAttendanceEvent].SchoolId
   and [edfi].[SectionClassPeriod].SchoolYear=[edfi].[StudentSectionAttendanceEvent].SchoolYear
   and [edfi].[SectionClassPeriod].SessionName=[edfi].[StudentSectionAttendanceEvent].SessionName

  where (@Batch_Period_List='all' or [edfi].[StudentSectionAttendanceEvent].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StudentSectionAttendanceEvent].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Enrollment_Pairs_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Enrollment_Pairs_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 15:54:59
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_FCT_ENROLLMENT_PAIRS_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Enrollment_Pairs"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear smallint = (select top (1) SchoolYear from [edfi].[SchoolYearType] where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear)-1) 
	+ '-'+ 
	convert(varchar,IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear))
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="DISTRICT_ID">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="SCHOOL_ID">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    IsNull([edfi].[StudentSchoolAssociation].CalendarCode, (
	select top (1) CalendarCode 
	  from [edfi].[Calendar] cal
	 where cal.SchoolId=[edfi].[StudentSchoolAssociation].SchoolId
	   and cal.SchoolYear=IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear)
	))
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[StudentSchoolAssociation].SchoolId
    --</MappingInfoStatus>
    )

    ,[Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="LOCAL_STUDENT_ID">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[Student].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Enrollment_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Enrollment_Cd">
    IsNull(EntryType.CodeValue,'UNK')
    --</MappingInfoStatus>
    )

    ,[Enrollment-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Enrollment-Date_Of_Day">
    [edfi].[StudentSchoolAssociation].EntryDate
    --</MappingInfoStatus>
    )

    ,[Withdrawal_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Withdrawal_Cd">
    IsNull(WithdrawType.CodeValue,'UNK')
    --</MappingInfoStatus>
    )

    ,[Withdrawal-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Withdrawal-Date_Of_Day">
    IsNull([edfi].[StudentSchoolAssociation].ExitWithdrawDate,'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Serving_District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Serving_District_Id">
    [edfi].[StudentSchoolAssociation].EducationOrganizationId
    --</MappingInfoStatus>
    )

    ,[Resident_District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Resident_District_Id">
    [edfi].[StudentSchoolAssociation].EducationOrganizationId
    --</MappingInfoStatus>
    )

    ,[Enrollment_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Enrollment_Date">
    [edfi].[StudentSchoolAssociation].EntryDate
    --</MappingInfoStatus>
    )

    ,[Withdrawal_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Withdrawal_Date">
    IsNull([edfi].[StudentSchoolAssociation].ExitWithdrawDate,'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Enrolled_Grade_Level]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Enrolled_Grade_Level">
    IsNull((
	select top (1) CodeValue from [edfi].[Descriptor] d where d.DescriptorId=[edfi].[StudentSchoolAssociation].EntryGradeLevelDescriptorId
	),'--') 
    --</MappingInfoStatus>
    )

    ,[Current_Enrollment_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Current_Enrollment_Ind">
    case
	when IsNull([edfi].[StudentSchoolAssociation].ExitWithdrawDate,'9999-12-31') > getdate() 
	then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Percent_Enrolled]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="I" Column="Percent_Enrolled">
    0.0 -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Enrollment_Count]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="ENROLLMENT_COUNT">
    case 
	when [edfi].[StudentSchoolAssociation].ExitWithdrawDate is null 
	 and [edfi].[StudentSchoolAssociation].ExitWithdrawTypeDescriptorId is null
	then 1 else 0 end
    --</MappingInfoStatus>
    )

    ,[No_Show_Count]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="No_Show_Count">
    case 
	when exists(
		select *
		  from [edfi].[Descriptor] d 
		 where d.DescriptorId=[edfi].[StudentSchoolAssociation].ExitWithdrawTypeDescriptorId
		   and d.CodeValue='No show')
	then 1 else 0 end
    --</MappingInfoStatus>
    )

    ,[Calendar_Days_Enrolled]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Calendar_Days_Enrolled">
    IsNull((
	select count(*)
	  from edfi.CalendarDateCalendarEvent a
	  join edfi.Descriptor d on d.DescriptorId=a.CalendarEventDescriptorId
	   and d.CodeValue='Instructional day'
	   and a.SchoolId=[edfi].[StudentSchoolAssociation].SchoolId
	   and a.SchoolYear=IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear)
	   and a.CalendarCode=IsNull([edfi].[StudentSchoolAssociation].CalendarCode,(select top (1) cal.CalendarCode from [edfi].[Calendar] cal where cal.SchoolId=[edfi].[StudentSchoolAssociation].SchoolId))
	   and a.Date between [edfi].[StudentSchoolAssociation].EntryDate and IsNull([edfi].[StudentSchoolAssociation].ExitWithdrawDate,'9999-12-31')
	),0)
    --</MappingInfoStatus>
    )

    ,[FullYear_Enrollment_Count]=convert(TinyInt,
    --<MappingInfoStatus Status="I" Column="FullYear_Enrollment_Count">
    0  -- Managed out of process.  Post load update.
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear)
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[StudentSchoolAssociation].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    convert(date,[edfi].[StudentSchoolAssociation].LastModifiedDate)
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [edfi].[StudentSchoolAssociation].Id
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select count(*) -- select top (10) *
  from [edfi].[Student] 
  join [edfi].[StudentSchoolAssociation] on [edfi].[Student].StudentUSI=[edfi].[StudentSchoolAssociation].StudentUSI
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[StudentSchoolAssociation].SchoolId
  left outer join [edfi].[Descriptor] EntryType on EntryType.DescriptorId=[edfi].[StudentSchoolAssociation].EntryTypeDescriptorId
  left outer join [edfi].[Descriptor] WithdrawType on WithdrawType.DescriptorId=[edfi].[StudentSchoolAssociation].ExitWithdrawTypeDescriptorId
 where (@Batch_Period_List='all' or IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear) in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StudentSchoolAssociation].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_School_Calendar_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_School_Calendar_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_School_Calendar_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_School_Calendar"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[CalendarDate_lkp].SchoolYear-1) + '-'+ convert(varchar,[CalendarDate_lkp].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Date_Of_Day">
    [CalendarDate_lkp].Date
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    [CalendarDate_lkp].CalendarCode
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [CalendarDate_lkp].SchoolId
    --</MappingInfoStatus>
    )

    ,[Calendar_Day_Type_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Day_Type_Cd">
    [CalendarDate_lkp].CalendarDayType
    --</MappingInfoStatus>
    )

    ,[Cycle_Day_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="H" Column="Cycle_Day_Cd">
    '--' -- Hold till Bell Schedules and Cycle Days (A day, B day) are implemented.
    --</MappingInfoStatus>
    )

    ,[Calendar_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Calendar_Date">
    [CalendarDate_lkp].Date
    --</MappingInfoStatus>
    )

    ,[School_Day_Num]=convert(Int,
    --<MappingInfoStatus Status="C" Column="School_Day_Num">
    [CalendarDate_lkp].SchoolDayNum
    --</MappingInfoStatus>
    )

    ,[Occurrence]=convert(SmallInt,
    --<MappingInfoStatus Status="C" Column="Occurrence">
    1
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [CalendarDate_lkp].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [CalendarDate_lkp].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [CalendarDate_lkp].LastModifiedDate
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [CalendarDate_lkp].Id
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> -- select top (10) *
  from (
	select cd.SAID, cd.SchoolId, cd.Date, cd.CalendarCode, cd.SchoolYear, cd.Id, cd.LastModifiedDate, 
		   SchoolDayNum=DENSE_RANK() over (partition by cd.SAID, cd.SchoolId, cd.CalendarCode, cd.SchoolYear order by cd.Date),
		   CalendarDayType=d.CodeValue,
		   DayTypeOrder=ROW_NUMBER() over (partition by cd.SAID, cd.SchoolId, cd.Date, cd.CalendarCode, cd.SchoolYear order by d.DescriptorId)
	  from [edfi].[CalendarDate] cd
	  join [edfi].[CalendarDateCalendarEvent] ce
		on cd.SchoolId=ce.SchoolId and cd.Date=ce.Date and cd.CalendarCode=ce.CalendarCode and cd.SchoolYear=ce.SchoolYear
	  join edfi.Descriptor d on d.DescriptorId=ce.CalendarEventDescriptorId
	   ) [CalendarDate_lkp] 
  join [edfi].[School] on [edfi].[School].SchoolId=[CalendarDate_lkp].SchoolId
   and [CalendarDate_lkp].DayTypeOrder=1
 where (@Batch_Period_List='all' or [CalendarDate_lkp].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [CalendarDate_lkp].SAID in (select SAID from @SAIDtable) )

  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Student_Course_Grade_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Student_Course_Grade_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_Student_Course_Grade_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Student_Course_Grade"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[edfi].[Grade].SchoolYear-1) 
	+ '-'+ 
	convert(varchar,[edfi].[Grade].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    IsNull([edfi].[StudentSchoolAssociation].CalendarCode,(
	select top (1) CalendarCode 
	  from [edfi].[Calendar] cal
	 where cal.SchoolId=[edfi].[Grade].SchoolId
	   and cal.SchoolYear=[edfi].[Grade].SchoolYear
	))
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Term_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Term_Cd">
    IsNull((
	select top(1) d.CodeValue
	  from [edfi].[Session] x
	  join [edfi].[Descriptor] d on d.DescriptorId=x.TermDescriptorId
	 where x.SchoolId=[edfi].[Grade].SchoolId
	   and x.SchoolYear=[edfi].[Grade].SchoolYear
	   and x.SessionName=[edfi].[Grade].SessionName
	),'--')
    --</MappingInfoStatus>
    )

    ,[Marking_Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Marking_Period_Cd">
    IsNull((
	select top (1) d.CodeValue
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Grade].GradingPeriodDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Grade_Type_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Grade_Type_Cd">
    IsNull((
	select top (1) d.CodeValue
	  from [edfi].[Descriptor] d 
	 where d.DescriptorId=[edfi].[Grade].GradeTypeDescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Course_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_Cd">
    IsNull((
	select top(1) co.CourseCode
	  FROM [edfi].[Section] x
	  join [edfi].[CourseOffering] co
		on co.SchoolId=x.SchoolId
	   and co.SchoolYear=x.SchoolYear
	   and co.SessionName=x.SessionName
	   and co.LocalCourseCode=x.LocalCourseCode
	 where x.SchoolId=[edfi].[Grade].SchoolId
	   and x.SchoolYear=[edfi].[Grade].SchoolYear
	   and x.SessionName=[edfi].[Grade].SessionName
	   and x.SectionIdentifier=[edfi].[Grade].SectionIdentifier
	),'--')
    --</MappingInfoStatus>
    )

    ,[Course_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Course_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Course_Section_Identifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Course_Section_Identifier">
    [edfi].[Grade].SectionIdentifier
    --</MappingInfoStatus>
    )

    ,[Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Student_Id">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[Grade].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Letter_Grade]=convert(VarChar(12),
    --<MappingInfoStatus Status="C" Column="Letter_Grade">
    [edfi].[Grade].LetterGradeEarned
    --</MappingInfoStatus>
    )

    ,[Numeric_Grade]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="C" Column="Numeric_Grade">
    [edfi].[Grade].NumericGradeEarned
    --</MappingInfoStatus>
    )

    ,[Grade_Point_Max]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="H" Column="Grade_Point_Max">
    0.0 -- Not Found in EdFi
    --</MappingInfoStatus>
    )

    ,[Passing_Grade_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="H" Column="Passing_Grade_Ind">
    '-' -- Not Found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[Grade].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[Grade].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[Grade].LastModifiedDate
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [edfi].[Grade].id
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>  -- select count(*)
  from [edfi].[Grade]
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[Grade].SchoolId
  join [edfi].[StudentSchoolAssociation]
    on [edfi].[StudentSchoolAssociation].SchoolId=[edfi].[Grade].SchoolId
   and [edfi].[StudentSchoolAssociation].StudentUSI=[edfi].[Grade].StudentUSI
   -- and [edfi].[StudentSchoolAssociation].SchoolYear=[edfi].[Grade].SchoolYear

 where (@Batch_Period_List='all' or [edfi].[Grade].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[Grade].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Student_Course_Schedule_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Student_Course_Schedule_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_Student_Course_Schedule_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Student_Course_Schedule"> 

--<MappingInfoCommon>

--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[edfi].[StudentSectionAssociation].SchoolYear-1) + '-'+ convert(varchar,[edfi].[StudentSectionAssociation].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    IsNull([edfi].[StudentSchoolAssociation].CalendarCode,(
	select top (1) CalendarCode 
	  from [edfi].[Calendar] cal
	 where cal.SchoolId=[edfi].[StudentSectionAssociation].SchoolId
	   and cal.SchoolYear=[edfi].[StudentSectionAssociation].SchoolYear
	))
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Term_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Term_Cd">
    IsNull((
	select top(1) d.CodeValue
	  from [edfi].[Session] x
	  join [edfi].[Descriptor] d on d.DescriptorId=x.TermDescriptorId
	 where x.SchoolId=[edfi].[StudentSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StudentSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StudentSectionAssociation].SessionName
	),'--')
    --</MappingInfoStatus>
    )

    ,[Course_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_Cd">
    IsNull((
	select top(1) co.CourseCode
	  FROM [edfi].[Section] x
	  join [edfi].[CourseOffering] co
		on co.SchoolId=x.SchoolId
	   and co.SchoolYear=x.SchoolYear
	   and co.SessionName=x.SessionName
	   and co.LocalCourseCode=x.LocalCourseCode
	 where x.SchoolId=[edfi].[StudentSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StudentSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StudentSectionAssociation].SessionName
	   and x.SectionIdentifier=[edfi].[StudentSectionAssociation].SectionIdentifier
	),'--')
    --</MappingInfoStatus>
    )

    ,[Course_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Course_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Course_Section_Identifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Course_Section_Identifier">
    [edfi].[StudentSectionAssociation].SectionIdentifier
    --</MappingInfoStatus>
    )

    ,[Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Student_Id">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[StudentSectionAssociation].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Enrolled-District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Enrolled-District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[Enrolled-School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Enrolled-School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Attending-District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Attending-District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[Attending-School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Attending-School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Cycle_Day_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="H" Column="Cycle_Day_Cd">
    '--' -- Hold till Bell Schedules and Cycle Days (A day, B day) are implemented.
    --</MappingInfoStatus>
    )

    ,[Start-Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Start-Period_Cd">
    IsNull((
	select top(1) x.ClassPeriodName
	  from [edfi].[SectionClassPeriod] x
	 where x.SchoolId=[edfi].[StudentSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StudentSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StudentSectionAssociation].SessionName
	),'--')
    --</MappingInfoStatus>
    )

    ,[Start-Period_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Start-Period_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[End-Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="End-Period_Cd">
    IsNull((
	select top(1) x.ClassPeriodName
	  from [edfi].[SectionClassPeriod] x
	 where x.SchoolId=[edfi].[StudentSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StudentSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StudentSectionAssociation].SessionName
	),'--')
    --</MappingInfoStatus>
    )

    ,[End-Period_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="End-Period_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Entered-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Entered-Date_Of_Day">
    [edfi].[StudentSectionAssociation].BeginDate
    --</MappingInfoStatus>
    )

    ,[Exited-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Exited-Date_Of_Day">
    [edfi].[StudentSectionAssociation].EndDate
    --</MappingInfoStatus>
    )

    ,[Entered_Calendar_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Entered_Calendar_Date">
    [edfi].[StudentSectionAssociation].BeginDate
    --</MappingInfoStatus>
    )

    ,[Exited_Calendar_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Exited_Calendar_Date">
    [edfi].[StudentSectionAssociation].EndDate
    --</MappingInfoStatus>
    )

    ,[Course_Enroll_Count]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="C" Column="Course_Enroll_Count">
    1
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[StudentSectionAssociation].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[StudentSectionAssociation].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[StudentSectionAssociation].LastModifiedDate
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [edfi].[StudentSectionAssociation].Id
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> 
  from [edfi].[StudentSectionAssociation]
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[StudentSectionAssociation].SchoolId
  join [edfi].[StudentSchoolAssociation]
    on [edfi].[StudentSchoolAssociation].SchoolId=[edfi].[StudentSectionAssociation].SchoolId
   and [edfi].[StudentSchoolAssociation].StudentUSI=[edfi].[StudentSectionAssociation].StudentUSI

  where (@Batch_Period_List='all' or [edfi].[StudentSectionAssociation].SchoolYear in (select Batch_Period from @BPLtable))
    and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StudentSectionAssociation].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Student_Course_Transcript_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Student_Course_Transcript_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-22 13:59:06
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_Student_Course_Transcript_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Student_Course_Transcript"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear smallint = (select top (1) SchoolYear from [edfi].[SchoolYearType] where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[edfi].[CourseTranscript].SchoolYear-1) 
	+ '-'+ 
	convert(varchar,[edfi].[CourseTranscript].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    IsNull([edfi].[StudentSchoolAssociation].CalendarCode,(
	select top (1) CalendarCode 
	  from [edfi].[Calendar] cal
	 where cal.SchoolId=[edfi].[CourseTranscript].CourseEducationOrganizationId
	   and cal.SchoolYear=[edfi].[CourseTranscript].SchoolYear
	))
    --</MappingInfoStatus>
    )

    ,[Term_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Term_Cd">
    IsNull((
	select top(1) d.CodeValue
	  from [edfi].[Descriptor] d
	 where d.DescriptorId=[edfi].[CourseTranscript].TermDescriptorId
	),'--')
    --</MappingInfoStatus>
    )

    ,[Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Student_Id">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[CourseTranscript].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Letter_Grade]=convert(VarChar(12),
    --<MappingInfoStatus Status="C" Column="Letter_Grade">
    [edfi].[CourseTranscript].FinalLetterGradeEarned
    --</MappingInfoStatus>
    )

    ,[Numeric_Grade]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="C" Column="Numeric_Grade">
    [edfi].[CourseTranscript].FinalNumericGradeEarned
    --</MappingInfoStatus>
    )

    ,[Credit_Attempted]=convert(Decimal(5,2),
    --<MappingInfoStatus Status="C" Column="Credit_Attempted">
    [edfi].[CourseTranscript].AttemptedCredits
    --</MappingInfoStatus>
    )

    ,[Credit_Earned]=convert(Decimal(5,2),
    --<MappingInfoStatus Status="C" Column="Credit_Earned">
    [edfi].[CourseTranscript].EarnedCredits
    --</MappingInfoStatus>
    )

    ,[Quality_Points_Earned]=convert(Decimal(5,2),
    --<MappingInfoStatus Status="H" Column="Quality_Points_Earned">
    0.0 -- Not Found in EdFi
    --</MappingInfoStatus>
    )

    ,[Grade_Point_Max]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="H" Column="Grade_Point_Max">
    0.0 -- Not Found in EdFi
    --</MappingInfoStatus>
    )

    ,[Passing_Grade_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="C" Column="Passing_Grade_Ind">
    case
	when [edfi].[CourseTranscript].FinalLetterGradeEarned in ('A','B','C','D') then 'Y'
	else 'N' end
    --</MappingInfoStatus>
    )

    ,[Content_Completer_Ind]=convert(Char(1),
    --<MappingInfoStatus Status="H" Column="Content_Completer_Ind">
    '-' -- Not found in EdFi 
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[CourseTranscript].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[CourseTranscript].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[CourseTranscript].LastModifiedDate
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [edfi].[CourseTranscript].id
    --</MappingInfoStatus>
    )


  --<MappingInfoFrom>  -- select count(*)  -- select top (100) *
  from [edfi].[CourseTranscript]
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[CourseTranscript].CourseEducationOrganizationId
  join [edfi].[StudentSchoolAssociation]
    on [edfi].[StudentSchoolAssociation].SchoolId=[edfi].[CourseTranscript].CourseEducationOrganizationId
   and [edfi].[StudentSchoolAssociation].StudentUSI=[edfi].[CourseTranscript].StudentUSI
   and IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear)=[edfi].[CourseTranscript].SchoolYear
 where (@Batch_Period_List='all' or [edfi].[CourseTranscript].SchoolYear in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[CourseTranscript].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Student_Program_Participation_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Student_Program_Participation_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_Student_Program_Participation_edfi] @SAID='all', @Batch_Period_List='2018'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Student_Program_Participation"> 

--<MappingInfoCommon>
declare @ActiveSchoolYear int = (select top 1 SchoolYear from edfi.SchoolYearType where CurrentSchoolYear=1)
--</MappingInfoCommon>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear)-1) 
	+ '-'+ 
	convert(varchar,IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear))
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[StudentProgramAssociation].ProgramEducationOrganizationId
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Program_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Program_Cd">
    [edfi].[Program].ProgramId
    --</MappingInfoStatus>
    )

    ,[Local_Student_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Student_Id">
    IsNull((
	select top (1) ic.IdentificationCode
	  from [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ic
	  join [edfi].[Descriptor] d on d.DescriptorId=ic.StudentIdentificationSystemDescriptorId
	 where d.CodeValue='Local'
	   and ic.StudentUSI=[edfi].[StudentProgramAssociation].StudentUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[Effective-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Effective-Date_Of_Day">
    [edfi].[StudentProgramAssociation].BeginDate
    --</MappingInfoStatus>
    )

    ,[Ending-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Ending-Date_Of_Day">
    '9999-12-31'  -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Occurrence]=convert(TinyInt,
    --<MappingInfoStatus Status="C" Column="Occurrence">
    1
    --</MappingInfoStatus>
    )

    ,[Effective_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Effective_Date">
    [edfi].[StudentProgramAssociation].BeginDate
    --</MappingInfoStatus>
    )

    ,[Ending_Date]=convert(Date,
    --<MappingInfoStatus Status="H" Column="Ending_Date">
    '9999-12-31'  -- Not found in EdFi
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear)
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[StudentProgramAssociation].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    getdate()
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="I" Column="SourceIdentifier">
    0  -- Not found in EdFi
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom>
  from [edfi].[StudentProgramAssociation]
  join [edfi].[Program]
    on [edfi].[Program].ProgramName=[edfi].[StudentProgramAssociation].ProgramName
   and [edfi].[Program].EducationOrganizationId=[edfi].[StudentProgramAssociation].EducationOrganizationId
  join [edfi].[StudentSchoolAssociation]
    on [edfi].[StudentSchoolAssociation].StudentUSI=[edfi].[StudentProgramAssociation].StudentUSI
  join [edfi].[School]
    on [edfi].[School].SchoolId=[edfi].[StudentSchoolAssociation].SchoolId 
   and [edfi].[School].LocalEducationAgencyId=[edfi].[StudentProgramAssociation].ProgramEducationOrganizationId

 where (@Batch_Period_List='all' or IsNull([edfi].[StudentSchoolAssociation].SchoolYear,@ActiveSchoolYear) in (select Batch_Period from @BPLtable))
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StudentProgramAssociation].SAID in (select SAID from @SAIDtable)) 
  --</MappingInfoFrom>
--</MappingInfo>
GO
/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Teacher_Course_Schedule_edfi]    Script Date: 4:40:40 PM ******/
CREATE procedure [dbo].[sp_iMart_Transform_fct_Teacher_Course_Schedule_edfi]
(
     @SAID varchar(30) = null,
     @Batch_Period_List varchar(max) = null
)
as

-- ============================================================================
-- Script UTC date: 2019-04-15 18:11:01
-- Description: Generated by OtisEd iMart Wizard Tool
-- Copyright: ©2019 Otis Educational Systems, Inc. All Rights Reserved
-- ============================================================================

-- Example:  exec [dbo].[sp_iMart_Transform_fct_Teacher_Course_Schedule_edfi] @SAID='all', @Batch_Period_List='all'
/* 
<StatusList>
  <Status Code = "A">Assigned Waiting for mapping</Status>
  <Status Code = "I">Ignore for this implementation</Status>
  <Status Code = "M">Mapped and waiting for Review</Status>
  <Status Code = "U">Reviewed and deemed unacceptable.Needs Remapping</Status>
  <Status Code = "H">On Hold for this iteration, non-blocking</Status>
  <Status Code = "C"> Completed</Status>
</StatusList>
*/

--parameter processing
declare @BPLxml xml = (select cast('<a>'+replace(@Batch_Period_List,',','</a><a>') + '</a>' as xml))
declare @BPLtable table(Batch_Period varchar(50), primary key (Batch_Period))
insert into @BPLtable(Batch_Period) 
select ltrim(rtrim(t.value('.','nvarchar(50)'))) as Batch_Period from @BPLxml.nodes('/a') as x(t) where len(@Batch_Period_List)>0

declare @SAIDxml xml = (select cast('<a>'+replace(@SAID,',','</a><a>') + '</a>' as xml))
declare @SAIDtable table(SAID nvarchar(30), Agency nvarchar(30), primary key (SAID))
insert into @SAIDtable(SAID) 
select ltrim(rtrim(t.value('.','nvarchar(30)'))) as SAID from @SAIDxml.nodes('/a') as x(t) where len(@SAID)>0
update @SAIDtable set Agency=case when patindex('%-%', said) > 1 then left(said, patindex('%-%', said)-1 ) else said end

--<MappingInfo Table="fct_Teacher_Course_Schedule"> 

--<MappingInfoCommon/>

select
     [Academic_Year_Name]=convert(Char(9),
    --<MappingInfoStatus Status="C" Column="Academic_Year_Name">
    convert(varchar,[edfi].[StaffSectionAssociation].SchoolYear-1) + '-'+ convert(varchar,[edfi].[StaffSectionAssociation].SchoolYear)
    --</MappingInfoStatus>
    )

    ,[District_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="District_Id">
    [edfi].[School].LocalEducationAgencyId
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_Cd">
    IsNull([edfi].[StaffSchoolAssociation].CalendarCode,(
	select top (1) CalendarCode 
	  from [edfi].[Calendar] cal
	 where cal.SchoolId=[edfi].[StaffSectionAssociation].SchoolId
	   and cal.SchoolYear=[edfi].[StaffSectionAssociation].SchoolYear
	))
    --</MappingInfoStatus>
    )

    ,[Calendar_Track_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Calendar_Track_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Term_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Term_Cd">
    IsNull((
	select top(1) d.CodeValue
	  from [edfi].[Session] x
	  join [edfi].[Descriptor] d on d.DescriptorId=x.TermDescriptorId
	 where x.SchoolId=[edfi].[StaffSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StaffSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StaffSectionAssociation].SessionName
	),'--')
    --</MappingInfoStatus>
    )

    ,[Course_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Course_Cd">
    IsNull((
	select top(1) co.CourseCode
	  FROM [edfi].[Section] x
	  join [edfi].[CourseOffering] co
		on co.SchoolId=x.SchoolId
	   and co.SchoolYear=x.SchoolYear
	   and co.SessionName=x.SessionName
	   and co.LocalCourseCode=x.LocalCourseCode
	 where x.SchoolId=[edfi].[StaffSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StaffSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StaffSectionAssociation].SessionName
	   and x.SectionIdentifier=[edfi].[StaffSectionAssociation].SectionIdentifier
	),'--')

    --</MappingInfoStatus>
    )

    ,[Course_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Course_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Course_Section_Identifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Course_Section_Identifier">
    [edfi].[StaffSectionAssociation].SectionIdentifier
    --</MappingInfoStatus>
    )

    ,[Local_Staff_Id]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Local_Staff_Id">
    IsNull((
	select top (1) s.StaffUniqueId
	  from [edfi].[Staff] s
	 where s.StaffUSI=[edfi].[StaffSectionAssociation].StaffUSI
	),'')
    --</MappingInfoStatus>
    )

    ,[School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="School_Id">
    [edfi].[StaffSectionAssociation].SchoolId
    --</MappingInfoStatus>
    )

    ,[Cycle_Day_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="H" Column="Cycle_Day_Cd">
    '--' -- Hold till Bell Schedules and Cycle Days (A day, B day) are implemented.
    --</MappingInfoStatus>
    )

    ,[Start-Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="Start-Period_Cd">
    IsNull((
	select top(1) x.ClassPeriodName
	  from [edfi].[SectionClassPeriod] x
	 where x.SchoolId=[edfi].[StaffSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StaffSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StaffSectionAssociation].SessionName
	),'--')
    --</MappingInfoStatus>
    )

    ,[Start-Period_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="Start-Period_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[End-Period_Cd]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="End-Period_Cd">
    IsNull((
	select top(1) x.ClassPeriodName
	  from [edfi].[SectionClassPeriod] x
	 where x.SchoolId=[edfi].[StaffSectionAssociation].SchoolId
	   and x.SchoolYear=[edfi].[StaffSectionAssociation].SchoolYear
	   and x.SessionName=[edfi].[StaffSectionAssociation].SessionName
	),'--')
    --</MappingInfoStatus>
    )

    ,[End-Period_School_Id]=convert(VarChar(16),
    --<MappingInfoStatus Status="C" Column="End-Period_School_Id">
    [edfi].[School].SchoolId
    --</MappingInfoStatus>
    )

    ,[Entered-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Entered-Date_Of_Day">
    IsNull([edfi].[StaffSectionAssociation].BeginDate,'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Exited-Date_Of_Day]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Exited-Date_Of_Day">
    IsNull([edfi].[StaffSectionAssociation].EndDate,'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Entered_Calendar_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Entered_Calendar_Date">
    IsNull([edfi].[StaffSectionAssociation].BeginDate,'1753-01-01')
    --</MappingInfoStatus>
    )

    ,[Exited_Calendar_Date]=convert(Date,
    --<MappingInfoStatus Status="C" Column="Exited_Calendar_Date">
    IsNull([edfi].[StaffSectionAssociation].EndDate,'9999-12-31')
    --</MappingInfoStatus>
    )

    ,[Course_Enroll_Count]=convert(Decimal(9,2),
    --<MappingInfoStatus Status="C" Column="Course_Enroll_Count">
    1
    --</MappingInfoStatus>
    )

    ,[Primary_Secondary_CD]=convert(Char(2),
    --<MappingInfoStatus Status="C" Column="Primary_Secondary_CD">
    IsNull((
	select top (1) 
	  case when d.CodeValue in ('Preschool/Prekindergarten','Kindergarten','First grade','Second grade','Third grade','Fourth grade','Fifth grade') then 'P'
	       when d.CodeValue in ('Sixth grade','Seventh grade','Eighth grade','Ninth grade','Tenth grade','Eleventh grade','Twelfth grade') then 'S'
		   else '' end
	  from [edfi].[StaffSchoolAssociationGradeLevel] x
	  join [edfi].[Descriptor] d on d.Descriptorid=x.GradeLevelDescriptorId
	 where x.StaffUSI=[edfi].[StaffSectionAssociation].StaffUSI
	   and x.SchoolId=[edfi].[StaffSectionAssociation].SchoolId
	 order by d.DescriptorId
	),'')
    --</MappingInfoStatus>
    )

    ,[Batch_Period]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="Batch_Period">
    [edfi].[StaffSectionAssociation].SchoolYear
    --</MappingInfoStatus>
    )

    ,[SAID]=convert(VarChar(30),
    --<MappingInfoStatus Status="C" Column="SAID">
    [edfi].[StaffSectionAssociation].SAID
    --</MappingInfoStatus>
    )

    ,[Date_Stamp]=convert(DateTime2,
    --<MappingInfoStatus Status="C" Column="Date_Stamp">
    [edfi].[StaffSectionAssociation].LastModifiedDate
    --</MappingInfoStatus>
    )

    ,[SourceIdentifier]=convert(VarChar(50),
    --<MappingInfoStatus Status="C" Column="SourceIdentifier">
    [edfi].[StaffSectionAssociation].Id
    --</MappingInfoStatus>
    )

  --<MappingInfoFrom> 
  from [edfi].[StaffSectionAssociation]
  join [edfi].[School] on [edfi].[School].SchoolId=[edfi].[StaffSectionAssociation].SchoolId
  join [edfi].[StaffSchoolAssociation]
    on [edfi].[StaffSchoolAssociation].SchoolId=[edfi].[StaffSectionAssociation].SchoolId
   and [edfi].[StaffSchoolAssociation].StaffUSI=[edfi].[StaffSectionAssociation].StaffUSI

  where (@Batch_Period_List='all' or [edfi].[StaffSectionAssociation].SchoolYear in (select Batch_Period from @BPLtable))
    and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StaffSectionAssociation].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>
GO
