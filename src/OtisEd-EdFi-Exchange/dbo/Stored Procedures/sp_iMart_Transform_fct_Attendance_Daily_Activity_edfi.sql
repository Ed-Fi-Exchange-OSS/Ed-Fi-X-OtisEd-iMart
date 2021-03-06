﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Attendance_Daily_Activity_edfi]    Script Date: 4:40:40 PM ******/
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

  where @Batch_Period_List='all' or [edfi].[StudentSchoolAttendanceEvent].SchoolYear in (select Batch_Period from @BPLtable)
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[StudentSchoolAttendanceEvent].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>