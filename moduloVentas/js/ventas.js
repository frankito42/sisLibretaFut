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
        fetch('php/cargarArticulo.php?codigo='+codigo+'&idPro='+idPro+'&cliente='+localStorage.getItem("idCliente"))
        .then(response => response.json())
        .then((data)=> {
            
            console.log(data)

        });
        /* escondo el modal al hacer click en un boton */
        $("#mostarProductElegir").modal("hide")
    }else{
        alert("Agregue codigo de barra.")
    }
}

async function deleteTdTable(e) {
    e.parentNode.parentNode.remove()
    await sumarTodo()
    
}

async function sumarTodo() {
    let acumulador=0
    let no=true
    document.getElementById("ProductosVender").children.forEach(element => {
        console.log(element.children[1].children[0].value)
        console.log(element.children[2].children[0].value)
        let suma=element.children[1].children[0].value*element.children[2].children[0].value
        acumulador=acumulador+parseFloat(suma.toFixed(2))
        console.log(acumulador)
        element.children[3].innerHTML=suma.toFixed(2)
        document.getElementById("total").innerHTML=acumulador.toFixed(2)
        no=false
    });

    if(no){
        document.getElementById("total").innerHTML=0
    }
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
               for  (let index = 0; index < data.length; index++) {
                elementos+=`
                <div onclick="abrirModalProductos(${data[index].idVenta})" class="col-md-4">
                    <div style="margin-bottom: 3%;" class="card">
                        <div class="card-body">
                        <h5 class="card-title">${data[index].cliente}</h5>
                        <hr>`
                
                        await fetch("php/articulosDeCliente.php?id="+data[index].idVenta)
                        .then(respuesta => respuesta.json())
                        .then(async(art) => {
                            console.log(art)
                            for  (let indexs = 0; indexs < art.length; indexs++) {
                                elementos+=`
                                <div style="padding:2%;" class="row hoverable">
                                    <div class="col-md-4">${art[indexs].nombreProducto} </div>
                                    <div class="col-md-6">$${art[indexs].precio}</div>
                                    <div class="col-md-2"><button class=" btn-sm btn btn-success"><i class="fa-solid fa-dollar-sign"></i></button></div>
                                </div>`
                                
                                
                            }
                          
                        })


                  
                        elementos+=`</div>
                        </div>
                    </div>`
              }
                

                

            document.getElementById("clientes").innerHTML=elementos
              });
    
}
async function abrirModalProductos(cliente) {
    localStorage.setItem("idCliente",cliente)
    $("#mostarProductElegir").modal("show")
    setTimeout(() => {
        document.getElementById('codigoDeBarra').focus()
    }, 800 );
}



