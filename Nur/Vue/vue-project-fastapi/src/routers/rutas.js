import { createRouter, createWebHistory } from "vue-router";
import ConsultaG from "@/components/ConsultaG.vue";
import Registrarse from "@/components/Registrarse.vue";
import Empresa from "@/components/Empresa.vue";
import Loginregistro from "@/components/Loginregistro.vue";
import cliente from "@/components/cliente.vue";
import empleado from "@/components/empleado.vue";
const routes = [
  {
    path: "/",
    name: "Registrarse",
    component: Registrarse,
  },
  {
    path: "/Consultar",
    name: "Consultar",
    component: ConsultaG,
  },
  {
    path: "/Empresa",
    name: "Empresa",
    component: Empresa,
  },
  {
    path: "/Login",
    name: "Loginregistro",
    component: Loginregistro,
  },
  {
    path: "/cliente",
    name: "cliente",
    component: cliente,
  },
  {
    path: "/empleado",
    name: "empleado",
    component: empleado,
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
