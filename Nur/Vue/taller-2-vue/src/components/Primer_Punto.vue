<template>
    <div class="mensaje">
      <p>{{ mensaje }}</p>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue';
  const mensaje = ref('mensaje con ref')
  </script>                                                                                                                                 
  
  <style scoped>
  .mensaje{
    color: rgb(251, 251, 251);
    font-size: 20px;
    background-color: rgb(190, 0, 0);
    padding: 20px;
  }
  </style>
  

  <!----
  scrpits
   import ref 
   variable = ref(mensaje)

   
    export default {
    data() {
      return {
        message: 'Hola, este es un mensaje simple en Vue!'
      };
    }
  };-->