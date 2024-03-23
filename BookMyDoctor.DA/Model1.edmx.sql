
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/23/2024 16:17:09
-- Generated from EDMX file: D:\BookMyDoctor-20240123T100817Z-001\BookMyDoctor\BookMyDoctor.DA\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BookMyDoctor];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_APPOINT_DOCTOR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_APPOINT_DOCTOR];
GO
IF OBJECT_ID(N'[dbo].[FK_APPOINT_STATUS]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_APPOINT_STATUS];
GO
IF OBJECT_ID(N'[dbo].[FK_USER_DOCTOR]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Doctors] DROP CONSTRAINT [FK_USER_DOCTOR];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Appointments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Appointments];
GO
IF OBJECT_ID(N'[dbo].[Doctors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Doctors];
GO
IF OBJECT_ID(N'[dbo].[Status]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Status];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [AppointmentId] int IDENTITY(1,1) NOT NULL,
    [AppointmentDate] datetime  NOT NULL,
    [AppointmentTime] time  NOT NULL,
    [DoctorId] int  NOT NULL,
    [PatientName] varchar(50)  NOT NULL,
    [PatientEmail] varchar(50)  NOT NULL,
    [PatientPhone] varchar(20)  NOT NULL,
    [AppointmentStatus] int  NOT NULL
);
GO

-- Creating table 'Doctors'
CREATE TABLE [dbo].[Doctors] (
    [DoctorId] int IDENTITY(1,1) NOT NULL,
    [DoctorName] varchar(50)  NOT NULL,
    [UserId] int  NOT NULL,
    [AppointmentSlotTime] int  NOT NULL,
    [DayStartTime] time  NOT NULL,
    [DayEndTime] time  NOT NULL
);
GO

-- Creating table 'Status'
CREATE TABLE [dbo].[Status] (
    [StatusId] int IDENTITY(1,1) NOT NULL,
    [StatusName] varchar(50)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [Password] varchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AppointmentId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [PK_Appointments]
    PRIMARY KEY CLUSTERED ([AppointmentId] ASC);
GO

-- Creating primary key on [DoctorId] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [PK_Doctors]
    PRIMARY KEY CLUSTERED ([DoctorId] ASC);
GO

-- Creating primary key on [StatusId] in table 'Status'
ALTER TABLE [dbo].[Status]
ADD CONSTRAINT [PK_Status]
    PRIMARY KEY CLUSTERED ([StatusId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DoctorId] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_APPOINT_DOCTOR]
    FOREIGN KEY ([DoctorId])
    REFERENCES [dbo].[Doctors]
        ([DoctorId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_APPOINT_DOCTOR'
CREATE INDEX [IX_FK_APPOINT_DOCTOR]
ON [dbo].[Appointments]
    ([DoctorId]);
GO

-- Creating foreign key on [AppointmentStatus] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_APPOINT_STATUS]
    FOREIGN KEY ([AppointmentStatus])
    REFERENCES [dbo].[Status]
        ([StatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_APPOINT_STATUS'
CREATE INDEX [IX_FK_APPOINT_STATUS]
ON [dbo].[Appointments]
    ([AppointmentStatus]);
GO

-- Creating foreign key on [UserId] in table 'Doctors'
ALTER TABLE [dbo].[Doctors]
ADD CONSTRAINT [FK_USER_DOCTOR]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_USER_DOCTOR'
CREATE INDEX [IX_FK_USER_DOCTOR]
ON [dbo].[Doctors]
    ([UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------