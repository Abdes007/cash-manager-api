<?php
require_once 'config.php';
$method = $_SERVER['REQUEST_METHOD'];
$id     = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        $st = $pdo->query('SELECT * FROM associes ORDER BY nom');
        respond($st->fetchAll());

    case 'PUT':
        $d = body();
        $pdo->prepare('UPDATE associes SET nom=?,pourcentage=?,totalRecu=? WHERE id=?')
            ->execute([$d['nom'], $d['pourcentage'], $d['totalRecu'], $id]);
        respond(['ok' => true]);

    // Ajouter montant reçu
    case 'PATCH':
        $d = body();
        $pdo->prepare('UPDATE associes SET totalRecu = totalRecu + ? WHERE id=?')
            ->execute([$d['montant'], $id]);
        respond(['ok' => true]);

    default:
        respond(['error' => 'Method not allowed'], 405);
}
