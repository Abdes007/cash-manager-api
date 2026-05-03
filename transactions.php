<?php
require_once 'config.php';
$method = $_SERVER['REQUEST_METHOD'];
$id     = $_GET['id'] ?? null;

// Add pay_par column if not exists
try {
    $pdo->exec("ALTER TABLE transactions ADD COLUMN pay_par VARCHAR(100) NULL");
} catch (Exception $e) {}

switch ($method) {
    case 'GET':
        $sql = 'SELECT * FROM transactions';
        $params = [];
        if (!empty($_GET['from']))     { $sql .= ' WHERE date >= ?'; $params[] = $_GET['from']; }
        if (!empty($_GET['to']))       { $sql .= (empty($params)?'WHERE':'AND').' date <= ?'; $params[] = $_GET['to']; }
        if (!empty($_GET['category'])) { $sql .= (empty($params)?'WHERE':'AND').' category = ?'; $params[] = $_GET['category']; }
        if (!empty($_GET['type']))     { $sql .= (empty($params)?'WHERE':'AND').' type = ?'; $params[] = $_GET['type']; }
        $sql .= ' ORDER BY date DESC';
        $st = $pdo->prepare($sql);
        $st->execute($params);
        respond($st->fetchAll());

    case 'POST':
        $d = body();
        $pdo->prepare('INSERT INTO transactions
            (id,type,category,montant,description,date,clientId,associeId,beneficiaire,pay_par)
            VALUES (?,?,?,?,?,?,?,?,?,?)')
            ->execute([
                $d['id'], $d['type'], $d['category'], $d['montant'],
                $d['description'], $d['date'],
                $d['clientId'] ?? null, $d['associeId'] ?? null,
                $d['beneficiaire'] ?? null, $d['payePar'] ?? null
            ]);
        respond(['ok' => true], 201);

    case 'PUT':
        $d = body();
        $pdo->prepare('UPDATE transactions SET type=?,category=?,montant=?,description=?,date=?,
            clientId=?,associeId=?,beneficiaire=?,pay_par=? WHERE id=?')
            ->execute([
                $d['type'], $d['category'], $d['montant'], $d['description'], $d['date'],
                $d['clientId'] ?? null, $d['associeId'] ?? null,
                $d['beneficiaire'] ?? null, $d['payePar'] ?? null,
                $id
            ]);
        respond(['ok' => true]);

    case 'DELETE':
        $pdo->prepare('DELETE FROM transactions WHERE id=?')->execute([$id]);
        respond(['ok' => true]);

    default:
        respond(['error' => 'Method not allowed'], 405);
}
