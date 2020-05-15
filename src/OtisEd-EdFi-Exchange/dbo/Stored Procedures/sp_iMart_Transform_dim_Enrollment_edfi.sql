﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Enrollment_edfi]    Script Date: 4:40:40 PM ******/
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