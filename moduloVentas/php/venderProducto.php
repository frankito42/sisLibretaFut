<?php
session_start();
require "../../conn/conn.php";
$idVentaDetalle=$_GET['idDetalle'];
$productoId=$_GET['idArticulo'];
$idCliente=$_GET['idCliente'];
$total=0;

$sqlTraerArticulo="UPDATE `articulos` SET `cantidad`=cantidad-1 WHERE `articulo`=:id";
$producto=$conn->prepare($sqlTraerArticulo);
$producto->bindParam(":id",$productoId);
$producto->execute();

/* $fecha=date("Y-m-d");
$addNewVenta="INSERT INTO `ventas`(`fechaV`, `totalV`, `idUser`) VALUES (:fecha,:total,:idUser)";
$addVenta=$conn->prepare($addNewVenta);
$addVenta->bindParam(":fecha",$fecha);
$addVenta->bindParam(":total",$total);
$addVenta->bindParam(":idUser",$_SESSION['user']['id']);
$addVenta->execute(); */

/* $idVenta=$conn->lastInsertId(); */

    $sqlInsetDetailVenta="UPDATE `detalleventa` SET `estado`='PAGADO' WHERE `idDetalleVenta`=:idDetalle";
    $insertDetailVenta=$conn->prepare($sqlInsetDetailVenta);
    $insertDetailVenta->bindParam(":idDetalle",$idVentaDetalle);
    $insertDetailVenta->execute();


/* require "../../moduloTicket/index.php"; */
echo json_encode("perfecto");
?>