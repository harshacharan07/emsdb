use EMSDB

sp_tables


CREATE TABLE Users (
    EmployeeID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UserName varchar(25) NOT NULL,
    Password nvarchar(25) NOT NULL,
    UserType varchar(25) NOT NULL    
);



CREATE TABLE Employee (
    EmployeeID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    UserName varchar(25) NOT NULL,
	FirstName varchar(25) NOT NULL, LastName varchar(25) NOT NULL, Address varchar(255) NOT NULL, City varchar(25) NOT NULL, 
	State varchar(25) NOT NULL, Pincode int NOT NULL, MobileNo bigint NOT NULL, HireDate DateTime NOT NULL, EmailAddress varchar(50) NOT NULL, 
	DateOfBirth datetime NOT NULL, BU_ID int Foreign Key REFERENCES BusinessUnit(BU_ID), DesignationID int NOT NULL Foreign Key REFERENCES Designation(DesignationID)
        
);

drop table BusinessUnit
CREATE TABLE BusinessUnit (
    BU_ID int NOT NULL identity(2001, 1) PRIMARY KEY,
    BU_Name varchar(25) NOT NULL   
);

CREATE TABLE Designation (
    DesignationID int NOT NULL identity(1001, 1) PRIMARY KEY,
    DesignationName varchar(25) NOT NULL   
);



Create Procedure usp_UserLogin @UserName varchar(25), @UserType varchar(25)
AS BEGIN
Select Password From Users Where UserName = @UserName AND UserType = @UserType
END

Create Procedure usp_AddDesignation (  @DesignationName varchar(25))
AS BEGIN
 Insert into Designation ( DesignationName) values ( @DesignationName)
END

Delete usp_AddDesignation


Create Procedure usp_GetDesignations 
AS BEGIN
Select * From Designation
END

Create Procedure usp_AddBusinessUnit ( @BU_Name varchar(25))
AS BEGIN
 Insert into BusinessUnit( BU_Name) values ( @BU_Name)
END

Create Procedure usp_GetBusinessUnit 
AS BEGIN
Select * From BusinessUnit
END

Create Procedure usp_InsertUsers (@UserName varchar(25), @Password varchar(25), @UserType varchar(25))
AS BEGIN
 Insert into Users(UserName, Password, UserType) values (@UserName, @Password, @UserType)
END

Create Procedure usp_DeleteBusinessUnit (@BU_Id int)
AS BEGIN
Delete from BusinessUnit where BU_ID = @BU_Id
END

Create Procedure usp_DeleteDesignations (@DesignationId int)
AS BEGIN
Delete from Designation where DesignationID = @DesignationId
END

Select * from BusinessUnit