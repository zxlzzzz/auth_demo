import cookie from 'js-cookie'

export function setCookie(name,data){
  cookie.set(name,data)
}

export function getCookie(name){
  return cookie.get(name)
}

export function removeCookie(name){
  cookie.remove(name)
}
