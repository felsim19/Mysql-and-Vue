<template>
  <section class="container">
    <div class="flex">
      <div class="carta">
        <h2>Este es listado de todos los Cursos :</h2>
        <table>
          <thead>
            <tr>
              <td>Titulo</td>
              <td>Nivel</td>
              <td>Duracion Horas</td>
            </tr>
          </thead>
          <tbody>
            <tr v-for="i in Cursos" :key="i">
              <td>{{ i.titulo }}</td>
              <td>{{ i.nivel }}</td>
              <td>{{ i.duracion }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div class="carta">
      <h2>
        Las siguientes Libros estan filtrados por Genero y un Año de Publicaion:
      </h2>
      <ul v-for="i in filtroLibros" :key="i">
        <li>
          Titulo : {{ i.titulo }} - Nivel : {{ i.nivel }} - Duracion Horas
          {{ i.duracion }}
        </li>
      </ul>
      <p>
        {{ mensaje }}
      </p>
    </div>
  </section>
</template>

<script setup>
let Cursos = [
  {
    titulo: "Introduccion a la Programacion",
    nivel: "Principiante",
    duracion: 60,
  },
  {
    titulo: "Data Science con Python",
    nivel: "Intermedio",
    duracion: 80,
  },
  {
    titulo: "Machine Learning Avanzado",
    nivel: "Avanzado",
    duracion: 120,
  },
  {
    titulo: "Desarrollo Web con JavaScript",
    nivel: "Principiante",
    duracion: 20,
  },
  {
    titulo: "Analisis de Datos con R",
    nivel: "Intermedio",
    duracion: 70,
  },
  {
    titulo: "Deep Learning",
    nivel: "Avanzado",
    duracion: 100,
  },
  {
    titulo: "Introduccion a la Ciberseguridad",
    nivel: "Principiante",
    duracion: 30,
  },
  {
    titulo: "Desarrollo de Aplicaciones Moviles",
    nivel: "Intermedio",
    duracion: 90,
  },
  {
    titulo: "Big Data y Hadoop",
    nivel: "Avanzado",
    duracion: 110,
  },
  {
    titulo: "UX/UI Design",
    nivel: "Principiante",
    duracion: 30,
  },
];
let mensaje = "Todos Los Cursos Estan Al Nivel Especifico";
let Nivel = "Avanzado";
let RangoInicio = 30;
let RangoFinal = 100;

let filtroLibros = Cursos.filter((product) => {
  return product.nivel == Nivel && RangoInicio <= product.duracion && RangoFinal >= product.duracion
});

for (let i of Cursos) {
  if (i.nivel != Nivel) {
    mensaje = "Hay cursos De Diferentes Niveles";
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
