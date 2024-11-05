<template>
  <section class="container">
    <div class="flex">
      <div class="carta">
        <h2>Este es listado de todos los Tareas :</h2>
        <table>
          <thead>
            <tr>
              <td>Titulo</td>
              <td>Prioridad</td>
              <td>Fecha de Vencimiento</td>
            </tr>
          </thead>
          <tbody>
            <tr v-for="i in Tareas" :key="i">
              <td>{{ i.titulo }}</td>
              <td>{{ i.prioridad }}</td>
              <td>{{ i.fecha_vencimiento }}</td>
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
      <ul v-for="i in FiltroFechas" :key="i">
        <li>
          Titulo : {{ i.titulo }} - Prioridad : {{ i.prioridad }} - Fecha
          {{ i.fecha_vencimiento }}
        </li>
      </ul>
      <p>
        {{ mensaje }}
      </p>
    </div>
  </section>
</template>

<script setup>
let Tareas = [
  {
    titulo: "Finalizar informe mensual",
    prioridad: "Alta",
    fecha_vencimiento: "2024-08-01",
  },
  {
    titulo: "Reunión con el equipo de marketing",
    prioridad: "Media",
    fecha_vencimiento: "2024-08-03",
  },
  {
    titulo: "Revisión de presupuestos",
    prioridad: "Alta",
    fecha_vencimiento: "2024-08-05",
  },
  {
    titulo: "Enviar propuesta al cliente",
    prioridad: "Alta",
    fecha_vencimiento: "2024-08-07",
  },
  {
    titulo: "Actualizar sitio web",
    prioridad: "Media",
    fecha_vencimiento: "2024-08-10",
  },
  {
    titulo: "Capacitación del personal",
    prioridad: "Baja",
    fecha_vencimiento: "2024-08-12",
  },
  {
    titulo: "Auditoría interna",
    prioridad: "Alta",
    fecha_vencimiento: "2024-08-15",
  },
  {
    titulo: "Planificación del evento anual",
    prioridad: "Media",
    fecha_vencimiento: "2024-08-20",
  },
  {
    titulo: "Mantenimiento de equipos",
    prioridad: "Baja",
    fecha_vencimiento: "2024-08-25",
  },
  {
    titulo: "Revisión de contratos",
    prioridad: "Alta",
    fecha_vencimiento: "2024-08-30",
  },
];

let prioridad = "Alta";
let fechaDeterminada = new Date("2024-08-14");
let fechaActual = new Date("2024-07-31");
let mensaje = "";

let FiltroFechas = Tareas.filter((filtro) => {
  let fechas = new Date(filtro.fecha_vencimiento);
  return filtro.prioridad === prioridad && fechaDeterminada > fechas;
});

for (let i of FiltroFechas) {
  if (new Date(i.fecha_vencimiento) > fechaActual) {
    mensaje = "Ninguna tarea esta vencida";
    continue
  } else {
    mensaje = "Ahi tareas vencidas";
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
