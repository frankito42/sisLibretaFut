<?php
session_start();
require "../../conn/conn.php";
    $sqlAllProductos="SELECT v.idVenta,v.cliente, d.nombreProducto,d.precio, v.estado FROM `ventas`=v
    JOIN detalleventa = d on v.idVenta=d.idV WHERE v.estado='PENDIENTE' AND idVenta=:id";
    $cliente=$conn->prepare($sqlAllProductos);
    $cliente->bindParam(":id",$_GET['id']);
    $cliente->execute();
    $cliente=$cliente->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($cliente);
?>