﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Term_edfi]    Script Date: 4:40:40 PM ******/
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

  where @Batch_Period_List='all' or [edfi].[Session].[SchoolYear] in (select Batch_Period from @BPLtable)
   and (IsNull(@SAID,'all') in ('all','any') or [edfi].[Session].[SAID] in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>