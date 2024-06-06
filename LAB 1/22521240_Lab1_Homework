CREATE DATABASE EX2

USE EX2

CREATE TABLE Location(
    Locid NUMERIC(5, 0) NOT NULL,
    Room NVARCHAR(6) NOT NULL,
    Capacity NUMERIC(5, 0)
    CONSTRAINT PK_LOCATION PRIMARY KEY (Locid)
)
CREATE TABLE Term(
    Termid NUMERIC(5,0) NOT NULL,
    Tdesc VARCHAR(20) NOT NULL,
    Status VARCHAR(20) NOT NULL
    CONSTRAINT PK_TERM PRIMARY KEY (Termid)
)
CREATE TABLE Course (
    Cid NUMERIC(6,0) NOT NULL,
    Callid NVARCHAR(10) NOT NULL,
    Cname NVARCHAR(30) NOT NULL,
    Ccredit NUMERIC(2,0) NULL
    CONSTRAINT PK_Course PRIMARY KEY (Cid)
)
CREATE TABLE Faculty(
    Fid NUMERIC(4,0) NOT NULL,
    Flname NVARCHAR(25) NOT NULL,
    Ffname NVARCHAR(25) NOT NULL,
    Fphone NUMERIC(10,0) NULL,
    CONSTRAINT PK_Faculty PRIMARY KEY(Fid)
)
CREATE TABLE Course_Section(
    Csecid NUMERIC(8,0) NOT NULL,
    Cid NUMERIC(6,0) NOT NULL,
    Termid NUMERIC(5,0) NOT NULL,
    Secnum NUMERIC(2,0) NOT NULL,
    Fid NUMERIC(4,0) NULL,
    Locid NUMERIC(5,0) NULL,
    Maxenrl NUMERIC(4,0) NOT NULL,
    Currenrl NUMERIC(4,0) NOT NULL,
    CONSTRAINT PK_Course_Section PRIMARY KEY(Csecid)
)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Fid FOREIGN KEY(Fid) REFERENCES Faculty(Fid)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Locid FOREIGN KEY(Locid) REFERENCES Location(Locid)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Termid FOREIGN KEY(Termid) REFERENCES Term(Termid)
ALTER TABLE Course_Section
ADD CONSTRAINT FK_Course_Section_Cid FOREIGN KEY(Cid) REFERENCES Course(Cid)

CREATE TABLE Student(
    Sid NUMERIC(5,0) NOT NULL,
    Slname NVARCHAR(25) NOT NULL,
    Sfname VARCHAR(25) NOT NULL,
    Saddr NVARCHAR(30) NULL,
    Scity NVARCHAR(30) NULL,
    Sstate char(2) NULL,
    Szip NUMERIC(9,0) NULL,
    Sphone NUMERIC(10,0) NOT NULL,
    Sclass char(2) NULL,
    Sdod date NOT NULL,
    Fid NUMERIC(4,0) NULL,
    CONSTRAINT PK_Student PRIMARY KEY(Sid)
)
ALTER TABLE Student
ADD CONSTRAINT FK_Student_Fid FOREIGN KEY(Fid) REFERENCES Faculty(Fid)
CREATE TABLE Enrollment(
    Sid NUMERIC(5,0) NOT NULL,
    Csecid NUMERIC(8,0) NOT NULL,
    Grade CHAR(1) NULL,
    CONSTRAINT PK_Enrollment PRIMARY KEY(Sid,Csecid)
)
ALTER TABLE Enrollment
ADD CONSTRAINT FK_Enrollment_Sid FOREIGN KEY(Sid) REFERENCES Student(Sid)
ALTER TABLE Enrollment
ADD CONSTRAINT FK_Enrollment_Csecid FOREIGN KEY(Csecid) REFERENCES Course_Section(Csecid)

