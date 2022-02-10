<?php
session_start();
require "../../conn/conn.php";
    $sqlInsertCliente="SELECT * FROM `ventas` where estado='PENDIENTE'";
    $cliente=$conn->prepare($sqlInsertCliente);
    $cliente->execute();
    $cliente=$cliente->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($cliente);
?>