import wollok.game.*
import personajes.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
}
// Testear
object utilidadesParaJuego2 {
	method posicionArbitraria() {
		var pos = game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0) )
		if (posArbitrariasUsadas.laPosicionEstaUsada(pos)) {
			return self.posicionArbitraria()
		}
		else {
			posArbitrariasUsadas.agregarPosicion(pos)
			return pos
		}
	}
}

// Registro de posiciones aleatorias usadas para no repetir
object posArbitrariasUsadas {
	const property posiciones = []
	method agregarPosicion(posicion) {posiciones.add(posicion)}
	method laPosicionEstaUsada(posicion) {return posiciones.contains(posicion)}
}

//Mostrar energia del alien en pantalla
object energiaAlien {
	const property position = game.at(game.height() - 1, 3)
	method text() = alien.energia()
}

//Mostrar salud del alien en pantalla
object saludAlien {
	const property position = game.at(game.height() - 1, 1)
	method text() = alien.salud()
	method textColor() = "FF0000FF"
}

object nivelSuperado {
	var property position = game.center()
	
	method text() = "Nivel Superado"
	
	method textColor() = "0000FFFF"
}
object mensajeCargandoNivel2 {
	var property position = game.center()
	
	method text() = "Cargando nivel 2..."
	
	method textColor() = "AAAAAAFF"
}

object victoriaDefinitiva {
	var property position = game.center()
	
	method text() = "Victoria Magistral!"
	
	method textColor() = "000000FF"
}

