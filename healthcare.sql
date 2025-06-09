

----------Healthcare Analysis By SQL 

--creating the database 
create database Healthcare_Analysis;


----Creating tables


-----create patient table 
drop table if exists patient;
create table patient(
patient_id int identity(1,1) primary key ,
patient_name varchar(255) not null,
Gender varchar(50) check (gender IN ('Male', 'Female', 'Other')),
Date_of_birth date not null,
phone_Number varchar(20) unique,
Email Varchar(255) CONSTRAINT CK_Email@Symbol CHECK (Email LIKE '%@%'),
Address varchar(255)
);


-----create Doctors table 
drop table if exists Doctors;
Create Table Doctors (
  Doctor_id INT identity(1,1) primary key,
  Doctor_name varchar(255) not null,
  department varchar(255) not null ,
  specialization varchar(100),
  dr_phone_Number varchar(20) unique,
  Doctor_email varchar(100) unique
);

-----create Appointments table 
drop table if exists Appointments;
Create Table Appointments(
  Appointment_id int identity(1,1) Primary key,
  patient_id INT NOT NULL,
  Doctor_id INT NOT NULL,
  Appointments_status varchar(20) CHECK (Appointments_status IN ('Scheduled', 'Completed', 'Canceled', 'No-Show', 'Rescheduled')),
  Appointment_date date NOT NULL,
  Reason varchar(255),
  Notes TEXT
  );


  
-----create Medical_Records table 
drop table if exists Medical_Records;
Create Table Medical_Records(
 Medical_Records_id int primary key identity(1,1),
  Diagnosis_ VARCHAR(20) NOT NULL,
  Diagnosis_description VARCHAR(255),
  Treatment_ TEXT,
  prescription TEXT,
  Notes TEXT,
  Record_date DATETIME NOT NULL DEFAULT GETDATE(),
  patient_id INT NOT NULL,
  Appointment_id INT NULL,
  Doctor_id INT  not NULL
  );


 -- create Medication table 
drop table if exists Medication;
Create Table Medication(
  Medication_id INT PRIMARY KEY IDENTITY(1,1),
  Medication_DATE Datetime NOT NULL default getdate(),
  Medication_name varchar(100) NOT NULL,
  Dosage varchar(50) NOT NULL,
  Duration varchar(50) NOT NULL,
  Instructions TEXT,
  Medication_status varchar(20) NOT NULL DEFAULT 'Active' CHECK (Medication_status IN ('Active', 'Completed', 'Canceled')),
  patient_id INT NOT NULL,
  Dctor_id INT not NULL,
  Appointment_id int not null
  );
 
   -- create Billing table 
   drop table if exists Billing;
  CREATE TABLE Billing (
  Billing_id int identity(1,1) primary key,
  Total_Ammount decimal(10, 2) NOT NULL constraint CHK_total_charge_nonnegative CHECK (Total_Ammount >= 0), -- for appointment
  patient_paid decimal(10, 2) NOT NULL constraint DF_patient_paid DEFAULT (0) constraint CHK_patient_paid_nonnegative CHECK (patient_paid >= 0),
  Billing_DATE DATE NOT NULL,
  payment_status varchar(20) NOT NULL constraint DF_payment_status DEFAULT ('NO STATUS') constraint CHK_payment_status_valid CHECK (payment_status IN ('Pending', 'Paid', 'Partial', 'Overdue', 'Canceled')),
  payment_date date NULL, 
  Appointment_id int NOT NULL
);
















