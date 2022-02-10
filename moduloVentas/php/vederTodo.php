<?php
session_start();
require "../../conn/conn.php";
$idCliente=$_GET['idCliente'];
$total=0;

$sqlTraerArticulo="SELECT `idDetalleVenta`, `idV`, `nombreProducto`, `cantidadV`, `precio`, `fecha`, `idArticulo`, `estado` FROM `detalleventa` WHERE `idV`=:id";
$producto=$conn->prepare($sqlTraerArticulo);
$producto->bindParam(":id",$idCliente);
$producto->execute();
$producto=$producto->fetchAll(PDO::FETCH_ASSOC);

$suma=0;
foreach ($producto as $key) {
    $sqlTraerArticulo="UPDATE `articulos` SET `cantidad`=cantidad-1 WHERE `articulo`=:id";
    $producto=$conn->prepare($sqlTraerArticulo);
    $producto->bindParam(":id",$key['idArticulo']);
    $producto->execute();
    $suma+=$key['precio'];
    $sqlInsetDetailVenta="UPDATE `detalleventa` SET `estado`='PAGADO' WHERE `idDetalleVenta`=:idDetalle";
    $insertDetailVenta=$conn->prepare($sqlInsetDetailVenta);
    $insertDetailVenta->bindParam(":idDetalle",$key['idDetalleVenta']);
    $insertDetailVenta->execute();
}



 
    $sqlInsetDetailVenta="UPDATE `ventas` SET `totalV`='$suma',`estado`='PAGADO' WHERE `idVenta`=$idCliente";
    $insertDetailVenta=$conn->prepare($sqlInsetDetailVenta);
    $insertDetailVenta->execute();


/* require "../../moduloTicket/index.php"; */
echo json_encode("perfecto");
?>