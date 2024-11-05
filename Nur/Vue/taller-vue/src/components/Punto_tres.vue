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
                <td>Ocupacion</td>
              </tr>
            </thead>
            <tbody>
              <tr v-for="i in listado" :key="i">
                <td>{{ i.nombre }}</td>
                <td>{{ i.edad }}</td>
                <td>{{ i.ocupación }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="carta">
        <h2>
          Los siguientes productos estan filtrados por ocupacion y rango de edad estan disponibles:
        </h2>
        <ul v-for="i in listado" :key="i">
          <li v-if="i.ocupación === 'Diseñador Grafico' && i.edad >=30 && i.edad <=40">
            Nombre: {{ i.nombre }} - edad: {{ i.edad }} - categorias: {{ i.ocupación }}
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
let listado = [
    {
        "nombre": "Ana Pérez",
        "edad": 34,
        "ocupación": "Gerente de Ventas"
    },
    {
        "nombre": "Luis Gómez",
        "edad": 29,
        "ocupación": "Desarrollador de Software"
    },
    {
        "nombre": "María Rodríguez",
        "edad": 42,
        "ocupación": "Contadora"
    },
    {
        "nombre": "Javier Martínez",
        "edad": 37,
        "ocupación": "Diseñador Grafico"
    },
    {
        "nombre": "Sofía Fernández",
        "edad": 28,
        "ocupación": "Especialista en Marketing"
    },
    {
        "nombre": "Carlos Hernández",
        "edad": 31,
        "ocupación": "Desarrollador de Software"
    },
    {
        "nombre": "Laura Gómez",
        "edad": 38,
        "ocupación": "Contadora"
    },
    {
        "nombre": "Roberto Torres",
        "edad": 33,
        "ocupación": "Gerente de Ventas"
    },
    {
        "nombre": "Paula Martínez",
        "edad": 26,
        "ocupación": "Diseñador Grafico"
    },
    {
        "nombre": "Diego Fernández",
        "edad": 30,
        "ocupación": "Especialista en Marketing"
    }
]
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