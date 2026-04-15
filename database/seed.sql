-- =============================================
-- SEED DATA - Données de test pour SESS
-- =============================================

-- Utilisateurs (7 comme indiqué)
INSERT INTO utilisateurs (nom, email, mot_de_passe, date_inscription) VALUES
('Ahmed Benali', 'ahmed@example.com', 'hash_motdepasse_1', '2025-01-15'),
('Fatma Trabelsi', 'fatma@example.com', 'hash_motdepasse_2', '2025-02-01'),
('Mohamed Khemiri', 'mohamed@example.com', 'hash_motdepasse_3', '2025-02-20'),
('Leila Saidi', 'leila@example.com', 'hash_motdepasse_4', '2025-03-05'),
('Karim Jarraya', 'karim@example.com', 'hash_motdepasse_5', '2025-03-10'),
('Sofia Mansouri', 'sofia@example.com', 'hash_motdepasse_6', '2025-03-25'),
('Youssef Amri', 'youssef@example.com', 'hash_motdepasse_7', '2025-04-01');

-- Appareils (6)
INSERT INTO appareils (nom, type, statut, puissance, utilisateur_id) VALUES
('Climatiseur Salon', 'Climatisation', TRUE, 1500.5, 1),
('Réfrigérateur', 'Electroménager', TRUE, 250.0, 1),
('Lampe LED Bureau', 'Éclairage', FALSE, 12.0, 2),
('Machine à laver', 'Electroménager', FALSE, 2200.0, 3),
('Chauffe-eau', 'Chauffage', TRUE, 3000.0, 4),
('TV OLED', 'Multimédia', TRUE, 120.0, 1);

-- Capteurs IoT (4)
INSERT INTO capteurs_iot (mac_addr, localisation, statut, appareil_id) VALUES
('AA:BB:CC:DD:EE:01', 'Salon', TRUE, 1),
('AA:BB:CC:DD:EE:02', 'Cuisine', TRUE, 2),
('AA:BB:CC:DD:EE:03', 'Bureau', TRUE, 3),
('AA:BB:CC:DD:EE:04', 'Salle de bain', TRUE, 5);

-- Consommation (6 enregistrements)
INSERT INTO consommation (valeur, date, cout, appareil_id) VALUES
(12.5, '2026-04-01 08:00:00+01', 3.75, 1),
(8.3, '2026-04-01 09:00:00+01', 2.49, 2),
(0.5, '2026-04-01 10:00:00+01', 0.15, 3),
(45.2, '2026-04-02 14:00:00+01', 13.56, 1),
(2.1, '2026-04-02 18:00:00+01', 0.63, 6),
(15.7, '2026-04-03 07:30:00+01', 4.71, 5);

-- Alertes (3)
INSERT INTO alertes (message, type, seuil, utilisateur_id, lue) VALUES
('Consommation élevée du climatiseur dépassant le seuil', 'seuil', 1400, 1, FALSE),
('Anomalie détectée sur le réfrigérateur', 'anomalie', NULL, 1, TRUE),
('Objectif mensuel presque atteint', 'info', NULL, 2, FALSE);

-- Objectifs (exemple)
INSERT INTO objectifs (titre, cible_kwh, progression, utilisateur_id) VALUES
('Réduire la consommation de 15% en avril', 450.0, 28.5, 1);

-- Recommandations (exemple)
INSERT INTO recommandations (description, economie_estimee, appliquee, utilisateur_id) VALUES
('Éteindre les appareils en veille la nuit', 45.0, FALSE, 1);