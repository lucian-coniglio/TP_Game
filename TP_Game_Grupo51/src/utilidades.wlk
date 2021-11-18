import elementos.*
import wollok.game.*
import personajes.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
}
object utilidadesParaJuego2 {
	const pos = game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0) )
	method posicionArbitraria() {
		
		if (posArbitrariasUsadas.laPosicionEstaUsada(pos)) {
			return utilidadesParaJuego.posicionArbitraria()
		}
		else {
			posArbitrariasUsadas.agregarPosicion(pos)
			return pos
		}
	}
	method puedeRecogerse(elem) {
		return posicion.seEncuentranCerca(alien, elem)
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
	const property position = game.at(1, game.height() - 1)
	method text() = "Energia: " + alien.energia().toString()
	method textColor() = "00FF00FF"
	method alColisionar() {}
}

//Mostrar salud del alien en pantalla
object saludAlien {
	const property position = game.at(1, game.height() - 3)
	method text() = "Salud: " + alien.salud().toString()
	method textColor() = "FF0000FF"
	method alColisionar() {}
}

object posicion {
	//Verifica que dos elementos esten a una sola posicion de distancia del otro
	method seEncuentranCerca(elem1, elem2) {
		return elem1.position().y() == elem2.position().y() and (elem2.position().x() - elem2.position().x()).abs() == 1
		or elem1.position().x() == elem2.position().x() and (elem1.position().y() - elem2.position().y()).abs() == 1
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
