<?php
session_start();
require "../../conn/conn.php";
    $estado="pendiente";
    $sqlInsertCliente="INSERT INTO `ventas`(`fechaV`, `idUser`, `cliente`, `estado`) VALUES (NOW(),:us,:cli,:es)";
    $cliente=$conn->prepare($sqlInsertCliente);
    $cliente->bindParam(":us",$_SESSION['user']['id']);
    $cliente->bindParam(":cli",$_GET['cli']);
    $cliente->bindParam(":es",$estado);
    $cliente->execute();
    echo json_encode("ok");
?>