import wollok.game.*
import utilidades.*
import personajes.*
class Elemento {
	var property position
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
	// agregar comportamiento	
	method usar() {}
	method alColisionar() {}
}
class Enemigo inherits Elemento {
	const property image = "Enemigo.png"
	
}

// Elemento que da energia al personaje
class Materia inherits Elemento {
	const property image = "Materia.png"
	override method usar() {alien.consumir(1.randomUpTo(30) ) }
}

// Elemento que da salud al personaje
class Nanomaquinas inherits Elemento {
	const property image = "Nanomaquina.png"
	override method usar() {alien.curar(1.randomUpTo(30) ) }
}

//Elemento coleccionable
class TarjetaAcceso inherits Elemento {
	const property image = "Tarjeta.png"
	override method usar() {}
}

// Trampa que quita 15 energia
class Trampa inherits Elemento {
	const property image = "Trampa.png"
	override method usar() {}
	override method alColisionar() {alien.daniar(15)}
}

// Trampa que aumenta 15 energia
class Booster inherits Elemento {
	const property image = "Energizante.png"
	override method usar() {}
	override method alColisionar() {alien.consumir(30)}
}

// Trampa que cambia de lugar al personaje
class Teletransportador inherits Elemento {
	const property image = "Teletransportador.png"
	override method usar() {}
	override method alColisionar() {alien.position(utilidadesParaJuego.posicionArbitraria() ) }
}
//Testear Colision
class Caja inherits Elemento {
	const property image = "Caja.png"
	method estaBienPosicionada() {}
	override method usar() {}
	override method alColisionar() {
		if (alien.ultimaDireccion() == "arriba") {
			self.subir()
		}
		else if (alien.ultimaDireccion() == "abajo") {
			self.bajar()
		}
		else if (alien.ultimaDireccion() == "derecha") {
			self.derecha()
		}
		else {
			self.izquierda()
		}
	}
}
// Elemento que da dinero y quita salud 
class Dinero inherits Elemento {

	const property image = "dinero.png"

	override method usar() {
	}

	override method alColisionar() {
		alien.ahorra(3)
		alien.daniar(5)
	}

}
