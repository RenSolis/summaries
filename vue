elemento de instancia de Vue:
  - el: 'selector' => indicamos el elementos que utilizaremos como base para usar Vue
  - data: { values } => indicamos la información que se utilizará en la instancia
  - methods: { functions } => indicamos los métodos que se utilizarán
  - computed: {} => es donde se trata con propiedades dependientes, todos los atributos que esten dentro de computed serán tratados como atributos en data
    ejemplo => computed: { fullName() { return `${this.firstname} ${this.lastname}` } }
  - watched: {} => es donde se ejecutan código cuando la data cambia
  - filters: {} => utiles para aplicar formatos a textos
  - template: '' => crear un template
  - directives: {} => es para crear nuestros directives personalizados

para activar eventos => v-on:nombre_evento
  para indicar en que argumento se usara el event => v-on:nombre_evento(variable, $event)
  - keystroke event => <tag @input="metodo">, si se utiliza todo dentro del form tag entonces se aplicará para todos los elementos dentro del form
  - click event => <tag v-on:click="metodo">
  - opcionalmente se puede usar los paréntesis para el método

modificadores de eventos:
  - modificadores click =>
    - para hacer event.stopPropagation() => v-on:nombre_evento.stop=""
    - para hacer event.preventDefault() => v-on:nombre_evento.prevent=""
  - modificadores de keys =>
    - para enter => @evento_key.enter="funcion"
    - para space => @evento_key.space="funcion"
    - para escape => @evento_key.esc="funcion"

enlazar a un atributo HTML => v-bind:nombre_atributo="valor", los {{}} sirven únicamente cuando se intenta insertar texto pero no cuando se modifica los atributos

limitar la renderización de un elemento, ayudará a mejorar la performancia => <tag v-once>

insertar html raw => como atributo v-html="attribute"

indicar el atributo de data dentro de un input => v-model="atributo"

watch property:
  - solo funcionará si exist el atributo en data
  - las funciones de los atributos ya poseen un argumento que es value => propiedad(value) { code }
  - también pueden manejar el nuevo valor y el antiguo => propiedad(newValue, oldValue) { code }
  - ideal para operaciones asincronas
  - cuando se hace a una propiedad dentro de un objeto, se tiene que manejar con las opciones del watcher =>
    'objeto.propiedad': { immediate: true, handler(newValue, oldValue) { code } } // immediate indica que se ejecutará el código inmediatamente

los eventos también pueden ser usados de manera más rápida => @nombre_evento="funcion"

para los v-bind que se utilizan para atributos => :atributo="funcion"

binding class =>
  - usar clases directamente en el tag => :class="{ clase: true|false }"
  - usar clases en funciones => :class="[funcion, funcion, 'clase_normal']", también se puede indicar las clases normales (no relacionadas a Vue) para darle una sintáxis más limpia

binding style =>
  - agregando una funcion de computed => :style="funcion"
  - agregando multiples funciones de computed => :style="[funcion, funcion, ...]"
  - indicar un estilo directamente => :style="{ propiedad: valor }", se usa camelcase si la propiedad no es de una sola palabra

para usar múltiples elementos dentro de un v-bind => v-bind:atributo="[funcion, function, ...]"

v-if => quita o muestra el elemento dentro del DOM, usar cuando no se renderizan muchas cosas

para no eliminar el elemento del DOM cuando se quiere ocultar, usar cuando se renderizan bastantes cosas => v-show="funcion"

obtener los valores de un objeto => v-for="(value, key, index) in objeto", value será la representación de los valores dentro del objeto juntos
  - Vue indica que no se deben usar juntos v-for con v-if por performancia y nos lo indica con un warning

iterar una cantidad de veces => v-for="name in number", el número es la cantidad de veces que se hará el loop

para un renderizado más rápido en las iteraciones, añadir el bind key => <tag v-for="" :key="">, también es una forma de hacer el elemento iterado único por cada renderizado

se pueden utilizar múltiples instancias de vue pero y se pueden usar sus diferentes atributos, pero es mayormente recomendable manejar todo en una sola instancia porque es complicado manejar desde afuera las propiedades que se crean dentro de la instancia

para acceder al objeto data de la instancia de vue => variable.$data

para devolver el elemento del que se está partiendo la instancia de vue => variable.$el

para agregar una key única a un elemento en vue => <tag ref="nombre"/>

para poder acceder a los ref's => variable.$refs

montar un template => template.$mount(selector)

la instancia de Vue únicamente toma un elemento dentro del DOM, la forma de poder usarlo en múltiples instancias es creando un componente =>
	Vue.component(nombre_del_componente, objeto_igual_a_vue_instancia)

vue posee un virtual DOM que es un intermedio entre el código y el DOM real, al realizar cambios, primero se realizan dentro del virtual DOM, este ve los cambios que se realizaron y luego actualizar el DOM real únicamente en la parte que se actualizó

lifecycle hooks:
	- beforeCreate() => antes de que la instancia de vue fue creada, todavía no se inicializa el atributo data
	- created() => una vez ya se creo la instancia de vue
	- beforeMount() => cuando ya se compilo la instancia de vue, antes de que se compile el template en el real DOM
	- mounted() => una vez que se compilo la instancia en el real DOM
	- beforeUpdated() => cuando todavía no se realiza la actualizacion del DOM
	- updated() => cuando el DOM ha sido actualizado con los nuevos cambios, cualquier cambio en la data
	- beforeDestroy() => antes que la instancia sea destruida
	- destroyed() => cuando ya se elimino la instancia

