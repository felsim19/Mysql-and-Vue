<template>
    <section class="container">
      <div class="flex">
        <div class="carta">
          <h2>Este es listado de todos los Tareas :</h2>
          <table>
            <thead>
              <tr>
                <td>Nombre</td>
                <td>Precio</td>
                <td>Estado</td>
              </tr>
            </thead>
            <tbody>
              <tr v-for="i in productos" :key="i">
                <td>{{ i.nombre }}</td>
                <td>{{ i.precio }}</td>
                <td>{{ i.estado_oferta }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="carta">
        <h2>
          Las siguientes tareas estan filtrados por prioridad y una fecha de
          Vencimiento:
        </h2>
        <ul v-for="i in filtroPrecio" :key="i">
          <li>
            Nombre : {{ i.nombre }} - Precio : {{ i.precio }} - Estado
            {{ i.estado_oferta }}
          </li>
        </ul>
        <p>
          {{ mensaje }}
        </p>
      </div>
    </section>
  </template>
  
  <script setup>
  let productos = [
    {
      "nombre": "Laptop",
      "precio": 1200,
      "estado_oferta": "En oferta"
    },
    {
      "nombre": "Smartphone",
      "precio": 800,
      "estado_oferta": "No esta en oferta"
    },
    {
      "nombre": "Auriculares",
      "precio": 150,
      "estado_oferta": "En oferta"
    },
    {
      "nombre": "Monitor",
      "precio": 300,
      "estado_oferta": "No esta en oferta"
    },
    {
      "nombre": "Teclado mecanico",
      "precio": 100,
      "estado_oferta": "En oferta"
    },
    {
      "nombre": "Raton inalambrico",
      "precio": 50,
      "estado_oferta": "No esta en oferta"
    },
    {
      "nombre": "Impresora",
      "precio": 200,
      "estado_oferta": "En oferta"
    },
    {
      "nombre": "Tablet",
      "precio": 400,
      "estado_oferta": "No esta en oferta"
    },
    {
      "nombre": "Disco duro externo",
      "precio": 120,
      "estado_oferta": "En oferta"
    },
    {
      "nombre": "Camara web",
      "precio": 80,
      "estado_oferta": "No esta en oferta"
    }
  ]
  let mensaje = "No hay ninguna oferta fuera de este rango"
  let minimo = 120
  let maximo = 500

  let filtroPrecio = productos.filter((product) =>{
    return product.estado_oferta === 'En oferta' && product.precio >= minimo && product.precio <= maximo
  })

  for(let i of productos){
    if(i.estado_oferta == "En oferta" && (i.precio < minimo || i.precio > maximo)){
        mensaje = "Hay productos en oferta que estan fuera del rango"
        break
    }
  }
  
  </script>
  
  <style>
  html,
  body,
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  p,
  ol,
  ul,
  li,
  pre,
  code,
  address,
  form,
  fieldset,
  blockquote {
    padding: 0;
    margin: 0;
    font-size: 100%;
    font-weight: normal;
  }
  ul {
    padding-left: 1.4em;
    list-style: square;
  }
  q:before,
  q:after {
    content: "";
  }
  html {
    scroll-behavior: unset;
  }
  
  .container {
    background-image: url("https://cdn.dribbble.com/userupload/6781077/file/original-12d8abb63d4b1dcf6ed01801376d9c0e.jpg?resize=752x");
    background-size: cover;
    background-position: center;
    width: 100%;
    height: 700px;
    display: flex;
    justify-content: space-around;
  }
  
  td {
    border: 2px solid rgb(0, 0, 0);
  }
  .carta {
    background-color: aliceblue;
    width: 400px;
    height: 340px;
    padding: 50px;
    margin: 40px;
    opacity: 0.8;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
  }
  
  p {
    margin-top: 25px;
  }
  </style>
  