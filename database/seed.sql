-- ============================================
-- ENRG — Smart Energy Saving System
-- Données de test
-- ============================================

-- Utilisateurs de test
INSERT INTO utilisateurs (nom, prenom, email, mot_de_passe, role) VALUES
('Nasri',    'Doua',    'doua@enrg.tn',    'hash_doua',    'ADMIN'),
('Nasri',    'Ranim',   'ranim@enrg.tn',   'hash_ranim',   'USER'),
('Guesmi',   'Nour',    'nour@enrg.tn',    'hash_nour',    'USER'),
('Bejaoui',  'Ranim',   'ranimb@enrg.tn',  'hash_ranimb',  'USER'),
('Kochbati', 'Takoua',  'takoua@enrg.tn',  'hash_takoua',  'USER'),
('Chouikh',  'Sahar',   'sahar@enrg.tn',   'hash_sahar',   'USER'),
('Boulifi',  'Imen',    'imen@enrg.tn',    'hash_imen',    'USER');

-- Appareils de test
INSERT INTO appareils (nom, type, puissance, localisation, utilisateur_id) VALUES
('Climatiseur Salon',   'Climatisation',  1500.0, 'Salon',      1),
('Réfrigérateur',       'Froid',           200.0, 'Cuisine',    1),
('Chauffe-eau',         'Eau chaude',     2000.0, 'Salle bain', 2),
('Lave-linge',          'Électroménager',  800.0, 'Buanderie',  2),
('Télévision',          'Multimédia',      150.0, 'Salon',      3),
('Ordinateur',          'Informatique',    300.0, 'Bureau',     3);

-- Capteurs IoT
INSERT INTO capteurs_iot (mac_addr, localisation, appareil_id) VALUES
('AA:BB:CC:DD:EE:01', 'Salon',      1),
('AA:BB:CC:DD:EE:02', 'Cuisine',    2),
('AA:BB:CC:DD:EE:03', 'Salle bain', 3),
('AA:BB:CC:DD:EE:04', 'Buanderie',  4);

-- Consommation de test
INSERT INTO consommation (valeur, zone, cout, appareil_id) VALUES
(12.5, 'Salon',      1.875, 1),
(3.2,  'Cuisine',    0.480, 2),
(18.7, 'Salle bain', 2.805, 3),
(6.4,  'Buanderie',  0.960, 4),
(2.1,  'Salon',      0.315, 5),
(4.8,  'Bureau',     0.720, 6);

-- Alertes de test
INSERT INTO alertes (message, type, seuil, utilisateur_id) VALUES
('Consommation élevée sur le climatiseur', 'SEUIL',    15.0, 1),
('Anomalie détectée sur le chauffe-eau',   'ANOMALIE', 20.0, 2),
('Consommation normale',                   'INFO',      5.0, 3);

-- Objectifs de test
INSERT INTO objectifs (titre, cible_kwh, progression, utilisateur_id) VALUES
('Réduire de 20% ce mois',  80.0, 45.0, 1),
('Économiser sur le froid', 30.0, 12.0, 2);

-- Recommandations de test
INSERT INTO recommandations (description, economie_estimee, utilisateur_id) VALUES
('Éteindre le climatiseur la nuit',         15.0, 1),
('Régler le réfrigérateur à 4°C',            5.0, 1),
('Utiliser le lave-linge en heures creuses', 8.0, 2);
