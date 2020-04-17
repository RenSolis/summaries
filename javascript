reemplazar solo una parte del texto 'string.replace(parte, reemplazo)'

'typeof object' nos retorna en un string el tipo de dato que es el objeto

obtener un dias anteriores o posteriores
    'var today = new Date()' una instancia de hoy dia
    'new Date(today.setDate(today.getDate() - cantidadDeDias))' con esto restamos el dia en que nos encontramos devolviendo un valor diferente para la fecha y teniendo que volver a instanciarla

clonar un objeto o array sin referencia: primero convertirlo en JSON.stringify(objeto) para después JSON.parse(objeto) y se considera una nueva instancia del objeto o array

event 'onmouseover' es la misma funcionalidad de hover

'objDate.setFullYear(year)' cambia el valor del año en una fecha

'new Image()' para crear una tag image
    '.src' para el valor de source (atributo)
    '.onload' es un evento que recibe una función que se ejecutará una vez que la imagen

bind: es una función que recibe como primer argumento el objeto 'this' que se hace referencia, y posteriormente los argumentos para la función que se está utilizando
    'function.bind(object_reference)'
    reduce la forma en como manejar eventos, dentro del evento: '("click", element.function.bind(object_reference))'
    funciona como aplicacion parcial: porque devuelve la función, simplemente añadimos como argumentos (undefined, ...valores) y luego llenar con los argumentos
    faltantes (funciona también con el rest parameters)
  su objetivo es que cuando se use el this dentro de una función de otra función entienda de que se refiere al this del objeto mismo por eso se usa en el constructor el bind

 maps de google
    todo el contenido es dentro de una función
    crear un nuevo mapa 'new google.maps.Map(parametros)'
        parametros: center: { lat: (latitud), lng: (longitud) }, zoom: int, styles: [ { elementType: (el elemento que se cambiara), stylers: [ { color: (color de fondo mapa) } ] } ]
    crear un marker 'new google.maps.Marker(parametros)'
        parametros: position: { lat: (latitud), lng: (longitude) }, map: (variable del mapa), title: (titulo del marker)

'document.querySelectorAll(selector)' nos devuelve un array con todos los elementos que poseen el selector

obtener la distancia del elemento con el top 'element.offsetTop'

service worker: es una secuencia de comandos que se realizan en segundo plano con el propósito de disponer de funcionalidades en estado de no conexión a internet
    funciona de manera asincrona
    listeners:
        install => cuando se instala por primera vez la service worker
            descarga los archivos iniciales y los guarda en el cliente
        activate => cuando la service worker se actualiza (cuando se instala o se modifica en una actualización)
            para actualizar la información del service worker
        fetch => se evalua cuando se hace una peticion al servidor remoto
            retornar del repositorio de archivos lo que el usuario necesita

desplazar con scroll: 'window.scrollTo({ 'behavior': comportamientoDelScroll, 'top': alturaDePagina })'

Promise.all(array de promesas) => devuelve una promesa una vez terminada todas las promesas dentro del arreglo

'event.waitUntil(promesa)' es usado por los service workers para realizar el evento de installation o activate una vez se termine las tareas

'event.respondWith(funciones)' es usado por el service worker event fetch para proporcionar una promesa de respuesta

comprobar si un objeto existe dentro de otro =>
  - en un string para substrings => string.includes(substring)
  - en un array => array.includes(valor)

cuando se realiza un 'export' lo devuelve dentro de un objeto necesitando usar el { } para destructurar
    usar el 'export default' hace que solamente se evite usar la destructuración

element_rect = element.getBoundingClientRect => devuelve el tamaño y su posición relativa respecto al viewport
  - obtener el ancho del objeto => element_rect.width
  - obtener el alto del objeto => element_rect.height
  - obtener el left del objeto por el viewport => element_rect.left
  - obtener el top del objeto por el viewport => element_rect.top

element.clientWidth => nos devuelve el ancho del elemento, contando el padding pero no los margin

obtener la altura del elemento => element.clientHeight

document.documentElement => nos devuelve la raíz del documento, osea html

obtener las coordenadas del mouse dentro de un evento mouse:
  - para el horizontal => event.clientX
  - para el vertical => event.clientY

devolver el número máximo de entre valores => Math.max(valor1, valor2)

devolver el menor número redondeado => Math.floor(numero)

devolver el mayor número redondeado => Math.ceil(numero)

validation API:
  - verificar si la validación se está cumpliendo => input.checkValidity()
  - obtener objeto que ve propiedades relacionadas a la validación del input => input.validity
    - obtener si el elemento es valido => input.validity.valid

crear a un documento DOM a partir de textos =>
  - instanciar el parser => parser = new DOMParser()
  - convertir a un DOM el texto => parser.parseFromString(texto)

obtener todas las keys de un objeto => Object.keys(objeto) // devolverá un array de las keys

obtener todo lo almacenado dentro del localStorage => Object.keys(localStorage).map(key => JSON.parse(localStorage.getItem(key)))

limpiar el localStorage => localStorage.clean()

insertar html en cierta parte de un elemento => elemento.insertAdjacentElement(position, parte)

crear un array con una cantidad de elementos y llenarlos con objetos => Array(cantidad_elementos).fill(objeto)

