CREATE TABLE utilisateurs (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,           
    date_inscription TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE administrateurs (
    id SERIAL PRIMARY KEY,
    utilisateur_id INTEGER UNIQUE REFERENCES utilisateurs(id) ON DELETE CASCADE,
    niveau_acces INTEGER DEFAULT 1 CHECK (niveau_acces >= 1 AND niveau_acces <= 5),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE appareils (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,                    -- ex: "lampe", "climatiseur", "frigo"
    statut BOOLEAN DEFAULT TRUE,                  -- true = allumé
    puissance FLOAT NOT NULL CHECK (puissance >= 0),
    utilisateur_id INTEGER NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE capteurs_iot (
    id SERIAL PRIMARY KEY,
    mac_addr VARCHAR(17) UNIQUE NOT NULL,         
    localisation VARCHAR(150),
    statut BOOLEAN DEFAULT TRUE,
    appareil_id INTEGER REFERENCES appareils(id) ON DELETE SET NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE consommation (
    id SERIAL PRIMARY KEY,
    valeur FLOAT NOT NULL CHECK (valeur >= 0),
    date TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cout FLOAT CHECK (cout >= 0),
    appareil_id INTEGER NOT NULL REFERENCES appareils(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Index pour les requêtes fréquentes sur la consommation
CREATE INDEX idx_consommation_appareil_date ON consommation(appareil_id, date DESC);
CREATE INDEX idx_consommation_date ON consommation(date DESC);

CREATE TABLE alertes (
    id SERIAL PRIMARY KEY,
    message TEXT NOT NULL,
    type VARCHAR(50) NOT NULL,                    -- ex: "seuil", "anomalie", "maintenance"
    seuil FLOAT,
    utilisateur_id INTEGER NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
    lue BOOLEAN DEFAULT FALSE,
    date_envoi TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_alertes_utilisateur ON alertes(utilisateur_id);
CREATE INDEX idx_alertes_lue ON alertes(lue);


CREATE TABLE objectifs (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(150) NOT NULL,
    cible_kwh FLOAT NOT NULL CHECK (cible_kwh > 0),
    progression FLOAT DEFAULT 0 CHECK (progression >= 0 AND progression <= 100),
    utilisateur_id INTEGER NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE recommandations (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    economie_estimee FLOAT CHECK (economie_estimee >= 0),
    appliquee BOOLEAN DEFAULT FALSE,
    utilisateur_id INTEGER REFERENCES utilisateurs(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE rapports (
    id SERIAL PRIMARY KEY,
    periode VARCHAR(50) NOT NULL,                 -- ex: "2026-04", "Q1-2026"
    total_kwh FLOAT NOT NULL,
    format VARCHAR(10) DEFAULT 'PDF',             -- PDF ou CSV
    utilisateur_id INTEGER NOT NULL REFERENCES utilisateurs(id) ON DELETE CASCADE,
    date_generation TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_appareils_utilisateur ON appareils(utilisateur_id);
CREATE INDEX idx_capteurs_appareil ON capteurs_iot(appareil_id);
CREATE INDEX idx_objectifs_utilisateur ON objectifs(utilisateur_id);

-- Trigger pour mettre à jour automatiquement updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_utilisateurs_updated_at 
    BEFORE UPDATE ON utilisateurs 
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_appareils_updated_at 
    BEFORE UPDATE ON appareils 
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();