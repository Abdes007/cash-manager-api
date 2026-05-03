<?php
require_once 'config.php';
$method = $_SERVER['REQUEST_METHOD'];
$id     = $_GET['id'] ?? null;

switch ($method) {
    case 'GET':
        $st = $pdo->query('SELECT * FROM clients ORDER BY nom');
        $rows = $st->fetchAll();
        // Décoder moisPayes JSON
        foreach ($rows as &$row) {
            $row['moisPayes'] = $row['moisPayes'] ? json_decode($row['moisPayes'], true) : [];
        }
        respond($rows);

    case 'POST':
        $d = body();
        $pdo->prepare('INSERT INTO clients (id,nom,telephone,montantMensuel,dernierPaiement,notes,moisPayes)
            VALUES (?,?,?,?,?,?,?)')
            ->execute([
                $d['id'], $d['nom'], $d['telephone'] ?? null,
                $d['montantMensuel'], $d['dernierPaiement'] ?? null,
                $d['notes'] ?? null,
                json_encode($d['moisPayes'] ?? [])
            ]);
        respond(['ok' => true], 201);

    case 'PUT':
        $d = body();
        $pdo->prepare('UPDATE clients SET nom=?,telephone=?,montantMensuel=?,dernierPaiement=?,notes=?,moisPayes=? WHERE id=?')
            ->execute([
                $d['nom'], $d['telephone'] ?? null, $d['montantMensuel'],
                $d['dernierPaiement'] ?? null, $d['notes'] ?? null,
                json_encode($d['moisPayes'] ?? []),
                $id
            ]);
        respond(['ok' => true]);

    case 'DELETE':
        $pdo->prepare('DELETE FROM clients WHERE id=?')->execute([$id]);
        respond(['ok' => true]);

    default:
        respond(['error' => 'Method not allowed'], 405);
}
