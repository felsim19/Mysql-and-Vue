<template>
  <section class="container">
    <div class="flex">
      <div class="carta">
        <h2>Este es listado de todos los usuarios</h2>
        <table>
          <thead>
            <tr>
              <td>Nombre</td>
              <td>Edad</td>
            </tr>
          </thead>
          <tbody>
            <tr v-for="usuario in usuarios" :key="usuario.nombre">
              <td>{{ usuario.nombre }}</td>
              <td>{{ usuario.edad }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div class="carta">
      <h2>
        Los estudiantes filtrados por edad de 20 años a 30 años son los
        siguientes:
      </h2>
      <ul v-for="i in usuarios"
      :key="i">
        <li
          v-if="i.edad >= 20 && i.edad <= 30"
        >
          Nombre: {{ i.nombre }} - Edad: {{ i.edad }}
        </li>
      </ul>
      <p v-if="contador <=2">
        El tamaño del grupo es pequeño y contiene:
        {{ contador }} personas
      </p>
      <p v-if=" contador <=4">
        El tamaño del grupo es mediano y contiene:
        {{ contador }} personas
      </p>
      <p v-if="contador >= 5">El tamaño del grupo es grande y contiene: {{ contador }} personas</p>
    </div>
  </section>
</template>

<script setup>
let contador = 0;
let usuarios = [
  { nombre: "Laura Martínez", edad: 38 },
  { nombre: "Carlos Gómez", edad: 35 },
  { nombre: "Ana Rodríguez", edad: 24 },
  { nombre: "Juan Pérez", edad: 40 },
  { nombre: "Sofía Hernández", edad: 31 },
  { nombre: "Luis Fernández", edad: 27 },
  { nombre: "Marta García", edad: 22 },
  { nombre: "Jorge López", edad: 33 },
  { nombre: "Elena Morales", edad: 29 },
  { nombre: "Ricardo Sánchez", edad: 38 },
];

for (let index = 0; index < usuarios.length; index++) {
  if (usuarios[index].edad >= 20 && usuarios[index].edad <= 30) {
    contador += 1;
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
  height: 320px;
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
