-- ============================================
-- ENRG — Smart Energy Saving System
-- Schéma Base de Données PostgreSQL
-- Équipe : ISG Bizerte | AGL 2026/2027
-- ============================================

-- TABLE utilisateurs
CREATE TABLE utilisateurs (
    id               SERIAL PRIMARY KEY,
    nom              VARCHAR(100) NOT NULL,
    prenom           VARCHAR(100) NOT NULL,
    email            VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe     VARCHAR(255) NOT NULL,
    role             VARCHAR(20)  DEFAULT 'USER',
    date_inscription TIMESTAMP   DEFAULT NOW(),
    actif            BOOLEAN     DEFAULT TRUE
);

-- TABLE appareils
CREATE TABLE appareils (
    id             SERIAL PRIMARY KEY,
    nom            VARCHAR(100) NOT NULL,
    type           VARCHAR(50)  NOT NULL,
    statut         BOOLEAN      DEFAULT TRUE,
    puissance      FLOAT        NOT NULL,
    localisation   VARCHAR(100),
    utilisateur_id INT REFERENCES utilisateurs(id),
    date_ajout     TIMESTAMP    DEFAULT NOW()
);

-- TABLE capteurs_iot
CREATE TABLE capteurs_iot (
    id           SERIAL PRIMARY KEY,
    mac_addr     VARCHAR(50) UNIQUE NOT NULL,
    localisation VARCHAR(100),
    statut       BOOLEAN     DEFAULT TRUE,
    protocol     VARCHAR(20) DEFAULT 'MQTT',
    interval_sec INT         DEFAULT 30,
    appareil_id  INT REFERENCES appareils(id)
);

-- TABLE consommation
CREATE TABLE consommation (
    id          SERIAL PRIMARY KEY,
    valeur      FLOAT     NOT NULL,
    date        TIMESTAMP DEFAULT NOW(),
    zone        VARCHAR(50),
    cout        FLOAT,
    appareil_id INT REFERENCES appareils(id)
);

-- TABLE alertes
CREATE TABLE alertes (
    id             SERIAL PRIMARY KEY,
    message        TEXT      NOT NULL,
    type           VARCHAR(50),
    seuil          FLOAT,
    lue            BOOLEAN   DEFAULT FALSE,
    date_envoi     TIMESTAMP DEFAULT NOW(),
    utilisateur_id INT REFERENCES utilisateurs(id)
);

-- TABLE objectifs
CREATE TABLE objectifs (
    id             SERIAL PRIMARY KEY,
    titre          VARCHAR(150) NOT NULL,
    cible_kwh      FLOAT        NOT NULL,
    progression    FLOAT        DEFAULT 0,
    date_debut     DATE         DEFAULT NOW(),
    utilisateur_id INT REFERENCES utilisateurs(id)
);

-- TABLE rapports
CREATE TABLE rapports (
    id              SERIAL PRIMARY KEY,
    periode         VARCHAR(50),
    total_kwh       FLOAT,
    total_cout      FLOAT,
    format          VARCHAR(10) DEFAULT 'PDF',
    date_generation TIMESTAMP   DEFAULT NOW(),
    utilisateur_id  INT REFERENCES utilisateurs(id)
);

-- TABLE recommandations
CREATE TABLE recommandations (
    id               SERIAL PRIMARY KEY,
    description      TEXT  NOT NULL,
    economie_estimee FLOAT,
    appliquee        BOOLEAN   DEFAULT FALSE,
    date_generation  TIMESTAMP DEFAULT NOW(),
    utilisateur_id   INT REFERENCES utilisateurs(id)
);

-- INDEX pour meilleures performances
CREATE INDEX idx_conso_appareil ON consommation(appareil_id);
CREATE INDEX idx_conso_date     ON consommation(date);
CREATE INDEX idx_alertes_user   ON alertes(utilisateur_id);
CREATE INDEX idx_appareils_user ON appareils(utilisateur_id);
