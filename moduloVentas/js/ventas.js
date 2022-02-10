let elInput = document.getElementById('codigoDeBarra');
elInput.addEventListener('keypress', async (e) => {
    console.log(e.key)
    if(e.key=="Enter"){
        await cargarProductoTablaVenta()
        elInput.value=""
    }
});


/* /////////////////////////////////////////////////////////////// */
/* /////////////////////////////////////////////////////////////// */
/* /////////////////////////////////////////////////////////////// */
document.addEventListener("DOMContentLoaded", async function(event) {
    // Your code to run since DOM is loaded and ready
    await cargarClientes()
    await listarTodosLosProductos() 
});
/* /////////////////////////////////////////////////////////////// */
/* /////////////////////////////////////////////////////////////// */
/* /////////////////////////////////////////////////////////////// */
/* /////////////////////////////////////////////////////////////// */











async function cargarProductoTablaVenta(codi,idPro) {
    let codigo
    if(codi){
        codigo=codi
    }else{
        codigo=document.getElementById('codigoDeBarra').value
    }
    
    if(codigo){
        await fetch('php/cargarArticulo.php?codigo='+codigo+'&idPro='+idPro+'&cliente='+localStorage.getItem("idCliente"))
        .then(response => response.json())
        .then(async(data)=> {
            await cargarClientes()
            console.log(data)

        });
        /* escondo el modal al hacer click en un boton */
        /* $("#mostarProductElegir").modal("hide") */
    }else{
        alert("Agregue codigo de barra.")
    }
}

async function deleteTdTable(e) {
    e.parentNode.parentNode.remove()
    await sumarTodo()
    
}

 

/* function guardarVenta() {
    if (document.getElementById("ProductosVender").children.length>0) {
        let venta=[]
        let ventas=[]
        document.getElementById("ProductosVender").children.forEach((element)=>{
           
            venta.push(element.children[1].children[1].value)
            venta.push(element.children[0].innerHTML)
            venta.push(element.children[1].children[0].value)
            venta.push(element.children[2].children[0].value)
             ventas.push(venta)
            venta=[]
        })
 
        let productosVender = new FormData();
        productosVender.append("productos", JSON.stringify(ventas));
      
        fetch("php/venderProducto.php", {
          method: 'POST',
          body: productosVender,
          }).then(respuesta => respuesta.json())
              .then(decodificado => {
                console.log(decodificado)
                  if (decodificado=="perfecto") {
                    document.getElementById("ProductosVender").innerHTML=""
                    sumarTodo()
                    alert("Venta finalizada.")
                    $("#pregunta").modal("hide")
                     document.getElementById('codigoDeBarra').focus()
                  }
              });


    }else{
        console.log("error")
    }
} */


/* document.getElementById("btnGuardarVenta").addEventListener("click",abreModalPregunta)
document.getElementById("imprimeTicket").addEventListener("click",guardarVenta) */



function abreModalPregunta() {
    console.log(document.getElementById("ProductosVender").children.length)
    if (document.getElementById("ProductosVender").children.length>0){
        $("#pregunta").modal("show")
    }else{
        alert("Cargue productos antes de continuar")
        document.getElementById('codigoDeBarra').focus()
    }
}

async function listarTodosLosProductos() {
    await fetch("php/listarProductos.php")
    .then(respuesta => respuesta.json())
    .then(data => {
              console.log(data)
              let elementos=``
              data.forEach(element => {
                  elementos+=`
                  <tr>
                    <td>${element.nombre}</td>
                    <td>$${element.precioVenta} </td>
                    <td><button class="btn btn-blue btn-sm" onclick="cargarProductoTablaVenta('${(element.codBarra)?element.codBarra:'no'}',${element.articulo})"><i class="fas fa-plus fa-1x"></i></button></td>
                  </tr>
                  `
              });
              document.getElementById("aquiMostrarTodo").innerHTML=elementos
    });
}


