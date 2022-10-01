<template>
  <div>
    <router-link to="/user">user</router-link>
  </div>
  <div>
    <router-link to="/login">login</router-link>
  </div>
  <div>
    <button @click="getHome">get Home</button>
    <button @click="logout">登出</button>
  </div>
  <hr>
  <ul class="list">
    <template v-for="(item,index) of list">
      <li :style="randomColor()"> {{item}} </li>
    </template>
  </ul>

</template>

<script setup>
import { homeMethod } from '../api/index'
import _ from 'lodash'
import {onMounted, onUnmounted, ref} from 'vue'
import { removeCookie } from '../utils'
import router from '../router/index'


  let list = ref([])
  let timer = ref(null)

  onMounted(()=>{
    timer.value = setInterval(()=>{
      getHome()
    },2000) 
  })
  onUnmounted(()=>{
    clearInterval(timer.value)
  })

  const logout = () =>{
    removeCookie('token')
    router.push('/')
  }

  const randomColor = () =>{
    return {
      color:`rgb(${_.random(255)},${_.random(255)},${_.random(255)})`,
      width:`${_.random(100,200)}px`,
      borderColor:`rgb(${_.random(255)},${_.random(255)},${_.random(255)})`
    }
  }


  const getHome = () =>{
    homeMethod(_.random(10,100)).then((result)=>{
      if (result.code === 200){
        list.value = result.data
      }
    })
  }
</script>

<style>
  .list{
    height: 500px;
    overflow: auto;
  }

  li{
    list-style: none;
    border-width: 1px;
    border-style: solid;
    transition: all .5s ease-out;
    margin:5px 0;
  }
</style>
