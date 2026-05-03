<?php
// Script d'import unique - supprimer après utilisation
$secret = $_GET['key'] ?? '';
if ($secret !== 'arkdigital2024import') {
    http_response_code(403);
    die(json_encode(['error' => 'Forbidden']));
}

require_once 'config.php';

$sql = file_get_contents(__DIR__ . '/data_backup.sql');
if (!$sql) { die(json_encode(['error' => 'SQL file not found'])); }

// Exécuter chaque statement
$pdo->exec("SET FOREIGN_KEY_CHECKS=0");
$statements = array_filter(array_map('trim', explode(';', $sql)));
$ok = 0; $errors = [];

foreach ($statements as $stmt) {
    if (empty($stmt) || strpos($stmt, '--') === 0 || strpos($stmt, '/*') === 0) continue;
    try {
        $pdo->exec($stmt);
        $ok++;
    } catch (PDOException $e) {
        $errors[] = $e->getMessage();
    }
}

$pdo->exec("SET FOREIGN_KEY_CHECKS=1");
echo json_encode(['imported' => $ok, 'errors' => count($errors), 'details' => array_slice($errors, 0, 5)]);
