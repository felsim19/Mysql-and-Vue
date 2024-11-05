<template>
    <div>
        <p>
            Hora Actual : {{ HoraActual }}
        </p>
    </div>
  </template>
  
  <script setup>
  import { ref,onMounted } from 'vue';
  const HoraActual = ref('')

  function ActualizarHora() {
    const hora = new Date();
    HoraActual.value = hora.toLocaleTimeString();
  }

  let intervalo = null;

  onMounted(() => {
    ActualizarHora();
    intervalo = setInterval(ActualizarHora,1000)
  });
  </script>
  
  <style>
  .clock {
    font-size: 2em;
    font-weight: bold;
  }
  </style>
  