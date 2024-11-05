<script setup>
import ConsultaFirebase from "./components/ConsultaFirebase.vue";
import ConsultaG from "./components/ConsultaG.vue";
import Registrarse from "./components/Registrarse.vue";
import Principal from "./components/Principal.vue";
import { ref,watch } from "vue";
import { useRouter } from "vue-router";

const RutasNoMostrar=['/cliente']
const ruta=useRouter()
const visible = ref(true)
watch(()=>ruta.path,
(nuevaruta)=>{
  visible.value=!RutasNoMostrar.includes(nuevaruta)
},
{inmediate:true}
)
</script>

<template>
  <div>
    <Principal v-if="visible"></Principal>
    <router-view></router-view>
  </div>
</template>

<style>
</style>
