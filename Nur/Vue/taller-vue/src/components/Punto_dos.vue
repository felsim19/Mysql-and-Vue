<template>
  <section class="container">
    <div class="flex">
      <div class="carta">
        <h2>Este es listado de todos los usuarios</h2>
        <table>
          <thead>
            <tr>
              <td>Nombre</td>
              <td>categoría</td>
              <td>disponibilidad</td>
            </tr>
          </thead>
          <tbody>
            <tr v-for="i in productos" :key="i">
              <td>{{ i.nombre }}</td>
              <td>{{ i.categoría }}</td>
              <td>{{ i.disponibilidad }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <div class="carta">
      <h2>
        Los siguientes productos estan filtrados por categorias y estan disponibles:
      </h2>
      <ul v-for="i in productos" :key="i">
        <li v-if="i.categoría === 'Accesorios' && i.disponibilidad === 'Disponible'">
          Nombre: {{ i.nombre }} - Categoria: {{ i.categoría }} - disponibilidad: {{ i.disponibilidad }}
        </li>
      </ul>
      <p v-if="contador <= 2">
        El tamaño del grupo es pequeño y contiene:
        {{ contador }} personas
      </p>
      <p v-if="contador <= 4">
        El tamaño del grupo es mediano y contiene:
        {{ contador }} personas
      </p>
      <p v-if="contador >= 5">
        El tamaño del grupo es grande y contiene: {{ contador }} personas
      </p>
    </div>
  </section>
</template>

<script setup>
let productos = [
  {
    nombre: "Camiseta Deportiva",
    categoría: "Ropa",
    disponibilidad: "Disponible",
  },
  {
    nombre: "Zapatillas de Running",
    categoría: "Calzado",
    disponibilidad: "Disponible",
  },
  {
    nombre: "Auriculares Bluetooth",
    categoría: "Electrónica",
    disponibilidad: "Agotado",
  },
  {
    nombre: "Reloj Inteligente",
    categoría: "Electrónica",
    disponibilidad: "Disponible",
  },
  {
    nombre: "Botellas de Agua",
    categoría: "Accesorios",
    disponibilidad: "Disponible",
  },
  {
    nombre: "Gorra Deportiva",
    categoría: "Ropa",
    disponibilidad: "Disponible",
  },
  {
    nombre: "Pelota de Fútbol",
    categoría: "Deportes",
    disponibilidad: "Disponible",
  },
  {
    nombre: "Gafas de Sol",
    categoría: "Accesorios",
    disponibilidad: "Disponible",
  },
  {
    nombre: "Chaqueta Deportiva",
    categoría: "Ropa",
    disponibilidad: "Agotado",
  },
  {
    nombre: "Mochila Deportiva",
    categoría: "Accesorios",
    disponibilidad: "Disponible",
  },
];
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
