-- Création des dimensions et des tables de faits

CREATE TABLE Dim_Tranche_Age (
    Id_Tranche_Age SERIAL PRIMARY KEY,
    Tranche_Age VARCHAR(20)
);

CREATE TABLE Dim_Region (
    Id_Region SERIAL PRIMARY KEY,
    Nom_Region VARCHAR(100)
);

CREATE TABLE Dim_Patient (
    Id_Patient INT PRIMARY KEY,
    Nom_prenom VARCHAR(100),
    Date_Naissance DATE,
    Groupage VARCHAR(10),
    Mobile VARCHAR(15),
    Id_Region INT REFERENCES Dim_Region(Id_Region),
    Id_Tranche_Age INT REFERENCES Dim_Tranche_Age(Id_Tranche_Age)
);

CREATE TABLE Dim_Specialite (
    Id_Specialite SERIAL PRIMARY KEY,
    Specialite VARCHAR(100)
);

CREATE TABLE Dim_Service (
    Id_Service SERIAL PRIMARY KEY,
    Service VARCHAR(100)
);

CREATE TABLE Dim_Medecin (
    Id_Medecin INT PRIMARY KEY,
    Nom VARCHAR(100),
    Id_Specialite INT REFERENCES Dim_Specialite(Id_Specialite),
    Id_Service INT REFERENCES Dim_Service(Id_Service)
);

CREATE TABLE Dim_Nature_Analyse (
    Id_Nature_Analyse SERIAL PRIMARY KEY,
    Nature_Analyse VARCHAR(100)
);

CREATE TABLE Dim_Type_Medicament (
    Id_Type_Medicament SERIAL PRIMARY KEY,
    Type_Medicament VARCHAR(100)
);

CREATE TABLE Dim_Analyse_Medicale (
    Code_Analyse INT PRIMARY KEY,
    Libelle_Analyse VARCHAR(100),
    Id_Nature_Analyse INT REFERENCES Dim_Nature_Analyse(Id_Nature_Analyse),
    Val_Min DECIMAL(10, 2),
    Val_Max DECIMAL(10, 2)
);

CREATE TABLE Dim_Medicament (
    Ref_medicament INT PRIMARY KEY,
    Libelle_Medicament VARCHAR(100),
    Id_Type_Medicament INT REFERENCES Dim_Type_Medicament(Id_Type_Medicament)
);

CREATE TABLE Dim_Jour_Semaine (
    Id_Jour_Semaine SERIAL PRIMARY KEY,
    Libelle_Jour_Semaine VARCHAR(20)
);

CREATE TABLE Dim_Annee (
    Id_Annee SERIAL PRIMARY KEY,
    Libelle_Annee VARCHAR(5)
);

CREATE TABLE Dim_Trimestre (
    Id_Trimestre SERIAL PRIMARY KEY,
    Libelle_trimestre VARCHAR(20)
);

CREATE TABLE Dim_Mois (
    Id_mois SERIAL PRIMARY KEY,
    Libelle_mois VARCHAR(20),
    Id_Trimestre INT REFERENCES Dim_Trimestre(Id_Trimestre)
);

CREATE TABLE Dim_Date (
    Id_Date DATE PRIMARY KEY,
    Id_Jour_Semaine INT REFERENCES Dim_Jour_Semaine(Id_Jour_Semaine),
    Id_mois INT REFERENCES Dim_Mois(Id_mois),
    Id_Annee INT REFERENCES Dim_Annee(Id_Annee)
);

-- Tables de faits
CREATE TABLE Fact_Consultations (
    Id_Medecin INT REFERENCES Dim_Medecin(Id_Medecin),
    Id_Patient INT REFERENCES Dim_Patient(Id_Patient),
    Id_Date DATE REFERENCES Dim_Date(Id_Date),
    Prix DECIMAL(10, 2),
    PRIMARY KEY (Id_Medecin, Id_Patient, Id_Date)
);

CREATE TABLE Fact_Analyses_Medicales (
    Id_Patient INT REFERENCES Dim_Patient(Id_Patient),
    Code_Analyse INT REFERENCES Dim_Analyse_Medicale(Code_Analyse),
    Id_Date DATE REFERENCES Dim_Date(Id_Date),
    Prix DECIMAL(10, 2),
    Resultat DECIMAL(10, 2),
    PRIMARY KEY (Id_Patient, Code_Analyse, Id_Date)
);

CREATE TABLE Fact_Prescriptions (
    Id_Medecin INT REFERENCES Dim_Medecin(Id_Medecin),
    Id_Patient INT REFERENCES Dim_Patient(Id_Patient),
    Id_Date DATE REFERENCES Dim_Date(Id_Date),
    Ref_Medicament INT REFERENCES Dim_Medicament(Ref_medicament),
    Quantite INT,
    Duree_Traitement INT,
    PRIMARY KEY (Id_Medecin, Id_Patient, Id_Date, Ref_Medicament)
);


-- Insertion des années
INSERT INTO Dim_Annee (Id_Annee, Libelle_Annee) VALUES 
    (2022, '2022'),
    (2023, '2023'),
    (2024, '2024');

-- Insertion des jours
INSERT INTO Dim_Jour_Semaine (Id_Jour_Semaine, Libelle_Jour_Semaine) VALUES 
    (1, 'Dimanche'),
    (2, 'Lundi'),
    (3, 'Mardi'),
    (4, 'Mercredi'),
    (5, 'Jeudi'),
    (6, 'Vendredi'),
    (7, 'Samedi');

-- Insertion des trimestres
INSERT INTO Dim_Trimestre (Id_Trimestre, Libelle_trimestre) VALUES 
    (1, 'Trimestre 1'),
    (2, 'Trimestre 2'),
    (3, 'Trimestre 3'),
    (4, 'Trimestre 4');

-- Insertion des mois
INSERT INTO Dim_Mois (Id_Mois, Libelle_mois, Id_Trimestre) VALUES 
    (1, 'Janvier', 1),
    (2, 'Février', 1),
    (3, 'Mars', 1),
    (4, 'Avril', 2),
    (5, 'Mai', 2),
    (6, 'Juin', 2),
    (7, 'Juillet', 3),
    (8, 'Août', 3),
    (9, 'Septembre', 3),
    (10, 'Octobre', 4),
    (11, 'Novembre', 4),
    (12, 'Décembre', 4);

-- Génération des dates pour l'année 2023
INSERT INTO Dim_Date (Id_Date, Id_Jour_Semaine, Id_Mois, Id_Annee)
SELECT
    dates::DATE AS Id_Date,
    EXTRACT(DOW FROM dates)::INT + 1 AS Id_Jour_Semaine,
    EXTRACT(MONTH FROM dates)::INT AS Id_Mois,
    EXTRACT(YEAR FROM dates)::INT AS Id_Annee
FROM
    generate_series('2023-01-01'::DATE, '2023-12-31'::DATE, '1 day'::INTERVAL) AS dates;
