<?php
require_once 'config.php';

// Add montant column if it doesn't exist
try {
    $pdo->exec("ALTER TABLE beneficiaires ADD COLUMN montant DECIMAL(12,2) NULL");
} catch (Exception $e) { /* column already exists */ }

$method = $_SERVER['REQUEST_METHOD'];
$id     = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        $st = $pdo->query('SELECT * FROM beneficiaires ORDER BY nom');
        respond($st->fetchAll());

    case 'POST':
        $d = body();
        $pdo->prepare('INSERT INTO beneficiaires (id,nom,categorie,montant) VALUES (?,?,?,?)')
            ->execute([$d['id'], $d['nom'], $d['categorie'], $d['montant'] ?? null]);
        respond(['ok' => true], 201);

    case 'PUT':
        $d = body();
        $pdo->prepare('UPDATE beneficiaires SET nom=?,categorie=?,montant=? WHERE id=?')
            ->execute([$d['nom'], $d['categorie'], $d['montant'] ?? null, $id]);
        respond(['ok' => true]);

    case 'DELETE':
        $pdo->prepare('DELETE FROM beneficiaires WHERE id=?')->execute([$id]);
        respond(['ok' => true]);

    default:
        respond(['error' => 'Method not allowed'], 405);
}
