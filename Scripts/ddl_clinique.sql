-- Création de la table Patient
CREATE TABLE Patient (
    Id_Patient SERIAL PRIMARY KEY,
    Nom_prenom VARCHAR(100),
    Date_Naissance DATE,
    Sexe CHAR(1),
    Adresse VARCHAR(255),
    Groupage VARCHAR(10),
    Mobile VARCHAR(15)
);

-- Création de la table RDV (Rendez-vous)
CREATE TABLE RDV (
    Id_RDV SERIAL PRIMARY KEY,
    Date_RDV DATE,
    Heure_RDV TIME,
    Id_Patient INT,
    FOREIGN KEY (Id_Patient) REFERENCES Patient(Id_Patient)
);

-- Création de la table Medecin
CREATE TABLE Medecin (
    Id_Medecin SERIAL PRIMARY KEY,
    Nom VARCHAR(100),
    Prenom VARCHAR(100),
    Specialite VARCHAR(100),
    Service VARCHAR(100)
);

-- Création de la table Consultation
CREATE TABLE Consultation (
    Id_Consul SERIAL PRIMARY KEY,
    Id_RDV INT,
    Id_Medecin INT,
    Prix DECIMAL(10, 2),
    Diagnostic VARCHAR(255),
    Maladie VARCHAR(100),
    FOREIGN KEY (Id_RDV) REFERENCES RDV(Id_RDV),
    FOREIGN KEY (Id_Medecin) REFERENCES Medecin(Id_Medecin)
);

-- Création de la table Medicament
CREATE TABLE Medicament (
    Ref_Medicament SERIAL PRIMARY KEY,
    Libelle_Medicament VARCHAR(100),
    Type_Medicament VARCHAR(100)
);

-- Création de la table Analyse_Medicale
CREATE TABLE Analyse_Medicale (
    Code_Analyse SERIAL PRIMARY KEY,
    Libelle_Analyse VARCHAR(100),
    Nature_Analyse VARCHAR(100),
    Val_Min DECIMAL(10, 2),
    Val_Max DECIMAL(10, 2)
);

-- Création de la table Prescrire
CREATE TABLE Prescrire (
    Ref_Medicament INT,
    Id_Consul INT,
    Quantite INT,
    Duree_Traitement INT,
    FOREIGN KEY (Ref_Medicament) REFERENCES Medicament(Ref_Medicament),
    FOREIGN KEY (Id_Consul) REFERENCES Consultation(Id_Consul),
    PRIMARY KEY (Ref_Medicament, Id_Consul)
);

-- Création de la table Bilan
CREATE TABLE Bilan (
    Id_Bilan SERIAL PRIMARY KEY,
    Date_Bilan DATE,
    Id_Patient INT,
    Id_Medecin INT,
    FOREIGN KEY (Id_Patient) REFERENCES Patient(Id_Patient),
    FOREIGN KEY (Id_Medecin) REFERENCES Medecin(Id_Medecin)
);

-- Création de la table Detail_Bilan
CREATE TABLE Detail_Bilan (
    Id_Bilan INT,
    Code_Analyse INT,
    Prix DECIMAL(10, 2),
    Resultat VARCHAR(255),
    FOREIGN KEY (Id_Bilan) REFERENCES Bilan(Id_Bilan),
    FOREIGN KEY (Code_Analyse) REFERENCES Analyse_Medicale(Code_Analyse),
    PRIMARY KEY (Id_Bilan, Code_Analyse)
);

