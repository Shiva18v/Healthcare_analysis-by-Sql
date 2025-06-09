 ------relationship between table by foreign key-------

 
 alter table Appointments
 Add constraint fk_Appointments_Patient foreign key (patient_id) references patient(patient_id);

 
 alter table Appointments
 Add constraint fk_Appointments_Doctor foreign key (Doctor_id) references Doctors(Doctor_id);


 
 alter table Billing
 Add constraint FK_Billing_Appointment foreign key (Appointment_id) references Appointments(Appointment_id);


alter table Medical_Records
 Add constraint FK_MedicalRecords_Patient foreign key (patient_id) references patient(patient_id);



 
alter table Medication
 Add constraint FK_Medication_appointment foreign key (Appointment_id) references Appointments(Appointment_id);