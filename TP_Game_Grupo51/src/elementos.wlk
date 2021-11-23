import wollok.game.*
import utilidades.*
import personajes.*
import nivel1.*
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
	method usar() {game.removeVisual(self)}
	method alColisionar() {game.removeVisual(self)}
}
class Enemigo inherits Elemento {
	const property image = "Enemigo.png"
	override method usar() {}
	override method alColisionar() {
		alien.daniar(5)
		alien.position(game.center())
	}
}

// Elemento que da energia al personaje
class Materia inherits Elemento {
	const property image = "Materia.png"
	override method usar() {
		super()
		alien.consumir(1.randomUpTo(30).truncate(0))
	}
	override method alColisionar() {
		super()
		alien.consumir(1.randomUpTo(30).truncate(0))
	}
}

// Elemento que da salud al personaje
class Nanomaquinas inherits Elemento {
	const property image = "Nanomaquina.png"
	override method usar() {
		super()
		alien.curar(5.randomUpTo(15).truncate(0) )
	}
	override method alColisionar() {
		super()
		alien.curar(1.randomUpTo(15).truncate(0))
	}
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
	override method alColisionar() {super() alien.daniar(15)}
}

// Trampa que aumenta 15 energia
class Booster inherits Elemento {
	const property image = "Energizante.png"
	override method usar() {}
	override method alColisionar() {alien.consumir(30) alien.daniar(1) position = utilidadesParaJuego2.posicionArbitraria()}
}

// Trampa que cambia de lugar al personaje
class Teletransportador inherits Elemento {
	const property image = "Teletransportador.png"
	override method usar() {}
	override method alColisionar() {alien.position(utilidadesParaJuego.posicionArbitraria()) }
}
//Testear Colision
class Caja inherits Elemento {
	const property image = "Caja.png"
	override method usar() {}
	override method alColisionar() {
		//Testear, deberia mover el elemento teniendo en cuanta la ultima dir del alien
		alien.ultimaDireccion().mover(self)
		/* 
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
		*/
		nivel1.comprobarVictoria()
	}
}
// Elemento que da dinero y quita salud 
class Dinero inherits Elemento {

	const property image = "Billete.png"

	override method usar() {
		super()
		alien.ahorra(3)
		alien.daniar(5)
	}

	override method alColisionar() {
		super()
		alien.ahorra(3)
		alien.daniar(5)
	}

}

class Panel inherits Elemento{
	const property image = "Panel.png"
	override method usar() {}
	override method alColisionar() {}
	method estaOcupado() = nivel1.cajas().any({caja => caja.position() == self.position()})
}