-- Insertions de données dans les tables
INSERT INTO Patient (Nom_prenom, Date_Naissance, sexe, Adresse, Groupage, Mobile)
VALUES 
('John Doe', '1990-06-15', 'M', '1234 Main St, Anytown, USA', 'A+', '555-1234'),
('Jane Smith', '1985-12-22', 'F', '5678 Park Ave, Anycity, USA', 'O-', '555-5678'),
('Alice Johnson', '1978-03-04', 'F', '9101 Lake Road, Anyville, USA', 'B+', '555-9012'),
('Bob Brown', '1992-07-19', 'M', '2345 River St, Anystate, USA', 'AB-', '555-3456'),
('Charlie Davis', '1980-11-30', 'M', '6789 Pine St, Anycounty, USA', 'A-', '555-6789'),
('Diana Evans', '1994-01-24', 'F', '1357 Oak St, Anycountry, USA', 'O+', '555-1357'),
('Frank Green', '1969-05-17', 'M', '2468 Elm St, Anyprovince, USA', 'B-', '555-2468'),
('Grace Hill', '1974-09-28', 'F', '9812 Maple St, Anydistrict, USA', 'AB+', '555-9812'),
('Henry Martin', '1988-04-12', 'M', '7531 Aspen St, Anyregion, USA', 'A+', '555-7531'),
('Ivy Wilson', '1993-08-03', 'F', '6543 Cedar St, Anyarea, USA', 'B+', '555-6543'),
('Jack Nelson', '1987-12-15', 'M', '3214 Birch St, Anyplace, USA', 'A-', '555-3214'),
('Kathy Lee', '1991-10-09', 'F', '2135 Palm St, Anyland, USA', 'O+', '555-2135'),
('Larry King', '1970-02-25', 'M', '1876 Spruce St, Anyzone, USA', 'B-', '555-1876'),
('Molly White', '1996-06-30', 'F', '4789 Willow St, Anyworld, USA', 'AB+', '555-4789'),
('Nathan Black', '1982-09-17', 'M', '5691 Holly St, Anydomain, USA', 'A+', '555-5691'),
('Olivia Scott', '1976-11-08', 'F', '6742 Ivy St, Anyrealm, USA', 'O-', '555-6742'),
('Peter Carter', '1964-03-21', 'M', '2890 Oak St, Anykingdom, USA', 'AB-', '555-2890'),
('Quinn Adams', '1998-08-05', 'F', '9321 Birch St, Anyempire, USA', 'B+', '555-9321'),
('Ryan Moore', '1990-01-14', 'M', '8765 Pine St, Anyestate, USA', 'A-', '555-8765'),
('Sara Thompson', '1985-05-05', 'F', '1923 Maple St, Anynation, USA', 'O+', '555-1923');

INSERT INTO Medecin (Nom, Prenom, Specialite, Service)
VALUES 
('Smith', 'Richard', 'Cardiology', 'Heart Center'),
('Johnson', 'Emily', 'Dermatology', 'Skin Care Clinic'),
('Williams', 'James', 'Neurology', 'Brain Center'),
('Jones', 'Patricia', 'Pediatrics', 'Children Hospital'),
('Brown', 'John', 'Oncology', 'Cancer Center'),
('Davis', 'Lisa', 'Orthopedics', 'Bone and Joint Clinic'),
('Miller', 'Charles', 'Gynecology', 'Senior Health Center'),
('Wilson', 'Jennifer', 'Psychiatry', 'Mental Wellness Clinic'),
('Moore', 'William', 'Neurology', 'Hormone Clinic'),
('Taylor', 'Elizabeth', 'Gastroenterology', 'Digestive Health Center'),
('Anderson', 'David', 'Ophthalmology', 'Eye Care Center'),
('Thomas', 'Barbara', 'Urology', 'Hormone Clinic'),
('Jackson', 'Joseph', 'Radiology', 'Imaging Center'),
('White', 'Maria', 'Neurology', 'Hormone Clinic'),
('Harris', 'Robert', 'Orthopedics', 'Children Hospital'),
('Martin', 'Nancy', 'Anesthesiology', 'Pain Management Center'),
('Thompson', 'Karen', 'Geriatrics', 'Senior Health Center'),
('Garcia', 'Michael', 'Orthopedics', 'Children Hospital'),
('Martinez', 'Jessica', 'Orthopedics', 'ENT Clinic'),
('Robinson', 'Thomas', 'Cardiology', 'Heart Center');

