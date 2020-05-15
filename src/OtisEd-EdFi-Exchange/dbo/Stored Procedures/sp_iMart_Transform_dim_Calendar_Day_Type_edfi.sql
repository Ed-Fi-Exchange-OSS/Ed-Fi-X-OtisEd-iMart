﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Calendar_Day_Type_edfi]    Script Date: 4:40:40 PM ******/
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

  where @Batch_Period_List='all' or @ActiveSchoolYear in (select Batch_Period from @BPLtable)
    and (IsNull(@SAID,'all') in ('all','any') or [edfi].[CalendarEventDescriptor].SAID in (select SAID from @SAIDtable) )
  --</MappingInfoFrom>
--</MappingInfo>