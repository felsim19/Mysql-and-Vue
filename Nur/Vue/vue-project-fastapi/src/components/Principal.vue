<template>
  <header>
    <h1>Principal</h1>
    <nav>
      <RouterLink class="ru" to="/">inicio</RouterLink>
      <RouterLink class="ru" to="/Consultar">Consultar</RouterLink>
      <router-link class="ru" to="/Empresa" >Empresa</router-link>
      <router-link class="ru" to="/Login" >Login</router-link>
    </nav>
  </header>
</template>

<style>
header {
  background-color: brown;
  color: aliceblue;
  height: 90px;
  display: flex;
  justify-content: space-between;
}
nav{
    margin: 30px;
    display: flex;
   justify-content: space-between;
   
}
h1{
    margin: 25px;
}
.ru{
    color: aliceblue;
    margin: 5px;
    text-decoration: none;
}
</style>
