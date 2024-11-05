<template>
    <div>
      <input v-model="userInput" placeholder="Escribe algo...">
      <p>{{ userInput }}</p>
    </div>
  </template>
  
  
  <style scoped>
  /* Puedes agregar tus estilos aquí */
  input {
    margin-top: 20px;
    margin-bottom: 10px;
    padding: 5px;
    font-size: 16px;
  }
  
  p {
    font-size: 16px;
    color: blue;
  }
  </style>
  


<script setup>
import { ref } from 'vue';
const userInput = ref('')
</script>