import wollok.game.*

object utilidadesParaJuego {
	method posicionArbitraria() {
		return game.at(
			0.randomUpTo(game.width()).truncate(0), 0.randomUpTo(game.height()).truncate(0)
		)
	}
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

