/***  OtisEd iMart EdFi Starter Data Warehouse version 1.0 
	  Perform TDW Load (Step 5)
***/
use [iMartEdFi]

declare @Sql nvarchar(max)
declare @ExecTime datetime2

/*** dim_Academic_Year ***/
if exists (select * from sys.objects where type='U' and name='dim_Academic_Year' and schema_name(schema_id)='ready') drop table ready.[dim_Academic_Year]

create table ready.[dim_Academic_Year] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Academic_Year_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Academic_Year_Name] char(9),[Academic_Year_Short_Name] char(5),[Start_Year] int,[End_Year] int,[Academic_Year_Nbr_Sequence] int,[State_Funded_School_Days_In_Year] int,[Current_Academic_Year_Ind] char(1),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Academic_Year_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Academic_Year] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Academic_Year_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Academic_Year_Name],[Academic_Year_Short_Name],[Start_Year],[End_Year],[Academic_Year_Nbr_Sequence],[State_Funded_School_Days_In_Year],[Current_Academic_Year_Ind],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Academic_Year_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Academic_Year]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Academic_Year] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Academic_Year] ([HASH_KEY_BK],[HASH_KEY_T1],[Academic_Year_Name],[Academic_Year_Short_Name],[Start_Year],[End_Year],[Academic_Year_Nbr_Sequence],[State_Funded_School_Days_In_Year],[Current_Academic_Year_Ind],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Academic_Year_Name],[Academic_Year_Short_Name],[Start_Year],[End_Year],[Academic_Year_Nbr_Sequence],[State_Funded_School_Days_In_Year],[Current_Academic_Year_Ind],[Date_Stamp],null,'N'
from ready.[dim_Academic_Year] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Academic_Year_Short_Name]=b.[Academic_Year_Short_Name] ,[Start_Year]=b.[Start_Year] ,[End_Year]=b.[End_Year] ,[Academic_Year_Nbr_Sequence]=b.[Academic_Year_Nbr_Sequence] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Academic_Year] a
  join ready.[dim_Academic_Year] b on a.[Academic_Year_Key]=b.[Academic_Year_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Academic_Year ***/
if exists (select * from sys.objects where type='U' and name='dim_Attendance' and schema_name(schema_id)='ready') drop table ready.[dim_Attendance]

create table ready.[dim_Attendance] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Attendance_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Attendance_Category_Cd] varchar(30),[Attendance_State_Category_Cd] varchar(30),[Attendance_Cd] varchar(30),[Attendance_Desc] varchar(254),[Attendance_Sort_Order] smallint,[Attendance_State_Cd] varchar(30),[Attendance_State_Desc] varchar(254),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Attendance_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Attendance] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Attendance_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Attendance_Category_Cd],[Attendance_State_Category_Cd],[Attendance_Cd],[Attendance_Desc],[Attendance_Sort_Order],[Attendance_State_Cd],[Attendance_State_Desc],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Attendance_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Attendance]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Attendance] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Attendance] ([HASH_KEY_BK],[HASH_KEY_T1],[Attendance_Category_Cd],[Attendance_State_Category_Cd],[Attendance_Cd],[Attendance_Desc],[Attendance_Sort_Order],[Attendance_State_Cd],[Attendance_State_Desc],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Attendance_Category_Cd],[Attendance_State_Category_Cd],[Attendance_Cd],[Attendance_Desc],[Attendance_Sort_Order],[Attendance_State_Cd],[Attendance_State_Desc],[Date_Stamp],null,'N'
from ready.[dim_Attendance] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Attendance_State_Category_Cd]=b.[Attendance_State_Category_Cd] ,[Attendance_Desc]=b.[Attendance_Desc] ,[Attendance_State_Cd]=b.[Attendance_State_Cd] ,[Attendance_State_Desc]=b.[Attendance_State_Desc] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Attendance] a
  join ready.[dim_Attendance] b on a.[Attendance_Key]=b.[Attendance_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Calendar_Day_Type ***/
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Day_Type' and schema_name(schema_id)='ready') drop table ready.[dim_Calendar_Day_Type]

create table ready.[dim_Calendar_Day_Type] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Calendar_Day_Type_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Calendar_Day_Type_Cd] varchar(30),[Calendar_Day_Type_Desc] varchar(254),[Calendar_Day_Type_Sort_Order] smallint,[School_Day_Ind] char(1),[Holiday_Ind] char(1),[Staff_Day_Ind] char(1),[Calendar_Day_Type_Planned_Make_Up_Day_Ind] char(1),[Calendar_Day_Type_Actual_Make_Up_Day_Ind] char(1),[Calendar_Day_Type_Inclement_Weather_Day_Ind] char(1),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Calendar_Day_Type_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Calendar_Day_Type] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Calendar_Day_Type_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Day_Type_Cd],[Calendar_Day_Type_Desc],[Calendar_Day_Type_Sort_Order],[School_Day_Ind],[Holiday_Ind],[Staff_Day_Ind],[Calendar_Day_Type_Planned_Make_Up_Day_Ind],[Calendar_Day_Type_Actual_Make_Up_Day_Ind],[Calendar_Day_Type_Inclement_Weather_Day_Ind],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Calendar_Day_Type_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Calendar_Day_Type]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Calendar_Day_Type] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Calendar_Day_Type] ([HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Day_Type_Cd],[Calendar_Day_Type_Desc],[Calendar_Day_Type_Sort_Order],[School_Day_Ind],[Holiday_Ind],[Staff_Day_Ind],[Calendar_Day_Type_Planned_Make_Up_Day_Ind],[Calendar_Day_Type_Actual_Make_Up_Day_Ind],[Calendar_Day_Type_Inclement_Weather_Day_Ind],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Day_Type_Cd],[Calendar_Day_Type_Desc],[Calendar_Day_Type_Sort_Order],[School_Day_Ind],[Holiday_Ind],[Staff_Day_Ind],[Calendar_Day_Type_Planned_Make_Up_Day_Ind],[Calendar_Day_Type_Actual_Make_Up_Day_Ind],[Calendar_Day_Type_Inclement_Weather_Day_Ind],[Date_Stamp],null,'N'
from ready.[dim_Calendar_Day_Type] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Calendar_Day_Type_Desc]=b.[Calendar_Day_Type_Desc] ,[School_Day_Ind]=b.[School_Day_Ind] ,[Holiday_Ind]=b.[Holiday_Ind] ,[Staff_Day_Ind]=b.[Staff_Day_Ind] ,[Calendar_Day_Type_Planned_Make_Up_Day_Ind]=b.[Calendar_Day_Type_Planned_Make_Up_Day_Ind] ,[Calendar_Day_Type_Actual_Make_Up_Day_Ind]=b.[Calendar_Day_Type_Actual_Make_Up_Day_Ind] ,[Calendar_Day_Type_Inclement_Weather_Day_Ind]=b.[Calendar_Day_Type_Inclement_Weather_Day_Ind] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Calendar_Day_Type] a
  join ready.[dim_Calendar_Day_Type] b on a.[Calendar_Day_Type_Key]=b.[Calendar_Day_Type_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Calendar_Track ***/
if exists (select * from sys.objects where type='U' and name='dim_Calendar_Track' and schema_name(schema_id)='ready') drop table ready.[dim_Calendar_Track]

create table ready.[dim_Calendar_Track] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Calendar_Track_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Calendar_Track_School_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Calendar_Track_Desc] varchar(254),[Calendar_Track_Sort_Order] smallint,[Summer_School_Ind] char(1),[Track_First_Instructional_Date] date,[Track_Last_Instructional_Date] date,[Track_Planned_Instructional_Days] smallint,[Track_Instructional_Minutes] smallint,[Track_Whole_Day_Absences_Minutes] smallint,[Track_Half_Day_Absences_Minutes] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Calendar_Track_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Calendar_Track] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Calendar_Track_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_School_Id],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Instructional_Minutes],[Track_Whole_Day_Absences_Minutes],[Track_Half_Day_Absences_Minutes],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Calendar_Track_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Calendar_Track]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Calendar_Track] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Calendar_Track] ([HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_School_Id],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Instructional_Minutes],[Track_Whole_Day_Absences_Minutes],[Track_Half_Day_Absences_Minutes],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_School_Id],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Instructional_Minutes],[Track_Whole_Day_Absences_Minutes],[Track_Half_Day_Absences_Minutes],[Date_Stamp],null,'N'
from ready.[dim_Calendar_Track] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Calendar_Track_Desc]=b.[Calendar_Track_Desc] ,[Summer_School_Ind]=b.[Summer_School_Ind] ,[Track_First_Instructional_Date]=b.[Track_First_Instructional_Date] ,[Track_Last_Instructional_Date]=b.[Track_Last_Instructional_Date] ,[Track_Planned_Instructional_Days]=b.[Track_Planned_Instructional_Days] ,[Track_Instructional_Minutes]=b.[Track_Instructional_Minutes] ,[Track_Whole_Day_Absences_Minutes]=b.[Track_Whole_Day_Absences_Minutes] ,[Track_Half_Day_Absences_Minutes]=b.[Track_Half_Day_Absences_Minutes] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Calendar_Track] a
  join ready.[dim_Calendar_Track] b on a.[Calendar_Track_Key]=b.[Calendar_Track_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Course ***/
if exists (select * from sys.objects where type='U' and name='dim_Course' and schema_name(schema_id)='ready') drop table ready.[dim_Course]

create table ready.[dim_Course] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Course_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Course_Cd] varchar(30),[Course_Title] varchar(60),[Course_Desc] varchar(254),[Course_State_Cd] varchar(30),[Course_State_Title] varchar(60),[Course_State_Code_Desc] varchar(254),[Course_Department_Desc] varchar(60),[Course_Active_Ind] char(1),[Course_Level_Cd] varchar(30),[Advanced_Placement_Cd] varchar(60),[Advanced_Placement_Desc] varchar(254),[SCED_Course_Cd] char(5),[SCED_Course_Subject_Cd] char(2),[SCED_Course_Sequence] varchar(10),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Course_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Course] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Course_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Course_Cd],[Course_Title],[Course_Desc],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Course_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Course]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Course] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Course] ([HASH_KEY_BK],[HASH_KEY_T1],[Course_Cd],[Course_Title],[Course_Desc],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Course_Cd],[Course_Title],[Course_Desc],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Date_Stamp],null,'N'
from ready.[dim_Course] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Course_Title]=b.[Course_Title] ,[Course_Desc]=b.[Course_Desc] ,[Course_State_Cd]=b.[Course_State_Cd] ,[Course_State_Title]=b.[Course_State_Title] ,[Course_State_Code_Desc]=b.[Course_State_Code_Desc] ,[Course_Department_Desc]=b.[Course_Department_Desc] ,[Course_Active_Ind]=b.[Course_Active_Ind] ,[Course_Level_Cd]=b.[Course_Level_Cd] ,[Advanced_Placement_Cd]=b.[Advanced_Placement_Cd] ,[Advanced_Placement_Desc]=b.[Advanced_Placement_Desc] ,[SCED_Course_Cd]=b.[SCED_Course_Cd] ,[SCED_Course_Subject_Cd]=b.[SCED_Course_Subject_Cd] ,[SCED_Course_Sequence]=b.[SCED_Course_Sequence] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Course] a
  join ready.[dim_Course] b on a.[Course_Key]=b.[Course_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Course_Section ***/
if exists (select * from sys.objects where type='U' and name='dim_Course_Section' and schema_name(schema_id)='ready') drop table ready.[dim_Course_Section]

create table ready.[dim_Course_Section] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Course_Section_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Course_Key] int,[Course_School_Id] varchar(16),[Course_Cd] varchar(30),[Course_Section_Identifier] varchar(50),[Course_Section_Cd] varchar(30),[Course_School_Name] varchar(60),[Course_Title] varchar(60),[Course_Desc] varchar(254),[Course_Sort_Order] smallint,[Course_State_Cd] varchar(30),[Course_State_Title] varchar(60),[Course_State_Code_Desc] varchar(254),[Course_Department_Desc] varchar(60),[Course_Active_Ind] char(1),[Course_Level_Cd] varchar(30),[Course_Level_Sort_Order] smallint,[Advanced_Placement_Cd] varchar(60),[Advanced_Placement_Desc] varchar(254),[Course_Credit_Value] decimal(9,2),[SCED_Course_Cd] char(5),[SCED_Course_Subject_Cd] char(2),[SCED_Course_Sequence] varchar(10),[Classroom_Identifier] varchar(30),[Delivery_Mode_Cd] varchar(30),[Delivery_Mode_Desc] varchar(254),[Primary_Teacher_Unique_Id] varchar(30),[Primary_Teacher_Full_Name] varchar(254),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Course_Section_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Course_Section] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Course_Section_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Course_Key],[Course_School_Id],[Course_Cd],[Course_Section_Identifier],[Course_Section_Cd],[Course_School_Name],[Course_Title],[Course_Desc],[Course_Sort_Order],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Course_Level_Sort_Order],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[Course_Credit_Value],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Classroom_Identifier],[Delivery_Mode_Cd],[Delivery_Mode_Desc],[Primary_Teacher_Unique_Id],[Primary_Teacher_Full_Name],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Course_Section_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Course_Section]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Course_Section] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Course_Section] ([HASH_KEY_BK],[HASH_KEY_T1],[Course_Key],[Course_School_Id],[Course_Cd],[Course_Section_Identifier],[Course_Section_Cd],[Course_School_Name],[Course_Title],[Course_Desc],[Course_Sort_Order],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Course_Level_Sort_Order],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[Course_Credit_Value],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Classroom_Identifier],[Delivery_Mode_Cd],[Delivery_Mode_Desc],[Primary_Teacher_Unique_Id],[Primary_Teacher_Full_Name],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Course_Key],[Course_School_Id],[Course_Cd],[Course_Section_Identifier],[Course_Section_Cd],[Course_School_Name],[Course_Title],[Course_Desc],[Course_Sort_Order],[Course_State_Cd],[Course_State_Title],[Course_State_Code_Desc],[Course_Department_Desc],[Course_Active_Ind],[Course_Level_Cd],[Course_Level_Sort_Order],[Advanced_Placement_Cd],[Advanced_Placement_Desc],[Course_Credit_Value],[SCED_Course_Cd],[SCED_Course_Subject_Cd],[SCED_Course_Sequence],[Classroom_Identifier],[Delivery_Mode_Cd],[Delivery_Mode_Desc],[Primary_Teacher_Unique_Id],[Primary_Teacher_Full_Name],[Date_Stamp],null,'N'
from ready.[dim_Course_Section] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Course_Section_Cd]=b.[Course_Section_Cd] ,[Course_School_Name]=b.[Course_School_Name] ,[Course_Title]=b.[Course_Title] ,[Course_Desc]=b.[Course_Desc] ,[Course_State_Cd]=b.[Course_State_Cd] ,[Course_State_Title]=b.[Course_State_Title] ,[Course_State_Code_Desc]=b.[Course_State_Code_Desc] ,[Course_Department_Desc]=b.[Course_Department_Desc] ,[Course_Active_Ind]=b.[Course_Active_Ind] ,[Course_Level_Cd]=b.[Course_Level_Cd] ,[Advanced_Placement_Cd]=b.[Advanced_Placement_Cd] ,[Advanced_Placement_Desc]=b.[Advanced_Placement_Desc] ,[Course_Credit_Value]=b.[Course_Credit_Value] ,[SCED_Course_Cd]=b.[SCED_Course_Cd] ,[SCED_Course_Subject_Cd]=b.[SCED_Course_Subject_Cd] ,[SCED_Course_Sequence]=b.[SCED_Course_Sequence] ,[Classroom_Identifier]=b.[Classroom_Identifier] ,[Delivery_Mode_Cd]=b.[Delivery_Mode_Cd] ,[Delivery_Mode_Desc]=b.[Delivery_Mode_Desc] ,[Primary_Teacher_Unique_Id]=b.[Primary_Teacher_Unique_Id] ,[Primary_Teacher_Full_Name]=b.[Primary_Teacher_Full_Name] ,[Course_Key]=b.[Course_Key] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Course_Section] a
  join ready.[dim_Course_Section] b on a.[Course_Section_Key]=b.[Course_Section_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Cycle_Day ***/
if exists (select * from sys.objects where type='U' and name='dim_Cycle_Day' and schema_name(schema_id)='ready') drop table ready.[dim_Cycle_Day]

create table ready.[dim_Cycle_Day] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Cycle_Day_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Cycle_Day_Cd] varchar(30),[Cycle_Day_Desc] varchar(254),[Cycle_Day_Sort_Order] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Cycle_Day_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Cycle_Day] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Cycle_Day_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Cycle_Day_Cd],[Cycle_Day_Desc],[Cycle_Day_Sort_Order],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Cycle_Day_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Cycle_Day]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Cycle_Day] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Cycle_Day] ([HASH_KEY_BK],[HASH_KEY_T1],[Cycle_Day_Cd],[Cycle_Day_Desc],[Cycle_Day_Sort_Order],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Cycle_Day_Cd],[Cycle_Day_Desc],[Cycle_Day_Sort_Order],[Date_Stamp],null,'N'
from ready.[dim_Cycle_Day] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Cycle_Day_Desc]=b.[Cycle_Day_Desc] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Cycle_Day] a
  join ready.[dim_Cycle_Day] b on a.[Cycle_Day_Key]=b.[Cycle_Day_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Date ***/
if exists (select * from sys.objects where type='U' and name='dim_Date' and schema_name(schema_id)='ready') drop table ready.[dim_Date]

create table ready.[dim_Date] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Date_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Date_Record_Type] char(1),[Year_Name] char(4),[Year_Number_Sequence] int,[Year_Begin_Date] date,[Year_End_Date] date,[Days_In_Year] smallint,[Quarter_Name] char(2),[Year_Quarter_Name] char(7),[Quarter_Number_In_Year] tinyint,[Quarter_Number_Sequence] int,[Quarter_Begin_Date] date,[Quarter_End_Date] date,[Days_In_Quarter] tinyint,[Month_Name] varchar(9),[Month_Year_Name] varchar(14),[Year_Month_Yyyy_Mm] char(7),[Month_Abbr] char(3),[Month_Year_Abbr] char(8),[Month_Number_In_Year] tinyint,[Month_Number_In_Quarter] tinyint,[Month_Number_Sequence] int,[Month_Begin_Date] date,[Month_End_Date] date,[Days_In_Month] tinyint,[Week_Name] char(7),[Week_Abbr] char(4),[Year_Week_Name] char(12),[Year_Week_Abbr] char(9),[Week_Desc_Short] char(19),[Week_Desc] char(32),[Week_Begin_Date] date,[Week_End_Date] date,[Week_Number_In_Year] tinyint,[Week_Number_Sequence] int,[Date_Of_Day] date,[Date_String] char(10),[Date_Desc] varchar(30),[Date_Desc_Short] char(16),[Day_Number_In_Year] smallint,[First_Day_In_Year_Ind] char(1),[Last_Day_In_Year_Ind] char(1),[Day_Number_In_Quarter] tinyint,[First_Day_In_Quarter_Ind] char(1),[Last_Day_In_Quarter_Ind] char(1),[Day_Number_In_Month] tinyint,[First_Day_In_Month_Ind] char(1),[Last_Day_In_Month_Ind] char(1),[Weekday_Name] char(9),[Weekday_Abbr] char(3),[Day_Number_In_Week] tinyint,[First_Day_In_Week_Ind] char(1),[Last_Day_In_Week_Ind] char(1),[Day_Number_Sequence] int,[Weekday_Ind] char(1),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Date_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Date] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Date_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Date_Record_Type],[Year_Name],[Year_Number_Sequence],[Year_Begin_Date],[Year_End_Date],[Days_In_Year],[Quarter_Name],[Year_Quarter_Name],[Quarter_Number_In_Year],[Quarter_Number_Sequence],[Quarter_Begin_Date],[Quarter_End_Date],[Days_In_Quarter],[Month_Name],[Month_Year_Name],[Year_Month_Yyyy_Mm],[Month_Abbr],[Month_Year_Abbr],[Month_Number_In_Year],[Month_Number_In_Quarter],[Month_Number_Sequence],[Month_Begin_Date],[Month_End_Date],[Days_In_Month],[Week_Name],[Week_Abbr],[Year_Week_Name],[Year_Week_Abbr],[Week_Desc_Short],[Week_Desc],[Week_Begin_Date],[Week_End_Date],[Week_Number_In_Year],[Week_Number_Sequence],[Date_Of_Day],[Date_String],[Date_Desc],[Date_Desc_Short],[Day_Number_In_Year],[First_Day_In_Year_Ind],[Last_Day_In_Year_Ind],[Day_Number_In_Quarter],[First_Day_In_Quarter_Ind],[Last_Day_In_Quarter_Ind],[Day_Number_In_Month],[First_Day_In_Month_Ind],[Last_Day_In_Month_Ind],[Weekday_Name],[Weekday_Abbr],[Day_Number_In_Week],[First_Day_In_Week_Ind],[Last_Day_In_Week_Ind],[Day_Number_Sequence],[Weekday_Ind],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Date_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Date]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Date] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Date] ([HASH_KEY_BK],[HASH_KEY_T1],[Date_Record_Type],[Year_Name],[Year_Number_Sequence],[Year_Begin_Date],[Year_End_Date],[Days_In_Year],[Quarter_Name],[Year_Quarter_Name],[Quarter_Number_In_Year],[Quarter_Number_Sequence],[Quarter_Begin_Date],[Quarter_End_Date],[Days_In_Quarter],[Month_Name],[Month_Year_Name],[Year_Month_Yyyy_Mm],[Month_Abbr],[Month_Year_Abbr],[Month_Number_In_Year],[Month_Number_In_Quarter],[Month_Number_Sequence],[Month_Begin_Date],[Month_End_Date],[Days_In_Month],[Week_Name],[Week_Abbr],[Year_Week_Name],[Year_Week_Abbr],[Week_Desc_Short],[Week_Desc],[Week_Begin_Date],[Week_End_Date],[Week_Number_In_Year],[Week_Number_Sequence],[Date_Of_Day],[Date_String],[Date_Desc],[Date_Desc_Short],[Day_Number_In_Year],[First_Day_In_Year_Ind],[Last_Day_In_Year_Ind],[Day_Number_In_Quarter],[First_Day_In_Quarter_Ind],[Last_Day_In_Quarter_Ind],[Day_Number_In_Month],[First_Day_In_Month_Ind],[Last_Day_In_Month_Ind],[Weekday_Name],[Weekday_Abbr],[Day_Number_In_Week],[First_Day_In_Week_Ind],[Last_Day_In_Week_Ind],[Day_Number_Sequence],[Weekday_Ind],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Date_Record_Type],[Year_Name],[Year_Number_Sequence],[Year_Begin_Date],[Year_End_Date],[Days_In_Year],[Quarter_Name],[Year_Quarter_Name],[Quarter_Number_In_Year],[Quarter_Number_Sequence],[Quarter_Begin_Date],[Quarter_End_Date],[Days_In_Quarter],[Month_Name],[Month_Year_Name],[Year_Month_Yyyy_Mm],[Month_Abbr],[Month_Year_Abbr],[Month_Number_In_Year],[Month_Number_In_Quarter],[Month_Number_Sequence],[Month_Begin_Date],[Month_End_Date],[Days_In_Month],[Week_Name],[Week_Abbr],[Year_Week_Name],[Year_Week_Abbr],[Week_Desc_Short],[Week_Desc],[Week_Begin_Date],[Week_End_Date],[Week_Number_In_Year],[Week_Number_Sequence],[Date_Of_Day],[Date_String],[Date_Desc],[Date_Desc_Short],[Day_Number_In_Year],[First_Day_In_Year_Ind],[Last_Day_In_Year_Ind],[Day_Number_In_Quarter],[First_Day_In_Quarter_Ind],[Last_Day_In_Quarter_Ind],[Day_Number_In_Month],[First_Day_In_Month_Ind],[Last_Day_In_Month_Ind],[Weekday_Name],[Weekday_Abbr],[Day_Number_In_Week],[First_Day_In_Week_Ind],[Last_Day_In_Week_Ind],[Day_Number_Sequence],[Weekday_Ind],[Date_Stamp],null,'N'
from ready.[dim_Date] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Date_Record_Type]=b.[Date_Record_Type] ,[Year_Name]=b.[Year_Name] ,[Year_Number_Sequence]=b.[Year_Number_Sequence] ,[Year_Begin_Date]=b.[Year_Begin_Date] ,[Year_End_Date]=b.[Year_End_Date] ,[Days_In_Year]=b.[Days_In_Year] ,[Quarter_Name]=b.[Quarter_Name] ,[Year_Quarter_Name]=b.[Year_Quarter_Name] ,[Quarter_Number_In_Year]=b.[Quarter_Number_In_Year] ,[Quarter_Number_Sequence]=b.[Quarter_Number_Sequence] ,[Quarter_Begin_Date]=b.[Quarter_Begin_Date] ,[Quarter_End_Date]=b.[Quarter_End_Date] ,[Days_In_Quarter]=b.[Days_In_Quarter] ,[Month_Name]=b.[Month_Name] ,[Month_Year_Name]=b.[Month_Year_Name] ,[Year_Month_Yyyy_Mm]=b.[Year_Month_Yyyy_Mm] ,[Month_Abbr]=b.[Month_Abbr] ,[Month_Year_Abbr]=b.[Month_Year_Abbr] ,[Month_Number_In_Year]=b.[Month_Number_In_Year] ,[Month_Number_In_Quarter]=b.[Month_Number_In_Quarter] ,[Month_Number_Sequence]=b.[Month_Number_Sequence] ,[Month_Begin_Date]=b.[Month_Begin_Date] ,[Month_End_Date]=b.[Month_End_Date] ,[Days_In_Month]=b.[Days_In_Month] ,[Week_Name]=b.[Week_Name] ,[Week_Abbr]=b.[Week_Abbr] ,[Year_Week_Name]=b.[Year_Week_Name] ,[Year_Week_Abbr]=b.[Year_Week_Abbr] ,[Week_Desc_Short]=b.[Week_Desc_Short] ,[Week_Desc]=b.[Week_Desc] ,[Week_Begin_Date]=b.[Week_Begin_Date] ,[Week_End_Date]=b.[Week_End_Date] ,[Week_Number_In_Year]=b.[Week_Number_In_Year] ,[Week_Number_Sequence]=b.[Week_Number_Sequence] ,[Date_String]=b.[Date_String] ,[Date_Desc]=b.[Date_Desc] ,[Date_Desc_Short]=b.[Date_Desc_Short] ,[Day_Number_In_Year]=b.[Day_Number_In_Year] ,[First_Day_In_Year_Ind]=b.[First_Day_In_Year_Ind] ,[Last_Day_In_Year_Ind]=b.[Last_Day_In_Year_Ind] ,[Day_Number_In_Quarter]=b.[Day_Number_In_Quarter] ,[First_Day_In_Quarter_Ind]=b.[First_Day_In_Quarter_Ind] ,[Last_Day_In_Quarter_Ind]=b.[Last_Day_In_Quarter_Ind] ,[Day_Number_In_Month]=b.[Day_Number_In_Month] ,[First_Day_In_Month_Ind]=b.[First_Day_In_Month_Ind] ,[Last_Day_In_Month_Ind]=b.[Last_Day_In_Month_Ind] ,[Weekday_Name]=b.[Weekday_Name] ,[Weekday_Abbr]=b.[Weekday_Abbr] ,[Day_Number_In_Week]=b.[Day_Number_In_Week] ,[First_Day_In_Week_Ind]=b.[First_Day_In_Week_Ind] ,[Last_Day_In_Week_Ind]=b.[Last_Day_In_Week_Ind] ,[Day_Number_Sequence]=b.[Day_Number_Sequence] ,[Weekday_Ind]=b.[Weekday_Ind] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Date] a
  join ready.[dim_Date] b on a.[Date_Key]=b.[Date_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_District ***/
if exists (select * from sys.objects where type='U' and name='dim_District' and schema_name(schema_id)='ready') drop table ready.[dim_District]

create table ready.[dim_District] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[District_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[District_Id] varchar(16),[District_Name] varchar(60),[Superintendent_Name] varchar(36),[State_Abbr] char(2),[State_Name] varchar(50),[County_Name] varchar(50),[REA_Name] varchar(60),[REA_Abbr] varchar(36),[District_Academic_Year_Began] varchar(9),[District_Academic_Year_Ended] varchar(9),[District_Phone] varchar(24),[District_Address_1] varchar(36),[District_Address_2] varchar(36),[District_City] varchar(24),[District_State] varchar(2),[District_Postal_Cd] varchar(10),[District_Latitude] decimal(9,6),[District_Longitude] decimal(9,6),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[District_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_District] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[District_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[District_Id],[District_Name],[Superintendent_Name],[State_Abbr],[State_Name],[County_Name],[REA_Name],[REA_Abbr],[District_Academic_Year_Began],[District_Academic_Year_Ended],[District_Phone],[District_Address_1],[District_Address_2],[District_City],[District_State],[District_Postal_Cd],[District_Latitude],[District_Longitude],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[District_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_District]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_District] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_District] ([HASH_KEY_BK],[HASH_KEY_T1],[District_Id],[District_Name],[Superintendent_Name],[State_Abbr],[State_Name],[County_Name],[REA_Name],[REA_Abbr],[District_Academic_Year_Began],[District_Academic_Year_Ended],[District_Phone],[District_Address_1],[District_Address_2],[District_City],[District_State],[District_Postal_Cd],[District_Latitude],[District_Longitude],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[District_Id],[District_Name],[Superintendent_Name],[State_Abbr],[State_Name],[County_Name],[REA_Name],[REA_Abbr],[District_Academic_Year_Began],[District_Academic_Year_Ended],[District_Phone],[District_Address_1],[District_Address_2],[District_City],[District_State],[District_Postal_Cd],[District_Latitude],[District_Longitude],[Date_Stamp],null,'N'
from ready.[dim_District] where NewRowFlag = 1 and DiscardFlag = 0

update a set [District_Name]=b.[District_Name] ,[Superintendent_Name]=b.[Superintendent_Name] ,[State_Abbr]=b.[State_Abbr] ,[State_Name]=b.[State_Name] ,[County_Name]=b.[County_Name] ,[REA_Name]=b.[REA_Name] ,[REA_Abbr]=b.[REA_Abbr] ,[District_Academic_Year_Began]=b.[District_Academic_Year_Began] ,[District_Academic_Year_Ended]=b.[District_Academic_Year_Ended] ,[District_Phone]=b.[District_Phone] ,[District_Address_1]=b.[District_Address_1] ,[District_Address_2]=b.[District_Address_2] ,[District_City]=b.[District_City] ,[District_State]=b.[District_State] ,[District_Postal_Cd]=b.[District_Postal_Cd] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_District] a
  join ready.[dim_District] b on a.[District_Key]=b.[District_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Enrollment ***/
if exists (select * from sys.objects where type='U' and name='dim_Enrollment' and schema_name(schema_id)='ready') drop table ready.[dim_Enrollment]

create table ready.[dim_Enrollment] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Enrollment_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Enrollment_Cd] varchar(30),[Enrollment_Desc] varchar(254),[Enrollment_State_Cd] varchar(30),[Enrollment_State_Desc] varchar(254),[Enrollment_Sort_Order] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Enrollment_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Enrollment] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Enrollment_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Enrollment_Cd],[Enrollment_Desc],[Enrollment_State_Cd],[Enrollment_State_Desc],[Enrollment_Sort_Order],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Enrollment_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Enrollment]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Enrollment] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Enrollment] ([HASH_KEY_BK],[HASH_KEY_T1],[Enrollment_Cd],[Enrollment_Desc],[Enrollment_State_Cd],[Enrollment_State_Desc],[Enrollment_Sort_Order],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Enrollment_Cd],[Enrollment_Desc],[Enrollment_State_Cd],[Enrollment_State_Desc],[Enrollment_Sort_Order],[Date_Stamp],null,'N'
from ready.[dim_Enrollment] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Enrollment_Desc]=b.[Enrollment_Desc] ,[Enrollment_State_Cd]=b.[Enrollment_State_Cd] ,[Enrollment_State_Desc]=b.[Enrollment_State_Desc] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Enrollment] a
  join ready.[dim_Enrollment] b on a.[Enrollment_Key]=b.[Enrollment_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Grade_Type ***/
if exists (select * from sys.objects where type='U' and name='dim_Grade_Type' and schema_name(schema_id)='ready') drop table ready.[dim_Grade_Type]

create table ready.[dim_Grade_Type] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Grade_Type_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Grade_Type_Cd] varchar(30),[Grade_Type_Desc] varchar(254),[Grade_Type_Sort_Order] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Grade_Type_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Grade_Type] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Grade_Type_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Grade_Type_Cd],[Grade_Type_Desc],[Grade_Type_Sort_Order],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Grade_Type_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Grade_Type]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Grade_Type] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Grade_Type] ([HASH_KEY_BK],[HASH_KEY_T1],[Grade_Type_Cd],[Grade_Type_Desc],[Grade_Type_Sort_Order],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Grade_Type_Cd],[Grade_Type_Desc],[Grade_Type_Sort_Order],[Date_Stamp],null,'N'
from ready.[dim_Grade_Type] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Grade_Type_Desc]=b.[Grade_Type_Desc] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Grade_Type] a
  join ready.[dim_Grade_Type] b on a.[Grade_Type_Key]=b.[Grade_Type_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Term ***/
if exists (select * from sys.objects where type='U' and name='dim_Term' and schema_name(schema_id)='ready') drop table ready.[dim_Term]

create table ready.[dim_Term] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Term_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Calendar_Track_Key] int,[Calendar_Track_Cd] varchar(30),[Calendar_Track_Desc] varchar(254),[Calendar_Track_Sort_Order] smallint,[Summer_School_Ind] char(1),[Track_First_Instructional_Date] date,[Track_Last_Instructional_Date] date,[Track_Planned_Instructional_Days] smallint,[Track_Actual_Instructional_Days] smallint,[Term_Cd] varchar(30),[Term_Desc] varchar(254),[Term_Sort_Order] smallint,[Term_First_Instructional_Date] date,[Term_Last_Instructional_Date] date,[Term_Planned_Instructional_Days] smallint,[Term_Actual_Instructional_Days] smallint,[Calendar_Track_School_Id] varchar(16),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Term_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Term] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Term_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_Key],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Actual_Instructional_Days],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Term_Planned_Instructional_Days],[Term_Actual_Instructional_Days],[Calendar_Track_School_Id],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Term_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Term]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Term] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Term] ([HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_Key],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Actual_Instructional_Days],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Term_Planned_Instructional_Days],[Term_Actual_Instructional_Days],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_Key],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Track_Planned_Instructional_Days],[Track_Actual_Instructional_Days],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Term_Planned_Instructional_Days],[Term_Actual_Instructional_Days],[Date_Stamp],null,'N'
from ready.[dim_Term] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Calendar_Track_Desc]=b.[Calendar_Track_Desc] ,[Summer_School_Ind]=b.[Summer_School_Ind] ,[Track_First_Instructional_Date]=b.[Track_First_Instructional_Date] ,[Track_Last_Instructional_Date]=b.[Track_Last_Instructional_Date] ,[Track_Planned_Instructional_Days]=b.[Track_Planned_Instructional_Days] ,[Track_Actual_Instructional_Days]=b.[Track_Actual_Instructional_Days] ,[Term_Desc]=b.[Term_Desc] ,[Term_First_Instructional_Date]=b.[Term_First_Instructional_Date] ,[Term_Last_Instructional_Date]=b.[Term_Last_Instructional_Date] ,[Term_Planned_Instructional_Days]=b.[Term_Planned_Instructional_Days] ,[Term_Actual_Instructional_Days]=b.[Term_Actual_Instructional_Days] ,[Calendar_Track_Key]=b.[Calendar_Track_Key] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Term] a
  join ready.[dim_Term] b on a.[Term_Key]=b.[Term_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Marking_Period ***/
if exists (select * from sys.objects where type='U' and name='dim_Marking_Period' and schema_name(schema_id)='ready') drop table ready.[dim_Marking_Period]

create table ready.[dim_Marking_Period] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Marking_Period_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Calendar_Track_Key] int,[Term_Key] int,[Calendar_Track_Cd] varchar(30),[Calendar_Track_Desc] varchar(254),[Calendar_Track_Sort_Order] smallint,[Summer_School_Ind] char(1),[Track_First_Instructional_Date] date,[Track_Last_Instructional_Date] date,[Term_Cd] varchar(30),[Term_Desc] varchar(254),[Term_Sort_Order] smallint,[Term_First_Instructional_Date] date,[Term_Last_Instructional_Date] date,[Marking_Period_Cd] varchar(30),[Marking_Period_Desc] varchar(254),[Marking_Period_Sort_Order] smallint,[Marking_Period_Begin_Date] date,[Marking_Period_End_Date] date,[Calendar_Track_School_Id] varchar(16),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Marking_Period_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Marking_Period] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Marking_Period_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_Key],[Term_Key],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Marking_Period_Cd],[Marking_Period_Desc],[Marking_Period_Sort_Order],[Marking_Period_Begin_Date],[Marking_Period_End_Date],[Calendar_Track_School_Id],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Marking_Period_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Marking_Period]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Marking_Period] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Marking_Period] ([HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_Key],[Term_Key],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Marking_Period_Cd],[Marking_Period_Desc],[Marking_Period_Sort_Order],[Marking_Period_Begin_Date],[Marking_Period_End_Date],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Calendar_Track_Key],[Term_Key],[Calendar_Track_Cd],[Calendar_Track_Desc],[Calendar_Track_Sort_Order],[Summer_School_Ind],[Track_First_Instructional_Date],[Track_Last_Instructional_Date],[Term_Cd],[Term_Desc],[Term_Sort_Order],[Term_First_Instructional_Date],[Term_Last_Instructional_Date],[Marking_Period_Cd],[Marking_Period_Desc],[Marking_Period_Sort_Order],[Marking_Period_Begin_Date],[Marking_Period_End_Date],[Date_Stamp],null,'N'
from ready.[dim_Marking_Period] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Calendar_Track_Desc]=b.[Calendar_Track_Desc] ,[Summer_School_Ind]=b.[Summer_School_Ind] ,[Track_First_Instructional_Date]=b.[Track_First_Instructional_Date] ,[Track_Last_Instructional_Date]=b.[Track_Last_Instructional_Date] ,[Term_Desc]=b.[Term_Desc] ,[Term_First_Instructional_Date]=b.[Term_First_Instructional_Date] ,[Term_Last_Instructional_Date]=b.[Term_Last_Instructional_Date] ,[Marking_Period_Desc]=b.[Marking_Period_Desc] ,[Marking_Period_Begin_Date]=b.[Marking_Period_Begin_Date] ,[Marking_Period_End_Date]=b.[Marking_Period_End_Date] ,[Calendar_Track_Key]=b.[Calendar_Track_Key] ,[Term_Key]=b.[Term_Key] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Marking_Period] a
  join ready.[dim_Marking_Period] b on a.[Marking_Period_Key]=b.[Marking_Period_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Period ***/
if exists (select * from sys.objects where type='U' and name='dim_Period' and schema_name(schema_id)='ready') drop table ready.[dim_Period]

create table ready.[dim_Period] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Period_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Period_School_Id] varchar(16),[Period_Cd] varchar(30),[Period_Desc] varchar(254),[Period_Sort_Order] smallint,[Period_Start_Time] time(7),[Period_End_Time] time(7),[Period_Noninstructional_Minutes] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Period_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Period] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Period_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Period_School_Id],[Period_Cd],[Period_Desc],[Period_Sort_Order],[Period_Start_Time],[Period_End_Time],[Period_Noninstructional_Minutes],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Period_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Period]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Period] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Period] ([HASH_KEY_BK],[HASH_KEY_T1],[Period_School_Id],[Period_Cd],[Period_Desc],[Period_Sort_Order],[Period_Start_Time],[Period_End_Time],[Period_Noninstructional_Minutes],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Period_School_Id],[Period_Cd],[Period_Desc],[Period_Sort_Order],[Period_Start_Time],[Period_End_Time],[Period_Noninstructional_Minutes],[Date_Stamp],null,'N'
from ready.[dim_Period] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Period_Desc]=b.[Period_Desc] ,[Period_Start_Time]=b.[Period_Start_Time] ,[Period_End_Time]=b.[Period_End_Time] ,[Period_Noninstructional_Minutes]=b.[Period_Noninstructional_Minutes] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Period] a
  join ready.[dim_Period] b on a.[Period_Key]=b.[Period_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Program ***/
if exists (select * from sys.objects where type='U' and name='dim_Program' and schema_name(schema_id)='ready') drop table ready.[dim_Program]

create table ready.[dim_Program] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Program_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Program_Cd] varchar(30),[Program_Desc] varchar(254),[Program_Sort_Order] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Program_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Program] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Program_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Program_Cd],[Program_Desc],[Program_Sort_Order],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Program_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Program]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Program] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Program] ([HASH_KEY_BK],[HASH_KEY_T1],[Program_Cd],[Program_Desc],[Program_Sort_Order],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Program_Cd],[Program_Desc],[Program_Sort_Order],[Date_Stamp],null,'N'
from ready.[dim_Program] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Program_Desc]=b.[Program_Desc] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Program] a
  join ready.[dim_Program] b on a.[Program_Key]=b.[Program_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_School ***/
if exists (select * from sys.objects where type='U' and name='dim_School' and schema_name(schema_id)='ready') drop table ready.[dim_School]

create table ready.[dim_School] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[School_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[District_Id] varchar(16),[School_Id] varchar(16),[School_Name] varchar(60),[School_Grade_Cd_Low] varchar(5),[School_Grade_Cd_High] varchar(5),[School_Principal_Name] varchar(24),[School_Level_Cd] varchar(16),[School_Level_Name] varchar(60),[School_Level_Desc] varchar(60),[NCES_School_Type_Cd] varchar(16),[NCES_School_Type_Name] varchar(60),[NCES_School_Type_Desc] varchar(60),[School_Type_Cd] varchar(16),[School_Type_Name] varchar(60),[School_Type_Desc] varchar(60),[School_State_Cd] varchar(16),[School_Local_Cd] varchar(16),[School_NCES_Cd] char(5),[School_NCES_Name] varchar(60),[School_Sat_School_Cd] char(6),[School_Unique_Id] varchar(16),[School_Short_Name] varchar(60),[School_Academic_Year_Began] varchar(9),[School_Academic_Year_Ended] varchar(9),[School_Is_Closed_Ind] char(1),[School_Principal_Email] varchar(60),[School_Phone] varchar(24),[School_Address_1] varchar(36),[School_Address_2] varchar(36),[School_City] varchar(24),[School_State] varchar(2),[School_Postal_Cd] varchar(10),[School_Latitude] decimal(9,6),[School_Longitude] decimal(9,6),[School_Url] varchar(100),[School_Title1_Ind] char(1),[School_Title1_Cd] varchar(16),[School_Title1_Desc] varchar(60),[School_Magnet_Ind] char(1),[School_Charter_Ind] char(1),[School_Accountability_Ind] char(1),[School_NCES_Phone] varchar(24),[School_NCES_Grade_Span] varchar(16),[School_NCES_Operational_Status] varchar(60),[School_Special_Assistance_Status] varchar(60),[School_Cpr_Aed_Instruction_Ind] char(1),[School_Online_School_Ind] char(1),[School_Course_Catalog_Master_List_Name] varchar(60),[School_State_Reported_Ind] char(1),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[School_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_School] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[School_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[District_Id],[School_Id],[School_Name],[School_Grade_Cd_Low],[School_Grade_Cd_High],[School_Principal_Name],[School_Level_Cd],[School_Level_Name],[School_Level_Desc],[NCES_School_Type_Cd],[NCES_School_Type_Name],[NCES_School_Type_Desc],[School_Type_Cd],[School_Type_Name],[School_Type_Desc],[School_State_Cd],[School_Local_Cd],[School_NCES_Cd],[School_NCES_Name],[School_Sat_School_Cd],[School_Unique_Id],[School_Short_Name],[School_Academic_Year_Began],[School_Academic_Year_Ended],[School_Is_Closed_Ind],[School_Principal_Email],[School_Phone],[School_Address_1],[School_Address_2],[School_City],[School_State],[School_Postal_Cd],[School_Latitude],[School_Longitude],[School_Url],[School_Title1_Ind],[School_Title1_Cd],[School_Title1_Desc],[School_Magnet_Ind],[School_Charter_Ind],[School_Accountability_Ind],[School_NCES_Phone],[School_NCES_Grade_Span],[School_NCES_Operational_Status],[School_Special_Assistance_Status],[School_Cpr_Aed_Instruction_Ind],[School_Online_School_Ind],[School_Course_Catalog_Master_List_Name],[School_State_Reported_Ind],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[School_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_School]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_School] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_School] ([HASH_KEY_BK],[HASH_KEY_T1],[District_Id],[School_Id],[School_Name],[School_Grade_Cd_Low],[School_Grade_Cd_High],[School_Principal_Name],[School_Level_Cd],[School_Level_Name],[School_Level_Desc],[NCES_School_Type_Cd],[NCES_School_Type_Name],[NCES_School_Type_Desc],[School_Type_Cd],[School_Type_Name],[School_Type_Desc],[School_State_Cd],[School_Local_Cd],[School_NCES_Cd],[School_NCES_Name],[School_Sat_School_Cd],[School_Unique_Id],[School_Short_Name],[School_Academic_Year_Began],[School_Academic_Year_Ended],[School_Is_Closed_Ind],[School_Principal_Email],[School_Phone],[School_Address_1],[School_Address_2],[School_City],[School_State],[School_Postal_Cd],[School_Latitude],[School_Longitude],[School_Url],[School_Title1_Ind],[School_Title1_Cd],[School_Title1_Desc],[School_Magnet_Ind],[School_Charter_Ind],[School_Accountability_Ind],[School_NCES_Phone],[School_NCES_Grade_Span],[School_NCES_Operational_Status],[School_Special_Assistance_Status],[School_Cpr_Aed_Instruction_Ind],[School_Online_School_Ind],[School_Course_Catalog_Master_List_Name],[School_State_Reported_Ind],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[District_Id],[School_Id],[School_Name],[School_Grade_Cd_Low],[School_Grade_Cd_High],[School_Principal_Name],[School_Level_Cd],[School_Level_Name],[School_Level_Desc],[NCES_School_Type_Cd],[NCES_School_Type_Name],[NCES_School_Type_Desc],[School_Type_Cd],[School_Type_Name],[School_Type_Desc],[School_State_Cd],[School_Local_Cd],[School_NCES_Cd],[School_NCES_Name],[School_Sat_School_Cd],[School_Unique_Id],[School_Short_Name],[School_Academic_Year_Began],[School_Academic_Year_Ended],[School_Is_Closed_Ind],[School_Principal_Email],[School_Phone],[School_Address_1],[School_Address_2],[School_City],[School_State],[School_Postal_Cd],[School_Latitude],[School_Longitude],[School_Url],[School_Title1_Ind],[School_Title1_Cd],[School_Title1_Desc],[School_Magnet_Ind],[School_Charter_Ind],[School_Accountability_Ind],[School_NCES_Phone],[School_NCES_Grade_Span],[School_NCES_Operational_Status],[School_Special_Assistance_Status],[School_Cpr_Aed_Instruction_Ind],[School_Online_School_Ind],[School_Course_Catalog_Master_List_Name],[School_State_Reported_Ind],[Date_Stamp],null,'N'
from ready.[dim_School] where NewRowFlag = 1 and DiscardFlag = 0

update a set [School_Name]=b.[School_Name] ,[School_Grade_Cd_Low]=b.[School_Grade_Cd_Low] ,[School_Grade_Cd_High]=b.[School_Grade_Cd_High] ,[School_Principal_Name]=b.[School_Principal_Name] ,[School_Level_Cd]=b.[School_Level_Cd] ,[School_Level_Name]=b.[School_Level_Name] ,[School_Level_Desc]=b.[School_Level_Desc] ,[NCES_School_Type_Cd]=b.[NCES_School_Type_Cd] ,[NCES_School_Type_Name]=b.[NCES_School_Type_Name] ,[NCES_School_Type_Desc]=b.[NCES_School_Type_Desc] ,[School_Type_Cd]=b.[School_Type_Cd] ,[School_Type_Name]=b.[School_Type_Name] ,[School_Type_Desc]=b.[School_Type_Desc] ,[School_State_Cd]=b.[School_State_Cd] ,[School_Local_Cd]=b.[School_Local_Cd] ,[School_NCES_Cd]=b.[School_NCES_Cd] ,[School_NCES_Name]=b.[School_NCES_Name] ,[School_Sat_School_Cd]=b.[School_Sat_School_Cd] ,[School_Unique_Id]=b.[School_Unique_Id] ,[School_Short_Name]=b.[School_Short_Name] ,[School_Academic_Year_Began]=b.[School_Academic_Year_Began] ,[School_Academic_Year_Ended]=b.[School_Academic_Year_Ended] ,[School_Is_Closed_Ind]=b.[School_Is_Closed_Ind] ,[School_Principal_Email]=b.[School_Principal_Email] ,[School_Phone]=b.[School_Phone] ,[School_Address_1]=b.[School_Address_1] ,[School_Address_2]=b.[School_Address_2] ,[School_City]=b.[School_City] ,[School_State]=b.[School_State] ,[School_Postal_Cd]=b.[School_Postal_Cd] ,[School_Url]=b.[School_Url] ,[School_Title1_Ind]=b.[School_Title1_Ind] ,[School_Title1_Cd]=b.[School_Title1_Cd] ,[School_Title1_Desc]=b.[School_Title1_Desc] ,[School_Magnet_Ind]=b.[School_Magnet_Ind] ,[School_Charter_Ind]=b.[School_Charter_Ind] ,[School_Accountability_Ind]=b.[School_Accountability_Ind] ,[School_NCES_Phone]=b.[School_NCES_Phone] ,[School_NCES_Grade_Span]=b.[School_NCES_Grade_Span] ,[School_NCES_Operational_Status]=b.[School_NCES_Operational_Status] ,[School_Special_Assistance_Status]=b.[School_Special_Assistance_Status] ,[School_Cpr_Aed_Instruction_Ind]=b.[School_Cpr_Aed_Instruction_Ind] ,[School_Online_School_Ind]=b.[School_Online_School_Ind] ,[School_Course_Catalog_Master_List_Name]=b.[School_Course_Catalog_Master_List_Name] ,[School_State_Reported_Ind]=b.[School_State_Reported_Ind] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_School] a
  join ready.[dim_School] b on a.[School_Key]=b.[School_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Staff ***/
if exists (select * from sys.objects where type='U' and name='dim_Staff' and schema_name(schema_id)='ready') drop table ready.[dim_Staff]

create table ready.[dim_Staff] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Staff_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Local_Staff_Id] varchar(32),[Staff_Unique_Id] varchar(32),[Staff_State_Id_Nbr] varchar(32),[Staff_SSN] varchar(11),[Staff_First_Name] varchar(30),[Staff_Middle_Name] varchar(30),[Staff_Last_Name] varchar(30),[Staff_Name_Suffix] varchar(30),[Staff_Full_Name] varchar(254),[Staff_Preferred_Name] varchar(254),[Staff_Sort_Name] varchar(254),[Staff_Birth_Date] date,[Staff_Gender_Cd] varchar(30),[Staff_Gender_Desc] varchar(254),[Staff_Gender_Sort_Order] smallint,[Staff_Primary_Ethnicity_Cd] varchar(30),[Staff_Type_Cd] varchar(30),[Staff_Type_Desc] varchar(254),[Staff_Type_Sort_Order] smallint,[Hire_Date] date,[Total_Salary_Amt] decimal(9,2),[Instruction_Salary_Amt] decimal(9,2),[Total_Contract_Hours] decimal(9,2),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Staff_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Staff] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Staff_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Local_Staff_Id],[Staff_Unique_Id],[Staff_State_Id_Nbr],[Staff_SSN],[Staff_First_Name],[Staff_Middle_Name],[Staff_Last_Name],[Staff_Name_Suffix],[Staff_Full_Name],[Staff_Preferred_Name],[Staff_Sort_Name],[Staff_Birth_Date],[Staff_Gender_Cd],[Staff_Gender_Desc],[Staff_Gender_Sort_Order],[Staff_Primary_Ethnicity_Cd],[Staff_Type_Cd],[Staff_Type_Desc],[Staff_Type_Sort_Order],[Hire_Date],[Total_Salary_Amt],[Instruction_Salary_Amt],[Total_Contract_Hours],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Staff_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Staff]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Staff] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Staff] ([HASH_KEY_BK],[HASH_KEY_T1],[Local_Staff_Id],[Staff_Unique_Id],[Staff_State_Id_Nbr],[Staff_SSN],[Staff_First_Name],[Staff_Middle_Name],[Staff_Last_Name],[Staff_Name_Suffix],[Staff_Full_Name],[Staff_Preferred_Name],[Staff_Sort_Name],[Staff_Birth_Date],[Staff_Gender_Cd],[Staff_Gender_Desc],[Staff_Gender_Sort_Order],[Staff_Primary_Ethnicity_Cd],[Staff_Type_Cd],[Staff_Type_Desc],[Staff_Type_Sort_Order],[Hire_Date],[Total_Salary_Amt],[Instruction_Salary_Amt],[Total_Contract_Hours],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Local_Staff_Id],[Staff_Unique_Id],[Staff_State_Id_Nbr],[Staff_SSN],[Staff_First_Name],[Staff_Middle_Name],[Staff_Last_Name],[Staff_Name_Suffix],[Staff_Full_Name],[Staff_Preferred_Name],[Staff_Sort_Name],[Staff_Birth_Date],[Staff_Gender_Cd],[Staff_Gender_Desc],[Staff_Gender_Sort_Order],[Staff_Primary_Ethnicity_Cd],[Staff_Type_Cd],[Staff_Type_Desc],[Staff_Type_Sort_Order],[Hire_Date],[Total_Salary_Amt],[Instruction_Salary_Amt],[Total_Contract_Hours],[Date_Stamp],null,'N'
from ready.[dim_Staff] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Staff_Unique_Id]=b.[Staff_Unique_Id] ,[Staff_State_Id_Nbr]=b.[Staff_State_Id_Nbr] ,[Staff_SSN]=b.[Staff_SSN] ,[Staff_First_Name]=b.[Staff_First_Name] ,[Staff_Middle_Name]=b.[Staff_Middle_Name] ,[Staff_Last_Name]=b.[Staff_Last_Name] ,[Staff_Name_Suffix]=b.[Staff_Name_Suffix] ,[Staff_Full_Name]=b.[Staff_Full_Name] ,[Staff_Preferred_Name]=b.[Staff_Preferred_Name] ,[Staff_Sort_Name]=b.[Staff_Sort_Name] ,[Staff_Birth_Date]=b.[Staff_Birth_Date] ,[Staff_Gender_Cd]=b.[Staff_Gender_Cd] ,[Staff_Gender_Desc]=b.[Staff_Gender_Desc] ,[Staff_Primary_Ethnicity_Cd]=b.[Staff_Primary_Ethnicity_Cd] ,[Staff_Type_Cd]=b.[Staff_Type_Cd] ,[Staff_Type_Desc]=b.[Staff_Type_Desc] ,[Hire_Date]=b.[Hire_Date] ,[Total_Salary_Amt]=b.[Total_Salary_Amt] ,[Instruction_Salary_Amt]=b.[Instruction_Salary_Amt] ,[Total_Contract_Hours]=b.[Total_Contract_Hours] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Staff] a
  join ready.[dim_Staff] b on a.[Staff_Key]=b.[Staff_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Student ***/
if exists (select * from sys.objects where type='U' and name='dim_Student' and schema_name(schema_id)='ready') drop table ready.[dim_Student]

create table ready.[dim_Student] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Student_Key_Temp] int,[Student_Sequence] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[HASH_KEY_T1C] binary(16),[Local_Student_Id] varchar(30),[Student_Unique_Id] varchar(30),[Student_State_Id_Nbr] varchar(30),[Student_Current_Enrolled_Ind] char(1),[Student_First_Name] varchar(30),[Student_Middle_Name] varchar(30),[Student_Last_Name] varchar(30),[Student_Name_Suffix] varchar(30),[Student_Full_Name] varchar(254),[Student_Preferred_Name] varchar(254),[Student_Sort_Name] varchar(254),[Student_SSN] varchar(11),[Student_Birth_Date] date,[Student_Birth_Year_Month] char(7),[Student_Birth_Year] char(4),[Student_Birth_Country_Cd] varchar(30),[Student_Birth_Country_Name] varchar(254),[Student_Gender_Cd] varchar(30),[Student_Gender_Desc] varchar(254),[Student_Gender_Sort_Order] smallint,[American_Indian_Or_Alaska_Native_Ind] char(1),[Asian_Ind] char(1),[Black_Or_African_American_Ind] char(1),[Native_Hawaiian_Or_Other_Pacific_Islander_Ind] char(1),[White_Ind] char(1),[Hispanic_Latino_Ind] char(1),[Hispanic_Latino_Desc] varchar(64),[Race_Desc] varchar(132),[Federal_Race_Ethnicity_Desc] varchar(255),[Number_Of_Races_Reported] smallint,[Student_Immigrant_Ind] char(1),[Student_Migrant_Ind] char(1),[Student_Refugee_Ind] char(1),[Student_Current_LEP_Ind] char(1),[Student_Current_Grade_Level_Cd] varchar(30),[Student_Current_Grade_Level_Desc] varchar(254),[Student_Current_Grade_Level_Sort_Order] smallint,[Student_Current_State_Grade_Level_Cd] varchar(30),[Student_Current_State_Grade_Level_Desc] varchar(254),[Student_Current_State_Grade_Level_Sort_Order] smallint,[Student_Current_Economically_Disadvantaged_Ind] char(1),[Student_Current_Free_Reduced_Meal_Cd] varchar(30),[Student_Current_Free_Reduced_Meal_Desc] varchar(254),[Student_Current_Free_Reduced_Meal_Sort_Order] smallint,[Student_Current_Disability_Ind] char(1),[Student_Date_Entered_District] date,[Student_Date_Entered_USA_School] date,[Student_Resident_District] varchar(30),[Student_Citizenship_Country] varchar(30),[Student_USA_Date_Of_Entry] date,[Student_Primary_Language] varchar(30),[Student_Year_Entered_9th_Grade] char(4),[Student_Graduation_Ind] char(1),[Student_Graduation_Date] date,[Student_Diploma_Type_Cd] varchar(30),[Student_Received_Ged_Ind] char(1),[Student_Current_Title_1_Cd] varchar(30),[Student_Current_Homeless_Ind] char(1),[Student_Homeless_Unaccompanied_Youth_Ind] char(1),[Student_Current_SpEd_Eligible_Ind] char(1),[Student_Current_SpEd_Receiving_Ind] char(1),[Student_SpEd_Area_of_Exceptionality] varchar(50),[Student_State_Funding_Type] varchar(254),[Student_Current_Gifted_Ind] char(1),[Current_School_Id] varchar(16),[Current_School_Name] varchar(60),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Student_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Student] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Student_Key_Temp],[Student_Sequence],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[HASH_KEY_T1C],[Local_Student_Id],[Student_Unique_Id],[Student_State_Id_Nbr],[Student_Current_Enrolled_Ind],[Student_First_Name],[Student_Middle_Name],[Student_Last_Name],[Student_Name_Suffix],[Student_Full_Name],[Student_Preferred_Name],[Student_Sort_Name],[Student_SSN],[Student_Birth_Date],[Student_Birth_Year_Month],[Student_Birth_Year],[Student_Birth_Country_Cd],[Student_Birth_Country_Name],[Student_Gender_Cd],[Student_Gender_Desc],[Student_Gender_Sort_Order],[American_Indian_Or_Alaska_Native_Ind],[Asian_Ind],[Black_Or_African_American_Ind],[Native_Hawaiian_Or_Other_Pacific_Islander_Ind],[White_Ind],[Hispanic_Latino_Ind],[Hispanic_Latino_Desc],[Race_Desc],[Federal_Race_Ethnicity_Desc],[Number_Of_Races_Reported],[Student_Immigrant_Ind],[Student_Migrant_Ind],[Student_Refugee_Ind],[Student_Current_LEP_Ind],[Student_Current_Grade_Level_Cd],[Student_Current_Grade_Level_Desc],[Student_Current_Grade_Level_Sort_Order],[Student_Current_State_Grade_Level_Cd],[Student_Current_State_Grade_Level_Desc],[Student_Current_State_Grade_Level_Sort_Order],[Student_Current_Economically_Disadvantaged_Ind],[Student_Current_Free_Reduced_Meal_Cd],[Student_Current_Free_Reduced_Meal_Desc],[Student_Current_Free_Reduced_Meal_Sort_Order],[Student_Current_Disability_Ind],[Student_Date_Entered_District],[Student_Date_Entered_USA_School],[Student_Resident_District],[Student_Citizenship_Country],[Student_USA_Date_Of_Entry],[Student_Primary_Language],[Student_Year_Entered_9th_Grade],[Student_Graduation_Ind],[Student_Graduation_Date],[Student_Diploma_Type_Cd],[Student_Received_Ged_Ind],[Student_Current_Title_1_Cd],[Student_Current_Homeless_Ind],[Student_Homeless_Unaccompanied_Youth_Ind],[Student_Current_SpEd_Eligible_Ind],[Student_Current_SpEd_Receiving_Ind],[Student_SpEd_Area_of_Exceptionality],[Student_State_Funding_Type],[Student_Current_Gifted_Ind],[Current_School_Id],[Current_School_Name],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Student_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Student]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Student] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[dim_Student] ([Student_Sequence],[HASH_KEY_BK],[HASH_KEY_T1],[HASH_KEY_T1C],[Local_Student_Id],[Student_Unique_Id],[Student_State_Id_Nbr],[Student_Current_Enrolled_Ind],[Student_First_Name],[Student_Middle_Name],[Student_Last_Name],[Student_Name_Suffix],[Student_Full_Name],[Student_Preferred_Name],[Student_Sort_Name],[Student_SSN],[Student_Birth_Date],[Student_Birth_Year_Month],[Student_Birth_Year],[Student_Birth_Country_Cd],[Student_Birth_Country_Name],[Student_Gender_Cd],[Student_Gender_Desc],[Student_Gender_Sort_Order],[American_Indian_Or_Alaska_Native_Ind],[Asian_Ind],[Black_Or_African_American_Ind],[Native_Hawaiian_Or_Other_Pacific_Islander_Ind],[White_Ind],[Hispanic_Latino_Ind],[Hispanic_Latino_Desc],[Race_Desc],[Federal_Race_Ethnicity_Desc],[Number_Of_Races_Reported],[Student_Immigrant_Ind],[Student_Migrant_Ind],[Student_Refugee_Ind],[Student_Current_LEP_Ind],[Student_Current_Grade_Level_Cd],[Student_Current_Grade_Level_Desc],[Student_Current_Grade_Level_Sort_Order],[Student_Current_State_Grade_Level_Cd],[Student_Current_State_Grade_Level_Desc],[Student_Current_State_Grade_Level_Sort_Order],[Student_Current_Economically_Disadvantaged_Ind],[Student_Current_Free_Reduced_Meal_Cd],[Student_Current_Free_Reduced_Meal_Desc],[Student_Current_Free_Reduced_Meal_Sort_Order],[Student_Current_Disability_Ind],[Student_Date_Entered_District],[Student_Date_Entered_USA_School],[Student_Resident_District],[Student_Citizenship_Country],[Student_USA_Date_Of_Entry],[Student_Primary_Language],[Student_Year_Entered_9th_Grade],[Student_Graduation_Ind],[Student_Graduation_Date],[Student_Diploma_Type_Cd],[Student_Received_Ged_Ind],[Student_Current_Title_1_Cd],[Student_Current_Homeless_Ind],[Student_Homeless_Unaccompanied_Youth_Ind],[Student_Current_SpEd_Eligible_Ind],[Student_Current_SpEd_Receiving_Ind],[Student_SpEd_Area_of_Exceptionality],[Student_State_Funding_Type],[Student_Current_Gifted_Ind],[Current_School_Id],[Current_School_Name],[Date_Stamp],[Last_Updated_T1],[Transaction_Start_Date],[Transaction_End_Date],[Current_Record_Ind],[No_Longer_In_Source_Ind])
select [Student_Sequence],[HASH_KEY_BK],[HASH_KEY_T1],[HASH_KEY_T1C],[Local_Student_Id],[Student_Unique_Id],[Student_State_Id_Nbr],[Student_Current_Enrolled_Ind],[Student_First_Name],[Student_Middle_Name],[Student_Last_Name],[Student_Name_Suffix],[Student_Full_Name],[Student_Preferred_Name],[Student_Sort_Name],[Student_SSN],[Student_Birth_Date],[Student_Birth_Year_Month],[Student_Birth_Year],[Student_Birth_Country_Cd],[Student_Birth_Country_Name],[Student_Gender_Cd],[Student_Gender_Desc],[Student_Gender_Sort_Order],[American_Indian_Or_Alaska_Native_Ind],[Asian_Ind],[Black_Or_African_American_Ind],[Native_Hawaiian_Or_Other_Pacific_Islander_Ind],[White_Ind],[Hispanic_Latino_Ind],[Hispanic_Latino_Desc],[Race_Desc],[Federal_Race_Ethnicity_Desc],[Number_Of_Races_Reported],[Student_Immigrant_Ind],[Student_Migrant_Ind],[Student_Refugee_Ind],[Student_Current_LEP_Ind],[Student_Current_Grade_Level_Cd],[Student_Current_Grade_Level_Desc],[Student_Current_Grade_Level_Sort_Order],[Student_Current_State_Grade_Level_Cd],[Student_Current_State_Grade_Level_Desc],[Student_Current_State_Grade_Level_Sort_Order],[Student_Current_Economically_Disadvantaged_Ind],[Student_Current_Free_Reduced_Meal_Cd],[Student_Current_Free_Reduced_Meal_Desc],[Student_Current_Free_Reduced_Meal_Sort_Order],[Student_Current_Disability_Ind],[Student_Date_Entered_District],[Student_Date_Entered_USA_School],[Student_Resident_District],[Student_Citizenship_Country],[Student_USA_Date_Of_Entry],[Student_Primary_Language],[Student_Year_Entered_9th_Grade],[Student_Graduation_Ind],[Student_Graduation_Date],[Student_Diploma_Type_Cd],[Student_Received_Ged_Ind],[Student_Current_Title_1_Cd],[Student_Current_Homeless_Ind],[Student_Homeless_Unaccompanied_Youth_Ind],[Student_Current_SpEd_Eligible_Ind],[Student_Current_SpEd_Receiving_Ind],[Student_SpEd_Area_of_Exceptionality],[Student_State_Funding_Type],[Student_Current_Gifted_Ind],[Current_School_Id],[Current_School_Name],[Date_Stamp],null,@ExecTime,convert(datetime2,'9999-12-31'),'Y','N'
from ready.[dim_Student] where NewRowFlag = 1 and DiscardFlag = 0

