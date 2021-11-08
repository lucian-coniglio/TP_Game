import wollok.game.*
import utilidades.*
import personajes.*

class Bloque {
	var property position
	const property image = "Enemigo.png" 	
	
	// agregar comportamiento	
	method usar()
	method alColisionar() {}
	//Metodo para empujar elemenos empujables en nivel2
	method subir() {
		if (position.y() == game.height() - 1) {position = game.at(position.x(), 0)}
		else {position = position.up(1)}
	}
	method bajar() {
		if (position.y() == 0) {position = game.at(position.x(), game.height() - 1)}
		else {position = position.down(1)}
	}
	method derecha() {
		if (position.x() == game.width() - 1) {position = game.at(0, position.y())}
		else {position = position.right(1)}
	}
	method izquierda() {
		if (position.x() == 0) {position = game.at(game.width() - 1, position.y())}
		else {position = position.left(1)}
	}
}

// Elemento que da energia al personaje
class Materia inherits Bloque {
	const property image = //Agregar imagen
	override method usar() {alien.consumir(1.randomUpTo(30) ) }
}

// Elemento que da salud al personaje
class Nanomaquinas inherits Bloque {
	const property image = //Agregar imagen
	override method usar() {alien.curar(1.randomUpTo(30) ) }
}

//Elemento coleccionable
class TarjetaAcceso inherits Bloque {
	const property image = //Agregar imagen de tarjeta
	override method usar() {}
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
//Testear Colision
class Caja inherits Bloque {
	const property image =
	override method usar() {}
	override method alColisionar() {
		if (alien.ultimaDireccion == "arriba") {
			self.subir()
		}
		else if (alien.ultimaDireccion == "abajo") {
			self.bajar()
		}
		else if (alien.ultimaDireccion == "derecha") {
			self.derecha()
		}
		else {
			self.izquierda()
		}
	}
}