para destruir una instancia => this.$destroy

cuando no se tiene ningun atributo para el componente entonces se puede borrar el script que contiene el export default

cuandos se utilizan componentes obligatoriamente al objeto data se le debe realizar una función y ésta debe retornar el objeto data porque es un valor que puede ser
  utilizado en diferentes lugares, en caso se tengan dos instancias de ese componente, en los dos componentes se cambiarian los datos por lo que la funcion se debe retornar un objeto

componentes globales y locales =>
	globales => Vue.component(nombres, objeto)
	local => components: { 'nombre': objeto }, es un atributo de la instancia de Vue, son los single-file components que tiene la extension .vue

cuando se colocan los componentes, Vue infiere lo mismo si es un camelcase o de otra forma con tal que tengan las mismas palabras => ej. app-header => appHeader pero la mejor manera es con -

poder mover en diferentes posiciones las listas => vuedraggable

pasar valores del componente padre al hijo => props
  - en el componente padre => <nombre-componente :nombre_prop="variable" />, no necesariamente tiene que tener el binding para pasarse como prop <Componente nombre_prop="valor" />
  - en el componente hijo => agregar un elemento al objeto de instancia de vue, props: [ 'nombre_prop' ]
  - agregar validacion al prop => props: { nombre_prop: tipoDato | { option: valor, ... } }
    - opciones para props =>
      - type => type: Tipo, el tipo del prop
      - required => required: true|false, si el prop es requerido
      - default => default: valor, que valor se le dará por defecto al prop
      - custom validator => validator(value) { return valor }

pasar valores del componente hijo al padre =>
  - dentro de la función del componente hijo que se cambiará el valor =>
    - en el componente padre, distintas formas =>
      <Componente :nombre_evento="metodo_componente_padre" />
      <Componente @nombre_evento="metodo_componente_padre" />
      asignar directamente el valor a un atributo de data => <Componente @nombre_evento="valor => atributo = valor" />, el valor es el que se pasa a través del $emit
    - en el componente hijo => metodo() { this.$emit('nombreEvento', valor) }, se coloca el valor únicamente si es necesario
  - pasar mediante callback functions =>
    - el padre crea el método que se utilizará y se coloca en el componente hijo => <nombre-componente :metodo_creado="nombre_metodo" />
    - en el componente hijo se agrega en el props => props { metodo_creado: Function }, y para usarlo es @evento="metodo_creado()"

