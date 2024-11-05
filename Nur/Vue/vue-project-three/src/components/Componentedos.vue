<template>
  <section class="container">
        <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th> Email</th>
                </tr>
        </thead>
        <tbody>
            <tr v-for="i in usuarios" :key="i" class="numeros" ">
                <td id="text">{{i.id}}</td>
                <td >{{ i.nombre }}</td>
                <td id="text">{{ i.edad }}</td> 
                <td>{{ i.email }}</td>
            </tr>
        </tbody>
    </table>
  </section>
</template>

<script setup>
let usuarios = [
  {
    id: 1,
    nombre: "Juan Pérez",
    edad: 28,
    email: "juan.perez@example.com",
  },
  {
    id: 2,
    nombre: "María López",
    edad: 34,
    email: "maria.lopez@example.com",
  },
  {
    id: 3,
    nombre: "Carlos Sánchez",
    edad: 45,
    email: "carlos.sanchez@example.com",
  },
  {
    id: 4,
    nombre: "Ana Martínez",
    edad: 22,
    email: "ana.martinez@example.com",
  },
  {
    id: 5,
    nombre: "Luis Fernández",
    edad: 30,
    email: "luis.fernandez@example.com",
  },
  {
    id: 6,
    nombre: "Laura Gómez",
    edad: 27,
    email: "laura.gomez@example.com",
  },
  {
    id: 7,
    nombre: "Pedro Ramírez",
    edad: 36,
    email: "pedro.ramirez@example.com",
  },
  {
    id: 8,
    nombre: "Elena Torres",
    edad: 31,
    email: "elena.torres@example.com",
  },
  {
    id: 9,
    nombre: "Miguel Díaz",
    edad: 29,
    email: "miguel.diaz@example.com",
  },
  {
    id: 10,
    nombre: "Sofía Morales",
    edad: 33,
    email: "sofia.morales@example.com",
  },
];
</script>

<style>

.container{
    background-color: black;
}


td{
    width: 270px;
    height: 60px;
    border: 2px solid rgb(255, 255, 255);
    color: aliceblue;
    transition: all .5s ease-in-out;
}

td:hover{
    background-color: aliceblue;
    color: black;
    transform: scale(1.05);
    border: 3px solid black;
    border-radius: 10px;
}
th{
    color: aliceblue;
}

#text{
    display: flex;
    justify-content: center;
    align-items: center;
}

</style>
