﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_dim_Grade_Type_edfi]    Script Date: 4:40:40 PM ******/
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