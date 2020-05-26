--------------------------------------- RUBY BASICS ---------------------------------------

manejadores de versiones => rbenv, RVM, chruby

librería que tiene toda la información de la configuración de la instalación de Ruby => RbConfig

librerías bases de Ruby => podemos acceder con el path RbConfig::CONFIG
  - rubylibdir => librería estandar de Ruby
  - bindir => las herramientas de línea de comandos
  - archdir => las extensiones y librerías de la arquitectura específica (compilado, archivos binarios)
  - sitedir => tus propias librerías y extensiones third-party (escritos en Ruby)
  - vendordir => extensiones y librerías third-party (escritos en Ruby)
  - sitelibdir => tus propias extensiones de Ruby (escritos en Ruby)
  - sitearchdir => tus propias extensiones de Ruby (escritos en C)

librerías estandar => son las extensiones que vienen con la instalación de Ruby
  - did_you_mean => indica cuando escribiste incorrectamente algo
  - minitest => es un conjunto completo de facilidades para testeo soportando TDD y BDD
  - net-telnet => nos proporciona un funcionalidad telnet (control de otra máquina)
  - power_assert => nos muestra el valor de cada variable y método que se llama en la expresión igual que en la consola, útil para tests
  - rake => es un make-like implementado en Ruby
  - rdoc => proporciona documentación de línea de comandos y produce HTML para Ruby projects
  - test-unit => es un framework de testeo unitario, basados en los principios tUnit
  - xmlrpc => es un protocolo ligero que habilita llamado a procedimientos remotos mediante HTTP

flag del intérprete en línea de comandos =>
  - chequear la sintaxis del archivo sin ejecutarlo => irb -c archivo.rb
  - proporcionar mensajes de warning durante la ejecución del programa => irb -w archivo.rb
  - ejecutar un código dentro rápidamente => irb -e 'código'
  - imprimir una línea después de cada output => irb -l
  - requerir una librería antes de empezar la consola => irb -r 'librería'
  - deshabilitar las impresiones por defecto => irb --noecho

ARGF => stream que se usa en scripts para procesar archivos que son pesados por la terminal o por vía STDIN

variables predefinidas =>
  - obtener el PID actual donde se está ejecutando Ruby => $$
  - nombre del archivo actual en donde está siendo leido ARGF => $FILENAME
  - indicador de saltos de línea (\n) => $/

parámetros =>
  - formal parameters, parametros obligatorios que pide el método => def nombreMetodo(parametro)
  - default parameters, parametros con valor asignado por defecto => def nombreMetodo(parametro = valor)
  - block parameter, poder utilizar un bloque como parametro => def nombreMetodo(&block)
  - optional parameters, valores que se le pasa a un parametro que añaden a un array => def nombreMetodo(*parametro)
  - double splat parameter, solo acepta un hash como valor, y los agrega a un hash => def nombreMetodo(**parametro)
    - en las versiones actuales es obsoleto
  - NOTAS:
    - no se puede utilizar un default parameter después de un optional parameter

iteraciones =>
  - while => iteración que indica que se repitará mientras se cumpla la condición
  - until => iteración para disminuir el contador
  - number.times { block } =>  se utiliza para realizar iteraciones determinada cantidad de veces

string =>
  - reemplazar una parte del string mediante un patrón (regexp o string) => string.gsub(patron, 'string')
  - aumentar el último caracter del string alfanumerico => string.succ

symbol =>
  - se diferencia de los strings por tener el mismo object_id en cada instancia que se realiza por lo que no crea nuevos objetos y mejora la performancia

float =>
  - imprimir un float con determinados decimales => "%.cantidadf" % float # reemplazar cantidad con el número de decimales

standard streams =>
  - pedir datos mediante un prompt => gets 'mensaje' # opcionalmente recibe un mensaje

file =>
  - leer archivos => File.read('nombre_archivo')
  - escribir archivos => File.new('nombre_archivo', 'w') # el segundo parametro es para indicar que escribiremos en el archivo
    - terminada la funcionalidad se cierra el flujo => file.close

hash =>
  - acceder a los atributos nesteados en un hash => hash.dig(key, key_nesteado, ...)

basic object => es el objeto base de Ruby, funciona para crear objetos genéricos
  - instanciar => BasicObject.new

--------------------------------------- THIRD-PARTY LIBRARIES ---------------------------------------

instalar gema => gem('nombre_gema', 'version')

cargar archivos =>
  - leer y analizar el archivo cada vez que se llama => load 'nombre_archivo'
  - leer y analizar el archivo solo una vez => require 'nombre_archivo'
    - subconjunto para buscar el archivo dentro del mismo directorio => require_relative 'nombre_archivo'

crear un servidor por webrick desde cli => httpd
  - ejecutar el comando para crear el servidor => ruby -run -e httpd ubicacion_archivo|. [OPTIONS]
    - indicar el número de puerto, por default 8080 => -p numero_puerto
    - mostrar los request del cliente => -v

--------------------------------------- METAPROGRAMMING ---------------------------------------

getters y setters =>
  - solo lectura => attr_reader :atributo
  - solo escritura => attr_writer :atributo
  - lectura y escritura => attr_accessor :atributo




rake file: son archivos que tienen la funcionalidad de mantenimiento o utilidad
  namespace: es para definir donde se colocarán las tareas 'namespace :nombre_namespace do'
  desc: es una descripción de lo que hará la tarea ' desc 'descripción' '
  task: es la tarea y dentro del bloque definir su funcionalidad 'task :nombre_task do'
  run: en línea de comandos 'bundle exec rake nombre_namespace:nombre_task'
  - crear un task con argumentos => task :nombre_task, [:nombreArg, ...] do |task, args|; args[:nombreArg]; end


funcionalidad de métodos:
    para ver métodos disponibles 'object.methods' o 'Class.methods'
    para pedir métodos por acceso de control: 'obj.private_methods' 'obj.public_methods' 'obj.protected_methods'
    únicamente los métodos de instancia creados en la misma clase 'Class.instance_methods(false)'
    para ver los métodos de instancia: 'Class.instance_methods'
    verificar si el método existe: 'object.respond_to?('nombre_método')'

para crear un objeto genérico: 'BasicObject.new' no tendrá ningún método

eliminar saltos de línea 'string.chomp', es muy usado en cadena de metodos como 'gets.chomp'

utilizar métodos con metaprogramming:
    send: es para utilizar todos los métodos disponibles en el objecto 'object.send('nombre_método', argumentos)', también se puede pasar un bloque como argumento
    public_send: es para utilizar únicamente los métodos públicos disponibles del objecto 'object.public_send('nombre_método')'

el método 'p' hace referencia a 'puts object.inspect'

las referencias en Ruby son tomadas cuando se asigna el valor de una variable a otra, teniendo el mismo object_id, por lo cuál si cambiamos el valor de una variable, el de la otra ocurrirá igual

mantener una variable inmutable 'variable.freeze', únicamente se puede cambiar el valor si se asigna un nuevo objeto, útil para crear constantes

duplicar un elemento 'object.dup', crea un nuevo elemento a partir del objeto (si estuviera en frozen, el nuevo objeto no tendría ese estado)

clonar un elemento 'object.clone', crea un nuevo elemento a partir del objeto (si estuviera en frozen, el nuevo objecto se encontraría en ese estado)

proceso de identificación de variables:
    1. identifica si es un keyword
    2. identifica si ha tenido un signo = a la derecha para identificar como variable local pasando por una asignación
    3. se identificará como variable local o método
    4. lanzará un error fatal
    Ruby no diferencia entre una variable local o un método, solamente si es un keyword o no, por eso el error incluye a ambos

clase anónima 'Class.new do; end'

devolver el valor o valores máximos 'object.max_by(optional_cantidad_returns) { condicional }

para utilizar comandos del sistema operativo => system('comando') o `comando`, la diferencia entre los dos es que con `` te devuelve un output en cambio system no devuelve el valor y que cuando no
  existe el comando en `` lanza un error

no se puede incluir módulos sin tener un require anteriormente

el orden para comprobar la existencia de un método (method lookup):
	- primero se observa si la singleton class tiene un prepend, luego la misma singleton class y posteriormente si tiene algún include
	- posterior observa si la clase tiene un prepend, la misma clase y por último include y así por la herencia

siempre el método de clase tiene mayor importancia que el de un módulo, y el último módulo agregado sobre los demás módulos

para ver el orden jerárquico de la clase es con el método 'Class.ancestors'

con el método 'prepend Module' hacemos que se busque inicialmente en el módulo que en la misma clase, siendo llamado primero el módulo

'extend Module' es usado para heredar métodos de clases a diferencia del include que es para métodos de instancia

funcionalidad de super (jerarquía de herencia):
    sin argumentos: pasa todos los valores que ha recibido al método padre 'super'
    argumentos vacios: no pasa ningun argumento al método padre 'super()'
    con argumentos específicos: manda exactamente esos argumentos 'super(a,b,c)'

singleton: es cuando se define un método de una instancia de un objeto 'def object.método; end'

query strings: devuelven un valor true o false si contiene el elemento
    identificar el string con el que empieza => '.start_with?(string)'
    identificar el string con el que termina => '.end_with?(string)'
    identificar si el string está vacio => '.empty? (" " no se considera vacío)

