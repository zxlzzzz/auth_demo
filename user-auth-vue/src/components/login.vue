<template>
  <div>
    账号 <input type="text" v-model="username">  
  </div>
  <div>
    密码 <input type="text" v-model="password" >
  </div>
  <div>
    <button @click="login">登录</button>
    <button @click="callBack">返回</button>
  </div>

</template>

<script setup>
  import {loginMethod} from '../api/index'
  import {ref} from 'vue'
  import _ from 'lodash'
  import {setCookie} from '../utils/index'
  import router from '../router/index'


  const username = ref('')
  const password = ref('');
  
  const login = () =>{
    if (_.isEmpty(username.value) || _.isEmpty(password.value)) return 
    loginMethod({
      username:username.value,
      password:password.value
    }).then((result)=>{
      if (result.code === 200){
        setCookie('token',result.token)
        router.push("/")
      }
    })
  }

  const callBack = () =>{
  }


</script>

