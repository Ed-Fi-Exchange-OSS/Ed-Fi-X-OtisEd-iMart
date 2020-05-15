﻿/****** Object:  StoredProcedure [dbo].[sp_iMart_Transform_fct_Enrollment_Pairs_edfi]    Script Date: 4:40:40 PM ******/
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