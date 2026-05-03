<?php
require_once 'config.php';

// Auto-create table
$pdo->exec("CREATE TABLE IF NOT EXISTS invoices (
  id           VARCHAR(36)  PRIMARY KEY,
  client       VARCHAR(255) NOT NULL,
  designation  VARCHAR(255) NOT NULL,
  num_facture  VARCHAR(100) NOT NULL,
  mnt_facture  DECIMAL(12,2) NOT NULL,
  date_facture DATE         NOT NULL,
  echeance     DATE         NOT NULL,
  commentaire  TEXT,
  statut       VARCHAR(20)  NOT NULL DEFAULT 'en_cours',
  created_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP
)");

$method = $_SERVER['REQUEST_METHOD'];
$id     = $_GET['id'] ?? null;

switch ($method) {
  case 'GET':
    $rows = $pdo->query("SELECT * FROM invoices ORDER BY echeance ASC")->fetchAll(PDO::FETCH_ASSOC);
    respond($rows);
    break;

  case 'POST':
    $d = body();
    $st = $pdo->prepare("INSERT INTO invoices
      (id,client,designation,num_facture,mnt_facture,date_facture,echeance,commentaire,statut)
      VALUES (?,?,?,?,?,?,?,?,?)");
    $st->execute([
      $d['id'], $d['client'], $d['designation'], $d['num_facture'],
      $d['mnt_facture'], $d['date_facture'], $d['echeance'],
      $d['commentaire'] ?? null, $d['statut'] ?? 'en_cours',
    ]);
    respond(['ok' => true], 201);
    break;

  case 'PUT':
    $d = body();
    $st = $pdo->prepare("UPDATE invoices SET statut=? WHERE id=?");
    $st->execute([$d['statut'], $id]);
    respond(['ok' => true]);
    break;

  case 'DELETE':
    if ($id) {
      $pdo->prepare("DELETE FROM invoices WHERE id=?")->execute([$id]);
    } else {
      $pdo->exec("DELETE FROM invoices");
    }
    respond(['ok' => true]);
    break;
}
