
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
	const pos = game.at(0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0) )
	method posicionArbitraria() {
		
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

object posicion {
	//Verifica que dos elementos esten a una sola posicion de distancia del otro
	method seEncuentranCerca(elem1, elem2) {
		return (elem1.position().y() == elem2.position().y() and elem2.position().x() - elem2.position().x().abs() == 1)
		or (elem1.position().x() == elem2.position().x() and elem1.position().y() - elem2.position().y().abs() == 1)
	}
}

<<<<<<< HEAD
=======
object elementosEnNivel {
	const property elementos = []
	method agregarElem(elemento) {elementos.add(elemento)}
	method vaciarColeccion() {elementos.clear()}
}

>>>>>>> branch 'main' of https://github.com/lucian-coniglio/TP_Game.git
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