set identity_insert [tdw].[dim_Student] on
set @ExecTime = getdate()
insert into [tdw].[dim_Student] ([Student_Sequence],[HASH_KEY_BK],[HASH_KEY_T1],[HASH_KEY_T1C],[Local_Student_Id],[Student_Unique_Id],[Student_State_Id_Nbr],[Student_Current_Enrolled_Ind],[Student_First_Name],[Student_Middle_Name],[Student_Last_Name],[Student_Name_Suffix],[Student_Full_Name],[Student_Preferred_Name],[Student_Sort_Name],[Student_SSN],[Student_Birth_Date],[Student_Birth_Year_Month],[Student_Birth_Year],[Student_Birth_Country_Cd],[Student_Birth_Country_Name],[Student_Gender_Cd],[Student_Gender_Desc],[Student_Gender_Sort_Order],[American_Indian_Or_Alaska_Native_Ind],[Asian_Ind],[Black_Or_African_American_Ind],[Native_Hawaiian_Or_Other_Pacific_Islander_Ind],[White_Ind],[Hispanic_Latino_Ind],[Hispanic_Latino_Desc],[Race_Desc],[Federal_Race_Ethnicity_Desc],[Number_Of_Races_Reported],[Student_Immigrant_Ind],[Student_Migrant_Ind],[Student_Refugee_Ind],[Student_Current_LEP_Ind],[Student_Current_Grade_Level_Cd],[Student_Current_Grade_Level_Desc],[Student_Current_Grade_Level_Sort_Order],[Student_Current_State_Grade_Level_Cd],[Student_Current_State_Grade_Level_Desc],[Student_Current_State_Grade_Level_Sort_Order],[Student_Current_Economically_Disadvantaged_Ind],[Student_Current_Free_Reduced_Meal_Cd],[Student_Current_Free_Reduced_Meal_Desc],[Student_Current_Free_Reduced_Meal_Sort_Order],[Student_Current_Disability_Ind],[Student_Date_Entered_District],[Student_Date_Entered_USA_School],[Student_Resident_District],[Student_Citizenship_Country],[Student_USA_Date_Of_Entry],[Student_Primary_Language],[Student_Year_Entered_9th_Grade],[Student_Graduation_Ind],[Student_Graduation_Date],[Student_Diploma_Type_Cd],[Student_Received_Ged_Ind],[Student_Current_Title_1_Cd],[Student_Current_Homeless_Ind],[Student_Homeless_Unaccompanied_Youth_Ind],[Student_Current_SpEd_Eligible_Ind],[Student_Current_SpEd_Receiving_Ind],[Student_SpEd_Area_of_Exceptionality],[Student_State_Funding_Type],[Student_Current_Gifted_Ind],[Current_School_Id],[Current_School_Name],[Date_Stamp],[Student_Key],[Last_Updated_T1],[Transaction_Start_Date],[Transaction_End_Date],[Current_Record_Ind],[No_Longer_In_Source_Ind])
select [Student_Sequence],[HASH_KEY_BK],[HASH_KEY_T1],[HASH_KEY_T1C],[Local_Student_Id],[Student_Unique_Id],[Student_State_Id_Nbr],[Student_Current_Enrolled_Ind],[Student_First_Name],[Student_Middle_Name],[Student_Last_Name],[Student_Name_Suffix],[Student_Full_Name],[Student_Preferred_Name],[Student_Sort_Name],[Student_SSN],[Student_Birth_Date],[Student_Birth_Year_Month],[Student_Birth_Year],[Student_Birth_Country_Cd],[Student_Birth_Country_Name],[Student_Gender_Cd],[Student_Gender_Desc],[Student_Gender_Sort_Order],[American_Indian_Or_Alaska_Native_Ind],[Asian_Ind],[Black_Or_African_American_Ind],[Native_Hawaiian_Or_Other_Pacific_Islander_Ind],[White_Ind],[Hispanic_Latino_Ind],[Hispanic_Latino_Desc],[Race_Desc],[Federal_Race_Ethnicity_Desc],[Number_Of_Races_Reported],[Student_Immigrant_Ind],[Student_Migrant_Ind],[Student_Refugee_Ind],[Student_Current_LEP_Ind],[Student_Current_Grade_Level_Cd],[Student_Current_Grade_Level_Desc],[Student_Current_Grade_Level_Sort_Order],[Student_Current_State_Grade_Level_Cd],[Student_Current_State_Grade_Level_Desc],[Student_Current_State_Grade_Level_Sort_Order],[Student_Current_Economically_Disadvantaged_Ind],[Student_Current_Free_Reduced_Meal_Cd],[Student_Current_Free_Reduced_Meal_Desc],[Student_Current_Free_Reduced_Meal_Sort_Order],[Student_Current_Disability_Ind],[Student_Date_Entered_District],[Student_Date_Entered_USA_School],[Student_Resident_District],[Student_Citizenship_Country],[Student_USA_Date_Of_Entry],[Student_Primary_Language],[Student_Year_Entered_9th_Grade],[Student_Graduation_Ind],[Student_Graduation_Date],[Student_Diploma_Type_Cd],[Student_Received_Ged_Ind],[Student_Current_Title_1_Cd],[Student_Current_Homeless_Ind],[Student_Homeless_Unaccompanied_Youth_Ind],[Student_Current_SpEd_Eligible_Ind],[Student_Current_SpEd_Receiving_Ind],[Student_SpEd_Area_of_Exceptionality],[Student_State_Funding_Type],[Student_Current_Gifted_Ind],[Current_School_Id],[Current_School_Name],[Date_Stamp],[Student_Key],null,@ExecTime,convert(datetime2,'9999-12-31'),'Y','N'
  from ready.[dim_Student]
 where NewSeqFlag = 1 and NewKeyFlag = 0 and NewRowFlag = 0 and DiscardFlag = 0
