<template>
  <div class="Card">
    <h1>Dragones</h1>
    <img
      class="imagen"
      src="https://cdn.pixabay.com/photo/2023/06/13/10/34/ai-generated-8060643_1280.jpg"
      alt=""
    />
    <p>
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusantium in
      aspernatur expedita animi ipsa quos modi consequuntur eum quibusdam! Amet,
      cupiditate veritatis fugiat voluptate doloremque consectetur voluptatum
      laborum aut autem.
    </p>
    <ComponenteUno />
  </div>
</template>

<script setup>
import ComponenteUno from "./ComponenteUno.vue";
</script>

<style>
.imagen {
  width: 260px;
  height: 250px;
  margin: 10px;
  border-radius: 10px;
}

.Card {
  margin: 20px;
  padding: 20px;
  background-color: rgb(255, 81, 0);
  color: white;
  display: flex;
  flex-direction: column;
  align-items: center;
  opacity: 0.9;
  border: 0;
  border-radius: 10px;
}
p {
  margin: 18px;
}
</style>
