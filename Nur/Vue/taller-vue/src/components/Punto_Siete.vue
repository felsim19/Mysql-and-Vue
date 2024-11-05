<template>
  <section class="container">
    <div class="flex">
      <div class="carta">
        <h2>Este es listado de todos los Blogs :</h2>
        <table>
          <thead>
            <tr>
              <td>Autor</td>
              <td>Fecha</td>
              <td>Contenido</td>
            </tr>
          </thead>
          <tbody>
            <tr v-for="i in blogs" :key="i">
              <td>{{ i.autor }}</td>
              <td>{{ i.fecha }}</td>
              <td>{{ i.contenido }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div class="carta">
      <h2>Las siguientes blogs estan filtrados por Autor y una fecha:</h2>
      <ul v-for="i in filtroBlogs" :key="i">
        <li>
          Autor : {{ i.autor }} - Fecha : {{ i.fecha }} - Contenido
          {{ i.contenido }}
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
    autor: "Juan Perez",
    fecha: "2024-01-15",
    contenido: "Hoy leí un libro muy interesante sobre historia.",
  },
  {
    autor: "Maria Gomez",
    fecha: "2024-02-20",
    contenido: "Disfruté mucho de mi viaje a las montañas este fin de semana.",
  },
  {
    autor: "Carlos Rodriguez",
    fecha: "2024-03-05",
    contenido: "He comenzado un nuevo proyecto en el trabajo.",
  },
  {
    autor: "Ana Lopez",
    fecha: "2024-04-12",
    contenido: "Hoy probé una nueva receta de pasta y quedó deliciosa.",
  },
  {
    autor: "Luis Fernandez",
    fecha: "2024-05-18",
    contenido: "Asistí a una conferencia sobre tecnología.",
  },
  {
    autor: "Laura Martinez",
    fecha: "2024-06-25",
    contenido: "Fui al cine y vi una película increíble.",
  },
  {
    autor: "Jorge Sanchez",
    fecha: "2024-07-30",
    contenido: "Pasé la tarde jugando al fútbol con mis amigos.",
  },
  {
    autor: "Sofia Torres",
    fecha: "2024-08-03",
    contenido: "Hoy empecé a aprender a tocar la guitarra.",
  },
  {
    autor: "David Ramirez",
    fecha: "2024-09-10",
    contenido: "He estado trabajando en mi jardín todo el día.",
  },
  {
    autor: "Juan Perez",
    fecha: "2024-10-15",
    contenido: "Visitamos un museo de arte moderno y fue fascinante.",
  },
];
let mensaje = "Todos Son del Mismo Autor"
let Autor = "Juan Perez"
let FechaCorte = new Date("2024-01-14");

let filtroBlogs = blogs.filter((product) => {
  let fechaPublic = new Date(product.fecha);
  return product.autor == Autor && FechaCorte < fechaPublic;
});

for (let i of filtroBlogs) {
  if (i.autor != Autor) {
    mensaje = "Hay diferentes Autores";
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
