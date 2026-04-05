# 🚀 Guide d'installation — Smart Energy Saving System

## 📋 Prérequis
- Node.js v18+
- Docker & Docker Compose
- Git

## ⚙️ Installation

### 1. Cloner le repository
```bash
git clone https://github.com/doua98/smart-energy-saving-system.git
cd smart-energy-saving-system
```

### 2. Lancer avec Docker
```bash
docker-compose up --build
```

### 3. Initialiser la base de données
```bash
docker exec -i enrg_db psql -U user -d enrg_db < database/schema.sql
docker exec -i enrg_db psql -U user -d enrg_db < database/seed.sql
```

## 🌐 URLs de l'application

| Service | URL |
|---------|-----|
| Frontend | http://localhost:3000 |
| Backend API | http://localhost:5000 |
| InfluxDB | http://localhost:8086 |
| MQTT Broker | mqtt://localhost:1883 |

## 👥 Équipe
| Membre | Rôle | GitHub |
|--------|------|--------|
| Doua Nasri | Chef de projet | @doua98 |
| Ranim M. Nasri | Backend | @ranim-nasri |
| Nour Guesmi | UI/UX | @nour-guesmi |
| Ranim Bejaoui | Frontend | @ranim-bejaoui |
| Takoua Kochbati | Backend | @takoua-k |
| Sahar Chouikh | Admin système | @sahar-c |
| Imen Boulifi | QA & Tests | @imen-b |

## 📁 Structure du projet
smart-energy-saving-system/
├── frontend/          → Interface React.js
├── backend/           → API REST Node.js
├── database/
│   ├── schema.sql     → Structure des tables
│   └── seed.sql       → Données de test
├── docs/              → Diagrammes UML, CDC
├── .github/workflows/ → CI/CD Pipeline
├── docker-compose.yml → Services Docker
└── SETUP.md           → Ce fichier

## 🔑 Variables d'environnement
Copier `.env.example` vers `.env` et remplir les valeurs.

## 📞 Encadrante
**Dr. Yasmine Chaabani** — ISG Bizerte | AGL 2025/2026
