<template>
    <section class="container">
      <div class="flex">
        <div class="carta">
          <h2>Este es listado de todos los blogs</h2>
          <table>
            <thead>
              <tr>
                <td>Titulo</td>
                <td>Etiqueta</td>
                <td>Fecha de Publicacion</td>
              </tr>
            </thead>
            <tbody>
              <tr v-for="i in blogs" :key="i">
                <td>{{ i.titulo }}</td>
                <td>{{ i.etiqueta }}</td>
                <td>{{ i.fecha_de_publicacion }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="carta">
        <h2>
          Los siguientes blogs estan filtrados por etiqueta y una fecha determinada:
        </h2>
        <ul v-for="i in fechaFiltrada" :key="i">
          <li>
            Titulo : {{ i.titulo }} - Etiqueta : {{ i.etiqueta }} - Fecha {{ i.fecha_de_publicacion }}
          </li>
        </ul>
        <p>
          {{ mensaje }}
        </p>
      </div>
    </section>
  </template>

<script setup>
let blogs = [
    {
        "titulo": "Cómo aprender Python en 30 días",
        "etiqueta": "Programacion",
        "fecha_de_publicacion": "2024-07-01"
    },
    {
        "titulo": "Las mejores estrategias de marketing digital",
        "etiqueta": "Marketing",
        "fecha_de_publicacion": "2024-07-15"
    },
    {
        "titulo": "10 técnicas de diseño gráfico imprescindibles",
        "etiqueta": "Diseño",
        "fecha_de_publicacion": "2023-05-20"
    },
    {
        "titulo": "Gestión financiera para pequeñas empresas",
        "etiqueta": "Finanzas",
        "fecha_de_publicacion": "2023-08-30"
    },
    {
        "titulo": "Cómo optimizar tu sitio web para SEO",
        "etiqueta": "SEO",
        "fecha_de_publicacion": "2023-11-15"
    },
    {
        "titulo": "Los lenguajes de programación más populares en 2022",
        "etiqueta": "Programacion",
        "fecha_de_publicacion": "2022-06-25"
    },
    {
        "titulo": "Cómo liderar equipos de manera efectiva",
        "etiqueta": "Liderazgo",
        "fecha_de_publicacion": "2022-09-10"
    },
    {
        "titulo": "Tendencias de tecnología para el próximo año",
        "etiqueta": "Tecnología",
        "fecha_de_publicacion": "2021-12-01"
    },
    {
        "titulo": "La importancia del contenido de calidad en blogs",
        "etiqueta": "Marketing de Contenidos",
        "fecha_de_publicacion": "2021-03-18"
    },
    {
        "titulo": "Consejos para la inversión en la bolsa",
        "etiqueta": "Finanzas",
        "fecha_de_publicacion": "2020-10-05"
    }
]

let etiqueta = "Programacion"
let FechaCorte = new Date("2022-07-29")
let mensajeFecha = new Date ("2023-07-31")
let mensaje = ""


let fechaFiltrada = blogs.filter((filtro) => {
    let fechasPublicacion = new Date(filtro.fecha_de_publicacion);
    return filtro.etiqueta === etiqueta && fechasPublicacion > FechaCorte 
})

for(let i of fechaFiltrada){
    if(new Date(i.fecha_de_publicacion) > mensajeFecha){
        mensaje = "Todos los blogs son recientes"
        continue
    }else{
        mensaje = "No todos los blogs son recientes"
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
  height: 520px;
  padding: 50px;
  margin: 40px;
  opacity: 0.8;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
}

p{
  margin-top: 25px;
}
</style>