crear un object con elementos no repetidos de un array => new Set(array)

crear un array con elementos únicos => Array.from(new Set(array))

limitar la cantidad de elementos de un array => array.length = cantidad

obtener los últimos elementos de un array => array.slice(-cantidad)

saber la cantidad de tiempo que toma => performance.now(), se deberia restar con otro variable con performance.now() para obtener el tiempo

Notifications API =>
  - comprobar el tipo de permission => Notification.permission
  - consultar si permitir las notificaciones => Notification.requestPermission().then(permission => { funcionalidad })
  - crear una notification => const notification = new Notification("texto titulo", { body: 'cuerpo mensaje', icon: 'imagen' })
  - manejar evento click de la notification => notification.onclick = function

redireccionar página => window.location.href = "/path"

limpiar el interval => window.clearInterval(intervalo_creado)

closure => (function() { funcionalidad })(), nos permite no tener que preocuparnos por el alcance de las variables

obtener la altura de todo el documento => document.documentElement.clientHeight

métodos para video =>
  - poner en play el video => selector.play()
  - poner en pausa el video => selector.pause()
  para las versionas de Firefox 70 para adelante no se puede usar estos métodos porque bloquea los permisos

acceder al nodo padre del elemento => element.parentNode

obtener todos los hijos del elemento => element.children

obtener el fragment del link => element_link.hash

crear un request con ajax => xhr = new XMLHttpRequest()
  - mandar una solicitud => xhr.open(metodo_http, url)
  - mandar request => xhr.send()
  - evento para cuando se mande =>
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          // bueno
        } else {
          // malo
        }
      }
    }

eventos Bootstrap para modales =>
  - show.bs.modal => ocurre cuando el modal empieza a mostrarse
  - shown.bs.modal => ocurren cuando el modal se mostro completamente (CSS transition fue completada)
  - hide.bs.modal => ocurre cuando el modal empieza a ocultarse
  - hidden.bs.modal => ocurre cuando el modal se oculto completamente (CSS transition fue completada)

eventos de drag =>
  - evento cuando empieza el drag => dragstart
  - evento cuando se está arrastrando => drag
  - evento cuando se termina el drag => dragend

eliminar la imagen que se genera al hacer un drag =>
  - crear un canvas vacio => canvas_empty = document.createElement('canvas')
  - en el evento dragstart => event.dataTransfer.setDragImage(canvas_empty, 0, 0)

librería mixitup => para animaciones con filtros, ordenamientos
  - requerir la librería al descargarla y obtener el archivo => dist/mixitup.min.js
  - para empezar a usarlo, se debe colocar la sección donde se aplicará dentro de un contenedor => mixitup('.clase_contenedor')
  - para indicar que elementos se filtraran con tal botón => data-filter=".clase_elementos"
  - para indicar que se puede hacer filtrado múltiple => data-toggle=".clase_elementos"
  - las clases deben tenerlo los elementos que se filtrarán

obtener todos los atributos del elemento => window.getComputedStyle(elemento)

obtener el ancho del elemento como un entero, toma en cuenta el width, padding y border (no margin) => elemento.offsetWidth

obtener o configurar los estilos en el elemento => elemento.style.cssText, para obtener o elemento.style.cssText = "atributo: valor; ..."

evento de doble click => elemento.addEventListener('dblclick', event => { funcionalidad })

get/setter del texto del elemento => elemento.innerText

convertir un número a un string => numero.toString(numero), el número puede ser entre 2 y 36 dando un valor binario, octal, hex, ...

scroll event =>
  - obtener el valor del scroll con respecto al alto => window.scrollY

Blob => es una clase para crear objetos de ficheros de datos planos inmutables, representan datos que no necesariamente se encuentran en un formato nativo de JavaScript

FileReader => es una clase que permite que las aplicaciones web lean ficheros almacenados en el cliente de forma asíncrona usando los objetos File o Blob dependiendo de los datos que se pretende leer
  manejadores de eventos =>
    - onload => es un controlador para el evento load, es decir cuando el contenido es leído con readAsArrayBuffer, readAsBinaryString, readAsDataURL o readAsText
      objetoFileReader.onload = function(event) { /* funcionalidad */ }

convertir string en formato path => escape(string)

mergear objetos y asignarlos todos dentro del primer objeto => Object.assign(objeto, objeto, ...) o también se puede usar el spread operator { ...objeto }

indicar que se ejecute una función en un determinado intervalo de tiempo => setInterval(funcion, tiempo_en_milisegundos)
  - a partir del segundo argumento todas las que siguen se tomarán como argumentos para la primera función

temporizador de una función, indicar en cuanto tiempo se ejecutará la función que se está pasando => setTimeout(funcion, tiempo_en_milisegundos, argumento_funcion, ...)
  - a partir del segundo argumento todas las que siguen se tomarán como argumentos para la primera función

convertir un string a un número => +string

comprobar si el valor es un integer => Number.isInteger(valor)

destructuring array => [variable, ...] = array

==================================================================
NODE MODULES

manejar los formatos de fechas => date-fns
  - instalar librería => npm install date-fns
  - importar librería => import { format } from 'date-fns'
  - cambiar el formato de la fecha => format(date, 'format')