set identity_insert [tdw].[dim_Student] off

update k1
set Current_Record_Ind='N', Transaction_End_Date=@ExecTime
  from ready.[dim_Student] x
  join[tdw].[dim_Student] k1 on k1.[Student_Key]=x.[Student_Key] and k1.[Student_Sequence]+1=x.[Student_Sequence] 
 where NewSeqFlag = 1 and NewKeyFlag = 0 and NewRowFlag = 0 and DiscardFlag = 0

update a set [Student_Current_Enrolled_Ind]=b.[Student_Current_Enrolled_Ind] ,[Student_Birth_Country_Cd]=b.[Student_Birth_Country_Cd] ,[Student_Birth_Country_Name]=b.[Student_Birth_Country_Name] ,[American_Indian_Or_Alaska_Native_Ind]=b.[American_Indian_Or_Alaska_Native_Ind] ,[Asian_Ind]=b.[Asian_Ind] ,[Black_Or_African_American_Ind]=b.[Black_Or_African_American_Ind] ,[Native_Hawaiian_Or_Other_Pacific_Islander_Ind]=b.[Native_Hawaiian_Or_Other_Pacific_Islander_Ind] ,[White_Ind]=b.[White_Ind] ,[Hispanic_Latino_Ind]=b.[Hispanic_Latino_Ind] ,[Hispanic_Latino_Desc]=b.[Hispanic_Latino_Desc] ,[Number_Of_Races_Reported]=b.[Number_Of_Races_Reported] ,[Student_Immigrant_Ind]=b.[Student_Immigrant_Ind] ,[Student_Migrant_Ind]=b.[Student_Migrant_Ind] ,[Student_Refugee_Ind]=b.[Student_Refugee_Ind] ,[Student_Current_LEP_Ind]=b.[Student_Current_LEP_Ind] ,[Student_Current_Grade_Level_Cd]=b.[Student_Current_Grade_Level_Cd] ,[Student_Current_Grade_Level_Desc]=b.[Student_Current_Grade_Level_Desc] ,[Student_Current_State_Grade_Level_Cd]=b.[Student_Current_State_Grade_Level_Cd] ,[Student_Current_State_Grade_Level_Desc]=b.[Student_Current_State_Grade_Level_Desc] ,[Student_Current_Economically_Disadvantaged_Ind]=b.[Student_Current_Economically_Disadvantaged_Ind] ,[Student_Current_Free_Reduced_Meal_Cd]=b.[Student_Current_Free_Reduced_Meal_Cd] ,[Student_Current_Free_Reduced_Meal_Desc]=b.[Student_Current_Free_Reduced_Meal_Desc] ,[Student_Current_Disability_Ind]=b.[Student_Current_Disability_Ind] ,[Student_Date_Entered_District]=b.[Student_Date_Entered_District] ,[Student_Date_Entered_USA_School]=b.[Student_Date_Entered_USA_School] ,[Student_Resident_District]=b.[Student_Resident_District] ,[Student_Citizenship_Country]=b.[Student_Citizenship_Country] ,[Student_USA_Date_Of_Entry]=b.[Student_USA_Date_Of_Entry] ,[Student_Primary_Language]=b.[Student_Primary_Language] ,[Student_Year_Entered_9th_Grade]=b.[Student_Year_Entered_9th_Grade] ,[Student_Graduation_Ind]=b.[Student_Graduation_Ind] ,[Student_Graduation_Date]=b.[Student_Graduation_Date] ,[Student_Diploma_Type_Cd]=b.[Student_Diploma_Type_Cd] ,[Student_Received_Ged_Ind]=b.[Student_Received_Ged_Ind] ,[Student_Current_Title_1_Cd]=b.[Student_Current_Title_1_Cd] ,[Student_Current_Homeless_Ind]=b.[Student_Current_Homeless_Ind] ,[Student_Homeless_Unaccompanied_Youth_Ind]=b.[Student_Homeless_Unaccompanied_Youth_Ind] ,[Student_Current_SpEd_Eligible_Ind]=b.[Student_Current_SpEd_Eligible_Ind] ,[Student_Current_SpEd_Receiving_Ind]=b.[Student_Current_SpEd_Receiving_Ind] ,[Student_SpEd_Area_of_Exceptionality]=b.[Student_SpEd_Area_of_Exceptionality] ,[Student_State_Funding_Type]=b.[Student_State_Funding_Type] ,[Student_Current_Gifted_Ind]=b.[Student_Current_Gifted_Ind] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Student] a
  join ready.[dim_Student] b on a.[Student_Key]=b.[Student_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** dim_Withdrawal ***/
if exists (select * from sys.objects where type='U' and name='dim_Withdrawal' and schema_name(schema_id)='ready') drop table ready.[dim_Withdrawal]

create table ready.[dim_Withdrawal] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Withdrawal_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[HASH_KEY_T1] binary(16),[Withdrawal_Cd] varchar(30),[Withdrawal_Desc] varchar(254),[Withdrawal_State_Cd] varchar(30),[Withdrawal_State_Desc] varchar(254),[Withdrawal_Sort_Order] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[OES_Litho] bigint,[Withdrawal_Key] int,[DISCARDFLAG] int)
insert into ready.[dim_Withdrawal] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Withdrawal_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[HASH_KEY_T1],[Withdrawal_Cd],[Withdrawal_Desc],[Withdrawal_State_Cd],[Withdrawal_State_Desc],[Withdrawal_Sort_Order],[Batch_Period],[SAID],[Date_Stamp],[OES_Litho],[Withdrawal_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_dim_Withdrawal]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[dim_Withdrawal] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

