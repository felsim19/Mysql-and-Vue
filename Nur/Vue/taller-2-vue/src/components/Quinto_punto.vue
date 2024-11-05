<template>
    <div>
        <input v-model="nuevoElemento" placeholder="Agrega un nuevo elemnto">
        <button @click="AddItem">Agregar</button>
        <ol>
            <li v-for="i in items" :key="i">{{ i}}</li>
        </ol>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const items = ref([])

const nuevoElemento = ref('')

const AddItem = () => {
    if (nuevoElemento.value.trim()){
        items.value.push(nuevoElemento.value.trim())
        nuevoElemento.value = '';
    }
}
</script>