-- ============================================================
-- CASH MANAGER ARK DIGITAL — Schéma MySQL
-- Base de données : cash_manager
-- ============================================================

USE cash_manager;

-- ── Transactions ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS transactions (
    id            VARCHAR(36)    PRIMARY KEY,
    type          VARCHAR(10)    NOT NULL,
    category      VARCHAR(50)    NOT NULL,
    montant       DECIMAL(12,2)  NOT NULL,
    description   TEXT           NOT NULL,
    date          DATETIME       NOT NULL,
    clientId      VARCHAR(36)    NULL,
    associeId     VARCHAR(36)    NULL,
    beneficiaire  VARCHAR(150)   NULL,
    created_at    TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ── Clients récurrents ────────────────────────────────────────
CREATE TABLE IF NOT EXISTS clients (
    id               VARCHAR(36)   PRIMARY KEY,
    nom              VARCHAR(150)  NOT NULL,
    telephone        VARCHAR(30)   NULL,
    montantMensuel   DECIMAL(12,2) NOT NULL,
    dernierPaiement  DATETIME      NULL,
    notes            TEXT          NULL,
    moisPayes        JSON          NULL,
    created_at       TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ── Associés (3 fixes) ────────────────────────────────────────
CREATE TABLE IF NOT EXISTS associes (
    id           VARCHAR(36)   PRIMARY KEY,
    nom          VARCHAR(150)  NOT NULL,
    pourcentage  DECIMAL(5,2)  NOT NULL,
    totalRecu    DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    created_at   TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed des 3 associés
INSERT IGNORE INTO associes (id, nom, pourcentage, totalRecu) VALUES
  ('associe_1', 'Khalil Jafari',      33.33, 0.00),
  ('associe_2', 'Radouane Et-Tafs',   33.33, 0.00),
  ('associe_3', 'Abdessamad Laarabi', 33.34, 0.00);

-- ── Ventes matériel ───────────────────────────────────────────
CREATE TABLE IF NOT EXISTS ventes (
    id            VARCHAR(36)   PRIMARY KEY,
    client        VARCHAR(150)  NOT NULL,
    designation   VARCHAR(255)  NOT NULL,
    description   TEXT          NOT NULL,
    montant       DECIMAL(12,2) NOT NULL,
    paye          TINYINT(1)    NOT NULL DEFAULT 0,
    date          DATETIME      NOT NULL,
    datePaiement  DATETIME      NULL,
    created_at    TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ── Bénéficiaires ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS beneficiaires (
    id         VARCHAR(36)  PRIMARY KEY,
    nom        VARCHAR(150) NOT NULL,
    categorie  VARCHAR(50)  NOT NULL,
    created_at TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed bénéficiaires associés
INSERT IGNORE INTO beneficiaires (id, nom, categorie) VALUES
  ('ben_associe_1', 'Khalil Jafari',      'repartitionAssocie'),
  ('ben_associe_2', 'Radouane Et-Tafs',   'repartitionAssocie'),
  ('ben_associe_3', 'Abdessamad Laarabi', 'repartitionAssocie');

-- ── Salariés ──────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS salaries (
    id         VARCHAR(36)   PRIMARY KEY,
    nom        VARCHAR(150)  NOT NULL,
    poste      VARCHAR(150)  NOT NULL,
    salaire    DECIMAL(12,2) NOT NULL,
    created_at TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