BasicObject#method_missing: es un método que que genera los mensajes de métodos no existentes, y puede ser sobreescrito '.method_missing(nombre_del_método, *args)', donde se recibe el nombre del método
como un símbolo y los argumentos que recibe el método

Class#public_method_defined?('nombre_método'): es un método que nos permite comprobar si existen métodos de instancia con el nombre asignado

acceder a las environment variables 'ENV["nombre_de_variable"]' o ver cuales están disponibles 'ENV'

la ventaja de utilizar 'self.method' en una clase es que evitaremos tener que renombrar el mètodo de clase 'C.x' con el nuevo nombre de la clase

cuando un método y una variable tienen el mismo nombre, Ruby adopta a tomarlo como una variable, para utilizar el método sería 'self.method' o 'method()'

'require 'English'' es donde podemos utilizar las variable predefinidas con otros nombres como $PID en lugar $$

cuando se crea una clase o módulo con un nombre similiar a un built-in class o módulo, para poder acceder a estos últimos simplemente ::Class/Module

cuando se modifica en una clase hija el valor de la variable de clase entonces cambiará el valor para todos quienes la poseen

mejor practica para no tener que compartir variables de clases que puedan cambiar y no tengan los mismos problemas de acceso que las variables globales es:
    crear un get o set class methods que modifiquen la variable, y ya no usarla como variable de clase sino como de instancia

en un método de instancia para asignar se usa self.attr sino creerá que es una variable local

tambien se puede indicar los métodos que son protegidos o privados al último de la clase con 'private|protected :method'

otras formas de if/unless condition:
    'if condition; action; end'
    'if condition then action end'
    'action if condition' (no es buena práctica)

asignamiento local de una variable dentro de una condition:
    cuando se realiza cualquier asignamiento dentro de una conditional, Ruby parser crea un espacio en memoria donde se crea esa variable local con nil

el analizador (parser) de Ruby cada vez que ve una variable local (solo con este tipo), le crea un espacio en memoria

'exit' para terminar la ejecución de Ruby

case statement: se pueden realizar múltiples comparaciones, incluso con rangos

syntactic sugar: es cuando en un método ruby no es necesario colocar los paréntesis o en un setter que sea 'obj.attr = value' en lugar de 'obj.attr.=(value)'

en la clase se puede sobreescribir el método '===' donde realizamos una comparación y usarlo en los case statements

cuando elegir un case statement sobre un if statement, cuando el case statement tiene sobreescrito el === (test), sino en caso contrario elegir con el que se lea mejor

'objTime.wday' nos devuelve el número de día empezando Domingo como 0

while y until se pueden manejar de la misma forma
    en un begin - end while o en un begin - end until
    en una expresion 'action until/while condition'

Ruby permite el múltiple asignamiento, también en las condicionales, exmpl: 'a, b = [val, val]'

looping unconditionally 'loop { action }'

realizar un loop dentro de un array 'for key in array'

los code blocks y yield, cuando se manda un code block en un llamado a un método, si este no tiene función para ese block entonces simplemente lo ignorará

diferencia entre each y map, each devuelve el array que llamo al método y map devuelve un nuevo array

'object.method do |arg; variable|', todas las variables después del ; son variables locales del bloque

'begin rescue ensure end' es cuando se quiere realizar una instancia de una excepción para solo una parte del código, solo se usa rescue si es en un método, el bloque dentro del ensure es realizado se haga
la excepción o no

usar 'binding.irb' nos abre una irb session y detiene la ejecución en la parte del código donde ha sido llamado para el propósito de debugear

safe navigation operator: para evitar que ocurra el error NoMethodError dado por un objeto nil que llama a un método 'object&.method'

'raise nombre_excepcion, mensaje' para generar una excepcion y su mensaje personalizado opcionalmente

para un RuntimeError simplemente con 'raise' o 'raise mensaje' el cual se consideraría como plain-vanilla de las excepciones

'rescue nombre_excepcion => e' para utilizar la instancia de excepcion que tiene un backtrace (seguimiento del error) y message (mensaje del error)

re-raised una exepcion es para registrar algo sobre la excepcion, pero que el código de la llamada lo trate como una excepción

scalars: objetos atomicos (strings, numbers y symbols), representando, que contienen valores pero no contienen otro objetos

collection: objetos que contienen otros objetos (ranges, array y hash)

definiciones de get y set en métodos
    'def [](x)' significa obj[x]
    'def []=(x,y)' significa obj[x] = y

para definir operadores unitarios se deben comprobar como es su funcionalidad

utilizar el ! después de un método genera que el objeto mute con los cambios realizados

una comparación entre modificar objetos (!) o crear nuevos con un simple método es la performancia, siendo este última más pesada en tiempo de procesos

buenas practicas para usar !
    cuando existe un mètodo sin ! y uno que lo tenga para conocer que existen dos métodos identicos
    bang no significa un comportamiento destructivo sino peligroso (como una advertencia), porque un método destructivo no necesariamente lleva un !

String#clear: limpia todos los caracteres del string y devuelve un ""

tipos de conversión:
    'to_s' para convertir a un string, todos los objetos menos instancias de BasicObject responden a esta conversión (crea un nuevo objeto)
    'to_a' para convertir a un array, es únicamente válido para objetos que tiene include Enumerable
    'to_sym' para convertir a un símbolo
    'to_i' para convertir a un entero, si es un string que no es un número, lo deja como 0 (crea un nuevo objeto) también recibe parametros para indicar la base que se usará
    'to_c' => para convertir un string en un complex number
    'to_r' => para convertir un string en un rational number
    'to_f' para convertir a un float (crea un nuevo objeto)
    'to_i' y 'to_f' reconocen el número cuando el string empieza con el y termina cuando es un caracter no numérico
    opcionalmente para convertir a un número hay una forma más estricta con Integer(string) y Float(string) donde únicamente dentro del string debe tener un número, en caso contrario lanzará un error

Object#display(file): es como un print pero que puede recibir como argumento un archivo para redireccionar el output

Struct: nos permite crear una clase con atributos de lectura/escritura, además hace include de Enumerable, pudiendose hacer un 'to_a'

splat operator => '*' es utilizado para eliminar el array contenedor y solo mostrar los valores '*arrayobject'
  - en caso de usarse con un hash, agrupará las keys-values en un array por cada uno

para poder concatenar (o shovel) objetos con un string, la clase debe poseer un método 'to_str' donde pondremos el string que se utilizará

Array#concat(array): nos añade el valor del array dentro de otro array

para concatenar objectos en un array debe agregarse un método 'to_ary' que debe devolver un array

boolean expressions en clases:
    una clase vacía: devuelve false
    una clase con valor dentro: devuelve true
    definición de un método: sin importar el valor dentro evalúa para true

convirtiendo nil:
    'to_s' => ""
    'to_i' => 0
    'object_id' => 8

Comparable module: implementa una forma rápida de comparación para objetos y clases
    '<=>' spaceship operator que cuando es mayor devuelve 1, menor -1 e igual 0, y es recomendable redefinirlo en las clases, cuando se compara Numeric se realiza sin redefinirlo
        cuando se define el spaceship operator, trae consigo la definición de los métodos de comparación '<', '>', '==', '<=', '=>', '!=', '.between?(val1, val2)'

métodos de comparación:
    '==', realiza una conversión para poder comparar dos valores (puede ser redefinido)
    '.eql?', realiza una comparación del valor únicamente (puede ser redefinido)
    '.equal?', usado para comparar que sea el mismo objeto (no recomendable redefinir)
    '==' y '.eql?' varían dependiendo de la clase del objeto
    '.between?(val1, val2)' comparando el que llam al método con esos valores caller > val1 y caller < val2

Array#sort: nos permite ordenar el array

protected únicamente puede ser llamado en cualquier instancia de clase (self) o subclase, private únicamente por el mismo objeto en su misma clase

