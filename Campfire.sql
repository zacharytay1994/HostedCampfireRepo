USE master
IF EXISTS(select * from sys.databases where name='Campfire_test')
DROP DATABASE Campfire_test
GO

Create Database Campfire_test
GO

use Campfire_test
GO

/* Table: dbo.Account */
if exists (select * from sysobjects 
  where id = object_id('dbo.CampfireUsers') and sysstat & 0xf = 3)
  drop table dbo.CampfireUsers
GO

--/* Table: dbo.Category */
--if exists (select * from sysobjects 
--  where id = object_id('dbo.Category') and sysstat & 0xf = 3)
--  drop table dbo.Category
--GO

/* Table: dbo.Activities */
if exists (select * from sysobjects 
  where id = object_id('dbo.Activities') and sysstat & 0xf = 3)
  drop table dbo.Activities
GO

/*** Create tables ***/
/* Table: dbo.Account 	*/
CREATE TABLE dbo.CampfireUsers 
(
  AccountID		int				NOT NULL,
  Username		varchar(100)	NOT NULL,
  EmailAddr		varchar(150)	NOT NULL,
  Password		varchar(255)	NOT NULL,
  CONSTRAINT PK_Users PRIMARY KEY NONCLUSTERED (AccountID)
)
GO

--/* Table: dbo.Category */
--CREATE TABLE dbo.Category
--(
--  CategoryID		varchar(10)	 NOT NULL,
--  CategoryName		varchar(255) NOT NULL,
--  CONSTRAINT PK_Category PRIMARY KEY NONCLUSTERED (CategoryID)
--)

/* Table: dbo.Activities */
CREATE TABLE dbo.Activities
(
  ActivityID	int				NOT NULL,
  ActivityName	varchar(255)	NOT NULL,
  ActivityDesc	varchar(255)	NOT NULL,
  CategoryID	varchar(10)		NOT NULL,
  ActivityExp	varchar(255)	NOT NULL,
  Picture		varchar(8000)	NULL,
  Link			varchar(255)	NULL,
  Votes			int				NULL,
  Duration		tinyint			NOT NULL
  CONSTRAINT PK_Activities PRIMARY KEY NONCLUSTERED (ActivityID),
  --CONSTRAINT FK_Activities_Category FOREIGN KEY (CategoryID) REFERENCES dbo.Category(CategoryID)
)
GO

--/* Add foreign key constraint to dbo.Category */
--ALTER TABLE dbo.Category
--  ADD CONSTRAINT FK_Category_CategoryID FOREIGN KEY (CategoryID) REFERENCES      
--  dbo.Activities(ActivityID)
--GO

INSERT INTO CampfireUsers VALUES (1, 'Zach', 'zacharytay1994@gmail.com', '12345678')
INSERT INTO CampfireUsers VALUES (2, 'cho', 'surellity@gmail.com', '12345678')