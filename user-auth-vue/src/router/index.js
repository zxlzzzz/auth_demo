import { createRouter,createWebHashHistory } from 'vue-router'

import Home from '../components/home.vue'
import Login from '../components/login.vue'
import User from '../components/users.vue'
import NotFount from '../components/404.vue'
import {getCookie} from '../utils/index';


const routes = [
  {path:'/',component:Home},
  {path:'/login',component:Login},
  {path:'/user',component:User},
  {path:"/404",component:NotFount},
  { path: "/:catchAll(.*)", redirect: '/404'}
]


const history = createWebHashHistory()

const routers = createRouter({ history, routes })


export default routers
