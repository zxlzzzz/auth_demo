import axios from 'axios'
import {getCookie} from './index';
import route from '../router/index'

const instance = axios.create({
  baseURL: 'http://localhost:3000',
  timeout: 0,
})

const whiteList = ['/login','/user']

instance.interceptors.request.use(config=>{
  if (!whiteList.includes(config.url)){
    const token = getCookie('token');
      if (token){
          config.headers.Authorization = "Bearer" + " " + token
      }else{
        route.push('/login')
      }
  }
    return config
},error=>{
  return Promise.reject(error)
})

instance.interceptors.response.use(response=>{
    return response.data
},error=>{
  return Promise.reject(error)
})


export default instance
