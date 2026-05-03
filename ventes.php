<?php
require_once 'config.php';
$method = $_SERVER['REQUEST_METHOD'];
$id     = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        $st = $pdo->query('SELECT * FROM ventes ORDER BY date DESC');
        $rows = $st->fetchAll();
        foreach ($rows as &$row) {
            $row['paye'] = (bool)$row['paye'];
        }
        respond($rows);

    case 'POST':
        $d = body();
        $pdo->prepare('INSERT INTO ventes (id,client,designation,description,montant,paye,date,datePaiement)
            VALUES (?,?,?,?,?,?,?,?)')
            ->execute([
                $d['id'], $d['client'], $d['designation'], $d['description'],
                $d['montant'], $d['paye'] ? 1 : 0, $d['date'],
                $d['datePaiement'] ?? null
            ]);
        respond(['ok' => true], 201);

    case 'PUT':
        $d = body();
        $pdo->prepare('UPDATE ventes SET client=?,designation=?,description=?,montant=?,paye=?,date=?,datePaiement=? WHERE id=?')
            ->execute([
                $d['client'], $d['designation'], $d['description'],
                $d['montant'], $d['paye'] ? 1 : 0, $d['date'],
                $d['datePaiement'] ?? null, $id
            ]);
        respond(['ok' => true]);

    case 'DELETE':
        $pdo->prepare('DELETE FROM ventes WHERE id=?')->execute([$id]);
        respond(['ok' => true]);

    default:
        respond(['error' => 'Method not allowed'], 405);
}