pasar valores entre componentes hermanos =>
  - automaticamente al realizarse un evento emit al padre actualizará el valor dado a los otros componentes que usan el prop
  - al usar callbacks functions
  - event bus =>
    - en el main.js => export default const eventBus = new Vue({ methods: { funcion(valor) { this.$emit('nombre_evento', valor) } })
    - en los componentes que se utilizara =>
      import eventBus from 'path/main'
      - en el que realiza el cambio por el evento => eventBus.metodo(valor)
      - en el que recibe => created() { eventBus.$on('evento', (valor) => { this.valor = valor }) }

slots => es una forma de pasar contenido dentro de la etiqueta del componente <slot></slot>
  - el slot unicamente le afecta el style scope en el componente que utilizará dentro el <slot></slot>
  - se puede indicar un valor por defecto dentro del slot cuando no se le pasa contenido => <slot> contenido </slot>
  - named slot => agregarle el atributo name="nombre" dentro de la etiqueta slot para poder utilizarlo, y dentro para indicar los elementos que se utilizaran en el slot agregar slot="nombre"

cambiando entre componentes de manera dinamica =>
  <component :is="stringAtributo"></component>, el stringAtributo es el componente
  mantener vivo el componente => hacer un wrapper de <component> dentro de un <keep-alive></keep-alive>
    - podemos añadir dos ciclos más dentro de la instancia de vue del componente =>
      - activated => cuando se vuelve a cargar el componente
      - deactivated => cuando se carga otro componente después de este

enlazar un input con un atributo data => <input v-model="atributo" />

crear una nueva aplicación => vue create nombre_proyecto
  - indicar que se usaran las configuraciones predefinidas => vue create nombre_proyecto -d

cuando se necesite importar para acceder directamente a la carpeta src => '@/carpeta_dentro_src'

crear getter and setter para computed property =>
  computed: {
    funcion() {
      get() {}
      set() {}
    }
  }

utilizar filters =>
  - utilizarlo dentro del template => {{ texto | funcion_dentro_filter }}
  - puede hacerse en chain => {{ texto | funcion_dentro_filter | ... }}
  - puede también hacerse un filtro para fechas
  - se puede pasar parametros al filtro => {{ atributo | funcion_dentro_filter(parametro) }}
  - volver el filter global en el main.js =>
    - importar el archivo => import nombreFilter from 'archivo';
    - Vue.filter('nombreFilter', nombreFilter);

crear un filter global =>
  - se debe realizar antes que se cree la instancia de Vue => Vue.filter('nombre_funcion', function(value) { code })

agregar un nombre al componente (ayuda a reconocer el componente en vue dev tools) => export default { name: 'nombre-componente' }

un componente también puede tener diferentes atributos => <Componente v-if="condicion" />

mixin => es una forma flexible de poder compartir funcionalidades reutilizables para componentes (methods, computeds, lifecycle hooks, data, watches)
  - crear el mixin => export const mixin = { propiedad }, también se pueden separar por cada una de las propiedades y exportarlas
  - importar el mixin y usarlo =>
    import { mixin } from 'path/file'
    export default {  ..., mixins: [ mixin ], ... }
  - cuando existe el método dentro del componente en que se utiliza, se mergeará y le dará precedencia al método propio del componente (methods, components, computeds)
  - en el propiedad data también se le da precedencia al componente usando el merge
  - se ejecutan los métodos del mixin antes que los del componente, pero ambos se ejecutan (watch, lifecycle hooks)

recomendaciones para creación de componentes =>
  - crear pequeños componentes
  - comunicación de padre a hijo mediante props
  - comunicación de hijo a padre mediante eventos

librería HTTP client basado en promesas => npm install axios
  - importar librería => import * as axios from 'axios'
  - mandar petición GET => axios.get('url')
  - todas las peticiones son asíncronas
  - configuración de petición =>
    response = await axios({
      method: 'post|get|put|delete', // es el tipo de método HTTP
      url: 'url',
      headers: { 'key': valor }, // los headers que se utilizarán para la petición
      data: { key: valor } // la data que se mandará a la API
    })

acceder a las variables de entorno => process.env.VARIABLE
  - es mejor manejar variables por archivo => export const VARIABLE = process.env.VARIABLE

librería para poder cambiar de componentes por rutas => npm install vue-router | vue add router (con vue add router ya configura el proyecto con vue-router)
  - características => modular, configuración basada en componentes, navigation API, route parameters
  - HTML5 history mode => remover el fragment por default que hay en las URL's, para evitar los errores cuando se guardan los url como /#/path
  - en el main.js =>
    import router from './router.js'
    new Vue({ router, ... }) // agregar en la instancia de Vue
  - en el router.js =>
    import Vue from 'vue'
    import Router from 'vue-router'
    Vue.use(Router)
    export default new Router({
      mode: 'history',
      base: process.env.BASE_URL,
      routes: [
        {
          opciones
        }
      ]
    })
    - opciones =>
      - el path de la ruta => path: '/path' | '/path/:nombre_param'
      - agregar el nombre del componente => name: 'nombre-componente'
      - agregar el componente =>
        - eager loading => component: Componente
        - lazy loading => () => import(/* webpackChunkName: "nombre-bundle" */ 'path/componente'), opcionalmente se le agrega el comentario para que webpack ponga el bundle con el nombre dado, separa por bundles los archivos JS para mejorar la performancia y cuando sean llamados sea mas liviano el archivo (webpack code splitting), pero es recomendable agrupar en bundle componentes que esten sumamente relacionados
      - named routes => en lugar de utilizar component usar components
        components: {
          default: ComponentePorDefault,
          nombre_router_view: Componente,
          ...
        }
        - en el router-link tag  => <router-link name="nombre_ruta_view" />, si no se coloca significa que es por default
      - redireccionar a otra ruta => redirect: '/ruta'
      - pasar los parametros como props => props: true|false| r => ({ nombre_param: convertir_valor_param(r.params.nombre_param) }), r es el objeto router
      - pasar rutas nesteadas =>
        children: [
          { /* mismas opciones de las rutas, solo que el path no necesita slash al principio */ }
        ]
      - realizar validación antes de ir a la ruta cuando el parametro está mal =>
        beforeEnter(to, from, next) {
          /* validacion */
          next(valor) // el valor debe ser true o false
        }
  - colocar donde se verán los componentes del router en app.vue, también se deben colocar dentro del componente que tendrá rutas nesteadas => <router-view />
  - crear los links para otras rutas => <router-link to="/path"></router-link>
  - crear un link con params => <router-link :to="{ name: 'nombre-componente', params: { nombre_param: value } }"></router-link>
  - convertir en un diferente tag => <router-link tag="nombre_tag"></router-link>
  - se pueden añadir clases y tambien bind events
  - url no encontrada (404) => al último del router
    { path: '*',  componente: Componente }
  - redireccionar a otra ruta => this.$router.push({ name: 'nombre-componente' })
  - darle un color generalizado para cuando se encuentra en la ruta => .router-link-active { propiedades }, aunque también se le puede cambiar la clase que se utiliza para cuando <router-link active-class="clase"></router-link>
  - indicar en que path exacto estará activo el link => <router-link to="" exact></router-link>
  - obtener el valor del parametro que se usa => this.$route.params.nombre_parametro

librería para manejar estados => npm install vuex | vue add vuex
  - tipos de data compartida =>
    - entidad => como un modelo
    - session => user info, preferencias, app settings, UX state, router config
    - local => propiedades de clase o propiedades de componente
  - nos permite poder centralizar la data para poder manejarla en los distintos componentes
  - en el archivo main.js =>
    import store from './store'
    new Vue({ store, ... })
  - es tener todos los archivos de vuex dentro de un folder store/
  - en el store.js =>
    import Vue from 'vue'
    import Vuex from 'vuex'
    Vue.use(Vuex)
    export default new Vuex.Store({
      strict: process.env.NODE_ENV !== 'production', // es opcional el modo estricto, nos ayuda a únicamente actualizar el valor del state con un mutate no con otros métodos dentro del componente
      state: { // la data que queremos guardar y que siempre tiene un estado inicial
        atributo: valor
      },
      mutations: { // son operaciones síncronas para modificar el state, espera al llamado del action
        metodoMutation(state, valor) {
          // set el state.atributo
        }
      },
      actions: { // es igual a mutation solo que en lugar de mutar el state, hacen un commit al mutate, pueden ser async o sync, se llama desde el componente, son los encargados de llamar a los metodos mutate
        async metodoAction({ state, getters, commit, dispatch, rootState }, valor) { // el segundo parametro es únicamente necesario si se actualizará el valor de un estado y el async únicamente porque se obtiene data mediante axios
          const variable_valor = await axios()
          commit('metodoMutation', variable_valor)
        }
      },
      getters: { // hace fácil acceder a las partes del state, ejemplo: un elemento dentro de un array o un objeto o para realizar filtros
        metodoGetter(state, getters, rootState) { acceder al valor } // los parametros son opcionales, el state es el estate del namespaced, el getters si es en el root namespaced entonces accederá a getters de todos los módulos, si es en un módulo solo accederá a getters locales, y el rootState es el state el root namespaced
      }
    })
  - acceder a los valores del state, crear el atributo dentro del componente en el computed property =>
    - si únicamente se necesita un state property => atributo() { return this.$store.state.atributo }
    - si se necesitan varios, se tiene el helper mapState =>
      - importar el helper => import { mapState } from 'vuex'
      - dentro del computed property => ...mapState('nombre_modulo', { atributo: state => state.atributo }) | ...mapState('nombre_modulo', { atributo: 'atributo-del-state' }) | ...mapState('nombre_modulo', ['atributo-state']) // este únicamente si el atributo tendrá el mismo que del state, el nombre_modulo es opcional sino se accederá como root namespaced
  - utilizar el action =>
    - cuando solamente se utilizará un action => this.$store.dispatch('metodoAction')
    - cuando se utilizan múltiples actions =>
      - importar el helper => import { mapActions } from 'vuex'
      - añadir dentro del methods property => ...mapActions('nombre_modulo', ['metodoAction']) | ...mapActions('nombre_modulo', { nombreMetodo: 'metodoAction' } // el nombre de modulo es opcional solamente si se necesita acceder a las propiedades del módulo sino utilizará el root namespaced
      - se llamara al action como método propio del componente => this.metodoAction()
    - dentro de la función se puede devolver la promesa de la consulta, como cuando se usa axios
  - utilizar los getters =>
    - dentro del computed propery =>
      - importar el helper => import { mapGetters } from 'vuex'
      - llamar los getters dentro de computed property => ...mapGetters('nombre_modulo', { metodoComputed: 'metodoGetter' }) | this.$store.getters.nombre_funcion | ...mapGetters({ nombreComputed: getters => getters['nombre_modulo/metodo_getter'] }) // opcionalmente se puede utilizar el nombre_modulo para acceder a las propiedades del módulo sino se utilizará del root namespaced
  - utilizar los mutations (no recomendable) =>
    - con el helper => ...mapMutations('nombre_modulo', misma_forma_que_los_demas_helpers) // el nombre modulo es opcional sino se accederá al root namespaced
  - vuex recomienda utilizar los helpers
  - manejar vuex en modulos para no sobrecargar de código el store/index.js =>
    - crear una carpeta modules/ en store/, crear el modulo.js y exportarlo como objeto
    - en store/index.js exportar el modulo y agregar dentro de la instancia de vuex => modules: { nombre_modulo: ObjetoImportado }
    - el cambio afectará a los estados => this.$store.state.nombre_modulo.estado
    - cuando se tienen varios métodos iguales como actions o getters en cada modulo se puede diferenciar cual utilizar => namespaced: true, en su respectivo archivo de módulo
      - utilizar los getters o actions será => this.$store.getters|actions['nombre_modulo/metodo']
      - se tiene un root namespaced => es el archivo store/index.js
      - aunque no se coloque el namespaced el state siempre lo está
      - cuando se crean dentro de los módulos getters, mutations o actions que también tiene el root namespaced se tiene que colocar el namespaced sino saldrá error por utilizar dos veces el mismo método pertenecientes root namespaced
    - todas las propiedades que se agreguen en el store/index.js como root no serán heredados en los módulos

configuración de vue => agregará o sobreescribirá la configuración que tiene para webpack
  - crear un archivo => vue.config.js
  - para proxy (webpack config), nos simplica el tener que usar el dominio de una URL externa =>
    - en el archivo vue.config.js =>
      module.exports = {
        devServer: { // configuración para el webpack-dev-server
          proxy: {
            '/path': { // el path con el que iniciará para indicar que url se utilizará
              target: 'url', // indicar la url que se utilizará para todos estos paths
              changeOrigin: true, //
            }
          }
        }
      }
  - para webpack =>
    - en el archivo vue.config.js =>
      module.exports = {
        configureWebpack: {
          module: { // para agregar preprocesadores
            rules: [
              test: /regex/, // para indicar cual debe ser la extensión
              use: ['modulo-loader'] // el loader del preprocesador
            ]
          }
        }
      }
    - otra opción es manejarlo como función =>
      module.exports = {
        configureWebpack: (config) => {
          config.module.rules.push({
            test: /regex/, // para indicar cual debe ser la extensión
            use: ['modulo-loader'] // el loader del preprocesador
          })
        }
      }
      - sobreescribir un rule =>
        const newRule = { /* rule */ }
        const indexRule = config.module.rules.findIndex(element => element.test.source.includes?('string que contenga'))
        config.module.rules.splice(indexRule, 1, newRule)

librería para modularidad y manejo de objetos y arrays => npm install lodash
  - importar la librería => import _ from 'lodash'
  - clonar un objeto sin referencia =>
    import { cloneDeep } from 'lodash'
    cloneDeep(objeto)

zero configuration => npm install -g @vue/cli-service-global
  - abrir un archivo vue sin necesidad de cli => vue serve -o archivo.vue, se queda escuchando los cambios que se hagan en el archivo

comandos por defecto cuando se crear un nuevo proyecto =>
  - npm run lint => analizador de sintáxis
  - npm run build => compilar los archivos para producción
  - npm run server => empezar el servidor

librería para ejecutar archivos binarios => npm install -g npx
  - ejecutar archivo en el dist/ => cd dist/ && npx http-server

manejar los proyectos de vue => vue ui, crear un servidor donde se puede manejar los disintos proyectos de vue

indicar que componente se rendizará en la instancia => new Vue({ render: h => h(ComponenteRoot) }).$mount('#id')

styling componente =>
  - indicar el style únicamente estará en el componente => <style scoped>
  - indicar el style dentro del scoped con deep selector => .clase-wrapper-componente-child >>> .clase-dentro-child {} | .clase-wrapper-componente-child /deep/ .clase-dentro-child {}

Vue CLI ya tiene configurado webpack para poder soportar diferentes preprocesadores para CSS y HTML =>
  - utilizar SASS => yarn add node-sass sass-loader --dev
  - indicar el preprocesador => <style lang="scss|sass">

directives =>
  - crear un archivo js donde exportaremos el directive =>
    export default {
      bind: (element, binding) => { // el bind element es cuando el directive es agregado al elemento, aquí es donde se realiza la configuración inicial
        /* funcionalidad */
      },
      update: (element, binding) => { // cuando las propiedades del binding han sido actualizadas
        /* funcionalidad */
      },
      inserted: (element, binding) => { // se llama cuando el elemento se ha insertado en el componente
        /* funcionalidad */
      },
      updateComponent: (element, binding) => { // cuando el componente contenedor se ha actualizado
        /* funcionalidad */
      },
      unbind: (element, binding) => { // cuando se remueve el elemento
        /* funcionalidad */
      },
    }
    - element => es el elemento al que se le agrega el directive
    - binding => es un objeto donde manejamos los valores que se le pasan al directive
  - agregar el directive =>
    - import directive from 'archivo'
    - dentro de las propiedades del componente => directives: { nombreDirective: directive }
    - utilizar dentro del elemento => <elemento v-nombreDirective=forma></elemento>
      - formas valores para directives =>
        - por modificadores => v-nombreDirective:argumento.modificador.modificador.....
          - en el binding del archivo se puede acceder al argumento con => binding.arg
          - en el binding del archivo se acceden a los modificadores con => binding.modifiers
        - por objetos => v-nombreDirective="objeto"
          - en el binding del archivo se puede acceder con => binding.value
  - cuando se utilizan la misma funcionalidad para bind y para update solamente se debe exportar la function =>
    export default function (element, binding) { /* funcionalidad */ }
  - volver un directive global, en el archivo main.js =>
    - import nombreDirective from 'archivo'
      Vue.directive('nombreDirective', nombreDirective)
  - solucionar error de context por canvas => npm install jest-canvas-mock
    - en el jest.config.js => setupFiles: ['jest-canvas-mock']

manejar diferentes environment variables para probar =>
  - ejecutar el env => npm run build --mode=nombre_env
  - crear un .env.nombre_env => este archivo manejaría todas las variables que se necesiten

ver la configuración de webpack para un environment => vue inspect --mode=nombre_env

snapshot testing => comprobar que la UI no cambie inesperadamente

testing jest =>
  - instalar jest para proyectos ya creados => vue add unit-jest
  - elegir dependiendo del componente, shallowMount para componentes hijos y que no habrá menos, y mount para componente que posee hijos => import { shallowMount, mount } from '@vue/test-utils'
  - realizar el mount del componente => shallowMount(componente, { /* propiedades componente */ }) | mount(componente, /* propiedades componente */ }) // propsData es opcional
    - una vez montado el componente podemos acceder =>
      - al html => wrapper.contains('tag')
      - al viewmodel de vue (instancia) => wrapper.vm
  - obtener el html en string del elemento o vm => wrapper.vm.html() | wrapper.find('selector').html()
  - esperar a que el DOM actualice después de un trigger event => wrapper.vm.$nextTick()
  - hacer una descripción de un conjunto de tests => describe("titulo", () => { /* tests */ })
  - hacer asignación del componente =>
    let wrapper
    beforeEach(() => { // se ejecutará antes de todos los tests
      wrapper = shallowMount|mount(Componente)
    })
    - las propiedades al montarse =>
      - propsData: { /* props */ }, son los props con los valores que se le pueden dar al componente
      - methods: { /* metodos del componente */ }, si se tiene un método que se utiliza en un callback al crear el componente se debe color dentro de las propiedades del componente, methods: { nombreMetodo: () => {} }
      - slots: { /* default, y los named slots */ }
      - attachToDocument: true|false => indicará si al componente se le insertará en un div dentro del body, dandonos la forma en poder utilizar todo el DOM
    afterEach(() => { // se ejecuta después de todos los test
      wrapper.destroy() // eliminar el componente montado ayudará a limpiar la memoria
    })
  - indicar el test => it('nombre test', () => { /* test */ })
  - indicar si el componente existe => wrapper.exists()
    - también funciona al buscar un elemento en el componente y comprobar si existe => wrapper.find('selector').exists()
  - comprobar si el valor esperado es igual al que se tiene => expect(valor_obtenido).toBe(valor_esperado)
  - indicar las clases que tiene el componente o elemento => wrapper.classes()
  - buscar un elemento html => wrapper.find('selector')
    - buscar un componente hijo dentro del componente montado => wrapper.find(ComponenteHijo) // no olvidar importar el componente hijo
      - se puede acceder a los atributos de instancia del componente => wrapper.find(ComponenteHijo).vm
    - obtener el texto del elemento => wrapper.find('selector').text()
    - obtener los atributos del elemento => wrapper.find('selector').attributes() // nos devuelve un objeto con todos los atributos
  - lanzar un evento de un elemento => wrapper.find('selector').trigger('nombre_evento')
  - acceder a los eventos que fueron emitidos en el componente => wrapper.emitted().evento_emitido // es un array con todas las veces que se ha emitido el método con sus respectivos atributos y valores con lo que emite
  - acceder a los atributos data del viewmodel => wrapper.vm.$data.atributo
  - acceder a los slots => wrapper.vm.$slots // devuelve un array con los slots
  - crear un mock nos permite capturar las funciones reemplazandolas con el valor que se necesite
    jest.mock('link|librería', () => ({
      metodo() {
        return {
          metodoChained(fnc) {
            return fnc(valor)
          }
        }
      }
    }))
    - librería para tratar las promesas => yarn add flush-promise
    - reemplazar funcionalidad de un módulo =>
      - crear constante que reemplazará los métodos que se utilicen
        const $router = { metodo: jest.fn() }
      - dentro del shallowMount =>
        mocks: { $router } // $ indica que es un atributo de la instancia de Vue
      - indicar el método con los parametros que ha sido llamado después de que se ejecutará algun evento, utilizando flush-promises dentro del test que sería async =>
        flushPromises()
        expect($router.metodo).lastCalledWith(parametros)
  - configurar los props => wrapper.setProps({ /* nuevos props */ }) // es una función asíncrona
  - acceder a los props que tiene sin necesidad de setearlos => wrapper.vm.props().atributo_prop
  - acceder a la data del vm => wrapper.vm.elemento
  - acceder a los validators para los props => wrapper.vm.$options.props.nombre_prop.validator(valor_para_metodo) // esto devolverá true|false según la validación
  - acceder a los computed methods => wrapper.vm.metodoComputed
  - comprobar el contenido de un array => expect(array).toEqual(expect.arrayContaining([valor, valor, ...])) // se indican todos los valores que pueda tener el array, no necesariamente todos
  - cuando se usa un módulo exterior se necesita importarlo y crear una instancia de Vue donde indiquemos que lo utilizaremos en el test =>
    - importar la librería que se utilizará
    - importar la librería para crear la instancia de Vue =>
      import { createLocalVue } from '@vue/test-utils'
      const localVue = createLocalVue()
    - indicar que se utilizará la librería importada y agregarla en el mount|shallowMount =>
      localVue.use(Libreria)
      mount|shallowMount(Component, { localVue })
  - utilizar los componentes de Quasar Framework =>
    import * as All from 'quasar'
    const { Quasar } = All
    const components = Object.keys(All).reduce((object, key) => {
      const val = All[key]
      if (val && val.component && val.component.name != null) object[key] = val
      return object
    }, {})
    localVue.use(Quasar, { components })
  - indicar que se espera que el string sea parecido => expect('string').toMatch('string')
  - comprobar las veces que ha sido llamada una mock function => expect(mockFn).toHaveBeenCalledTimes(cantidad)
  - comprobar si el mock function ha sido llamado => expect(mockFn).toHaveBeenCalled()
  - cuando se necesita que directamente se emita un evento dentro de un componente hijo => wrapper.find(ComponenteHijo).vm.$emit('nombreEvento', parametros_que_devuelve) // solamente si devuleve un valor al emitir

storybook => es una documentación de UI
  - añadir storybook a vue cli => vue add storybook
  - configuración de storybook en .storybook/main.js =>
    module.exports = {
      stories: ['../src/components/**/*.stories.js'], // indicamos en donde se encuentran los archivos stories
      addons: ['@storybook/addon-actions', '@storybook/addon-links', '@storybook/addon-knobs'], // son los plugins de storybook (los 3 más utilizados en este caso)
    }
  - realizar configuración para soportar archivo scss, en la carpeta .storybook/webpack.config.js =>
    const path = require('path')
    module.exports = ({ config }) => {
      config.module.rules.push({
        test: /\.scss$/,
        loaders: ['style-loader', 'css-loader', 'sass-loader'],
        include: path.resolve(__dirname, '../'),
      })
    }
  - creación básica de un archivo, nombrarlo como nombreComponente.stories.js =>
    import Componente from 'path/Componente'
    import { withKnobs, tipoKnob } from '@storybook/addon-knobs' // el tipoKnobs serían para utilizar en los props y que se vuelvan editables (array, object, text, boolean, number)
    import { action } from '@storybook/addon-action' // para utilizar eventos que son emitidos en el componente

    export default { // características de como estará formada la carpeta de stories del archivo actual
      title: 'Carpeta/NombreComponente', // se pueden agregar cuantos nombres de carpetas se necesiten
      decorators: [withKnobs], // para indicar que se utilizará el addon knobs
    }

    export const nombreEjemplo = () => ({ // el nombre que se le dará a la variación en el story, pueden crearse varias en el archivo
      components: { Componente }, // el componente que se utilizará
      props: { // opcionalmente se ponen los props para agregarlos en
        nombreProp: {
          default: () => tipoKnob('nombreParaEditarEnKnob', valor)
        }
      },
      methods: { // los actions que tiene para el componente (opcional)
        nombreMetodo: action('eventoEmitido')
      },
      template: '<componente :nombreProp="nombreProp" @eventoEmitido="nombreMetodo" />' // es tal cual como usas un componente en otro
    })
  - importar el filtro global => el nombre que se le de al filtro debe ser tal cual que se está usando en el componente
    import Vue from 'vue'
    import filter from 'path/filter'
    Vue.filter('nombreFilter', filter)
  - utilizar librerías third-party =>
    import Vue from 'vue'
    import LibreriaComponente from 'modulo'
    Vue.use(LibreriaComponente)
  - utilizar los estilos, componentes de Quasar Framework =>
    import 'quasar/dist/quasar.min.css' // es la librería de css comprimida de quasar
    import Quasar from 'quasar'
    const { NombreComponenteQuasar } = Quasar
    Vue.use(Quasar, NombreComponenteQuasar) // nos permitirá poder utilizar los componentes de Quasar dentro del story

acceder a atributos de manera global por la instancia de Vue => Vue({ /* atributos */ }), acceder mediante this.$root.atributo, es mejor manejarlo con Vuex

Quasar Framework => al tener componentes y configuraciones ya establecidas nos facilita la posibilidad de poder ser utilizada la aplicación en distintos dispositivos
  - se puede utilizar quasar con un cli o dentro de vue cli, mejor quasar cli => sudo npm i -g @quasar/cli
  - crear un proyecto quasar => quasar create nombre_proyecto
  - crear un filtro global =>
    - crear una carpeta src/filters donde se creen los filtros globales
    - crear un archivo en src/boot/ que se llame filters.js =>
      /* importar filtros */
      export default ({ Vue }) => {
        Vue.filter('nombreFiltro', filtroImportado) // para todos los filtros
      }
    - dentro del quasar.conf.js => boot: [...demasArchivos, 'filters']
  - componentes de Quasar =>
    - q-page => normalmente es un template que contiene el router-view
      - agregarle padding al componente => <q-page padding>
    - q-list => un componente que crea una lista
      - indicar si los elementos tienen un fondo dark para cambiar el color de los items dentro => dark="true|false"
    - q-item => es el item que se utiliza dentro de la lista
      - indicar que es clickable => clickable="true|false"
      - indicar el tag que se usará => tag="nombretag"
      - indicar el target => target="valor"
      - con vue-router =>
        - indicar la dirección url => to="/url"
    - q-item-section => por cada vez que se coloque dentro del q-item lo separa en secciones
      - indicar que la seccion será para avatar => avatar="true|false"
    - q-item-label => componente que indica el label del item dentro del q-item-section
      - indicar que será el encabezado de la lista => header="true|false"
      - la clase que se utilizará => class="nombreClase"
    - q-icon => componente para indicar el ícono que se utilizará
      - indicar el material design icon => name="nombreIcon"
    - q-footer => una sección de footer
      - agregar elevación y un box-shadow para el footer => elevated="true|false"
    - q-tabs => es un menú de tabs
    - q-tab => es un elemento dentro del menú de tabs
      - se puede elegir el icono segun material design => icon="nombreIcono"
      - el label que se utilizará para el tab => label="texto"
    - q-route-tab => es un componente que hereda de q-tab y se puede conectar con vue-router
      - indicar la ruta => to="/ruta"
    - q-drawer => es el componente de sidebar
      - indicar el modelo que se utilizará => v-model="nombreModelo"
      - poner un borde => bordered
      - indicar el punto donde no se mostrará => :breakpoint="numero_pixeles"
    - q-layout => es un componente diseñado para manejar todo el window y envolver todo el contenido de la página
      - indicar como estarán distribuidos los elementos de la página como header, sidebar, footer, etc. => view="valores"
  - añadir una librería de componente third-party =>
    - crear un archivo boot para añadir la librería => quasar new boot nombreLibrería
    - dentro del src/boot/ se encontrará el archivo con una función que indicará a que atributos de la instancia de Vue, app podemos acceder
    - en el quasar.conf.js => boot: ['nombreArchivoLibreria', ...]
  - en el archivo quasar.variables.extension es donde podemos redefinir las variables

firebase =>
  - instalar firebase => npm o yarn firebase
  - instalar vuefire => npm o yarn vuefire, nos provisiona una manera de manejar bases de datos en tiempo real: Realtime Database y Cloud Store
  - crear un archivo que se llame src/firebase.js donde se manejará toda la configuración de firebase =>
  - configurar para firestore =>
    - dentro del firebase.js =>
      import firebase from 'firebase/app'
      import 'firebase/firestore'
      const firebaseApp = firebase.initializeApp({  // iniciar el sdk
        /* configuraciones de acceso para firebase */
      })
      const db = firebaseApp.firestore() // crear acceso a firestore
      export { db }
    - añadir en el archivo main.js =>
      import { firestorePlugin } from 'vuefire'
      Vue.use(firestorePlugin)
    - en el componente que se utilizará =>
      - acceder a la data de una colección => db.doc('coleccion/documento')
        - obtener los datos de la coleccion => db.doc('coleccion/documento').get() // devuelve una promesa
          - (await db.doc('coleccion/documento').get).data()
        - configuración de la colección => db.doc('coleccion/documento').set(nuevaData) // devuelve una promesa

debounce => es una librería que nos permite implementar un comportamiento después que ocurra una acción repetida
  - instalar librería => yarn|npm debounce
  - en los métodos => nombreMetodo: debounce(function() { /* funcionalidad repetida */ }, tiempo_espera_a_ejecución)

multipleselection => npm|yarn multipleselection, para realizar diferentes tipos de seleccion
  - props =>
    - v-model="value" => debe colocarse un array como valor si es múltiple sino un valor cualquiera
    - :options="list_de_opciones" => deben tener los elementos
    - label="key_de_la_opcion" => se indicará que propiedad de las opciones se mostrará
    - :multiple="true|false" => indica si el selector será múltiple o no
    - track-by="key_de_la_opcion" => con que atributo de las opciones se buscará
    - :close-on-select="true|false" => al seleccionar una opción se cerrará el dropdown
    - :clear-on-select="true|false" => al seleccionar se limpiarán todas las opciones que fueron seleccionadas
    - :preserve-search="true|false" => mantener la busqueda anterior que se realiza para el filtrado de opciones
    - placeholder="string" => el valor del placeholder que se utilizará
    - openDirection="top|bottom" => indica la posición en donde se abrirá el dropdown
    - :maxHeight="numero" => es el valor máximo que tendrá el alto del dropdown
    - :optionHeight="numero" => es el valor del alto que ocupará cada opción del dropdown
    - select-label="string" => es el texto que irá en cada opción del dropdown
    - :searchable="true|false" => indica si se podrá realizar el filtrado de opciones
    - :showLabels="true|false" => los textos que van en cada opción
    - :showPointer="true|false" => es un efecto que se activa con un hover sobre las opciones
    - :max="numero" => indica el número máximo para items seleccionados en el dropdown
  - eventos =>
    - @select="metodoLocal" => indica cada vez que se selecciona un valor en el selector

refs => son propiedades que nos permiten hacer referencias a elementos html en el template
  - indicar el elemento con el atributo ref => <tag ref="nombre_ref" />
  - para referencia el elemento => this.$refs.nombre_ref | this.$refs['nombre_ref'], esto sería igual que un querySelector
  - también se puede utilizar en múltiples elementos (v-for) y se tomaría como un array
  - no es recomendable utilizar dentro de los computed properties porque tiene la habilidad de manejar directamente nodos hijos

listar los componentes hijos => this.$children // nos devuelve un array de los componentes hijos donde podremos acceder a sus instancias

estructura de archivos =>
  - React propone dos distintas formas de agrupar archivos =>
    - por características o rutas
    - por el tipo de archivo
  - atomic design =>
    - atoms => son los bloques más básicos (input, button)
    - molecules => son grupos de atomos para crear unidades fundamentales (form search)
    - organisms => son grupos de moleculas que relativamente para secciones complejas (header)
    - templates => son grupos de organismos juntos para formar una página
    - pages => es colocar información dentro de los templates

vue-color => librería para seleccionar por una paleta de colores
  - tiene diferentes tipos de componentes para seleccionar
  - agregar librería => npm install vue-color
  - importar librería => import { nombreComponente } from 'vue-color'
  - los props que se utilizaran en el componente =>
    - v-model="color" => indicaremos un atributo data donde se manejará los valores del componente
    - indicar el valor por defector del color => :value="#color"
    - indicar un conjunto de colores predefinidos => :presetColors="[colores]"

vuelidate => validaciones para formularios
  - agregar librería => npm i vuelidate
  - import la librería para uso global =>
    import Vuelidate from 'vuelidate'
    Vue.use(Vuelidate)
  - utilizar validaciones en el componente =>
    import { tipoValidacion } from 'vuelidate/lib/validators'
    export default {
      ...,
      validations: {
        atributo {
          tipoValidacion,
          ...
        }
      }
  - validar todos los campos => this.$v.$touch()
  - validar únicamente un campo => this.$v.nombreCampo.$touch();
  - tipo de validaciones =>
    - required => no permite ningún elemento sin contenido
    - alphaNum => únicamente permite letras y números, no permite espacios
  - crear validacion customizada =>
    - creacion => const nombreValidacionCustomizada => (value) => /* devolver un valor boolean despues de validar el value */
    - agregar a validations del elemento que se utilizará como cualquier otro tipo de validación
  - comprobar si todo ha sido invalido => this.$v.$invalid
  - acceder a un campo para comprobar si tiene un error por alguna validación => this.$v.campo.nombreValidacion // si es valido dara false y si es valido retornará true

vue-swal => librería para realizar alerts personalizados
  - instalar librería => npm install vue-swal
  - importar librería para uso global =>
    import VueSwal from 'vue-swal'
    Vue.use(VueSwal)
  - utilizarlo dentro del componente => this.$swal({ atributos })
    - el título del sweet alert => title: string
    - el texto debajo del título => text: string
    - el ícono que se pondrá primero => icon: 'success|error|warning|info'
    - agregar el botón con un texto => button string
    - indicar que se cierre si se hace un click afuera del sweet alert => closeOnClickOutside: true|false // por defecto en true
    - indicar que se cierre cuando se presiona esc => closeOnEsc: true|false // por defecto en true
