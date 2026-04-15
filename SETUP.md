🚀 Guide d'installation — ENRG Smart Energy Saving System
====================================================================

**Site Web de démonstration** — Prototype Frontend + Backend PHP + PostgreSQL

---

### 📋 Prérequis

- PHP 8.0 ou supérieur (avec extension `pdo_pgsql`)
- PostgreSQL 15+
- Serveur web XAMPP
- Git

---

### ⚙️ Installation

#### 1. Cloner le repository

```bash
git clone https://github.com/doua98/smart-energy-saving-system.git
cd smart-energy-saving-system

#### 2. Configurer la base de données

CREATE DATABASE AGL_db;

#### 3. Lancer le site

cd frontend
php -S localhost:8000

🌐 Accès à l'application

Frontend (Site Web) → http://localhost:8000
Backend API → http://localhost/backend/api/
Base de données → PostgreSQL (port 5432)

👥 Équipe — ISG Bizerte | AGL 2026/2027

Doua Nasri
Ranim M. Nasri
Nour Guesmi
Ranim Bejaoui
Takoua Kochbati
Sahar Chouikh
Imen Boulifi

smart-energy-saving-system/
├── frontend/           → Interface (HTML + CSS + JavaScript)
├── backend/            → API REST en PHP
├── database/
│   ├── schema.sql
│   └── seed.sql
├── docs/               → Diagrammes UML & Cahier des charges
└── README.md

📞 Encadrante
Dr. Yasmine Chaabani — ISG Bizerte | AGL 2026/2027

Dernière mise à jour : 15 Avril 2026
Note : Ce prototype est un site web statique amélioré avec backend PHP connecté à PostgreSQL. Il respecte le cahier des charges et est prêt pour la démonstration.
