<template>
  <div>
    账号 <input type="text" v-model="username">  
  </div>
  <div>
    密码 <input type="text" v-model="password" >
  </div>
  <div>
    <button @click="callBack">返回</button>

    <button @click="createUser">创建</button>
  </div>
</template>

<script setup>
import {ref} from 'vue'
import {addUser} from '../api/index'
import _ from 'lodash'
import router from '../router/index'

const username = ref('')
const password = ref('');

const createUser = () =>{
  if (_.isEmpty(username.value)|| _.isEmpty(password.value)) return
  addUser({
    username:username.value,
    password:password.value
  }).then((result)=>{
    alert( result?.message)
    if (result.code === 200){
      router.push('/login')
    }
  })
  console.log(1)
}

const callBack = () =>{
    
  }


</script>