insert into[tdw].[dim_Withdrawal] ([HASH_KEY_BK],[HASH_KEY_T1],[Withdrawal_Cd],[Withdrawal_Desc],[Withdrawal_State_Cd],[Withdrawal_State_Desc],[Withdrawal_Sort_Order],[Date_Stamp],[Last_Updated_T1],[No_Longer_In_Source_Ind])
select [HASH_KEY_BK],[HASH_KEY_T1],[Withdrawal_Cd],[Withdrawal_Desc],[Withdrawal_State_Cd],[Withdrawal_State_Desc],[Withdrawal_Sort_Order],[Date_Stamp],null,'N'
from ready.[dim_Withdrawal] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Withdrawal_Desc]=b.[Withdrawal_Desc] ,[Withdrawal_State_Cd]=b.[Withdrawal_State_Cd] ,[Withdrawal_State_Desc]=b.[Withdrawal_State_Desc] , Hash_Key_T1=b.Hash_Key_T1, Last_Updated_T1=getdate()
  from [tdw].[dim_Withdrawal] a
  join ready.[dim_Withdrawal] b on a.[Withdrawal_Key]=b.[Withdrawal_Key] 
 where UpdateFlag = 1 and DiscardFlag = 0 and NewRowFlag = 0 and a.Hash_Key_T1!=b.Hash_Key_T1

