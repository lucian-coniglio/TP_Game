import wollok.game.*
import utilidades.*

class Bloque {
	var property position
	const property image = "Enemigo.png" 	
	
	// agregar comportamiento	
	method usar(personaje)
}

// Elemento que da energia al personaje
class Materia inherits Bloque {
	override method usar(personaje) {personaje.consumir(1.randomUpTo(30) ) }
}

// Elemento que da salud al personaje
class Nanomaquinas inherits Bloque {
	override method usar(personaje) {personaje.curar(1.randomUpTo(30) ) }
}

