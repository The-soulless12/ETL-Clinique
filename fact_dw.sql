CREATE TABLE Fact_Consultations (
    Id_Medecin INT REFERENCES Dim_Medecin(Id_Medecin),
    Id_Patient INT REFERENCES Dim_Patient(Id_Patient),
    Id_Date DATE REFERENCES Dim_Date(Id_Date),
	Id_Maladie INT REFERENCES Dim_Maladie(Id_Maladie),
    Prix DECIMAL(10, 2),
    PRIMARY KEY (Id_Medecin, Id_Patient, Id_Date, Id_Maladie)  
);

CREATE TABLE Fact_Analyses_Medicales (
    Id_Patient INT REFERENCES Dim_Patient(Id_Patient),
    Code_Analyse INT REFERENCES Dim_Analyse_Medicale(Code_Analyse),
    Id_Date DATE REFERENCES Dim_Date(Id_Date),
	Id_Medecin INT REFERENCES Dim_Medecin(Id_Medecin),
    Prix DECIMAL(10, 2),
    Resultat DECIMAL(10, 2),
    PRIMARY KEY (Id_Medecin, Id_Patient, Id_Date, Code_Analyse)
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