/*** fct_Attendance_Daily_Activity ***/
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Daily_Activity' and schema_name(schema_id)='ready') drop table ready.[fct_Attendance_Daily_Activity]

create table ready.[fct_Attendance_Daily_Activity] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Attendance_Daily_Activity_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[School_Key] int,[Calendar_Track_Key] int,[Student_Key] int,[Attendance_Key] int,[Attendance_Date_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[School_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Calendar_Track_School_Id] varchar(16),[Local_Student_Id] varchar(30),[Attendance_Category_Cd] varchar(30),[Attendance_Cd] varchar(30),[Attendance-Date_Of_Day] date,[Attendance_Calendar_Date] date,[Attendance_Days_Absent_Count] decimal(9,2),[Periods_Absent] smallint,[Periods_Scheduled] smallint,[Minutes_Absent] smallint,[Minutes_Scheduled] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Attendance_Daily_Activity_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Attendance_Daily_Activity] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Attendance_Daily_Activity_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Student_Key],[Attendance_Key],[Attendance_Date_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Local_Student_Id],[Attendance_Category_Cd],[Attendance_Cd],[Attendance-Date_Of_Day],[Attendance_Calendar_Date],[Attendance_Days_Absent_Count],[Periods_Absent],[Periods_Scheduled],[Minutes_Absent],[Minutes_Scheduled],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Attendance_Daily_Activity_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Attendance_Daily_Activity]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Attendance_Daily_Activity] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Attendance_Daily_Activity] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Student_Key],[Attendance_Key],[Attendance_Date_Key],[Batch_Key],[Attendance_Calendar_Date],[Attendance_Days_Absent_Count],[Periods_Absent],[Periods_Scheduled],[Minutes_Absent],[Minutes_Scheduled],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Student_Key],[Attendance_Key],[Attendance_Date_Key],[Batch_Key],[Attendance_Calendar_Date],[Attendance_Days_Absent_Count],[Periods_Absent],[Periods_Scheduled],[Minutes_Absent],[Minutes_Scheduled],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Attendance_Daily_Activity] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Attendance_Days_Absent_Count]=b.[Attendance_Days_Absent_Count] ,[Periods_Absent]=b.[Periods_Absent] ,[Periods_Scheduled]=b.[Periods_Scheduled] ,[Minutes_Absent]=b.[Minutes_Absent] ,[Minutes_Scheduled]=b.[Minutes_Scheduled] 
  from [tdw].[fct_Attendance_Daily_Activity] a
  join ready.[fct_Attendance_Daily_Activity] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Attendance_Daily_Activity] a
  left outer join (select Hash_Key_BK from ready.[fct_Attendance_Daily_Activity] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Attendance_Daily_Activity] where Batch_Key is not null )

