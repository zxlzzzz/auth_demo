import { createApp } from 'vue'
import './style.css'
import routers from './router/index'
import App from './App.vue'
import './permission'


const app = createApp(App)
app.use(routers)
app.mount('#app')
