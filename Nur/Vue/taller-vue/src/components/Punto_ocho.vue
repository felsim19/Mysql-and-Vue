<template>
    <section class="container">
      <div class="flex">
        <div class="carta">
          <h2>Este es listado de todos los Blogs :</h2>
          <table>
            <thead>
              <tr>
                <td>Nombre</td>
                <td>Tipo</td>
                <td>Fecha</td>
              </tr>
            </thead>
            <tbody>
              <tr v-for="i in Reuniones" :key="i">
                <td>{{ i.nombre }}</td>
                <td>{{ i.tipo }}</td>
                <td>{{ i.fecha }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="carta">
        <h2>Las siguientes blogs estan filtrados por Tipo y un rango de fecha:</h2>
        <ul v-for="i in filtroRangos" :key="i">
          <li>
            Nombre : {{ i.nombre }} - Tipo : {{ i.tipo }} - Fecha
            {{ i.fecha }}
          </li>
        </ul>
        <p>
          {{ mensaje }}
        </p>
      </div>
    </section>
  </template>
  
  <script setup>
  let Reuniones = [
  {
        "nombre": "Evento de Tecnologia",
        "tipo": "Conferencia",
        "fecha": "2024-01-10"
    },
    {
        "nombre": "Reunion de Proyecto",
        "tipo": "Reunion",
        "fecha": "2024-02-15"
    },
    {
        "nombre": "Taller de Cocina",
        "tipo": "Taller",
        "fecha": "2024-03-22"
    },
    {
        "nombre": "Concierto de Rock",
        "tipo": "Concierto",
        "fecha": "2024-04-05"
    },
    {
        "nombre": "Fiesta de Cumpleanos",
        "tipo": "Celebracion",
        "fecha": "2024-05-18"
    },
    {
        "nombre": "Exposicion de Arte",
        "tipo": "Exposicion",
        "fecha": "2024-06-12"
    },
    {
        "nombre": "Partido de Futbol",
        "tipo": "Deporte",
        "fecha": "2024-07-23"
    },
    {
        "nombre": "Reunion Anual",
        "tipo": "Reunion",
        "fecha": "2024-08-30"
    },
    {
        "nombre": "Conferencia de Seguridad",
        "tipo": "Conferencia",
        "fecha": "2024-09-17"
    },
    {
        "nombre": "Festival de Cine",
        "tipo": "Festival",
        "fecha": "2024-10-21"
    }
  ];
  let mensaje = "Esta Dentro Del Rango Especifico"
  let Tipo = "Reunion"
  let FechaInicio = new Date("2024-01-10");
  let FechaFin = new Date("2024-09-18");
  
  let filtroRangos  = Reuniones.filter((product) => {
    let fechaPublic = new Date(product.fecha);
    return product.tipo == Tipo && FechaInicio <= fechaPublic && FechaFin >= fechaPublic;
  });
  
  for (let i of Reuniones) {
    let fechas = new Date(i.fecha)
    if (FechaInicio > fechas && FechaFin < fechas) {
      mensaje = "No Esta Bajo El Rango Especifico";
      break;
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
    height: 460px;
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
  