/*** fct_Attendance_Period_Activity ***/
if exists (select * from sys.objects where type='U' and name='fct_Attendance_Period_Activity' and schema_name(schema_id)='ready') drop table ready.[fct_Attendance_Period_Activity]

create table ready.[fct_Attendance_Period_Activity] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Attendance_Period_Activity_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[School_Key] int,[Calendar_Track_Key] int,[Period_Key] int,[Student_Key] int,[Attendance_Key] int,[Attendance_Date_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[School_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Calendar_Track_School_Id] varchar(16),[Period_Cd] varchar(30),[Period_School_Id] varchar(16),[Local_Student_Id] varchar(30),[Attendance_Category_Cd] varchar(30),[Attendance_Cd] varchar(30),[Attendance-Date_Of_Day] date,[Attendance_Calendar_Date] date,[Attendance_Periods_Absent_Count] decimal(9,2),[Minutes_Absent] smallint,[Minutes_Scheduled] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Attendance_Period_Activity_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Attendance_Period_Activity] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Attendance_Period_Activity_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Period_Key],[Student_Key],[Attendance_Key],[Attendance_Date_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Period_Cd],[Period_School_Id],[Local_Student_Id],[Attendance_Category_Cd],[Attendance_Cd],[Attendance-Date_Of_Day],[Attendance_Calendar_Date],[Attendance_Periods_Absent_Count],[Minutes_Absent],[Minutes_Scheduled],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Attendance_Period_Activity_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Attendance_Period_Activity]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Attendance_Period_Activity] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Attendance_Period_Activity] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Period_Key],[Student_Key],[Attendance_Key],[Attendance_Date_Key],[Batch_Key],[Attendance_Calendar_Date],[Attendance_Periods_Absent_Count],[Minutes_Absent],[Minutes_Scheduled],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Period_Key],[Student_Key],[Attendance_Key],[Attendance_Date_Key],[Batch_Key],[Attendance_Calendar_Date],[Attendance_Periods_Absent_Count],[Minutes_Absent],[Minutes_Scheduled],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Attendance_Period_Activity] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Attendance_Periods_Absent_Count]=b.[Attendance_Periods_Absent_Count] ,[Minutes_Absent]=b.[Minutes_Absent] ,[Minutes_Scheduled]=b.[Minutes_Scheduled] 
  from [tdw].[fct_Attendance_Period_Activity] a
  join ready.[fct_Attendance_Period_Activity] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Attendance_Period_Activity] a
  left outer join (select Hash_Key_BK from ready.[fct_Attendance_Period_Activity] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Attendance_Period_Activity] where Batch_Key is not null )

