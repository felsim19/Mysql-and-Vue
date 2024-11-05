<template>
    <section class="container">
      <div class="flex">
        <div class="carta">
          <h2>Este es listado de todos los Libros :</h2>
          <table>
            <thead>
              <tr>
                <td>Titulo</td>
                <td>Genero</td>
                <td>Año Publicacion</td>
              </tr>
            </thead>
            <tbody>
              <tr v-for="i in Libros" :key="i">
                <td>{{ i.titulo }}</td>
                <td>{{ i.genero }}</td>
                <td>{{ i.ano_publicacion }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="carta">
        <h2>Las siguientes Libros estan filtrados por Genero y un Año de Publicaion:</h2>
        <ul v-for="i in filtroLibros" :key="i">
          <li>
            Titulo : {{ i.titulo }} - Genero : {{ i.genero }} - Año Publicacion
            {{ i.ano_publicacion }}
          </li>
        </ul>
        <p>
          {{ mensaje }}
        </p>
      </div>
    </section>
  </template>
  
  <script setup>
  let Libros = [
  {
        "titulo": "Cien años de soledad",
        "genero": "Novela",
        "ano_publicacion": 1967
    },
    {
        "titulo": "1984",
        "genero": "Distopia",
        "ano_publicacion": 1949
    },
    {
        "titulo": "Don Quijote de la Mancha",
        "genero": "Novela",
        "ano_publicacion": 1605
    },
    {
        "titulo": "El señor de los anillos",
        "genero": "Fantasia",
        "ano_publicacion": 1954
    },
    {
        "titulo": "Matar a un ruiseñor",
        "genero": "Drama",
        "ano_publicacion": 1960
    },
    {
        "titulo": "Orgullo y prejuicio",
        "genero": "Romance",
        "ano_publicacion": 1813
    },
    {
        "titulo": "Fahrenheit 451",
        "genero": "Distopia",
        "ano_publicacion": 1953
    },
    {
        "titulo": "Harry Potter y la piedra filosofal",
        "genero": "Fantasia",
        "ano_publicacion": 1997
    },
    {
        "titulo": "El gran Gatsby",
        "genero": "Drama",
        "ano_publicacion": 1925
    },
    {
        "titulo": "Crimen y castigo",
        "genero": "Novela",
        "ano_publicacion": 1866
    }
  ];
  let mensaje = "Todos Los libros son del mismo genero"
  let Genero = "Novela"
  let AñoPublicacion = 1604 
  
  let filtroLibros  = Libros.filter((product) => {
    return product.genero == Genero && AñoPublicacion <= product.ano_publicacion
  });
  
  for (let i of filtroLibros) {
    if (i.genero != Genero) {
      mensaje = "No Todos Los libros son del mismo genero";
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
  