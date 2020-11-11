
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/11/2020 11:20:04
-- Generated from EDMX file: C:\Users\troyf\Documents\Classes\1714\Project\1714TFeller\1714TFeller\1714tfeller2h\PhotographyModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Photography];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CustomerAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_CustomerAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_PhotographerAppoinment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_PhotographerAppoinment];
GO
IF OBJECT_ID(N'[dbo].[FK_RecieptInvoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_RecieptInvoice];
GO
IF OBJECT_ID(N'[dbo].[FK_AppointmentReciept]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reciepts] DROP CONSTRAINT [FK_AppointmentReciept];
GO
IF OBJECT_ID(N'[dbo].[FK_StudioAppointment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appointments] DROP CONSTRAINT [FK_StudioAppointment];
GO
IF OBJECT_ID(N'[dbo].[FK_PortraitReciept]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Reciepts] DROP CONSTRAINT [FK_PortraitReciept];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO
IF OBJECT_ID(N'[dbo].[Reciepts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Reciepts];
GO
IF OBJECT_ID(N'[dbo].[Appointments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Appointments];
GO
IF OBJECT_ID(N'[dbo].[Portraits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Portraits];
GO
IF OBJECT_ID(N'[dbo].[Studios]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Studios];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [firstName] nvarchar(15)  NOT NULL,
    [lastName] nvarchar(15)  NOT NULL,
    [Phone] nvarchar(15)  NOT NULL,
    [Email] nvarchar(25)  NOT NULL,
    [Address] nvarchar(25)  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [invoiceDate] datetime  NOT NULL,
    [dueDate] datetime  NOT NULL,
    [Reciept_Id] int  NOT NULL
);
GO

-- Creating table 'Reciepts'
CREATE TABLE [dbo].[Reciepts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [recieptDate] nvarchar(10)  NOT NULL,
    [Total] decimal(18,0)  NOT NULL,
    [Appointment_Id] int  NOT NULL,
    [Portrait_Id] int  NOT NULL
);
GO

-- Creating table 'Appointments'
CREATE TABLE [dbo].[Appointments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [apptDate] datetime  NOT NULL,
    [apptCost] decimal(18,0)  NOT NULL,
    [CustomerId_Id] int  NOT NULL,
    [PhotographerId_Id] int  NOT NULL,
    [Studio_Id] int  NOT NULL
);
GO

-- Creating table 'Portraits'
CREATE TABLE [dbo].[Portraits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [portRatio] nvarchar(5)  NOT NULL,
    [portCost] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'Studios'
CREATE TABLE [dbo].[Studios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SqrFt] int  NOT NULL,
    [studioAddress] nvarchar(25)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reciepts'
ALTER TABLE [dbo].[Reciepts]
ADD CONSTRAINT [PK_Reciepts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [PK_Appointments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Portraits'
ALTER TABLE [dbo].[Portraits]
ADD CONSTRAINT [PK_Portraits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Studios'
ALTER TABLE [dbo].[Studios]
ADD CONSTRAINT [PK_Studios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CustomerId_Id] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_CustomerAppointment]
    FOREIGN KEY ([CustomerId_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CustomerAppointment'
CREATE INDEX [IX_FK_CustomerAppointment]
ON [dbo].[Appointments]
    ([CustomerId_Id]);
GO

-- Creating foreign key on [PhotographerId_Id] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_PhotographerAppoinment]
    FOREIGN KEY ([PhotographerId_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotographerAppoinment'
CREATE INDEX [IX_FK_PhotographerAppoinment]
ON [dbo].[Appointments]
    ([PhotographerId_Id]);
GO

-- Creating foreign key on [Reciept_Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_RecieptInvoice]
    FOREIGN KEY ([Reciept_Id])
    REFERENCES [dbo].[Reciepts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecieptInvoice'
CREATE INDEX [IX_FK_RecieptInvoice]
ON [dbo].[Invoices]
    ([Reciept_Id]);
GO

-- Creating foreign key on [Appointment_Id] in table 'Reciepts'
ALTER TABLE [dbo].[Reciepts]
ADD CONSTRAINT [FK_AppointmentReciept]
    FOREIGN KEY ([Appointment_Id])
    REFERENCES [dbo].[Appointments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AppointmentReciept'
CREATE INDEX [IX_FK_AppointmentReciept]
ON [dbo].[Reciepts]
    ([Appointment_Id]);
GO

-- Creating foreign key on [Studio_Id] in table 'Appointments'
ALTER TABLE [dbo].[Appointments]
ADD CONSTRAINT [FK_StudioAppointment]
    FOREIGN KEY ([Studio_Id])
    REFERENCES [dbo].[Studios]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudioAppointment'
CREATE INDEX [IX_FK_StudioAppointment]
ON [dbo].[Appointments]
    ([Studio_Id]);
GO

-- Creating foreign key on [Portrait_Id] in table 'Reciepts'
ALTER TABLE [dbo].[Reciepts]
ADD CONSTRAINT [FK_PortraitReciept]
    FOREIGN KEY ([Portrait_Id])
    REFERENCES [dbo].[Portraits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PortraitReciept'
CREATE INDEX [IX_FK_PortraitReciept]
ON [dbo].[Reciepts]
    ([Portrait_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------