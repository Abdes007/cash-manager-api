<?php
require_once 'config.php';
$method = $_SERVER['REQUEST_METHOD'];
$id     = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        $st = $pdo->query('SELECT * FROM salaries ORDER BY nom');
        respond($st->fetchAll());

    case 'POST':
        $d = body();
        $pdo->prepare('INSERT INTO salaries (id,nom,poste,salaire) VALUES (?,?,?,?)')
            ->execute([$d['id'], $d['nom'], $d['poste'], $d['salaire']]);
        respond(['ok' => true], 201);

    case 'PUT':
        $d = body();
        $pdo->prepare('UPDATE salaries SET nom=?,poste=?,salaire=? WHERE id=?')
            ->execute([$d['nom'], $d['poste'], $d['salaire'], $id]);
        respond(['ok' => true]);

    case 'DELETE':
        $pdo->prepare('DELETE FROM salaries WHERE id=?')->execute([$id]);
        respond(['ok' => true]);

    default:
        respond(['error' => 'Method not allowed'], 405);
}
