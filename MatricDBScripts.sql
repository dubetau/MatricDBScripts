create database [Matric Results]
Go

create table dbo.schoolDetails
(
	CentreNo varchar(20) NOT NULL PRIMARY KEY,
	Emis varchar(20) not null,
	[Name] varchar(200) not null
)

create table dbo.YearlyResults
(
	CentreNo varchar(20) not null primary key,
	ExamYear varchar(4) not null,
	Wrote int null,
	Passed int null,
)
Go
USE [Matric Results]
Go

create procedure dbo.GetAllResults
AS
begin
	Select *
	from dbo.schoolDetails sd
	right join dbo.YearlyResults yr on sd.CentreNo = yr.CentreNo
 end
 Go

 create procedure dbo.GetResultsForYear
 @year varchar(4)
 as
 begin
	select *
	from from dbo.schoolDetails sd
	left join dbo.YearlyResults yr on sd.CentreNo = yr.CentreNo
	where sd.ExamYear = @year
 end
 GO

 create procedure dbo.GetResultsForCentre
 @centre varchar(4)
 as
 begin
	select *
	from from dbo.schoolDetails sd
	left join dbo.YearlyResults yr on sd.CentreNo = yr.CentreNo
	where sd.CentreNo = @centre
 end
 GO



 create procedure dbo.InsertResults
 @centreNo varchar(20),
 @emis varchar(20),
 @name varchar(200),
 @wrote2014 int = null,
 @passed2014 int = null,
 @wrote2015 int = null,
 @passed2015 int = null,
 @wrote2016 int = null,
 @passed2016 int = null
 AS
 BEGIN
	insert into dbo.schoolDetails (CentreNo, Emis, [Name])
	values (@centreNo, @emis, @name)

	insert into dbo.YearlyResults (CentreNo, ExamYear, Wrote, Passed)
	values (@centreNo, '2014', @wrote2014, @passed2014)

	insert into dbo.YearlyResults (CentreNo, ExamYear, Wrote, Passed)
	values (@centreNo, '2015', @wrote2015, @passed2015)

	insert into dbo.YearlyResults (CentreNo, ExamYear, Wrote, Passed)
	values (@centreNo, '2016', @wrote2016, @passed2016)
 END
 GO

