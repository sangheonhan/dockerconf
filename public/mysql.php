<?php

$pdo = new \PDO('mysql:host=mysql;dbname=test', 'test', 'test');
foreach ($pdo->query('SELECT NOW() AS now', \PDO::FETCH_ASSOC) as $row) {
    var_dump($row);
}
$pdo = null;
