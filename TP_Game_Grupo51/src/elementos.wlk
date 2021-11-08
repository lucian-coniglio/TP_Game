import wollok.game.*
import utilidades.*
import personajes.*

class Bloque {
	var property position
	const property image = "Enemigo.png" 	
	
	// agregar comportamiento	
	method usar()
	method alColisionar() {}
}

// Elemento que da energia al personaje
class Materia inherits Bloque {
	override method usar() {alien.consumir(1.randomUpTo(30) ) }
}

// Elemento que da salud al personaje
class Nanomaquinas inherits Bloque {
	override method usar() {alien.curar(1.randomUpTo(30) ) }
}

//Elemento coleccionable
class TarjetaAcceso inherits Bloque {
	const property image = //Agregar imagen de tarjeta
}

// Trampa que quita 15 energia
class Trampa inherits Bloque {
	const property image =
	override method usar() {}
	override method alColisionar() {alien.daniar(15)}
}

// Trampa que aumenta 15 energia
class Booster inherits Bloque {
	const property image =
	override method usar() {}
	override method alColisionar() {alien.consumir(30)}
}

// Trampa que cambia de lugar al personaje
class Teletransportador inherits Bloque {
	const property image =
	override method usar() {}
	override method alColisionar() {alien.position(utilidadesParaJuego.posicionArbitraria() ) }
}


