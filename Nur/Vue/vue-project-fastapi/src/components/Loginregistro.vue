<script setup>
import Swal from "sweetalert2";
import { useRouter } from "vue-router";
import { ref, onMounted } from "vue";
import Axios from "axios";
import { errorMessages } from "vue/compiler-sfc";
const router = useRouter();
const nombreUsuario = ref("");
const password = ref("");
const rol = ref("");
const documento = ref("");
const documentos = ref([]);
const frmlogin = ref(true);
const menError = ref("");

const CambioForm = async () => {
  frmlogin.value = !frmlogin.value;

  if (!frmlogin.value) {
    try {
      const response = await Axios.get(
        "http://127.0.0.1:8000/clientes/documento/"
      );
      console.log("Documentos de los clientes", response.data);
      documentos.value = response.data;
    } catch (error) {
      console.error("Error en la consulta de documentos", error);
      menError.value = "Error al consultar documentos";
    }
  }
};

const LoginUsuario = async () => {
  try {
    if (frmlogin.value) {
      const response = await Axios.post("http://127.0.0.1:8000/login", {
        nombreUsuario: nombreUsuario.value,
        password: password.value,
      });
      const { rol: userRol } = response.data;
      console.log("Login response:", response.data);
      if (userRol === "cliente") {
        console.log("Redirecting to /cliente");
        router.push("/cliente");
      } else if (userRol === "empleado") {
        console.log("Redirecting to /empleado");
        router.push("/empleado");
      } else {
        errorMessages.value = "Rol no se encontro";
        Swal.fire({
          icon: "error",
          title: "Error en el login",
          text: "Rol no se encontro",
        });
      }
      Swal.fire({
        icon: "success",
        title: "Login Exitoso",
        text: "Bienvenido a tu cuenta",
      });
    } else {
      const response = await Axios.post(
        "http://127.0.0.1:8000/registrousuario/",
        {
          nombreUsuario: nombreUsuario.value,
          password: password.value,
          rol: rol.value,
          documento: documento.value,
        }
      );
      console.log("Registro Exitoso", response.data);
      Swal.fire({
        icon: "success",
        title: "Registro Exitoso",
        text: "inicio de Sesion Satisfactoriamente",
      });
    }
  } catch (error) {
    console.error("Error al registar usuario", error.response.data);
    Swal.fire({
      icon: "error",
      title: "Error en el registro",
      text: "No se pudo registrar el usuario por favor intentelo de nuevo",
    });
  }
};

onMounted(async () => {
  if (!frmlogin.value) {
    try {
      const response = await Axios.get(
        "http://127.0.0.1:8000//clientes/documento/"
      );
      console.log("Documentos de los clientes ", response.data);
      documentos.value = response.data;
    } catch (error) {
      console.error("Error en la consulta de documentos");
      menError.value = "Error al consultar documentos";
    }
  }
});
</script>

<template>
  <div class="aut_container">
    <h1>{{ frmlogin ? "Iniciar Sesion " : "Registrarse" }}</h1>
    <form @submit.prevent="LoginUsuario">
      <div class="inputs" v-if="!frmlogin">
        <label for=""></label>
        <select name="" id="documento" v-model="documento">
          <option value="">Seleccionar Documentos</option>
          <option v-for="doc in documentos" :key="doc" :value="doc">
            {{ doc }}
          </option>
        </select>
      </div>
      <div class="inputs">
        <label for="">Nombre Usuario</label>
        <input
          type="text"
          id="nombreUsuario"
          v-model="nombreUsuario"
          required
        />
      </div>
      <div class="inputs">
        <label for="">password</label>
        <input type="text" id="password" v-model="password" required />
      </div>
      <div class="inputs" v-if="!frmlogin">
        <label for="">Rol</label>
        <input type="text" id="rol" v-model="rol" required />
      </div>
      <button type="submit">
        {{ frmlogin ? "Iniciar Sesion" : "Registrarse" }}
      </button>
      <div v-if="menError">{{ menError }}</div>
      <button type="button" @click="CambioForm">
        {{ frmlogin ? "Registrarse" : "Iniciar Sesion" }}
      </button>
    </form>
  </div>
</template>
