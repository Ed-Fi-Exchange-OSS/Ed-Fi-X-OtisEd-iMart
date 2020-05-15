﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Marking_Period_edfi]    Script Date: 4:40:40 PM ******/
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