$(document).ready(function(){
    $("#filtroProductos").keyup(function(){
    _this = this;
    // Show only matching TR, hide rest of them
    $.each($("#mytable tbody tr"), function() {
    if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
    $(this).hide();
    else
    $(this).show();
    });
    });
   });
 
   document.getElementById("formClienteNuevo").addEventListener("submit",async (e)=>{
       e.preventDefault()
       let cli=document.getElementById("nombre").value
       await fetch("php/nuevoCliente.php?cli="+cli)
    .then(respuesta => respuesta.json())
    .then(data => {
              console.log(data)
              if (data=="ok") {
                location.reload();
              }
    });
   })
   async function cargarClientes() {
    await fetch("php/cargarClientes.php")
    .then(respuesta => respuesta.json())
    .then(async(data) => {
              console.log(data)
              let elementos=``
              let suma=0
               for  (let index = 0; index < data.length; index++) {
                   suma=0
                elementos+=`
                <div onclick="abrirModalProductos(${data[index].idVenta},event)" class="col-md-4">
                    <div style="margin-bottom: 3%;" class="card">
                        <div class="card-body">
                        <h5 style="background: #33b5e5;PADDING: 2%;border-radius: 5px;color: white;" class="card-title">${data[index].cliente}</h5>
                        <hr>`
                
                        await fetch("php/articulosDeCliente.php?id="+data[index].idVenta)
                        .then(respuesta => respuesta.json())
                        .then(async(art) => {
                            /* console.log(art) */
                            
                            for  (let indexs = 0; indexs < art.length; indexs++) {
                                /* console.log(art[index]) */
                                suma+=parseFloat(art[indexs].precio)
                                elementos+=`
                                <div style="padding:2%;" class="row hoverable">
                                    <div class="col-md-4"><p>${art[indexs].nombreProducto} </p></div>
                                    <div class="col-md-4">$${art[indexs].precio}</div>
                                    <div class="col-md-4"><button onclick="pagar(${art[indexs].idDetalleVenta},${data[index].idVenta},${art[indexs].idArticulo})" class="no btn-sm btn btn-success"><svg class="no svg-inline--fa fa-dollar-sign no" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="dollar-sign" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" data-fa-i2svg=""><path class="no" fill="currentColor" d="M160 0C177.7 0 192 14.33 192 32V67.68C193.6 67.89 195.1 68.12 196.7 68.35C207.3 69.93 238.9 75.02 251.9 78.31C268.1 82.65 279.4 100.1 275 117.2C270.7 134.3 253.3 144.7 236.1 140.4C226.8 137.1 198.5 133.3 187.3 131.7C155.2 126.9 127.7 129.3 108.8 136.5C90.52 143.5 82.93 153.4 80.92 164.5C78.98 175.2 80.45 181.3 82.21 185.1C84.1 189.1 87.79 193.6 95.14 198.5C111.4 209.2 136.2 216.4 168.4 225.1L171.2 225.9C199.6 233.6 234.4 243.1 260.2 260.2C274.3 269.6 287.6 282.3 295.8 299.9C304.1 317.7 305.9 337.7 302.1 358.1C295.1 397 268.1 422.4 236.4 435.6C222.8 441.2 207.8 444.8 192 446.6V480C192 497.7 177.7 512 160 512C142.3 512 128 497.7 128 480V445.1C127.6 445.1 127.1 444.1 126.7 444.9L126.5 444.9C102.2 441.1 62.07 430.6 35 418.6C18.85 411.4 11.58 392.5 18.76 376.3C25.94 360.2 44.85 352.9 60.1 360.1C81.9 369.4 116.3 378.5 136.2 381.6C168.2 386.4 194.5 383.6 212.3 376.4C229.2 369.5 236.9 359.5 239.1 347.5C241 336.8 239.6 330.7 237.8 326.9C235.9 322.9 232.2 318.4 224.9 313.5C208.6 302.8 183.8 295.6 151.6 286.9L148.8 286.1C120.4 278.4 85.58 268.9 59.76 251.8C45.65 242.4 32.43 229.7 24.22 212.1C15.89 194.3 14.08 174.3 17.95 153C25.03 114.1 53.05 89.29 85.96 76.73C98.98 71.76 113.1 68.49 128 66.73V32C128 14.33 142.3 0 160 0V0z"></path></svg></button></div>
                                </div>
                                `
                                
                                
                            }
                          
                        })


                  
                        elementos+=`
                            <hr>
                            <div style="background: #00f56336;font-weight: bold;" class="row">
                                <div class="col">
                                 TOTAL:
                                </div>
                                <div class="col">
                                $${suma.toFixed(2)}
                                </div>
                                <div class="col">
                                <button onclick="pagarTodo(${data[index].idVenta})" class="no btn btn-blue btn-sm">Pagar todo</button>
                                </div>
                            </div>

                            </div>
                        </div>
                    </div>`
              }
                
 
                

            document.getElementById("clientes").innerHTML=elementos
              });
    
}
async function abrirModalProductos(cliente,e) {
    if (e.target.classList[0]=="no") {
            console.log(e.target.classList[0])
        }else{
            localStorage.setItem("idCliente",cliente)
    $("#mostarProductElegir").modal("show")
    setTimeout(() => {
        document.getElementById('codigoDeBarra').focus()
    }, 800 );
        }
    
    
}
async function pagar(idDetalleVenta,idCli,idArti) { 
    await fetch('php/venderProducto.php?idDetalle='+idDetalleVenta+'&idCliente='+idCli+'&idArticulo='+idArti)
  .then(response => response.json())
  .then(async (data) => {
      console.log(data)
      await cargarClientes()
      toastr.success('Articulo pagado!', 'Exito.')
    });
}
async function pagarTodo(idCli) { 
    await fetch('php/vederTodo.php?idCliente='+idCli)
  .then(response => response.json())
  .then(async (data) => {
      console.log(data)
      await cargarClientes()
      toastr.success('Articulos pagados!', 'Exito.')
    });
}



