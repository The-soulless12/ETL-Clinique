-- Création des tables de la base clinique

CREATE TABLE Patient (
    Id_Patient SERIAL PRIMARY KEY,
    Nom_prenom VARCHAR(100),
    Date_Naissance DATE,
    Sexe CHAR(1),
    Adresse VARCHAR(255),
    Groupage VARCHAR(10),
    Mobile VARCHAR(15)
);

CREATE TABLE RDV (
    Id_RDV SERIAL PRIMARY KEY,
    Date_RDV DATE,
    Heure_RDV TIME,
    Id_Patient INT,
    FOREIGN KEY (Id_Patient) REFERENCES Patient(Id_Patient)
);

CREATE TABLE Medecin (
    Id_Medecin SERIAL PRIMARY KEY,
    Nom VARCHAR(100),
    Prenom VARCHAR(100),
    Specialite VARCHAR(100),
    Service VARCHAR(100)
);

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

CREATE TABLE Medicament (
    Ref_Medicament SERIAL PRIMARY KEY,
    Libelle_Medicament VARCHAR(100),
    Type_Medicament VARCHAR(100)
);

CREATE TABLE Analyse_Medicale (
    Code_Analyse SERIAL PRIMARY KEY,
    Libelle_Analyse VARCHAR(100),
    Nature_Analyse VARCHAR(100),
    Val_Min DECIMAL(10, 2),
    Val_Max DECIMAL(10, 2)
);

CREATE TABLE Prescrire (
    Ref_Medicament INT,
    Id_Consul INT,
    Quantite INT,
    Duree_Traitement INT,
    FOREIGN KEY (Ref_Medicament) REFERENCES Medicament(Ref_Medicament),
    FOREIGN KEY (Id_Consul) REFERENCES Consultation(Id_Consul),
    PRIMARY KEY (Ref_Medicament, Id_Consul)
);

CREATE TABLE Bilan (
    Id_Bilan SERIAL PRIMARY KEY,
    Date_Bilan DATE,
    Id_Patient INT,
    Id_Medecin INT,
    FOREIGN KEY (Id_Patient) REFERENCES Patient(Id_Patient),
    FOREIGN KEY (Id_Medecin) REFERENCES Medecin(Id_Medecin)
);

CREATE TABLE Detail_Bilan (
    Id_Bilan INT,
    Code_Analyse INT,
    Prix DECIMAL(10, 2),
    Resultat VARCHAR(255),
    FOREIGN KEY (Id_Bilan) REFERENCES Bilan(Id_Bilan),
    FOREIGN KEY (Code_Analyse) REFERENCES Analyse_Medicale(Code_Analyse),
    PRIMARY KEY (Id_Bilan, Code_Analyse)
);