/*** fct_Enrollment_Pairs ***/
if exists (select * from sys.objects where type='U' and name='fct_Enrollment_Pairs' and schema_name(schema_id)='ready') drop table ready.[fct_Enrollment_Pairs]

create table ready.[fct_Enrollment_Pairs] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Enrollment_Pairs_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[School_Key] int,[Calendar_Track_Key] int,[Student_Key] int,[Enrollment_Key] int,[Enrollment_Date_Key] int,[Withdrawal_Key] int,[Withdrawal_Date_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[School_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Calendar_Track_School_Id] varchar(16),[Local_Student_Id] varchar(30),[Enrollment_Cd] varchar(30),[Enrollment-Date_Of_Day] date,[Withdrawal_Cd] varchar(30),[Withdrawal-Date_Of_Day] date,[Serving_District_Id] varchar(16),[Resident_District_Id] varchar(16),[Enrollment_Date] date,[Withdrawal_Date] date,[Enrolled_Grade_Level] varchar(30),[Current_Enrollment_Ind] char(1),[Percent_Enrolled] decimal(9,2),[Enrollment_Count] smallint,[No_Show_Count] smallint,[Calendar_Days_Enrolled] smallint,[FullYear_Enrollment_Count] tinyint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Enrollment_Pairs_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Enrollment_Pairs] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Enrollment_Pairs_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Student_Key],[Enrollment_Key],[Enrollment_Date_Key],[Withdrawal_Key],[Withdrawal_Date_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Local_Student_Id],[Enrollment_Cd],[Enrollment-Date_Of_Day],[Withdrawal_Cd],[Withdrawal-Date_Of_Day],[Serving_District_Id],[Resident_District_Id],[Enrollment_Date],[Withdrawal_Date],[Enrolled_Grade_Level],[Current_Enrollment_Ind],[Percent_Enrolled],[Enrollment_Count],[No_Show_Count],[Calendar_Days_Enrolled],[FullYear_Enrollment_Count],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Enrollment_Pairs_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Enrollment_Pairs]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Enrollment_Pairs] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Enrollment_Pairs] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Student_Key],[Enrollment_Key],[Enrollment_Date_Key],[Withdrawal_Key],[Withdrawal_Date_Key],[Batch_Key],[Serving_District_Id],[Resident_District_Id],[Enrollment_Date],[Withdrawal_Date],[Enrolled_Grade_Level],[Current_Enrollment_Ind],[Percent_Enrolled],[Enrollment_Count],[No_Show_Count],[Calendar_Days_Enrolled],[FullYear_Enrollment_Count],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Student_Key],[Enrollment_Key],[Enrollment_Date_Key],[Withdrawal_Key],[Withdrawal_Date_Key],[Batch_Key],[Serving_District_Id],[Resident_District_Id],[Enrollment_Date],[Withdrawal_Date],[Enrolled_Grade_Level],[Current_Enrollment_Ind],[Percent_Enrolled],[Enrollment_Count],[No_Show_Count],[Calendar_Days_Enrolled],[FullYear_Enrollment_Count],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Enrollment_Pairs] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Withdrawal_Key]=b.[Withdrawal_Key] ,[Withdrawal_Date_Key]=b.[Withdrawal_Date_Key] ,[Serving_District_Id]=b.[Serving_District_Id] ,[Resident_District_Id]=b.[Resident_District_Id] ,[Withdrawal_Date]=b.[Withdrawal_Date] ,[Enrolled_Grade_Level]=b.[Enrolled_Grade_Level] ,[Current_Enrollment_Ind]=b.[Current_Enrollment_Ind] ,[Percent_Enrolled]=b.[Percent_Enrolled] ,[Enrollment_Count]=b.[Enrollment_Count] ,[No_Show_Count]=b.[No_Show_Count] ,[Calendar_Days_Enrolled]=b.[Calendar_Days_Enrolled] 
  from [tdw].[fct_Enrollment_Pairs] a
  join ready.[fct_Enrollment_Pairs] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Enrollment_Pairs] a
  left outer join (select Hash_Key_BK from ready.[fct_Enrollment_Pairs] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Enrollment_Pairs] where Batch_Key is not null )

/*** fct_School_Calendar ***/
if exists (select * from sys.objects where type='U' and name='fct_School_Calendar' and schema_name(schema_id)='ready') drop table ready.[fct_School_Calendar]

create table ready.[fct_School_Calendar] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[School_Calendar_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[School_Key] int,[Date_Key] int,[Calendar_Track_Key] int,[Calendar_Day_Type_Key] int,[Cycle_Day_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[School_Id] varchar(16),[Date_Of_Day] date,[Calendar_Track_Cd] varchar(30),[Calendar_Track_School_Id] varchar(16),[Calendar_Day_Type_Cd] varchar(30),[Cycle_Day_Cd] varchar(30),[Calendar_Date] date,[School_Day_Num] int,[Occurrence] smallint,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[School_Calendar_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_School_Calendar] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[School_Calendar_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Date_Key],[Calendar_Track_Key],[Calendar_Day_Type_Key],[Cycle_Day_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[School_Id],[Date_Of_Day],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Calendar_Day_Type_Cd],[Cycle_Day_Cd],[Calendar_Date],[School_Day_Num],[Occurrence],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[School_Calendar_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_School_Calendar]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_School_Calendar] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_School_Calendar] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Date_Key],[Calendar_Track_Key],[Calendar_Day_Type_Key],[Cycle_Day_Key],[Batch_Key],[Calendar_Date],[School_Day_Num],[Occurrence],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Date_Key],[Calendar_Track_Key],[Calendar_Day_Type_Key],[Cycle_Day_Key],[Batch_Key],[Calendar_Date],[School_Day_Num],[Occurrence],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_School_Calendar] where NewRowFlag = 1 and DiscardFlag = 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_School_Calendar] a
  left outer join (select Hash_Key_BK from ready.[fct_School_Calendar] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_School_Calendar] where Batch_Key is not null )

/*** fct_Student_Course_Grade ***/
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Grade' and schema_name(schema_id)='ready') drop table ready.[fct_Student_Course_Grade]

create table ready.[fct_Student_Course_Grade] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Student_Course_Grade_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[School_Key] int,[Calendar_Track_Key] int,[Term_Key] int,[Marking_Period_Key] int,[Grade_Type_Key] int,[Course_Section_Key] int,[Student_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[School_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Calendar_Track_School_Id] varchar(16),[Term_Cd] varchar(30),[Marking_Period_Cd] varchar(30),[Grade_Type_Cd] varchar(30),[Course_Cd] varchar(30),[Course_School_Id] varchar(16),[Course_Section_Identifier] varchar(50),[Local_Student_Id] varchar(30),[Letter_Grade] varchar(12),[Numeric_Grade] decimal(9,2),[Grade_Point_Max] decimal(9,2),[Passing_Grade_Ind] char(1),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Student_Course_Grade_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Student_Course_Grade] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Student_Course_Grade_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Term_Key],[Marking_Period_Key],[Grade_Type_Key],[Course_Section_Key],[Student_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Term_Cd],[Marking_Period_Cd],[Grade_Type_Cd],[Course_Cd],[Course_School_Id],[Course_Section_Identifier],[Local_Student_Id],[Letter_Grade],[Numeric_Grade],[Grade_Point_Max],[Passing_Grade_Ind],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Student_Course_Grade_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Student_Course_Grade]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Student_Course_Grade] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Student_Course_Grade] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Term_Key],[Marking_Period_Key],[Grade_Type_Key],[Course_Section_Key],[Student_Key],[Batch_Key],[Letter_Grade],[Numeric_Grade],[Grade_Point_Max],[Passing_Grade_Ind],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Calendar_Track_Key],[Term_Key],[Marking_Period_Key],[Grade_Type_Key],[Course_Section_Key],[Student_Key],[Batch_Key],[Letter_Grade],[Numeric_Grade],[Grade_Point_Max],[Passing_Grade_Ind],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Student_Course_Grade] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Letter_Grade]=b.[Letter_Grade] ,[Numeric_Grade]=b.[Numeric_Grade] ,[Grade_Point_Max]=b.[Grade_Point_Max] ,[Passing_Grade_Ind]=b.[Passing_Grade_Ind] 
  from [tdw].[fct_Student_Course_Grade] a
  join ready.[fct_Student_Course_Grade] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Student_Course_Grade] a
  left outer join (select Hash_Key_BK from ready.[fct_Student_Course_Grade] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Student_Course_Grade] where Batch_Key is not null )

/*** fct_Student_Course_Schedule ***/
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Schedule' and schema_name(schema_id)='ready') drop table ready.[fct_Student_Course_Schedule]

