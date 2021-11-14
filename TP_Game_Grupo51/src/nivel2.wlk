import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*

object nivelLlaves {
	//Collecion para usar elementos, agregarlos al crear el nivel
	const property elementos = []
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="Fondo_Area_51.png"))
				 
		// otros visuals, p.ej. bloques o llaves
		game.addVisual(alien.energia())
		game.addVisual(alien.salud())
		
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		// teclado
		
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()
			alien.energia(alien.energia() - 1) }
		}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()
			alien.energia(alien.energia() - 1) }
		}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()
			alien.energia(alien.energia() - 1) }
		}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()
			alien.energia(alien.energia() - 1) }
		}
		
		//Usar elementos si es que estan a una posicion de distancia del alien
		keyboard.e().onPressDo({elementosEnNivel.elementos().forEach({elem => if (posicion.seEncuentranCerca(alien, elem)) {elem.usar()} else {} } ) } )
		
		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })

		// colisiones, acá sí hacen falta
		// faltan casos de movimiento/empujar
		game.whenCollideDo(alien, {elemento => elemento.alColisionar() } )
	}
	
	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="Fondo_Victoria_nivel1.png"))
		game.addVisual(nivelSuperado)
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="Fondo_Ganamos.png"))
			game.addVisual(victoriaDefinitiva)
			// después de un ratito ...
			game.schedule(3000, {
				// fin del juego
				game.stop()
			})
		})
	}
	
	method comprobarSiGano() {
		if (elementos.all{ c => c.colisionoConTodos() and alien.tieneEnergia() }) {
			game.say(alien, "GANASTE")
			game.addVisual("puerta.png")
		}
	}

}