INSERT INTO RDV (date_RDV, heure_RDV, Id_Patient)
VALUES 
('2023-04-10', '09:00', 1),
('2023-04-11', '10:00', 2),
('2023-04-12', '11:00', 3),
('2023-04-13', '12:00', 4),
('2023-04-14', '13:00', 5),
('2023-04-15', '14:00', 6),
('2023-04-16', '15:00', 7),
('2023-04-17', '16:00', 8),
('2023-04-18', '17:00', 9),
('2023-04-19', '18:00', 10),
('2023-04-20', '09:30', 11),
('2023-04-21', '10:30', 12),
('2023-04-22', '11:30', 13),
('2023-04-23', '12:30', 14),
('2023-04-24', '13:30', 15),
('2023-04-25', '14:30', 16),
('2023-04-26', '15:30', 17),
('2023-04-27', '16:30', 18),
('2023-04-28', '17:30', 19),
('2023-04-29', '18:30', 20);

INSERT INTO Consultation (Id_RDV, Id_medecin, Prix, Diagnostic, Maladie)
VALUES 
(1, 1, 100.00, 'Routine check-up', 'Healthy'),
(2, 2, 150.00, 'Skin rash', 'Eczema'),
(3, 3, 200.00, 'Headache', 'Migraine'),
(4, 4, 120.00, 'Annual child wellness exam', 'Healthy'),
(5, 5, 300.00, 'Chest pain', 'Angina'),
(6, 6, 180.00, 'Knee pain', 'Arthritis'),
(7, 7, 170.00, 'Regular check-up', 'Healthy'),
(8, 8, 160.00, 'Anxiety symptoms', 'Anxiety'),
(9, 9, 220.00, 'Thyroid problem', 'Hypothyroidism'),
(10, 10, 190.00, 'Stomach pain', 'Gastritis'),
(11, 1, 130.00, 'Eye check-up', 'Healthy'),
(12, 2, 210.00, 'Urinary issues', 'Infection'),
(13, 3, 250.00, 'X-ray for chest', 'Healthy'),
(14, 4, 140.00, 'Joint stiffness', 'Rheumatoid Arthritis'),
(15, 5, 280.00, 'Allergic reaction', 'Allergies'),
(16, 6, 110.00, 'Sleep issues', 'Insomnia'),
(17, 7, 165.00, 'Senior health check-up', 'Healthy'),
(18, 8, 205.00, 'Breathing difficulties', 'Asthma'),
(19, 9, 195.00, 'Ear pain', 'Otitis'),
(20, 10, 155.00, 'Cosmetic consultation', 'Healthy');

INSERT INTO Medicament (Libelle_Medicament, Type_Medicament)
VALUES 
('Amoxicillin', 'Antibiotic'),
('Ibuprofen', 'Analgesic'),
('Metformin', 'Antidiabetic'),
('Atorvastatin', 'Statins'),
('Lisinopril', 'ACE inhibitor'),
('Amlodipine', 'Calcium channel blocker'),
('Simvastatin', 'Statins'),
('Levothyroxine', 'Thyroid hormone'),
('Azithromycin', 'Antibiotic'),
('Hydrochlorothiazide', 'Diuretic'),
('Prednisone', 'Corticosteroid'),
('Aspirin', 'Analgesic'),
('Cetirizine', 'Antihistamine'),
('Diphenhydramine', 'Antihistamine'),
('Pseudoephedrine', 'Decongestant'),
('Fluticasone', 'Corticosteroid'),
('Albuterol', 'Bronchodilator'),
('Insulin Glargine', 'Insulin'),
('Esomeprazole', 'Proton pump inhibitor'),
('Furosemide', 'Diuretic');

