/***  OtisEd iMart EdFi Starter Data Warehouse version 1.0 
	  Raw Stage EdFi tables (Step 2b)
***/
use [iMartEdfi]

declare @sql nvarchar(MAX) = N'' 
declare @SAID nvarchar(30) = 'XYZ-EdFi3'				--xyz is a code which represents your district
declare @SourceDb nvarchar(128) = 'EdFi_Ods_Northridge'	--enter the name of your Ed-Fi ODS database here
declare @SourceSrv nvarchar(128) = ''					--enter Linked Server name in brackets (e.g. [MyLinkedServerName]) if Ed-Fi ODS is on a different server

if (len(@SourceSrv) > 0 and right(@SourceSrv, 1) <> '.') set @SourceSrv = @SourceSrv + '.'

/*** Create Schema ***/
IF (SCHEMA_ID('edfi') IS NULL) EXEC ('CREATE SCHEMA [edfi] AUTHORIZATION [dbo]')

/*** List of Tables to Grab ***/
declare @TableList table (Table_Name nvarchar(128), Table_Schema nvarchar(128), [Skip] int)
insert into @TableList (Table_Name, Table_Schema, [Skip]) values
('Calendar','edfi',0),
('CalendarDate','edfi',0),
('CalendarDateCalendarEvent','edfi',0),
('CalendarEventDescriptor','edfi',0),
('CalendarTypeDescriptor','edfi',0),
('ClassPeriod','edfi',0),
('ClassPeriodMeetingTime','edfi',0),
('Course','edfi',0),
('CourseIdentificationCode','edfi',0),
('CourseLevelCharacteristic','edfi',0),
('CourseOffering','edfi',0),
('CourseTranscript','edfi',0),
('Descriptor','edfi',0),
('EducationOrganization','edfi',0),
('EducationOrganizationAddress','edfi',0),
('EducationOrganizationIdentificationCode','edfi',0),
('EducationOrganizationInstitutionTelephone','edfi',0),
('Grade','edfi',0),
('GradeTypeDescriptor','edfi',0),
('GradingPeriod','edfi',0),
('GradingPeriodDescriptor','edfi',0),
('LocalEducationAgency','edfi',0),
('Program','edfi',0),
('ProgramTypeDescriptor','edfi',0),
('School','edfi',0),
('SchoolCategory','edfi',0),
('SchoolGradeLevel','edfi',0),
('SchoolYearType','edfi',0),
('Section','edfi',0),
('SectionClassPeriod','edfi',0),
('Session','edfi',0),
('SexDescriptor','edfi',0),
('Staff','edfi',0),
('StaffClassificationDescriptor','edfi',0),
('StaffEducationOrganizationAssignmentAssociation','edfi',0),
('StaffElectronicMail','edfi',0),
('StaffIdentificationCode','edfi',0),
('StaffSchoolAssociation','edfi',0),
('StaffSchoolAssociationGradeLevel','edfi',0),
('StaffSectionAssociation','edfi',0),
('Student','edfi',0),
('StudentAcademicRecordDiploma','edfi',0),
('StudentEducationOrganizationAssociation','edfi',0),
('StudentEducationOrganizationAssociationLanguageUse','edfi',0),
('StudentEducationOrganizationAssociationRace','edfi',0),
('StudentEducationOrganizationAssociationStudentCharacteristic','edfi',0),
('StudentEducationOrganizationAssociationStudentIdentificationCode','edfi',0),
('StudentOtherName','edfi',0),
('StudentProgramAssociation','edfi',0),
('StudentSchoolAssociation','edfi',0),
('StudentSchoolAttendanceEvent','edfi',0),
('StudentSchoolFoodServiceProgramAssociation','edfi',0),
('StudentSectionAssociation','edfi',0),
('StudentSectionAttendanceEvent','edfi',0),
('StudentSpecialEducationProgramAssociation','edfi',0),
('StudentSpecialEducationProgramAssociationDisability','edfi',0),
('StudentSpecialEducationProgramAssociationSpecialEducationProgramService','edfi',0),
('StudentTitleIPartAProgramAssociation','edfi',0),
('TermDescriptor','edfi',0)

