# ETL-Clinique
Développement d’un pipeline ETL complet avec Pentaho Data Integration pour l’extraction, la transformation et le chargement de données opérationnelles dans un entrepôt PostgreSQL.

# Fonctionnalités
- Extraction automatisée de données brutes depuis une source opérationnelle.
- Nettoyage, transformation et standardisation des données (formats, types & valeurs manquantes).
- Chargement structuré dans un entrepôt de données PostgreSQL (dimensions & faits).
- Orchestration complète d'un job ETL via Pentaho.

# Structure du projet
- Scripts/ : Contient les scripts PostgreSQL pour créer les tables dans la base clinique et dans l'entrepôt de données.
- Tables/ : Contient les fichiers CSV générés par les jobs ETL.
- Transformations/ : Contient les transformations Pentaho (dimensions & faits) ainsi que les jobs d’orchestration.

# Prérequis
- Pentaho Data Integration.
- PostgreSQL.