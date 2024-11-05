<template>
  <div>
    <h1>Consulta datos de Fast API</h1>
    <div v-if="loading">>Cargando...</div>
    <div v-if="error">>{{ error }}</div>
    <ul>
      <li v-for="i in items" :key="i.id">{{ i.name }}</li>
    </ul>
  </div>
</template>

<script setup>
import {ref, onMounted} from 'vue';
import axios from 'axios';



const items=ref([]);
const loading=ref(false);
const error=ref('');



const fechData=async() =>{
  loading.value=true
  try{
      const response = await axios.get('https://api.thecatapi.com/v1/breeds')
      items.value = response.data
  }catch(err){
      error.value= 'Error al obtener los datos'
  }finally{
      loading.value=false;
  }
}



onMounted(()=>{
  fechData()
})
</script>
