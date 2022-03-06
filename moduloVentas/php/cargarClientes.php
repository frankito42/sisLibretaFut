<?php
session_start();
require "../../conn/conn.php";
    $sqlInsertCliente="SELECT v.`idVenta`,v.`fechaV`,v.`cliente`,u.user,v.latLong FROM `ventas`=v 
    JOIN users =u ON u.id=v.`idUser` where v.estado='PENDIENTE'";
    $cliente=$conn->prepare($sqlInsertCliente);
    $cliente->execute();
    $cliente=$cliente->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($cliente);
?>