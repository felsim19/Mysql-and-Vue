<template>
  <div class="card">
    <h1>Contenido Inicial</h1>
    <img src="https://madridchino.com/wp-content/uploads/2024/01/Exposicion-dragones-digitales.jpg" alt="">
    <p>
      Lorem ipsum, dolor sit amet consectetur adipisicing elit. Fugit in, eius
      vitae quis maxime doloribus natus voluptas iste asperiores, labore quae
      laboriosam corporis reprehenderit debitis. Reprehenderit delectus
      blanditiis expedita ut.
    </p>
    <ComponenteUno/>
  </div>
</template>

<script setup>
import ComponenteUno from './ComponenteUno.vue';
</script>

<style>
.card {
  margin: 10px;
  padding: 20px;
  background-color: rgb(231, 151, 151);
  font-size: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

</style>
