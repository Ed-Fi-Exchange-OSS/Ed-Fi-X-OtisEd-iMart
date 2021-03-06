﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Attendance_edfi]    Script Date: 4:40:40 PM ******/
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
  where @Batch_Period_List='all' or [AttendanceEvent_lkp].SchoolYear in (select Batch_Period from @BPLtable)
   and (IsNull(@SAID,'all') in ('all','any') or [AttendanceEvent_lkp].SAID in (select SAID from @SAIDtable) )  --</MappingInfoFrom>
--</MappingInfo>