<?php
session_start();
require "../../conn/conn.php";
    $estado="pendiente";
    $latLong=(empty($_GET['latLong']))?"":$_GET['latLong'];
    $sqlInsertCliente="INSERT INTO `ventas`(`fechaV`, `idUser`, `cliente`, `estado`,latLong) VALUES (NOW(),:us,:cli,:es,:latLong)";
    $cliente=$conn->prepare($sqlInsertCliente);
    $cliente->bindParam(":us",$_SESSION['user']['id']);
    $cliente->bindParam(":cli",$_GET['cli']);
    $cliente->bindParam(":es",$estado);
    $cliente->bindParam(":latLong",$latLong);
    $cliente->execute();
    echo json_encode("ok");
?>