INSERT INTO Analyse_Medicale (Libelle_Analyse, Nature_Analyse, val_min, val_max)
VALUES 
('Complete Blood Count', 'Blood Test', 4.5, 11.0),
('Lipid Profile', 'Blood Test', 0.0, 200.0),
('Liver Function Test', 'Blood Test', 0.0, 40.0),
('Thyroid Function Test', 'Blood Test', 0.4, 4.0),
('Electrolytes Test', 'Blood Test', 135, 145),
('Urine Analysis', 'Urine Test', 4.5, 8.0),
('Glucose Test', 'Blood Test', 70, 140),
('Hemoglobin A1C', 'Blood Test', 4, 6),
('Prostate-Specific Antigen', 'Blood Test', 0.0, 4.0),
('Pregnancy Test', 'Urine Test', null, null),
('Stool Culture', 'Stool Test', null, null),
('EKG', 'Electrocardiogram', null, null),
('X-Ray Chest', 'Imaging', null, null),
('CT Scan Brain', 'Imaging', null, null),
('MRI Spine', 'Imaging', null, null),
('Ultrasound Abdomen', 'Imaging', null, null),
('Bone Density Scan', 'Imaging', null, null),
('Allergy Testing', 'Skin Test', null, null),
('Blood Typing', 'Blood Test', null, null),
('COVID-19 PCR', 'Swab Test', null, null);

INSERT INTO Prescrire (Ref_medicament, Id_Consul, Quantite, duree_traitement)
VALUES 
(1, 1, 30, 10),
(2, 1, 20, 5),
(3, 2, 30, 30),
(4, 3, 30, 90),
(5, 4, 30, 14),
(6, 5, 10, 7),
(7, 6, 20, 14),
(8, 7, 30, 30),
(9, 8, 50, 120),
(10, 9, 10, 10),
(1, 10, 30, 10),
(2, 11, 20, 5),
(3, 12, 30, 30),
(4, 13, 30, 90),
(5, 14, 30, 14),
(6, 15, 10, 7),
(7, 16, 20, 14),
(8, 17, 30, 30),
(9, 18, 50, 120),
(10, 19, 10, 10);

INSERT INTO Bilan (date_bilan, Id_Patient, Id_Medecin)
VALUES 
('2023-04-10', 1,9),
('2023-04-11', 2,10),
('2023-04-12', 3,11),
('2023-04-13', 4,12),
('2023-04-14', 5,13),
('2023-04-15', 6,14),
('2023-04-16', 7,15),
('2023-04-17', 8,16),
('2023-04-18', 9,17),
('2023-04-19', 10,18),
('2023-04-20', 11,10),
('2023-04-21', 12,11),
('2023-04-22', 13,12),
('2023-04-23', 14,1),
('2023-04-24', 15,1),
('2023-04-25', 16,2),
('2023-04-26', 17,2),
('2023-04-27', 18,10),
('2023-04-28', 19,3),
('2023-04-29', 20,3);

INSERT INTO Detail_Bilan (Id_Bilan, Code_analyse, Prix, Resultat)
VALUES 
(1, 1, 200.00, 'Normal'),
(2, 2, 150.00, 'High cholesterol'),
(3, 3, 100.00, 'Normal liver function'),
(4, 4, 120.00, 'Thyroid function normal'),
(5, 5, 130.00, 'Electrolytes balanced'),
(6, 6, 90.00, 'Normal'),
(7, 7, 80.00, 'Normal glucose levels'),
(8, 8, 140.00, 'Normal'),
(9, 9, 110.00, 'Normal'),
(10, 10, 50.00, 'Positive'),
(11, 11, 70.00, 'Normal'),
(12, 12, 110.00, 'Normal EKG'),
(13, 13, 200.00, 'Clear'),
(14, 14, 250.00, 'Normal'),
(15, 15, 300.00, 'Normal'),
(16, 16, 180.00, 'Clear'),
(17, 17, 200.00, 'Normal'),
(18, 18, 120.00, 'Normal'),
(19, 19, 110.00, 'Normal'),
(20, 20, 130.00, 'Normal');