interpolación nativa: 'string_content %{key_interpolated}'
    para usar interpolación dentro del string => variable % { key_interpolated: 'content' } (String#%)
                                                 sprintf(variable, key_interpolated: 'content') (Kernel#sprintf)

escape string: con el backslash invertido se puede insertar el string \

para crear strings: el delimitador más comun son {contenido}, pero pueden ser -contenido-, [contenido], /contenido/
    %q{texto} => un string con ''
    %Q{texto} => un string con ""
    %{texto} => texto plano

irb tiene su propio interprete de Ruby, en casos de quotes mechanisms no termina realizando el escape y termina indicando que aún falta terminar el código, en esos casos es mejor usar "ruby -e 'code'"

para obtener un determinado caracter de un string <= '"string"[index]' siendo el index positivo o negativo
    '"string"[empieza, termina]' => obtener un substring indicando de que caracter empezar y en cual terminar, directamente tambien se puede usar range
    '"string"["substring substring"]' => también se puede indicar por substring, devolverá nil si no se parece al string, también se puede usar regex en lugar de substring
    el efecto [] en un string sería igual que usar el método 'string.slice(funciones_anteriores)'
    'string.slice!(funciones_anteriores)' => eliminará el substring del string
    string tiene un método '[]=' que nos permite reemplazar el substring
    en el momento que se use un index fuera del rango que posee el string se lanza un IndexError pero que únicamente devuelve nil

el contrario del [] en un string es .index, porque devuelve el primer index que encuentra desde la izquierda del substring 'string.index(substring)'
    también se puede usar 'string.rindex(substring)' que devuelve el primer index que encuentra desde la derecha

para ver la cantidad de caracteres que se tiene en el string
    'string.size' => devuelve la cantidad de caracteres en total
    'string.count' => devuelve lo mismo que el size, pero se puede detallar mas los caracteres
        'string.count(opciones)' => donde las opciones pueden ser:
            'caractercaractercaracter' donde se busca de un caracter especifico, también puede ser espacio en blanco ' '
            'caracter-caracter' donde se busca entre en el rango de esos dos caracteres, siendo también especificados con case sensitive, ejm: 'A-Z'
            para negar la busqueda de los caracteres dados se agrega ^ al principio, también se puede indicar como segundo parametro 'string.count(caracter, ^caracter)'

caracteres por si solos (One-character string):
    "caracter.ord" => devuelve el ordinal code, si se tiene un string completo de caracteres y se realiza el método solamente devolverá del primer caracter
    de la misma forma se puede convertir un entero a un caracter 'numero.chr', si el número no se puede convertir en caracter manda error

transformación de strings:
    upcase => todo mayusculas
    downcase => todo minuscula
    swapcase => primera letra en minuscula y demás en mayusculas
    capitalize => primera letra en mayuscula y demás en minisculas

añadir padding al string:
    rjust(cantidad, string(opcional)) => añade padding a la izquierda
    ljust(cantidad, string(opcional)) => añade padding a la derecha
    center(cantidad, string(opcional)) => añade padding a la izquierda y derecha
    el string opcional agrega en donde coloca el espacio en blanco el string dado

eliminar espacios en blanco:
    strip: quita los saltos de linea de un string y los espacios en blanco de todo el string
    lstrip: quita los espacios en blanco de la izquierda
    rstrip: quita los espacios en blanco de la derecha

transformaciones del contenido:
    chop => elimina el último caracter del string
    chomps('substring') => elimina el último substring indicado, más útil para eliminar saltos de línea, también recibe un substring que si reconoce que está al final del string, lo elimina
    clear => elimina el contenido del string y nos devuelve empty string (es un método que cambia el valor directamente)
    replace => reemplaza todo el contenido del string (es un método que cambia el valor directamente)
    delete => funciona igual que el método count solo que para eliminar substrings dentro del string
    crypt => realiza una encriptación similar a la de Unix (Data Encryption Standard)

para crear una variable de ambiente temporal y usarla en irb => '>> VARIABLE=value irb'
    una variable global permanente por la session 'export VARIABLE=value'

para concatenar un string sin salir error por la variable no definida => value &&= value + string

enconding of source file =>
  cuando ponemos en la consola => puts __ENCODING__, nos saldrá el valor por defecto de UTF-8
  para cambiar el valor del encoding, Ruby maneja magic comment, que se utiliza en el top del archivo => # encoding: valor_encoding
  obtener el encoding del string => string.encoding
  cambiar el encoding del string => string.encode('encoding_value'), también posee un método bang
  cuando se tiene un valor fuera del rango del encoding, se realizará un switch y cambiará automáticamente a UTF-8

características principales de los symbols (se parecen más a los integers que a los strings):
  - inmutability => no se cambia el valor del símbolo, una vez se crea, existe como una sola entidad
  - uniqueness => en todos los lugares que llames al símbolo, siempre seguirá siendo el mismo objecto (object_id)
  tienen más parecido a los integers que a los strings porque una vez se crea el símbolo solo se puede, porque comparte unicidad, inmutabilidad e inmediatez
  los symbols objects no son más que representaciones de si mismos, siendo una variable que lo almacene un identificador más simbólico, por lo cual un identificador que contenga un símbolo proporciona el valor real del símbolo y no solo una referencia

obtener todos los symbols disponibles => Symbol.all_symbols

los identificadores de Ruby técnicamente son símbolos

una variante a include?(valor) es grep(valor_regex)

compararar dos strings sin case-sensitive, si son iguales devolerá 0, mayor -1 y menor 1 => string.casecmp(other_string)

los números hexadecimales son indicados co 0xnumero y los enteros que empiecen con 0 son tomados como octal (base 8)

para utilizar la clase Date se necesita importarlo => require 'date'

constructors de Date => Date.today, Date.new(parametros), los parametros son números y opcionales

pasar de un string a una fecha => Date.new(parametro_string)
  Ruby reconoce un año también cuando es entre 0 al 68 como 2000 y mayor a 69 como 1900,
  también reconoce meses como su nombre y abreviatura

cambiar el formato de la fecha => Date.strptime('string_date', 'format')

para usar la clase Time no se necesita importar pero algunos métodos son válidos únicamente cuando lo importas => require 'time'

constructors de Time =>
  - Time.new o Time.now
  - Time.at(número_segundos)
  - Time.mktime(numero, numero, ...)
  - Time.parse('string_time') para este método se necesita la importación

constructors de DateTime => como es una subclase de Date
  - DateTime.new o DateTime.now
  - DateTime.parse(string_date)

queries a DateTime objects =>
  - obtener el año => objeto.year
  - obtener la hora => objeto.hour
  - obtener el minuto => objeto.minute
  - obtener el segundo => objeto.second ó objeto.sec
  - consultar si es un día => objeto.saturday?

cambiar el formato de fecha => object_date.strftime('format')
  formatos y descripciones:
    - %Y => año con 4 dígitos
    - %y => año con 2 dígitos
    - %b, %B => abreviatura de mes, mes completo
    - %m => número del mes
    - %d => dia del més con un zero
    - %e => día del mes con un espacio en blanco
    - %a, %A => abreviatura de día, día completo
    - %H, %I => una hora de las 24 horas, una hora de 12 horas
    - %M => minuto
    - %S => segundo
    - %c => equivalente a "%a %b %d %H:%M:%S %Y"
    - %x => equivalente a "%m/%d/%y"

adelantar o retroceder en los objetos date:
  - adelantar un día => objeto.next ó objeto.succ
  - adelantar meses => objeto.next_month(cantidad)
  - adelantar año => objeto.next_year(cantidad)
  - retroceder día => objeto.prev_day(cantidad)

iterar un objeto fecha:
  - para iterar a la fecha más próxima => objeto.upto(fecha_esperada) { bloque_codigo }
  - para iterar a la fecha anterior => objeto.downto(fecha_anterior) { bloque_codigo }

para ver el index dentro de un hash => hash_object.each_with_index { |(key, value), i| }
  - Tip => los parentesis dentro del parametro de bloque es para separar los las partes de un array

crear array:
  - array = Array.new(cantidad, objeto) => se crea un array indicando opcionalmente la cantidad de veces que se creará y el objeto que se usará al crear el array, también se le puede pasar un bloque
      de código { |i| code }, cuando se está utilizando el segundo argumento son el mismo objeto para las veces que se indica que se usará por lo cual estan siendo mutables
  - array = []
  - array = Array(objeto)
  - array = %i{} ó %w{}
    - %w(value value) => significa que se realizará un array con los string y con single-quoted
    - %W(value value) => se creará un array con los strings más resistentes

realizar la conversión de un elemento pero en caso no tenga el método que devuelva nil => Class.try_convert(objeto)

en un array se puede insertar en un determinada posición => array.[]=(index, valor) ó con syntactic sugar array[index] = valor

obtener valores dentro de un array =>
  - array[index, cantidad]
  - array.slice(index, cantidad) ó array.slice!(index, cantidad) donde convertirá el array a los elementos seleccionados
  - array.values_at(index, index)

asignar en una determinada cantidad de elementos:
  - un array dentro de un elemento => array[index] = valor, valor
  - asignar la cantidad del array => array[index, cantidad] = valor, valor, para que entienda que es una asignación de sus elementos se indica el segundo argumento que es de la cantidad

manipulación de arrays:
  - insertar un elemento primero => array.unshift(valor)
  - la diferencia principal entre shovel y push es que shovel únicamente inserta un valor a la vez
  - para eliminar a partir primer elemento => array.shift(cantidad = 1), la cantidad es opcional para indicar cuantos elementos se eliminarán
  - eliminar a partir del último elemento => array.pop(cantidad = 1), la cantidad es opcional para indicar cuantos elementos se eliminarán

combinar arrays:
  - array.concat(other_array) => combina dos arrays pero cambia el contenido del primer array
  - array + other_array => en este caso si se creará un nuevo array mergeando los dos
  - array.replace(other_array) => cambia el array que manda ese mensaje y también a todos las referencias de ese array

transformaciones de array:
  - eliminar los arrays dentro de un array => array.flatten(cantidad=todos_los_arrays_nesteados), cantidad es un argumento opcional que elimina todos los array nesteados, indicando una cantidad
      se limitará, también posee una bang version
  - una forma alterna de realizar un join => array * 'separador'
  - poner al revés un array => array.reverse, también posee una bang version
  - para eliminar los objetos iguales => array.uniq, también posee una bang version para cambiar el array => array.uniq!
  - eliminar todos los elementos con nil => array.compact, también posee una bang version

seleccionar elementos del array al azar => array.sample(cantidad), se puede indicar la cantidad de elementos al azar

creación de hashes:
  - la forma común => hash = { valores }, donde valores pueden ser separadas por key => value ó por key: value
  - usando el initializer de hash => Hash.new(valor_default) { |hash, key| contenido_bloque } => el parametro valor_default es opcional, únicamente indica que es lo que devolverá el hash si la key
      no existe, por defecto devuelve nil, también se puede pasar un bloque de código para manejar cuando no existe la  key
  - con el método Hash.[] => Hash[key, value], se puede crear cuantas veces se necesite pero indicando un número par de keys y values porque sino lanzará error, a menos que se pase un
      array(valores en par) como argumento, cuando se quiere agregar un array directamente Hash[*array]
  - con el método => variable.to_h, solamente para tipos de dato [] o nil

para almacenar un nuevo valor dentro de un hash => hash.store(key, value)

retornando valores del hash:
  - una manera alternativa para buscar, donde se lanzará una excepción si no encuentra la key => hash.fetch(key, message), el mensaje es un argumento opcional en caso de que no se quiera lanzar
      una excepción para poder devolver ese mensaje, también se puede realizar con un bloque en lugar de mensaje que recibe la key como parametro de bloque
  - recuperando múltiples valores => hash.values_at(key, key, ...)
  - recuperar múltiples valores y lanzar una excepción cuando no la encuentra => hash.fetch_values(key, key, ...) { |key| contenido_bloque }, el bloque es opcional para indicar como se manejara la igual de las keys

combinando hashes:
  - para combinar un hash cambiando su contenido del hash => hash.update(other_hash), y en caso existan las mismas keys se actualizará su contenido
  - combinar creando un nuevo hash => hash.merge(other_hash), existe una bang version pero sería igual a update

transformaciones de hashes:
  - seleccionando dentro de un hash => hash.select { |key, value| codigo_bloque }, aqui se realizará dentro del bloque alguna estructura que devuelva un boolean, existe una bang version
  - rechazando valores dentro de un hash => hash.reject { |key, value| codigo_bloque }, aquí se realizará dentro del bloque alguna estructura que devuelva un boolean, existe una bang version
  - mantener el hash => hash.keep_if { |key, value| codigo_bloque }, aquí se mantendrá el hash si se cumple la condición
  - eliminar el hash => hash.delete_if { |key, value| codigo_bloque }, aquí se eliminará el hash si ocurre la condición
  - eliminar valores nil dentro del hash => hash.compact, también tiene una bang version
  - invertir un array entre sus keys y values => hash.invert, pero hay que tener cuidado porque los valores pueden estar repitidos eliminandono un elemento
  - limpiar un hash => hash.clear, siendo el mismo hash
  - reemplazar el contenido del hash => hash.replace(other_hash)

queries para hashes:
  - verificar si el hash tiene una key => hash.has_key?(key)
  - otra forma de verificar si tiene la key => hash.key?(key), también con hash.member?(key)
  - verificar si tiene el valor => hash.has_value?(valor), otra forma hash.value?(valor)
  - verificar si el hash está vacío => hash.empty?

hashes como argumentos finales => si se utilizar como argumento final se puede usar los keys: value sin necesidad de las {}
  cuando se usa hash como primer argumento se deben colocar los paréntesis porque sino Ruby interpreta que es un bloque de código

los ranges tienen dos conceptos:
  - inclusión => que es sobre un valor dado está dentro del range
  - enumeración => el range es tratado como una colección transitable

crear ranges
  - se puede crear uno con su initializer => Range.new(inicio, fin, tipo) donde indicamos los valores máximos y mínimos del range y el tipo que es opcional para indicar si será inclusivo (false)
      o exclusivo (true) por defecto es false
  - un range inclusivo => inicial..final, que incluye el valor final dado
  - un range exclusivo => inicial...final, que excluye el valor final dado

queries para ranges:
  - para que nos devuelva el valor mínimo => range.begin
  - para que nos devuelva el valor máximo => range.end
  - para comprobar si es incluyente o excluyente => range.exclude_end?

comprobar si un elemento existe dentro del rango => range.cover?(elemento), también se puede utilizar el ===

se pueden crear backward ranges => 20..1 pero no es recomendable porque no da los resultados esperados

sets => es una librería estandar que se puede utilizar con => require 'set', es una colección única de objetos
  - lo que hace para hacerlos únicos es crear un hash oculto donde se almacenarán los valores dados en el set como keys, únicamente se pueden añadir enumerables

para crear sets:
  - Set.new(valores) { |valor| codigo_bloque }, los valores son opcionales, y en el bloque de código se pueden tratar con los valores añadidos en el set

añadir nuevos valores al set => set << valor, en caso de que ese valor exista, únicamente devolverá el set completo

para eliminar elementos dentro de un set => set.delete(valor)

para verificar si el elemento existe dentro del set => set.add?(valor), devolverá nil si el objeto existe, pero sino devolverá el set completo

operaciones de sets:
  - intersección => set & other_set
  - unión => set + other_set ó set & other_set
  - difference => set - other_set
  - exclusive-or (los elementos distintos en unión) => set ^ other_set

mergear sets => set.merge(other_set), a diferencia de otros tipos de colecciones aquí modifica directamente al objeto utilizando unicamente un object_id (mejor performancia)

supersets y subsets =>
  - para comprobar de que un set es un subconjunto de otro set => set.subset?(super_set)
  - para comprobar de que un set es un superconjunto de otro set => set.superset?(small_test)

module Enumerable:
  - Enumerators => son objetos que encapsulan la forma en como iterar un colección en particular
    - Array => push, pop, shift, unshift, slice!
    - Hash => keys, values, each_key, each_value
    - Range => cover?
    - Set => add, divide, intersect?, subset

Enumerable boolean queries:
  Array:
    - verificar una condición dentro de todos los elementos de un array => array.all? { |value| condicion }
    - verificar si algún elemento del array posee una condición => array.any? { |value| condicion }
    - verificar si un solo y unico elemento cumple con la condición => array.one? { |value| condicion }
    - verificar si no existe ninguno con la condicion => array.none? { |value| condicion }
  Hash:
    - el método hash.include?(valor) de un hash verificar si existe el valor dado en las keys
    - se pueden usar los métodos de Array pero indicando en el bloque la key, value; también puedes tratarlo como una sola variable pero devolvera como un array
  Range:
    - se pueden utilizar todos los métodos del array siempre y cuando se utilicen como mínimo un entero en los limitantes, cuando se coloca Range.new(entero, float) al momento de hacer el each
        convertirá los valores a enteros
  Set:
    - utiliza todos los métodos de array

comparar un string con un regex => string =~ regex

cuando se intenta indicar dentro de las variables del bloque que no se usará, se debe agregar un _ a la variable => do |_var, var2|

obtener el primer número => array.find { codigo_bloque } ó array.detect { codigo_bloque }
  - existen casos particulares donde dentro del array puede ver un valor que sea nil y en el caso de que el find no encuentre el valor devolverá un nil, en ese caso se puede realizar lo siguiente
    array.find(proc) { codigo_bloque }, donde el proc debe ser el valor que se mostrará en caso no se encuentre el valor

find_all no tiene una bang versión, únicamente se utilizará el sinónimo => array.select! {}

la diferencia entre array.find y array.select_all, también conocido como array.select, y su contraparte array.reject es que find devuelve nil si no encuentra un valor y los demás devuelven un array

buscar mediante grep => array.grep(valor) { bloque_que_se_ejecutará_después_de_grep }, estos valores pueden ser distintos y no habrá problema con el tipo de elemento que tiene el array, grep
  sería equivalente a array.select { |valor| valor === valor_esperado }

agrupar en un hash dependiendo del atributo => array.group_by { codigo_bloque }, donde la key será el atributo que indiques que se utilizará para agrupar

crear un array de un número => numero.step(maximo, cantidad), el maximo indica el número al que se llegará y la cantidad indica el espacio entre cada número dentro del array

dividir el array entre los que cumplen y no la condición => array.partition { condicion }

element-wise:
  - first => obtener el primer valor de la colección
      Array, Range, Set retornan un valor único, en cambio el hash devuelve un array con el pair key/value
  - last => obtener el último valor de la colección, solo en Array y Range

generar un float al azar => Kernel#rand => llamarlo sin argumentos indica que se generará un número al azar entre igual-mayor a 0 y menor a 1, si se le da un valor se indicará un float aleatorio
  entre 0 y un número anterior al dado, y si se pone un range como argumento se indicará de que límites se generará

take and drop methods:
  - para tomar una cantidad de elementos dentro de una coleccion => coleccion.take(cantidad), la cantidad especifica cuando elementos se tomarán
  - para tomar todos los elementos menos la cantidad que se indica => coleccion.drop(cantidad), la cantidad especifica cuantos elementos no se tomarán en cuenta
  - para devolver todos los elementos que están después de cumplirse una condición => array.drop_while { |value| condicion }, devuelve todos los elementos que siguen al elemento que cumple la condición
  - para tomar todos los elementos hasta que se cumpla una condición => array.take_while { condicion }, devuelve los elementos que se tomaron antes de que se cumpla la condicion

el maximo y minimo de las colecciones: únicamente válidos si se compara elementos del mismo tipo
  - obtener el valor mínimo => coleccion.min { bloque_condicion_opcional }
  - obtener el valor máximo => coleccion.max, { bloque_condicion_opcional }
  - obtener el valor mínimo por una condicion => coleccion.min_by { bloque_condicion }
  - obtener el valor máximo por una condicion => coleccion.max_by { bloque_condicion }
  - obtener el valor mínimo y máximo => coleccion.minmax { bloque_condicion_opcional }
  - obtener el valor mínimo y máximo por una condicion => coleccion.minmax_by { bloque_condicion }
  no necesariamente en el bloque deben tener los dos valores |a,b| que se comparan, también únicamente señalando el atributo que se utilizará para ordenar

relativos de each:
  - realizar el each al revés => coleccion.reverse_each { codigo_bloque }, se ejecuta del último al primero
  - realizar un each indicando los índices => coleccion.each_with_index(inicial) { |valor, index| codigo_bloque }, el argumento inicial indica de qué manera
  - realizar un each únicamente con los índices => coleccion.each_index { |index| codigo_bloque }, no funciona para hashes
  - tomar por cantidad de elementos que no repitan por su orden => coleccion.each_slice(cantidad) { codigo_bloque }, la cantidad indica de cada cuantos elementos se tomarán
  - tomar por cantidad de elementos que vaya progresivamente aumentando uno a la vez => coleccion.each_cons(cantidad) { codigo_bloque }, la cantidad indica de cada cuantos elementos se tomarán
  - agrupar los elementos donde en cada match que se haga con el pattern dado empiece el array creado => coleccion.slice_before(pattern).to_a { condicion_bloque }, se usa el pattern o el bloque
  - agrupar los elementos donde en cada match que se haga con el pattern dado termine el array creado => coleccion.slice_after(pattern).to_a { condiciion_bloque }, se usa el pattern o el bloque
  - agrupar elementos por una condición de comparación entre ellos separando los arrays creados entre los dos elementos que cumplen la condicion (uno en un array y el otro en el siguiente) =>
    coleccion.slice_when { |valor1, valor2| condicion }
  - usar varias veces un each => coleccion.cycle(cantidad) { bloque_codigo } => en la cantidad se indica cuantas veces se ejecutará este each
  - recorrer la coleccion y devolver el valor => coleccion.map { bloque_codigo }, también conocido como collect
  - el método map! es sobreeescrito en Array porque únicamente devolverá un array

iterar strings:
  - por cada byte del string => string.each_byte { bloque_codigo }, por el valor de cada byte que genera los caracteres
  - por cada caracter del string => string.each_char { bloque_codigo }
  - por el código del caracter => string.each_codepoint { bloque_codigo }
  - iterar por cada línea del string => string.each_line { bloque_codigo }

obtener los bytes de un string => string.bytes
obtener las líneas del string en un array => string.lines
dividir el string por caracter => string.chars
obtener los codepoints del string => string.codepoints

para odenar un array de objetos de una clase se tiene que sobreescribir el método <=>

para el método .sort { |valor1, valor2| valor1 <=> valor2 } aquí indicamos un orden donde se tiene que ordenar

el orden conciso por .sort_by { |valor| atributo_el_cual_se_compara }

verificar que un valor se encuentre entre dos (paracido a between?) => objeto.clamp(menor, mayor)

usar comparable nos permite la oportunidad de tener una amplia gama de comparadores y manejo de las distintas colecciones

crear un enumerator para manejar distintos procedimientos dentro y lo que se tendrá dentro del enumerator para manejar será lo que se añada al yielder
  - enumerator = Enumerator.new do |yielder|
      yielder << valor
    end
  al enumerator se le puede aplicar cualquier método de enumerable
  tiene un side-effect para los valores que no esten asignados dentro el enumerator, modificará los valores dependiendo de la ejecuciones que se realicen en el enumerator

crear un enumerator adjuntado al objeto => objeto.enum_for(:method, opcional1, ...) ó tambien Enumerator.new(objeto, :method, opcional1, ...)

existen varios métodos para ejecutar iteraciones que retornan enumerators cuando no colocas el bloque

crear un enumerator para que solo haga con each es utilizar => objeto.to_enum

los enumerators son distintos objetos a los que les das para que se realice la iteración

cuando se usar un enumerator en hash este de aquí sobreescribe los métodos del hash porque ahora es un enumerator y utiliza los métodos de Enumerable en lugar de Hash

para poder proteger un array de los cambios se puede utilizar el enumerator, limitandonos a únicamente poder hacer iteraciones y examinaciones de los elementos por el enumerator, un ejemplo podría
  ser para cuando se utiliza variables de lectura en una clase, cuando se pide a través de un objeto, se pueden modificar, las soluciones pueden ser, freezear la variable, o duplicarla o convertirla
  en un enumerator para protegerlo del cambio

la diferencia entre un enumerator y un iterator es que el enumerator es un objeto que puede mantener un estado y el iterator es un método
  para pasar al siguiente estado de un enumerator => enumerator.next
  para rebobinar al primer estado del enumerator => enumerator.rewind

para adjuntar un enumerator a un objeto no enumerable => no necesariamente una clase debe incluir el enumerable para que se puede iterar, también si agregamos un método que realice una iteración y
  luego a la instancia utilizamos el .enum_for(:metodo_de_la_clase), entonces podremos utilizar los distintos métodos que ofrece enumerator que es un enumerable object

el enumerator cuando se utilizar directamente por ejemplo => array.select.map { codigo_de_bloque } tiene una distinta forma de como manejarse a diferencia de array.select { codigo_bloque }.map,
  porque en el primero se maneja directamente con el enumerator y lo que se usa en el bloque es codigo para el método map

utilizar index en culquier método de enumerator => enumerator.método.with_index(numero_inicial) { |val, index| codigo_bloque }, el numero inicial es opcional, indicarlo es para decir desde que número
  se empezará el index

lazy enumerator nos permite tratar con colecciones infinitas convirtiendolas en finitas para poder realizar operaciones => (1..Float::INFINITY).lazy.metodo_iterator

cuando se toma de un lazy enumerator y se intenta tomar una cantidad de números se necesita el método force para que no devuelva el mismo enumerator

la clase Regexp es la que maneja las expresiones regulares y nos permite poder realizar un instancia simplemente con // o también con la forma de %r{expresion}

obtener el pattern matching, pudiendo hacerse con un regexp y también con un string => /regex/.match?(string) ó string.match?(/regex/), la diferencia es que cuando un string usa el método devuelve un regexp
  tambien se puede usar =~, pero a diferencia del .match?(), este retornará el index en donde se encontro en caso contrario nil

para retornar un objeto MatchData simplemente hacemos la comparación con => string.match(/regex/) ó /regex/.match(string), donde devuelve el objeto si encuentra que se cumple el pattern sino devolverá nil

encapsular submatches => /(match1) (match2) .../.match(string), al colocar los submatches dentro de un parentesis, Ruby crea una variables globales donde podremos acceder a los valores que tiene
  iguales, de manera incremental $numero, para poder ver el substring completo es almacenar el matchdata dentro de una variable e imprimir el index 0, matchdata[0], y para obtener el match completo
  Ruby también crea la variable predefinida que almacena el objeto match data $~

para ver el nombre del archivo que se está utilizando para ejecutarse => puts $0

para acceder a las capturas (submatches )que se realizan => objeto_match_data.captures[index] e indicar con el index que valor se requiere, empezando por 0, también simplemente object_match_data[index],
  pero en este último se empieza con 1

agregar un named capture => dentro del regexp se tiene que agregar /(?<nombre>regex)/, el ? indica que se podrá recibir nil si es que no lo encuentra, y se podrá acceder con objeto_match_data[:nombre]

para devolver lo anterior encontrado en un match => objeto_match_data.pre_match

para devolver lo que se encuentra después de un match => objeto_match_data.pos_match

para obtener los indices de donde se encontraron los submatches se utilizan:
  - para encontrar donde empezo => objeto_match_data.begin(submatch_index)
  - para encontrar donde termino => objeto_match_data.end(submatch_index)

quantifiers en regexp => nos permite especificar cuantas veces seguidas se desea que el match coincida
  cero o una vez => /pattern?/, con el ? indicamos si será una o ninguna
  cero o muchos => /pattern*/, con el * indicamos que puede ser uno o muchos
  uno o muchos => /pattern+/, con el + indicamos que es necesario uno o más
  indicar la cantidad de veces => /pattern{inicio, fin}/, se indica la cantidad inicial, cuando se pone {inicial} solamente es válido exactamente esa cantidad, {inicial, final} se indica que será entre esos rangos y cuando es {inicial, } que desde esa cantidad inicial hasta donde se pueda

los anchors en regexp => permite estipular que el match ocurra en un cierto punto estructural de un string
  - para el inicio de una línea => ^
  - para el final de una línea => $
  - zero-width => significa que ningún caracter fue consumido en el string
  - lookaheads positive => significa que se estipula que el periodo está presente (?=regex), realiza el match pero no se colocará dentro de este
  - lookaheads negative => significa que se estipula que el periodo no está presente (?!regex), realiza el match pero no se colocará dentro de este
  - lookahead assertion => significa que quieres saber que estás especificando que podría ser el próximo
  - lookbehind assertion => significa que quieres saber que se está especificando antes, (?<=regex), o (?<!regex)
  - para no capturar en los parentesis => (?:regex)
  - condicionales => /?(nombre)valor|valor/, valida si se cumpla una condición

modifier en regexp => son interruptores para cambiar el comportamiento del motor regexp
  - indicar que no importa el case sensitive => /regex/i
  - indicar que capturará todos los caracteres incluso con saltos de línea => /regex/m
  - poder utilizar comentarios dentro del regexp => /regex/x

crear un regexp de un string => Regexp.escape(string), con esto devolverá el string tal cual en regexp

convertir una expresion regular a un string => regexp_string = regex.inspect

métodos comunes para utilizar regexp:
  - String#scan => a diferencia del método match, aquí unicamente tratamos con arrays
  - String#split => nos permite separar en un array dependiendo del match que haga con el regexp
  - String#sub (substitution) String#sub! => string.sub(/regex/, string), tambien se puede con un bloque de código string.sub(/regex/) { |string| codigo_bloque }, solo se aplicará al primero que encuentre
  - String#gsub (global substitution) String#gsub! => de la misma forma que sub, string.gsub(/regex/, string) ó string.gsub(/regex/) { |string| codigo_bloque }, se aplicará a todos los que hagan match
    la diferencia entre sub y gsub es que sub se delimita a una sola sustitución mientras que gsub a múltiples
    usar capturas para reemplazar string => string.(g)sub(/(regex)(regex)/, '\2 \1'), con los \numero dentro del string hacemos referencia a las capturas del regex
  - comparar con el case equality => string === /regex/, es parecido a .match? únicamente devuelve true o false
  - Enumerable#grep => coleccion.grep(/regex/), para poder filtrar la coleccion, también se puede agregar un bloque coleccion.grep(/regex/) { |elemento| bloque_codigo }, todo es válido para elementos string dentro del array

librería estandar StringScanner:
  - utilizar la librería => require 'strscan'
  - crear un objeto => string_scanner = StringScanner.new(string)
  - escaner hasta cierto punto => string_scanner.scan_until(/regex/)
  - devolver el punto actual => string_scanner.pos
  - obtener el resto del string sin examinar => string_scanner.peek(cantidad), se indica la cantidad de caracteres que se usarán desde donde se encontró con el match
  - deshacer el match realizado anteriormente => string_scanner.unscan
  - saltearse hasta cierta línea => string_scanner.skip(/string_hasta_cierta_parte/), se utiliza el string hasta cierta parte

clase IO => es la clase padre de las constantes que se utilizan STDERR, STDIN, STDOUT, son más tratados como enumerables

STDIN => para el ingreso de los datos
	- STDIN#each {} => podemos interactuar con los valores que ingresamos en consola
		para indicar con que se realizará el salto de línea, antes declarar => $/ = string
	se pueden usar distintos métodos de enumerable => map, select, ..

STDERR => para mostrar los errores en la consola
	- STDERR#puts(string) => imprimimos el string de un mensaje de error
	- STDERR#write(string) => imprimos el string, es parecido al método print

STDOUT => salida de la información en consola
	- puts => salida en consola

por defecto Ruby interpreta que las entradas son por el teclado y salidas son para la consola, y en adicción a las 3 constantes Ruby nos proporciona variables globales para ellos $stdin, $stdout y $stderr
	la diferencia de la constante con las variables globales que las variables globales pueden cambiarse para definir una nueva entrada, salida y error
		$stdout = File.open(path, permiso)

para recibir un solo caracter por parte del teclado => STDIN.getc

la clase File es una subclase de la clase IO:
	- crear un objeto File => f = File.new('archivo')
	- leer el archivo => f.read
	- cerrar archivo => f.close (únicamente es necesario cuando se abre un con el initializer)
	- leer cada línea del archivo => f.gets (cuando no hay más que leer arroja nil) ó f.readline (cuando no hay más que leer arroja un error fatal)
	- reestablecer a la primera línea del archivo => f.rewind
	- agrupar en un array las líneas del archivo => f.readlines
	- se puede iterar mediante un each donde se tendría la misma funcionalidad que un each_line
	- para obtener un caracter a la vez => f.getc (devuelve nil cuando no hay más que leer) ó f.readchar (devuelve error fatal cuando no hay más por leer)
	- agregar un string antes de cualquier linea => f.ungetc('string')
	- leer el número del byte del caracter => f.getbyte (devuelve nil cuando no hay más que leer) ó f.readbyte (devuelve error fatal cuando no hay más que leer)
	- obtener la posición actual del puntero => f.pos, si asignamos un valor f.pos = valor, el puntero irá hacia esa dirección
	- para moverse a una ubicación específica => f.seek(posicion)

métodos de clase para lectura de File:
	- leer directamente todo el archivo => File.read('file')
	- agrupar por líneas el archivo => File.readlines('file')

existen métodos de low-level para I/O methods que son sysseek, sysread, syswrite los cuales no deben mezclarse con higher-level methods porque sino saldrán errores, son métodos low-level porque realizan operaciones con datos sin operar

escribiendo en archivos:
	- permisos para escribir en un archivo => f = File.new('file', 'tipo'),  el tipo puede ser
		- w => sobreescribe todo el contenido anterior del archivo
		- a => agrega nuevo contenido al archivo
	- escribir => f.puts "", f.write "", f.print

usar bloques para el alcance de las operaciones con archivos =>
	File.open('file') do |f|
		operaciones
	end
	al hacerlo en un bloque retornará el valor de la última linea del bloque

I/O Exceptions y errors: todos son errores que van al nivel del sistema no propios de Ruby
	- permiso denegado => Errno::EACCES
	- no existe archivo o directorio => Errno::ENOENT
	- es un directorio no un archivo => Errno::EISDIR
	- ver el número del error => Errno::NombreError::Errno, la constante Errno nos permite ver el número

consultas a archivos: la clase File posee métodos para consultar sobre el archivo de la misma forma para el módulo FileTest
	- ver el tamaño del archivo => FileTest.size('file')
	- comprobar si el archivo existe => FileTest.exist?('file')
	- comprobar si el archivo está vacío => FileTest.empty?('file') ó FileTest.zero?('file')
	- comprobar si es un directorio => FileTest.directory?('path')
	- comprobar si es un archivo => FileTest.file?('file')
	- comprobar si es un symbolic link => FileTest.symlink?('file')
	- comprobar si es posible leer el archivo => FileTest.readable?('file')
	- comprobar si es posible escribir en el archivo => FileTest.writable?('file')
	- comprobar si es ejecutable el archivo => FileTest.executable?('file')

obtener información del archivo con Kernel#test:
	- comprobar que el archivo existe  => test ?e, 'file'
	- comprobar si es un directorio => test ?d, 'directorio'
	- comprobar si es un archivo => test ?f, 'file'
	- comprobar si tiene tamaño 0 o vacío => test ?z, 'file'

derivando la información del archivo en otro objeto, donde la instancia nos muestra información como la fecha de creación, modificación, último accceso, etc.:
	file_information = File::Stat.new('file') ó File.open('file') { |f| f.stat }

manejar directorios => d = Dir.new('directoru')

obtener los archivos dentro del directorio => d.entries ó Dir.entries('directory')

eliminar de un array los valores que no se cumplan => array.delete_if { |value| condition }

para hacer un glob directory => Dir['*'] ó Dir.glob('*'), el glob directory es más para tener varios resultados de diferentes archivos que sigan el patrón dentro del método
	- con case-insensitive => Dir.glob('*', File::FNM_CASEFOLD)
	- con archivos ocultos => Dir.glob('*', File::FNM_DOTMATCH)
	para usar múltiples flags se usa el | para separarlos, y cada constante indica un valor entero

manejar directories:
	- crear un nuevo directorio => Dir.mkdir('directory')
	- comprobar si el directorio contiene archivos => Dir.empty?('directory')
	- para moverse a un directorio temporalmente => Dir.chdir('directory') do; end, opcionalmente se usa un bloque pero cuando se termine de utilizar el cambio hacia el directorio se tiene que volver atrás
	- ubicación actual => Dir.pwd
	- eliminar directorio => Dir.rmdir('directory')

eliminar un archivo => File.unlink('file')

obtener el nombre del archivo => File.basename('archivo')

modulo FileUtils:
	- requerir librería => require 'fileutils'
	- copiar un archivo => FileUtils.cp('archivo' | ['archivo1', 'archivo2'], 'copia'), se puede indicar un solo archivo o mútliples dentro de un array
	- crear un directorio => FileUtils.mkdir('directorio')
	- mover archivo => FileUtils.mv('archivo', 'nueva_ruta')
	- remover archivo => FileUtils.rm('archivo')
	- remove directorio => FileUtils.rm_rf('directory')
	- ver el comando real del archivo => FileUtils::DryRun.método('archivo_o_directorio')
	- cuando no se quiere realizar cambios accidentalemente => FileUtils::NoWrite.método('archivo_o_directorio')

módulo Pathname:
	- requerir librería => require 'pathname'
	- crear objeto => path = Pathname.new('file')
	- obtener el nombre del archivo => path.basename
	- directorio contenedor => path.dirname
	- obtener el tipo de extensión => path.extname
	- obtener la estructura de directorios => path.ascend do |dir|; codigo; end, un objeto pathname devuelve otro objeto pathname, por eso los directorios causados por ascend pueden usar los métodos anteriores de los archivo devuelve otro objeto pathname, por eso los directorios causados por ascend pueden usar los métodos anteriores de los archivoss

crear archivos temporales:
	- requerir librería => require 'tempfile'
	- instanciar => tf = Tempfile.new('nombre')

tratar strings como I/O objects:
	- requerir librería => require 'stringio'
	- instanciar string => StringIO.new('string')

obtener información de la red para leerlos como archivos locales:
	- requerir librería => require 'open-uri'
	- consultar red con el método Kernel#open y devuelve un StringIO object => open('url')

realizar un conjunto de instrucciones y luego devolver el objeto => object.tap |objeto|; instrucciones; end

individualización de objetos:
	- crear una singleton class => class << object; actions; end
	- un singleton method => def object.method; action; end
	la diferencia entre los dos es que en una singleton class se puede nuevas variables (como constantes) que si estuvieran definidas afuera dentro de la clase es una variable del scope de la clase, en cambio un método utiliza las variables fuera de la clase

referirnos a la singleton class de un objeto => objeto.singleton_class

los singleton classes pueden compartir sus métodos a través de la herencias, también son conocidos como meta-class

el singleton pattern: nos permite limitar la creacion de las instancias de clase a solo una
	- require librería => require 'singleton'

los alias en Ruby => nos permiten poder realizar convenciones al nombrar métodos con el objetivo de que sean menos propensos a ser utilizados (menos convencionales), como para referenciar un método heredado
	alias nombre_alias método
	tomar string o symbols => alias_method :alias, :method

riesgos de cambiar la funcionalidad core de Ruby: los cambios que se realicen a las clases core de Ruby son de efecto global

formas para modificar el core de Ruby de manera segura:
	- additive changes => agregar un método que no exista, el único problema sería si dos programadores añaden métodos con el mismo nombre, uno golpeará al otro
	por años se ha estado pasando métodos que se puedan utilizar no solo en un programa sino en varios por lo que se creo la extensión sublibrería core en Ruby que es ActiveSupport
		- gem install activesupport
		- require 'active_support'
		- require 'active_support/core_ext'
	- pass-through overrides => se crea una nueva función para realizar todo lo que sea necesario para luego dentro de esa nueva versión de la función llamemos a la anterior pasandole los argumentos
	- per-object changes with extend => es agregar funcionalidad como módulo a cada objeto en particular
			- añadiendo funcionalidad a un por objeto => objeto.extend(modulo)
			- añadir funcionalidad a una por clase => Class.extend(modulo)
	- refinements => la idea del refinement es hacer un cambio a una clase de manera temporal o con limited-scope
		module NombreModulo
			refine NombreClass do
				def metodo; contenido; end
			end
		end
		para usar el refinement => using NombreModulo, en la clase o archivo que se agregue se delimitara el uso

escribir XML => con la gema builder, hereda directamente de la clase BasicObject y maneja los method_missing creandolos como tags xml
	- requerir la librería => require 'builder'
	- hacer una instancia de la clase => xml = Builder::XmlMarkup.new(target: STDOUT, indent: número)
	- indicar que se empezará con la declaración de XML => xml.instruct!
	- crear contenido dentro del tag xml => xml.nombre_tag do; mas cosas; end
	- el contenido dentro del tag => xml.nombre_tag('contenido')

para verificar que existe un argumento block en el método se puede usar => block_given?

indefinir métodos para que no puedan ser utilizados => undef :nombre_metodo

heredoc: es una forma de poder escribir multiples lineas de strings => 'var = <<-NAME contenido NAME' se puede cambiar NAME, que es un delimitador, con cualquier palabra que se quiera
    se puede desactivar la interpolación con agregando '' al NAME
    para quitar los espacios se usa '<<~NAME'
    también se puede utilizar métodos al NAME, añadir como un item de un array

para obtener un determinado caracter de un string <= '"string"[index]' siendo el index positivo o negativo
    '"string"[empieza, termina]' => obtener un substring indicando de que caracter empezar y en cual terminar, directamente tambien se puede usar range
Hash#proc => cuando se realiza un llamado a múltiples keys de un hash [key, key, ...].map(&hash_object)

crear un to_proc generalizado:
	- dentro de la clase => def self.to_proc; Proc.new { |objeto| objeto.atributo }; end
	- utilizar el to_proc => [objeto, objeto, ...].método_usa_bloque(&Nombre_clase)

procs como closures => preservan un estado dentro del programa, cada variable al se instanciado el proc se vuelve inmutable fuera del proc

no pasar argumentos al proc => cuando no se pasan argumentos el proc los toma como nil

un proc únicamente para un return => Proc.new { return }.call nos devolverá un error cuando no se usa dentro de un método

lambdas:
  - crear un lambda => lambda { bloque }
  - argumentos en lambda => a diferencia de un proc, un lambda cuando no se da la cantidad adecuada de argumentos lanzará un error
  - creción explicita => los lambdas a diferencia de los proc tienen que se creados explicitamente sino lo tomará como un proc
  - cuando se realiza un return => termina directamente con la ejecución del método
  - stabby lambda:
    - sin argumentos => -> { bloque }
    - con argumentos => ->(argumentos, ..) { bloque }

tratando métodos como objetos:
  - capturar un método => variable_metodo = bjeto.method(:nombre_método)
  - usar la variable que tiene el método => variable_metodo.call
    alternativas:
      - lambda_variable[argumentos, ...]
      - lambda_variable.(argumentos, ...)
  - determinar donde fue definido el método => variable_metodo.owner
  - para relacionarlo con otra instancia de la Clase o alguna instancia de una subclase:
    - desunir con la variable => unbound = variable_metodo.unbind ó Clase.instance_method(:nombre_metodo)
    - enlazar con un nuevo objeto => unbound.bind(objeto)
  - utilizar el método del padre => variable_metodo.super_methodr
  - usar un método padre para determinada clase hija (cuando hay una larga jerarquía) => sobreescribir el método y dentro de este ClasePadre.instance_method(:nombre_metodo).bind(self).call

librería CSV:
  - leer un archivo CSV => CSV.read('file')
  - ver las filas del CSV => CSV.foreach('file', headers: true) do |row|; funcionalidad; el headers se indica siempre que se tenga un fila para indicar que valores tendra cada una de las que siguen
    - agregar el header nos permite obtener por el valor de cada fila dependiendo del header de la columna => row[:header_columna]
    - la fila cuando está con headers se puede convertir y tratar como hash => row.to_hash
  - escribir en un CSV => CSV.open('file', 'wb') do |csv|; csv << [valores]; end

realizar operaciones con strings:
  - crear funcionalidades a través un string => eval("string funcionalidad")
  - existe una Binding objects que nos permiten utilizar para reconocer que variables no han sido asignadas dentro del eval y utilizarlas => eval('variable', objeto_variable)

comprobar que el string no es de un input user o tiene un comando dentro => string.tainted?
  - comprobar mediante variable global => $SAFE

acceder a las variables de instancias directamente sin métodos => objeto.instance_eval { funcionalidad_con_variables_instancia }
  se puede utizar el instance_eval en el initialize de una clase junto con sus attr_accessors para realizar una instancia del objeto como bloque Clase.new do; asignar variables; end
  - utilizar con argumentos => objeto.instance_exec(variable) { |variable| funcionalidad }

definir métodos de instancia para objetos teniendo un scope con variables fuera de la clase => var = valor; Clase.class_eval { puts var }

poder utilizar métodos fuera del alcance propio => define_method ("nombre_método") { funcionalidad_método }, es utilizado normalmente para sobreescribir el method_missing

crear una nueva variable de instancia a través de un string => objeto.instance_variable_set('@variable', valor)

obtener todas las variables de instancias => objeto.instance_variables

obtener el valor de una variable de instancia => objeto.instance_variable_get('@variable')

Ruby utiliza por defecto los threads del sistema operativo pero en caso de que no esten disponibles usa los green threads (implementados dentro del intérprete)

Ruby posee Global Interpreter Lock (GIL) => mecanismo que nos ayuda a asegurar que los threads sean seguros en la programación concurrente y evitar el paralelismo

manejar threads:
  - crear un thread => Thread.new do; funcionalidad; end
  - para hacer que se ejecute un thread cuando se desee => variable_thread.join, despues de almacenar la instancia de thread en una variable
  - detener un thread => Thread.stop
  - ver el status del thread => objeto_thread.status
  - verificar si el thread esta detenido => objeto_thread.stop?
  - verificar si el thread sigue vivo => objeto_thread.alive?
  - llamar al thread para su empiece o continue su ejecución => objeto_thread.join
  - cambiar status detenido a ejecutandose => objeto_thread.wakeup
  puede ocurrir veces en que como se maneja varias veces la variable un thread pueda usar la variable la cual no debería usar por lo que se puede => Thread.new(objeto, ..) do |objeto_propio|,
    para poder hacer único al objeto dentro del thread
  las variables globales no son afectadas cuando se intenta cambiar el valor dentro del Thread, se cambiará el valor pero únicamente dentro del scope del thread, se pueden considerar variables globales
    con scope únicamente del thread
  - asignar valores para los threads => Thread.current[:key] = valor, dentro del bloque del thread
    - consultar las keys del thread =>  objeto_thread[:key]

controlar el flujo de ejecución => fiber_object = Fiber.new do; funcionalidad, Fiber.yield, funcionalidad; end, el objeto fiber se detendrá una vez que se llegue al Fiber.yield
  - retomar con la siguiente funcionalidad del fiber => fiber_object.resume, se detendrá en el próximo Fiber.yield

crear un servidor TCP:
  - requerir la librería => require 'socket'
  - crear una instancia => tcp_object = TCPServer.new(numero_puerto), el número puerto no tiene que estar ocupado por ningún otro servidor o servicio
  - esperar la conexión del cliente => connection_object = tcp_object.accept
  - mostrar resultados en la pantalla del cliente => connection_object.puts "#{valor}"
  - aceptar entrada de input => var = connection_object.gets
  - terminar la conexión del cliente => connection_object.close
  - terminar el servidor => tcp_object.close

pedir un valor en un hash y poner uno por defecto => hash_object.fetch(:key, valor por defecto)

cuando se usa system o `` el valor de la variable global $? cambia, dandonos información del status del proceso que se utilizo

utilizar comandos con delimitador => %x{comando}, es parecido a ``

utilizar un comando y reemplazar la sesion actual => exec("comando")

abrir un pipe con open => open("|comando", "permisos"), el permiso para poder escribir y leer w+, normalmente el comando es cat

un manejo más preciso del pipe:
  - requerir la librería => require 'open3'
  - asignar los standards => stdin, stdout, stderr = Open3.popen3("comando"), normalmente el comando es cat

delegando con method_missing => a través del method_missing nosotros asignamos los métodos que no existen dentro de la clase a los atributos que se tengan, por ejemplo .select, lo asignariamos a un
  atributo array como array.public_send(m, *args, &block)

hacer que el método method_missing y respond_to? tengan concordancia o=> def respond_to_missing?(m, include_private = false); end

hook para cuando un módulo es añadido a otro módulo o clase => def self.included(clase_al_que_se_añade); funcionalidades; end, dentro del módulo

hook para cuando se extiende un módulo para un objeto => def self.extended(objeto_al_que_se_añade); funcionalidades; end, dentro del módulo

hook para cuando se hereda una clase sobre una subclase => def self.inherited(subclass); funcionalidades; end, dentro de la clase padre, este método puede ser heredado por los hijos de las subclases que
  hereden la clase padre
  - si el inherited se crea en el singleton class entonces cuando se herede no afectará a la subclase singleton class

callback cuando se llama una constante que no existe => def self.const_missing(const); funcionalidad con la constante; end, dentro de la clase

crear una constante dentro de la clase => const_set(nombre_constante, valor)

ejecutar funcionalidades cuando se agrega un nuevo método => def self.method_added(m); funcionalidades; end, dentro de la clase

ejecutar funcionalidades cuando se agrega un nuevo método para la singleton class => def self.singleton_method_added(m); funcionalidades; end, se activará cuando se agreguen nuevos métodos
  al singleton class y se activa con el mismo callback
  - hacer que las instancias lancen el callback => def singleton_method_added(m); funcionalidades; end, dentro de la clase solo que sin usar la keyword self

listar los métodos privados del objeto => objeto.private_methods

listar los métodos protegidos del objeto => objeto.protected_methods

las clases poseen dos distintos tipos de métodos para ellos y para sus instancias:
  - para las clases => Class.public/protected/private_methods
  - para las instancias => Class.public/protected/private_instance_methods

operaciones entre arrays:
  - restar dos arrays => array - other_array
  - intersección de dos arrays => array & other_array

obtener todas las clases que tengan determinado módulo => ObjectSpace.each_object(Class).select { |c| c.ancestors.include?(Modulo) }

obtener los métodos singleton de un objeto => objeto.singleton_methods, pero no devuelve los métodos singleton que son privados

obtener los métodos singleton privados de un objeto => class << objeto; p private_instance_methods(false); end

ver las variables locales que han sido creadas (depende del scope) => local_variables

ver las variables globales => global_variables

saber que variables de instancia estan inicializadas dentro del objeto => objeto.instance_variables

variable _ en irb => esta variable es única que es creada por irb para almacenar la última expresión

ver el stacktrace que se está realizando => p caller, el método caller muestra en un array de strings

realizar testing con minitest:
  - requerir la librería de minitest => require 'minitest/autorun'
  - hacer que la clase herede los métodos de minitest => class ClaseTest < Minitest::Test; funcionalidades de testeo; end
  - tener un funcionalidades creadas antes para todos los métodos => def setup; funcionalidades; end
  - minitest testea todos los métodos que empiecen con test_ => def test_nombre; testing; end
  - asertar cuando sea igual => assert_equal(valor_esperado, valor)

side effect => es virtualmente todo lo que un método puede hacer aparte de retornar un valor, como modificar una variable, lanzar una exception y poniendo texto en el output de la consola
  los mayores ejemplos de side effects son los métodos bang

realizar un mapeo de todos los elementos del array eliminando a medida que se avanza => array.reduce(:operador), el operador puede ser +, -, *, /

pure function => es cuando la función no tiene ningún side effect y solo depende de sus parametros

referentially transparent => la función reemplazará al valor de la expresión sin alterar el estado del programa Ruby

comprobar si un objeto esta frezeado => objeto.frozen?

frozen string literal => la versión de Ruby 3.0 para adelante freezeara los strings, volviendolos inmutables
  - cuando se crean strings que tengan los mismos caracteres también tendran los mismos object_id, se parecerán más a los integers
  - se puede activar esto en versiones anteriores de Ruby con:
    al ejecutar archivos => ruby --enable-frozen-string-literal nombre_archivo.rb
    dentro del archivo a ejecutar => # frozen_string_literal: true
    poder usarlo en una session de irb => RUBYOPT=--enable-frozen-string-literal irb
  - una forma de crear unfrozen strings => String.new("string")

higher-order functions => son donde un proc es tomado como argumento (los bloques) o la función devuelve un proc

devolver el mismo objeto => objeto.itself

manejar el objeto en un bloque y devolver el último valor del bloque => objeto.yield_self { |obj| intrucciones y ultima linea se devolverá }
  - la diferencia con tap es que retornar el último valor del bloque y tap retorna el objeto mismo

realizar curry y funciones parciales =>
  - habilitar el lambda para que nos permita retornar funciones => funcion_curry = variable_lamda.curry
    - también se puede utilizar con métodos => method(:nombre_metodo).curry, lo convierte a lambda
  - cuando se necesite avanzar parcialmente en el lambda con los argumentos que se le pasan => funcion_con_una_variable = funcion_curry.(argumento), en este caso esta almacenandose el lambda ya con
      un argumento pasado
    también se pueden pasar múltiples argumentos funcion_curry.(valor, valor, ...)
  - también se pueden manejar cuando los lambdas manejan un argumento opcional => variable_lambda = (*variables) { funcionalidad }
    - se puede pasar directamente los valores => variable_lambda.curry.(valor, valor, ...)
    - se limita la cantidad de argumentos  que se usará el curry => variable_lambda.curry(cantidad), hasta que no se cumpla la cantidad de argumentos no se ejecutará el lambda
  - el operador .(valor, ..) es un shorthand de .call(valor, ..)

stack overflow errors => cuando se generan una gran cantidad de subrutinas que el interprete de Ruby debe evaluar pero crecen tanto que la máquina no lo puede manejar

tail-call optimization => para evitar problemas de rendimiento y lentitud cuando se realiza recursividad es que exista un método que su instrucción final sea llamarse a si mismo
  def metodo(argumentos...); funcionalidad y llamarse a si mismo metodo(argumentos...); end

modificar las opciones de compilado para poder evaluar gran cantidad sin que se lance el error de SystemStackError por manejar muchos valores =>
  RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true, trace_instruction: false }

system call, ver los datos de los inodes => File::stat('archivo')

realizar peticiones para consumir API =>
  - instalar gema rest-client => gem install rest-client y luego requerirla en el archivo
  - realizar una consulta get => RestClient.get(url), esto nos da una respuesta que necesitaremos convertir en JSON
    - manejar por 3 atributos en un bloque response, request, result => RestClient.get(url) { |response, request, result| funcionalidad }
  - realizar método post => RestClient.post(url, { payload })

usar redis para mejorar la performancia =>
  - instalar redis en el sistema op => sudo apt install redis-server
  - instalar la gema => gem install redis
  - usar la librería => require 'redis'
  - crear una instancia de redis => Redis.new también le podemos pasar argumentos para indicar el host, puerto y la bd (se manejan con numeros) Redis.new(host: host, port: port, db: 0|15|..)
  - guardar un valor en redis => redis.set "key", valor
  - obtener el valor guardado => redis.get "key"
