/***  OtisEd iMart EdFi Starter Data Warehouse version 1.0 
	  Create3 EdFi views (Step 2)
***/

declare @sql nvarchar(MAX) = N'' 
declare @SAID nvarchar(30) = 'XYZ-EdFi'						--xyz is a code which represents your district
declare @SourceDb nvarchar(128) = 'EdFi_Ods_Northridge'		--enter the name of your Ed-Fi ODS database here
declare @SourceSrv nvarchar(128) = ''						--enter Linked Server name in brackets (e.g. [MyLinkedServerName]) if Ed-Fi ODS is on a different server

if (len(@SourceSrv) > 0 and right(@SourceSrv, 1) <> '.') set @SourceSrv = @SourceSrv + '.'

/*** Create Schema ***/
IF (SCHEMA_ID('edfi') IS NULL) EXEC ('CREATE SCHEMA [edfi] AUTHORIZATION [dbo]')

/*** Drop views ***/
if exists (select * from sys.views where name='Calendar' and schema_name(schema_id)='edfi') drop view [edfi].[Calendar]
if exists (select * from sys.views where name='CalendarDate' and schema_name(schema_id)='edfi') drop view [edfi].[CalendarDate]
if exists (select * from sys.views where name='CalendarDateCalendarEvent' and schema_name(schema_id)='edfi') drop view [edfi].[CalendarDateCalendarEvent]
if exists (select * from sys.views where name='CalendarEventDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[CalendarEventDescriptor]
if exists (select * from sys.views where name='CalendarTypeDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[CalendarTypeDescriptor]
if exists (select * from sys.views where name='ClassPeriod' and schema_name(schema_id)='edfi') drop view [edfi].[ClassPeriod]
if exists (select * from sys.views where name='ClassPeriodMeetingTime' and schema_name(schema_id)='edfi') drop view [edfi].[ClassPeriodMeetingTime]
if exists (select * from sys.views where name='Course' and schema_name(schema_id)='edfi') drop view [edfi].[Course]
if exists (select * from sys.views where name='CourseIdentificationCode' and schema_name(schema_id)='edfi') drop view [edfi].[CourseIdentificationCode]
if exists (select * from sys.views where name='CourseLevelCharacteristic' and schema_name(schema_id)='edfi') drop view [edfi].[CourseLevelCharacteristic]
if exists (select * from sys.views where name='CourseOffering' and schema_name(schema_id)='edfi') drop view [edfi].[CourseOffering]
if exists (select * from sys.views where name='CourseTranscript' and schema_name(schema_id)='edfi') drop view [edfi].[CourseTranscript]
if exists (select * from sys.views where name='Descriptor' and schema_name(schema_id)='edfi') drop view [edfi].[Descriptor]
if exists (select * from sys.views where name='EducationOrganization' and schema_name(schema_id)='edfi') drop view [edfi].[EducationOrganization]
if exists (select * from sys.views where name='EducationOrganizationAddress' and schema_name(schema_id)='edfi') drop view [edfi].[EducationOrganizationAddress]
if exists (select * from sys.views where name='EducationOrganizationIdentificationCode' and schema_name(schema_id)='edfi') drop view [edfi].[EducationOrganizationIdentificationCode]
if exists (select * from sys.views where name='EducationOrganizationInstitutionTelephone' and schema_name(schema_id)='edfi') drop view [edfi].[EducationOrganizationInstitutionTelephone]
if exists (select * from sys.views where name='Grade' and schema_name(schema_id)='edfi') drop view [edfi].[Grade]
if exists (select * from sys.views where name='GradeTypeDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[GradeTypeDescriptor]
if exists (select * from sys.views where name='GradingPeriod' and schema_name(schema_id)='edfi') drop view [edfi].[GradingPeriod]
if exists (select * from sys.views where name='GradingPeriodDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[GradingPeriodDescriptor]
if exists (select * from sys.views where name='LocalEducationAgency' and schema_name(schema_id)='edfi') drop view [edfi].[LocalEducationAgency]
if exists (select * from sys.views where name='Program' and schema_name(schema_id)='edfi') drop view [edfi].[Program]
if exists (select * from sys.views where name='ProgramTypeDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[ProgramTypeDescriptor]
if exists (select * from sys.views where name='School' and schema_name(schema_id)='edfi') drop view [edfi].[School]
if exists (select * from sys.views where name='SchoolCategory' and schema_name(schema_id)='edfi') drop view [edfi].[SchoolCategory]
if exists (select * from sys.views where name='SchoolGradeLevel' and schema_name(schema_id)='edfi') drop view [edfi].[SchoolGradeLevel]
if exists (select * from sys.views where name='SchoolYearType' and schema_name(schema_id)='edfi') drop view [edfi].[SchoolYearType]
if exists (select * from sys.views where name='Section' and schema_name(schema_id)='edfi') drop view [edfi].[Section]
if exists (select * from sys.views where name='SectionClassPeriod' and schema_name(schema_id)='edfi') drop view [edfi].[SectionClassPeriod]
if exists (select * from sys.views where name='Session' and schema_name(schema_id)='edfi') drop view [edfi].[Session]
if exists (select * from sys.views where name='SexDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[SexDescriptor]
if exists (select * from sys.views where name='Staff' and schema_name(schema_id)='edfi') drop view [edfi].[Staff]
if exists (select * from sys.views where name='StaffClassificationDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[StaffClassificationDescriptor]
if exists (select * from sys.views where name='StaffEducationOrganizationAssignmentAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StaffEducationOrganizationAssignmentAssociation]
if exists (select * from sys.views where name='StaffElectronicMail' and schema_name(schema_id)='edfi') drop view [edfi].[StaffElectronicMail]
if exists (select * from sys.views where name='StaffIdentificationCode' and schema_name(schema_id)='edfi') drop view [edfi].[StaffIdentificationCode]
if exists (select * from sys.views where name='StaffSchoolAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StaffSchoolAssociation]
if exists (select * from sys.views where name='StaffSchoolAssociationGradeLevel' and schema_name(schema_id)='edfi') drop view [edfi].[StaffSchoolAssociationGradeLevel]
if exists (select * from sys.views where name='StaffSectionAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StaffSectionAssociation]
if exists (select * from sys.views where name='Student' and schema_name(schema_id)='edfi') drop view [edfi].[Student]
if exists (select * from sys.views where name='StudentAcademicRecordDiploma' and schema_name(schema_id)='edfi') drop view [edfi].[StudentAcademicRecordDiploma]
if exists (select * from sys.views where name='StudentEducationOrganizationAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StudentEducationOrganizationAssociation]
if exists (select * from sys.views where name='StudentEducationOrganizationAssociationRace' and schema_name(schema_id)='edfi') drop view [edfi].[StudentEducationOrganizationAssociationRace]
if exists (select * from sys.views where name='StudentEducationOrganizationAssociationLanguageUse' and schema_name(schema_id)='edfi') drop view [edfi].[StudentEducationOrganizationAssociationLanguageUse]
if exists (select * from sys.views where name='StudentEducationOrganizationAssociationStudentCharacteristic' and schema_name(schema_id)='edfi') drop view [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]
if exists (select * from sys.views where name='StudentEducationOrganizationAssociationStudentIdentificationCode' and schema_name(schema_id)='edfi') drop view [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode]
if exists (select * from sys.views where name='StudentOtherName' and schema_name(schema_id)='edfi') drop view [edfi].[StudentOtherName]
if exists (select * from sys.views where name='StudentProgramAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StudentProgramAssociation]
if exists (select * from sys.views where name='StudentSchoolAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSchoolAssociation]
if exists (select * from sys.views where name='StudentSchoolAttendanceEvent' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSchoolAttendanceEvent]
if exists (select * from sys.views where name='StudentSchoolFoodServiceProgramAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSchoolFoodServiceProgramAssociation]
if exists (select * from sys.views where name='StudentSectionAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSectionAssociation]
if exists (select * from sys.views where name='StudentSectionAttendanceEvent' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSectionAttendanceEvent]
if exists (select * from sys.views where name='StudentSpecialEducationProgramAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSpecialEducationProgramAssociation]
if exists (select * from sys.views where name='StudentSpecialEducationProgramAssociationDisability' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSpecialEducationProgramAssociationDisability]
if exists (select * from sys.views where name='StudentSpecialEducationProgramAssociationSpecialEducationProgramService' and schema_name(schema_id)='edfi') drop view [edfi].[StudentSpecialEducationProgramAssociationSpecialEducationProgramService]
if exists (select * from sys.views where name='StudentTitleIPartAProgramAssociation' and schema_name(schema_id)='edfi') drop view [edfi].[StudentTitleIPartAProgramAssociation]
if exists (select * from sys.views where name='TermDescriptor' and schema_name(schema_id)='edfi') drop view [edfi].[TermDescriptor]

/*** Create Views ***/
set @sql= replace(replace(replace(N'create view [edfi].[Calendar] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Calendar]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CalendarDate] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CalendarDate]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CalendarDateCalendarEvent] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CalendarDateCalendarEvent]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CalendarEventDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CalendarEventDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CalendarTypeDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CalendarTypeDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[ClassPeriod] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[ClassPeriod]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[ClassPeriodMeetingTime] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[ClassPeriodMeetingTime]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Course] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Course]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CourseIdentificationCode] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CourseIdentificationCode]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CourseLevelCharacteristic] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CourseLevelCharacteristic]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CourseOffering] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CourseOffering]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[CourseTranscript] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[CourseTranscript]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Descriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Descriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[EducationOrganization] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[EducationOrganization]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[EducationOrganizationAddress] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[EducationOrganizationAddress]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[EducationOrganizationIdentificationCode] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[EducationOrganizationIdentificationCode]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[EducationOrganizationInstitutionTelephone] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[EducationOrganizationInstitutionTelephone]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Grade] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Grade]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[GradeTypeDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[GradeTypeDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[GradingPeriod] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[GradingPeriod]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[GradingPeriodDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[GradingPeriodDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[LocalEducationAgency] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[LocalEducationAgency]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Program] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Program]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[ProgramTypeDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[ProgramTypeDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[School] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[School]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[SchoolCategory] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[SchoolCategory]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[SchoolGradeLevel] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[SchoolGradeLevel]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[SchoolYearType] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[SchoolYearType]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Section] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Section]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[SectionClassPeriod] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[SectionClassPeriod]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Session] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Session]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[SexDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[SexDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Staff] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Staff]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StaffClassificationDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StaffClassificationDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StaffEducationOrganizationAssignmentAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StaffEducationOrganizationAssignmentAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StaffElectronicMail] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StaffElectronicMail]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StaffIdentificationCode] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StaffIdentificationCode]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StaffSchoolAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StaffSchoolAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StaffSchoolAssociationGradeLevel] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StaffSchoolAssociationGradeLevel]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StaffSectionAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StaffSectionAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[Student] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[Student]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentAcademicRecordDiploma] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentAcademicRecordDiploma]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentEducationOrganizationAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentEducationOrganizationAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentEducationOrganizationAssociationRace] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentEducationOrganizationAssociationRace]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentEducationOrganizationAssociationLanguageUse] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentEducationOrganizationAssociationLanguageUse]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentEducationOrganizationAssociationStudentCharacteristic] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentEducationOrganizationAssociationStudentCharacteristic]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentEducationOrganizationAssociationStudentIdentificationCode]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentOtherName] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentOtherName]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentProgramAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentProgramAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSchoolAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSchoolAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSchoolAttendanceEvent] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSchoolAttendanceEvent]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSchoolFoodServiceProgramAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSchoolFoodServiceProgramAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSectionAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSectionAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSectionAttendanceEvent] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSectionAttendanceEvent]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSpecialEducationProgramAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSpecialEducationProgramAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSpecialEducationProgramAssociationDisability] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSpecialEducationProgramAssociationDisability]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentSpecialEducationProgramAssociationSpecialEducationProgramService] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentSpecialEducationProgramAssociationSpecialEducationProgramService]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[StudentTitleIPartAProgramAssociation] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[StudentTitleIPartAProgramAssociation]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)
set @sql= replace(replace(replace(N'create view [edfi].[TermDescriptor] as select SAID=''{said}'', * from {srv}[{db}].[edfi].[TermDescriptor]','{said}',@SAID),'{db}',@SourceDb),'{srv}',@SourceSrv)
exec (@sql)