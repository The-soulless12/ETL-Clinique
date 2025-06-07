CREATE VIEW view_Consultations AS
SELECT 
    c.Id_Medecin,
    m.Nom AS Nom_Medecin,
    s.Service AS Service_Medecin,
    sp.Specialite AS Specialite_Medecin,
    p.Id_Patient,
    p.Nom_prenom AS Nom_Patient,
    p.Date_Naissance,
    p.Groupage,
    r.Nom_Region AS Region_Patient,
    ta.Tranche_Age,
    c.Id_Date,
    d.Id_Jour_Semaine,
    js.Libelle_Jour_Semaine,
    d.Id_mois,
    dm.Libelle_mois,
    d.Id_Annee,
    a.Libelle_Annee,
    c.Id_Maladie,
    mal.Nom_Maladie,
    c.Prix
FROM 
    Fact_Consultations c
JOIN 
    Dim_Medecin m ON c.Id_Medecin = m.Id_Medecin
JOIN 
    Dim_Service s ON m.Id_Service = s.Id_Service
JOIN 
    Dim_Specialite sp ON m.Id_Specialite = sp.Id_Specialite
JOIN 
    Dim_Patient p ON c.Id_Patient = p.Id_Patient
JOIN 
    Dim_Region r ON p.Id_Region = r.Id_Region
JOIN 
    Dim_Tranche_Age ta ON p.Id_Tranche_Age = ta.Id_Tranche_Age
JOIN 
    Dim_Date d ON c.Id_Date = d.Id_Date
JOIN 
    Dim_Jour_Semaine js ON d.Id_Jour_Semaine = js.Id_Jour_Semaine
JOIN 
    Dim_mois dm ON d.Id_mois = dm.Id_mois
JOIN 
    Dim_Annee a ON d.Id_Annee = a.Id_Annee
JOIN 
    Dim_Maladie mal ON c.Id_Maladie = mal.Id_Maladie;

CREATE VIEW view_Prescriptions AS
SELECT 
    p.Id_Medecin,
    m.Nom AS Nom_Medecin,
    s.Service AS Service_Medecin,
    sp.Specialite AS Specialite_Medecin,
    p.Id_Patient,
    dp.Nom_prenom AS Nom_Patient,
    dp.Date_Naissance,
    dp.Groupage,
    dr.Nom_Region AS Region_Patient,
    ta.Tranche_Age,
    p.Id_Date,
    d.Id_Jour_Semaine,
    js.Libelle_Jour_Semaine,
    d.Id_mois,
    dm.Libelle_mois,
    d.Id_Annee,
    da.Libelle_Annee,
    p.Ref_Medicament,
    dme.Libelle_Medicament,
    dtm.Type_Medicament AS Nature_Medicament,
    p.Quantite,
    p.Duree_Traitement
FROM 
    Fact_Prescriptions p
JOIN 
    Dim_Medecin m ON p.Id_Medecin = m.Id_Medecin
JOIN 
    Dim_Service s ON m.Id_Service = s.Id_Service
JOIN 
    Dim_Specialite sp ON m.Id_Specialite = sp.Id_Specialite
JOIN 
    Dim_Patient dp ON p.Id_Patient = dp.Id_Patient
JOIN 
    Dim_Region dr ON dp.Id_Region = dr.Id_Region
JOIN 
    Dim_Tranche_Age ta ON dp.Id_Tranche_Age = ta.Id_Tranche_Age
JOIN 
    Dim_Date d ON p.Id_Date = d.Id_Date
JOIN 
    Dim_Jour_Semaine js ON d.Id_Jour_Semaine = js.Id_Jour_Semaine
JOIN 
    Dim_mois dm ON d.Id_mois = dm.Id_mois
JOIN 
    Dim_Annee da ON d.Id_Annee = da.Id_Annee
JOIN 
    Dim_Medicament dme ON p.Ref_Medicament = dme.Ref_medicament
JOIN 
    Dim_Type_Medicament dtm ON dme.Id_Type_Medicament = dtm.Id_Type_Medicament;

CREATE VIEW view_Analyses_Medicales AS
SELECT 
    fa.Id_Medecin,
    m.Nom AS Nom_Medecin,
    s.Service AS Service_Medecin,
    sp.Specialite AS Specialite_Medecin,
    fa.Id_Patient,
    dp.Nom_prenom AS Nom_Patient,
    dp.Date_Naissance,
    dp.Groupage,
    dr.Nom_Region AS Region_Patient,
    ta.Tranche_Age,
    fa.Id_Date,
    d.Id_Jour_Semaine,
    js.Libelle_Jour_Semaine,
    d.Id_mois,
    dm.Libelle_mois,
    d.Id_Annee,
    da.Libelle_Annee,
    fa.Code_Analyse,
    am.Libelle_Analyse,
    na.Nature_Analyse,
    fa.Prix,
    fa.Resultat
FROM 
    Fact_Analyses_Medicales fa
JOIN 
    Dim_Medecin m ON fa.Id_Medecin = m.Id_Medecin
JOIN 
    Dim_Service s ON m.Id_Service = s.Id_Service
JOIN 
    Dim_Specialite sp ON m.Id_Specialite = sp.Id_Specialite
JOIN 
    Dim_Patient dp ON fa.Id_Patient = dp.Id_Patient
JOIN 
    Dim_Region dr ON dp.Id_Region = dr.Id_Region
JOIN 
    Dim_Tranche_Age ta ON dp.Id_Tranche_Age = ta.Id_Tranche_Age
JOIN 
    Dim_Date d ON fa.Id_Date = d.Id_Date
JOIN 
    Dim_Jour_Semaine js ON d.Id_Jour_Semaine = js.Id_Jour_Semaine
JOIN 
    Dim_mois dm ON d.Id_mois = dm.Id_mois
JOIN 
    Dim_Annee da ON d.Id_Annee = da.Id_Annee
JOIN 
    Dim_Analyse_Medicale am ON fa.Code_Analyse = am.Code_Analyse
JOIN 
    Dim_Nature_Analyse na ON am.Id_Nature_Analyse = na.Id_Nature_Analyse;