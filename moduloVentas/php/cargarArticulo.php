<?php
require "../../conn/conn.php";
$idVenta=$_GET['cliente'];
$fecha=date("Y-m-d");
if ($_GET['codigo']=="no") {
    $sqlTraerArticulo="SELECT `articulo`, `nombre`, `costo`, `stockmin`,
                     `cantidad`, `descripcion`, `imagen`, `categoria`,
                     `codBarra`, `precioVenta`, `idEsta`, `idProveedor`,mayoritario
                      FROM `articulos` WHERE `articulo`=:id";
    $producto=$conn->prepare($sqlTraerArticulo);
    $producto->bindParam(":id",$_GET['idPro']);
    $producto->execute();
    $producto=$producto->fetch(PDO::FETCH_ASSOC);
} else {
    $sqlTraerArticulo="SELECT `articulo`, `nombre`, `costo`, `stockmin`,
                     `cantidad`, `descripcion`, `imagen`, `categoria`,
                     `codBarra`, `precioVenta`, `idEsta`, `idProveedor`,mayoritario
                      FROM `articulos` WHERE `codBarra`=:codigo";
    $producto=$conn->prepare($sqlTraerArticulo);
    $producto->bindParam(":codigo",$_GET['codigo']);
    $producto->execute();
    $producto=$producto->fetch(PDO::FETCH_ASSOC);
}
$cantidad=1;
$estado="PENDIENTE";
$sqlInsetDetailVenta="INSERT INTO `detalleventa`(`idV`, `nombreProducto`, `cantidadV`, `precio`, `fecha`,idArticulo,estado)
VALUES (:idVenta,:nombre,:cantidadV,:precio,:fecha,:idArticulo,:es)";
$insertDetailVenta=$conn->prepare($sqlInsetDetailVenta);
$insertDetailVenta->bindParam(":idVenta",$idVenta);
$insertDetailVenta->bindParam(":nombre",$producto['nombre']);
$insertDetailVenta->bindParam(":cantidadV",$cantidad);
$insertDetailVenta->bindParam(":precio",$producto['precioVenta']);
$insertDetailVenta->bindParam(":fecha",$fecha);
$insertDetailVenta->bindParam(":idArticulo",$producto['articulo']);
$insertDetailVenta->bindParam(":es",$estado);
$insertDetailVenta->execute();


echo json_encode($producto);
?>