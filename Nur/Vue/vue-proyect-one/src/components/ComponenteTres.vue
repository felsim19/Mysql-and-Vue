<template>
<div class="Inicio">
    <ComponenteDos/>
    <ComponenteDos/>
</div>
</template>

<script setup>
import ComponenteDos from './ComponenteDos.vue';
</script>


<style>
.Inicio{
    display: flex;
    flex-wrap: wrap;
    padding: 20px;
    background-color: rgb(107, 248, 107);
}
</style>