create table ready.[fct_Student_Course_Schedule] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Student_Course_Schedule_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[Calendar_Track_Key] int,[Term_Key] int,[Course_Section_Key] int,[Student_Key] int,[Enrolled_School_Key] int,[Attending_School_Key] int,[Cycle_Day_Key] int,[Start_Period_Key] int,[End_Period_Key] int,[Entered_Date_Key] int,[Exited_Date_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Calendar_Track_School_Id] varchar(16),[Term_Cd] varchar(30),[Course_Cd] varchar(30),[Course_School_Id] varchar(16),[Course_Section_Identifier] varchar(50),[Local_Student_Id] varchar(30),[Enrolled-District_Id] varchar(16),[Enrolled-School_Id] varchar(16),[Attending-District_Id] varchar(16),[Attending-School_Id] varchar(16),[Cycle_Day_Cd] varchar(30),[Start-Period_Cd] varchar(30),[Start-Period_School_Id] varchar(16),[End-Period_Cd] varchar(30),[End-Period_School_Id] varchar(16),[Entered-Date_Of_Day] date,[Exited-Date_Of_Day] date,[Entered_Calendar_Date] date,[Exited_Calendar_Date] date,[Course_Enroll_Count] decimal(9,2),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Student_Course_Schedule_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Student_Course_Schedule] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Student_Course_Schedule_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[Calendar_Track_Key],[Term_Key],[Course_Section_Key],[Student_Key],[Enrolled_School_Key],[Attending_School_Key],[Cycle_Day_Key],[Start_Period_Key],[End_Period_Key],[Entered_Date_Key],[Exited_Date_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Term_Cd],[Course_Cd],[Course_School_Id],[Course_Section_Identifier],[Local_Student_Id],[Enrolled-District_Id],[Enrolled-School_Id],[Attending-District_Id],[Attending-School_Id],[Cycle_Day_Cd],[Start-Period_Cd],[Start-Period_School_Id],[End-Period_Cd],[End-Period_School_Id],[Entered-Date_Of_Day],[Exited-Date_Of_Day],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Student_Course_Schedule_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Student_Course_Schedule]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Student_Course_Schedule] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Student_Course_Schedule] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[Calendar_Track_Key],[Term_Key],[Course_Section_Key],[Student_Key],[Enrolled_School_Key],[Attending_School_Key],[Cycle_Day_Key],[Start_Period_Key],[End_Period_Key],[Entered_Date_Key],[Exited_Date_Key],[Batch_Key],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[Calendar_Track_Key],[Term_Key],[Course_Section_Key],[Student_Key],[Enrolled_School_Key],[Attending_School_Key],[Cycle_Day_Key],[Start_Period_Key],[End_Period_Key],[Entered_Date_Key],[Exited_Date_Key],[Batch_Key],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Student_Course_Schedule] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Course_Enroll_Count]=b.[Course_Enroll_Count] 
  from [tdw].[fct_Student_Course_Schedule] a
  join ready.[fct_Student_Course_Schedule] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Student_Course_Schedule] a
  left outer join (select Hash_Key_BK from ready.[fct_Student_Course_Schedule] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Student_Course_Schedule] where Batch_Key is not null )

/*** fct_Student_Course_Transcript ***/
if exists (select * from sys.objects where type='U' and name='fct_Student_Course_Transcript' and schema_name(schema_id)='ready') drop table ready.[fct_Student_Course_Transcript]

create table ready.[fct_Student_Course_Transcript] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Student_Course_Grade_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[School_Key] int,[Term_Key] int,[Student_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[School_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Term_Cd] varchar(30),[Local_Student_Id] varchar(30),[Letter_Grade] varchar(12),[Numeric_Grade] decimal(9,2),[Credit_Attempted] decimal(5,2),[Credit_Earned] decimal(5,2),[Quality_Points_Earned] decimal(5,2),[Grade_Point_Max] decimal(9,2),[Passing_Grade_Ind] char(1),[Content_Completer_Ind] char(1),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Student_Course_Grade_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Student_Course_Transcript] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Student_Course_Grade_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Term_Key],[Student_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[School_Id],[Calendar_Track_Cd],[Term_Cd],[Local_Student_Id],[Letter_Grade],[Numeric_Grade],[Credit_Attempted],[Credit_Earned],[Quality_Points_Earned],[Grade_Point_Max],[Passing_Grade_Ind],[Content_Completer_Ind],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Student_Course_Grade_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Student_Course_Transcript]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Student_Course_Transcript] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Student_Course_Transcript] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Term_Key],[Student_Key],[Batch_Key],[Letter_Grade],[Numeric_Grade],[Credit_Attempted],[Credit_Earned],[Quality_Points_Earned],[Grade_Point_Max],[Passing_Grade_Ind],[Content_Completer_Ind],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Term_Key],[Student_Key],[Batch_Key],[Letter_Grade],[Numeric_Grade],[Credit_Attempted],[Credit_Earned],[Quality_Points_Earned],[Grade_Point_Max],[Passing_Grade_Ind],[Content_Completer_Ind],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Student_Course_Transcript] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Letter_Grade]=b.[Letter_Grade] ,[Numeric_Grade]=b.[Numeric_Grade] ,[Credit_Attempted]=b.[Credit_Attempted] ,[Credit_Earned]=b.[Credit_Earned] ,[Quality_Points_Earned]=b.[Quality_Points_Earned] ,[Grade_Point_Max]=b.[Grade_Point_Max] ,[Passing_Grade_Ind]=b.[Passing_Grade_Ind] ,[Content_Completer_Ind]=b.[Content_Completer_Ind] 
  from [tdw].[fct_Student_Course_Transcript] a
  join ready.[fct_Student_Course_Transcript] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Student_Course_Transcript] a
  left outer join (select Hash_Key_BK from ready.[fct_Student_Course_Transcript] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Student_Course_Transcript] where Batch_Key is not null )

/*** fct_Student_Program_Participation ***/
if exists (select * from sys.objects where type='U' and name='fct_Student_Program_Participation' and schema_name(schema_id)='ready') drop table ready.[fct_Student_Program_Participation]

create table ready.[fct_Student_Program_Participation] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Student_Program_Participation_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[School_Key] int,[Program_Key] int,[Student_Key] int,[Effective_Date_Key] int,[Ending_Date_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[School_Id] varchar(16),[Program_Cd] varchar(30),[Local_Student_Id] varchar(30),[Effective-Date_Of_Day] date,[Ending-Date_Of_Day] date,[Occurrence] tinyint,[Effective_Date] date,[Ending_Date] date,[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Student_Program_Participation_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Student_Program_Participation] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Student_Program_Participation_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Program_Key],[Student_Key],[Effective_Date_Key],[Ending_Date_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[School_Id],[Program_Cd],[Local_Student_Id],[Effective-Date_Of_Day],[Ending-Date_Of_Day],[Occurrence],[Effective_Date],[Ending_Date],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Student_Program_Participation_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Student_Program_Participation]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Student_Program_Participation] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Student_Program_Participation] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Program_Key],[Student_Key],[Effective_Date_Key],[Ending_Date_Key],[Batch_Key],[Occurrence],[Effective_Date],[Ending_Date],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[School_Key],[Program_Key],[Student_Key],[Effective_Date_Key],[Ending_Date_Key],[Batch_Key],[Occurrence],[Effective_Date],[Ending_Date],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Student_Program_Participation] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Ending_Date_Key]=b.[Ending_Date_Key] ,[Ending_Date]=b.[Ending_Date] 
  from [tdw].[fct_Student_Program_Participation] a
  join ready.[fct_Student_Program_Participation] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Student_Program_Participation] a
  left outer join (select Hash_Key_BK from ready.[fct_Student_Program_Participation] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Student_Program_Participation] where Batch_Key is not null )

/*** fct_Teacher_Course_Schedule ***/
if exists (select * from sys.objects where type='U' and name='fct_Teacher_Course_Schedule' and schema_name(schema_id)='ready') drop table ready.[fct_Teacher_Course_Schedule]

create table ready.[fct_Teacher_Course_Schedule] ([MissingBusinessKey] int,[MissingForeignKey] int,[DupCount] bigint,[Teacher_Course_Schedule_Key_Temp] int,[UpdateFlag] int,[NewSeqFlag] int,[NewKeyFlag] int,[NewRowFlag] int,[HASH_KEY_BK] binary(16),[Academic_Year_Key] int,[District_Key] int,[Calendar_Track_Key] int,[Term_Key] int,[Course_Section_Key] int,[Staff_Key] int,[School_Key] int,[Cycle_Day_Key] int,[Start_Period_Key] int,[End_Period_Key] int,[Entered_Date_Key] int,[Exited_Date_Key] int,[Batch_Key] int,[Academic_Year_Name] char(9),[District_Id] varchar(16),[Calendar_Track_Cd] varchar(30),[Calendar_Track_School_Id] varchar(16),[Term_Cd] varchar(30),[Course_Cd] varchar(30),[Course_School_Id] varchar(16),[Course_Section_Identifier] varchar(50),[Local_Staff_Id] varchar(32),[School_Id] varchar(16),[Cycle_Day_Cd] varchar(30),[Start-Period_Cd] varchar(30),[Start-Period_School_Id] varchar(16),[End-Period_Cd] varchar(30),[End-Period_School_Id] varchar(16),[Entered-Date_Of_Day] date,[Exited-Date_Of_Day] date,[Entered_Calendar_Date] date,[Exited_Calendar_Date] date,[Course_Enroll_Count] decimal(9,2),[Primary_Secondary_CD] char(2),[Batch_Period] varchar(50),[SAID] varchar(30),[Date_Stamp] datetime2(7),[SourceIdentifier] varchar(50),[OES_Litho] bigint,[Teacher_Course_Schedule_Key] int,[DISCARDFLAG] int)
insert into ready.[fct_Teacher_Course_Schedule] ([MissingBusinessKey],[MissingForeignKey],[DupCount],[Teacher_Course_Schedule_Key_Temp],[UpdateFlag],[NewSeqFlag],[NewKeyFlag],[NewRowFlag],[HASH_KEY_BK],[Academic_Year_Key],[District_Key],[Calendar_Track_Key],[Term_Key],[Course_Section_Key],[Staff_Key],[School_Key],[Cycle_Day_Key],[Start_Period_Key],[End_Period_Key],[Entered_Date_Key],[Exited_Date_Key],[Batch_Key],[Academic_Year_Name],[District_Id],[Calendar_Track_Cd],[Calendar_Track_School_Id],[Term_Cd],[Course_Cd],[Course_School_Id],[Course_Section_Identifier],[Local_Staff_Id],[School_Id],[Cycle_Day_Cd],[Start-Period_Cd],[Start-Period_School_Id],[End-Period_Cd],[End-Period_School_Id],[Entered-Date_Of_Day],[Exited-Date_Of_Day],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Primary_Secondary_CD],[Batch_Period],[SAID],[Date_Stamp],[SourceIdentifier],[OES_Litho],[Teacher_Course_Schedule_Key],[DISCARDFLAG]) 
exec [dbo].[sp_iMart_Load_fct_Teacher_Course_Schedule]

insert into [tdw].[dim_batch] (SAID, Batch_Period)
select distinct x.SAID, x.Batch_Period
  from [tdw].[dim_batch] b
 right outer join (select distinct SAID, Batch_Period from ready.[fct_Teacher_Course_Schedule] ) x
    on x.SAID=b.SAID and x.Batch_Period=b.Batch_Period where b.SAID is null

set @ExecTime = getdate()
insert into[tdw].[fct_Teacher_Course_Schedule] ([HASH_KEY_BK],[Academic_Year_Key],[District_Key],[Calendar_Track_Key],[Term_Key],[Course_Section_Key],[Staff_Key],[School_Key],[Cycle_Day_Key],[Start_Period_Key],[End_Period_Key],[Entered_Date_Key],[Exited_Date_Key],[Batch_Key],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Primary_Secondary_CD],[Date_Stamp],[SourceIdentifier],[No_Longer_In_Source_Ind],[Date_First_Seen],[Date_Last_Seen])
select [HASH_KEY_BK],[Academic_Year_Key],[District_Key],[Calendar_Track_Key],[Term_Key],[Course_Section_Key],[Staff_Key],[School_Key],[Cycle_Day_Key],[Start_Period_Key],[End_Period_Key],[Entered_Date_Key],[Exited_Date_Key],[Batch_Key],[Entered_Calendar_Date],[Exited_Calendar_Date],[Course_Enroll_Count],[Primary_Secondary_CD],[Date_Stamp],[SourceIdentifier],'N',@ExecTime,@ExecTime
from ready.[fct_Teacher_Course_Schedule] where NewRowFlag = 1 and DiscardFlag = 0

update a set [Exited_Date_Key]=b.[Exited_Date_Key] ,[Exited_Calendar_Date]=b.[Exited_Calendar_Date] ,[Primary_Secondary_CD]=b.[Primary_Secondary_CD] 
  from [tdw].[fct_Teacher_Course_Schedule] a
  join ready.[fct_Teacher_Course_Schedule] b
    on a.Hash_Key_BK=b.Hash_Key_BK
 where b.UpdateFlag=1 and b.DiscardFlag=0 and b.NewRowFlag= 0

update a
   set Date_Last_Seen =case when b.Hash_Key_BK is null then a.Date_Last_Seen else getdate() end
     , No_Longer_In_Source_Ind=case when b.Hash_Key_BK is null then 'Y' else 'N' end
  from [tdw].[fct_Teacher_Course_Schedule] a
  left outer join (select Hash_Key_BK from ready.[fct_Teacher_Course_Schedule] where DiscardFlag=0) b on a.Hash_Key_BK=b.Hash_Key_BK
 where a.Batch_Key in (select distinct Batch_Key from ready.[fct_Teacher_Course_Schedule] where Batch_Key is not null )
