import request from '../utils/request'

export function addUser(data){
  return request({
    url:'/users',
    method:'post',
    data
  })
}

export function loginMethod(data){
  return request({
    url:'/login',
    method:'post',
    data
  })
}

export function logoutMethod(data){
  return request({
    url:'/logout',
    method:'post',
    data
  })
}


export function homeMethod(data){
    return request({
      url:'/home',
      method:'post',
      data
    })
}
