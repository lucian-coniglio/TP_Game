import wollok.game.*
import utilidades.*
import personajes.*

class Bloque {
	var property position
	const property image = "Enemigo.png" 	
	
	// agregar comportamiento	
	method usar()
}

// Elemento que da energia al personaje
class Materia inherits Bloque {
	override method usar() {alien.consumir(1.randomUpTo(30) ) }
}

// Elemento que da salud al personaje
class Nanomaquinas inherits Bloque {
	override method usar() {alien.curar(1.randomUpTo(30) ) }
}