/*** Raw Stage Each table ***/
declare @t nvarchar(128), @s nvarchar(128)
declare EdFiTables cursor read_only
for select Table_Name, Table_Schema from @TableList where [Skip]=0

open EdFiTables
fetch next from EdFiTables into @t, @s

while @@FETCH_STATUS=0
begin
	begin try
	set @sql = replace(N'if exists (select * from sys.views where name=''{t}'' and schema_name(schema_id)=''edfi'') drop view [edfi].[{t}]','{t}',@t)
	print @sql
	exec (@sql)
	set @sql = replace(N'if exists (select * from sys.objects where type=''U'' and name=''{t}'' and schema_name(schema_id)=''edfi'') drop table [edfi].[{t}]','{t}',@t)
	exec (@sql)
	end try
	begin catch
		print 'Error dropping table or view associated with '+@t+' ' + ERROR_MESSAGE()
	end catch
	begin try
	set @sql = replace(replace(replace(replace(N'select SAID=''{said}'', OES_Litho=Row_Number() over (order by (select 1)), * into [edfi].[{t}] from {srv}[{db}].[edfi].[{t}]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv),'{t}',@t)
	exec (@sql)
	end try
	begin catch
		print 'Error creating table '+@t
	end catch
	fetch next from EdFiTables into @t, @s
end
close EdFiTables
deallocate EdFiTables

/*** Create Indexes for Transforming ***/
CREATE NONCLUSTERED INDEX Idx_CodeDateSchYr
ON [edfi].[CalendarDateCalendarEvent] ([CalendarCode],[Date],[SchoolId],[SchoolYear])
INCLUDE ([CalendarEventDescriptorId])

CREATE NONCLUSTERED INDEX Idx_DescId
ON [edfi].[CalendarDateCalendarEvent] ([CalendarEventDescriptorId])
INCLUDE ([CalendarCode],[Date],[SchoolId],[SchoolYear])

CREATE NONCLUSTERED INDEX Idx_LCCodeSchYrSession
ON [edfi].[CourseOffering] ([LocalCourseCode],[SchoolId],[SchoolYear],[SessionName])
INCLUDE ([CourseCode])

CREATE NONCLUSTERED INDEX Idx_Id
ON [edfi].[Descriptor] ([DescriptorId])
INCLUDE ([CodeValue],[Description],[LastModifiedDate])

CREATE NONCLUSTERED INDEX Idx_Id
ON [edfi].[EducationOrganization] ([EducationOrganizationId])

CREATE NONCLUSTERED INDEX Idx_SchStu
ON [edfi].[Grade] ([SchoolId],[StudentUSI])
INCLUDE ([SAID],[GradeTypeDescriptorId],[GradingPeriodDescriptorId],[SchoolYear],[SectionIdentifier],[SessionName],[LetterGradeEarned],[NumericGradeEarned],[LastModifiedDate],[Id])

CREATE NONCLUSTERED INDEX Idx_USI
ON [edfi].[Staff] ([StaffUSI])
INCLUDE ([FirstName],[LastSurname])

CREATE NONCLUSTERED INDEX Idx_Stf
ON [edfi].[StaffElectronicMail] ([StaffUSI])
INCLUDE ([ElectronicMailAddress])

CREATE NONCLUSTERED INDEX Idx_Stu
ON [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] ([StudentUSI])

CREATE NONCLUSTERED INDEX idx_Sch
ON [edfi].[StudentSchoolAttendanceEvent] ([SchoolId])
INCLUDE ([AttendanceEventCategoryDescriptorId],[SchoolYear])

CREATE NONCLUSTERED INDEX Idx_SchStu
ON [edfi].[StudentSectionAssociation] ([SchoolId],[StudentUSI])
INCLUDE ([SchoolYear],[SessionName])
