separar un string mediante un regex => explode(regex, string)

agregar un nuevo valor a un array => array_push(array, valor);

poner en lowercase un string => strtolower(string);

especificar la version de PHP => en el archivo composer.json en el "require": { "php": "version" }

PHP 7.4:
	- se pueden lanzar excepciones dentro de los __toString de las clases
	- se agrego tipado fuerte => protected tipo $variable; (typed properties)
		los integers se pueden indicar también como "integer" y no saldrán errores porque PHP convierte los integers a string
	- fat arrows => fn($value) => algo, nos evita usar el use ($variable)
	- asignar un valor en una key del array => array['key'] ??= valor;
	- spread operator => [valor, ...$array];, no deben tener la misma key
	- personalizar el serialize => public function __serialize() { return valor; }
	- personalizar el unserialize => public function __unserialize() { valores; }

XAMPP => es un paquete de software que contiene distribuciones Apache para Apache server, MariaDB, PHP y Perl

imprimir información legible para humanos sobre una variable => print_r($variable);

filtrar elementos de un array usando una función callback => array_filter($objeto_array, function($value) { return condicion });
  - si no se pasa el callback entonces tomará por defecto que filtrará a los elementos que sean iguales a FALSE

devolver todos los valores de un array e indexar numéricamente el array => array_values($objeto_array);

obtener todos las keys del array => array_keys($objeto_array);

recorrer array => array_map(function($item) {}, $objeto_array);

combinar un array para utilizar como keys y un array de valores => array_combine($array_keys, $array_values); // deben tener la misma cantidad de valores los dos arrays

ordenar un array independientemente de las keys => sort($objeto_array, $sort_flags = SORT_REGULAR); // la función devuelve true si se cumplio el ordenamiento o false en caso de error
  - el segundo parametro es opcional, indicando como será el modo de ordenación

ordenar un array con las keys => asort($objeto_array, $sort_flags = SORT_REGULAR); // la función devuelve true si se cumplio el ordenamiento o false en caso de error
  - el segundo parametro es opcional, indicando como será el modo de ordenación
