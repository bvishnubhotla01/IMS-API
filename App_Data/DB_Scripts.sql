USE MASTER    
GO    
    
-- 1) Check for the Database Exists .If the database exists then drop and create new one
IF EXISTS (SELECT [name] FROM sys.databases WHERE [name] = 'IMS' )    
DROP DATABASE IMS    
GO    
    
CREATE DATABASE IMS    
GO    
    
USE IMS    
GO    
    
    
-- 1) Create Products table    
    
IF EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Products' )    
DROP TABLE Products    
GO    
    
CREATE TABLE [dbo].Products(    
        [ProductID]		INT IDENTITY PRIMARY KEY,    
        [ProductName]	VARCHAR(50) NOT NULL,       
        [Quantity]		INT NOT NULL,       
        [Price]			FLOAT NOT NULL,       
        [CreatedDate]	DATETIME NOT NULL,
		[CreatedBy]		VARCHAR(25) NOT NULL
)    
    
-- insert sample data to Student Master table    
INSERT INTO [Products]   ([ProductName],[Quantity],[Price],[CreatedDate],[CreatedBy])    
     VALUES ('Item 1',100,20.50,CURRENT_TIMESTAMP,'User1' )    
    
INSERT INTO [Products]   ([ProductName],[Quantity],[Price],[CreatedDate],[CreatedBy])    
     VALUES ('Item 2',200,30.00,CURRENT_TIMESTAMP,'User1' ) 

INSERT INTO [Products]   ([ProductName],[Quantity],[Price],[CreatedDate],[CreatedBy])    
     VALUES ('Item 3',300,20.00,CURRENT_TIMESTAMP,'User1' ) 

	 -- 2) Create Users table

	 IF EXISTS ( SELECT [name] FROM sys.tables WHERE [name] = 'Users' )    
DROP TABLE Users    
GO    
    
CREATE TABLE [dbo].Users(    
		[UserName]		VARCHAR(10) PRIMARY KEY,
        [FirstName]		VARCHAR(50) NOT NULL,       
        [LastName]		VARCHAR(50) NULL,       
        [CreatedDate]	DATETIME NOT NULL
)    
  INSERT INTO [Users] ([UserName], [FirstName],[LastName],[CreatedDate]) VALUES ('admin', 'Admin', 'Admin', CURRENT_TIMESTAMP)


     select * from [Products];
	 select * from Users;