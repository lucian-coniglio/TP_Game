import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import nivel1.*
import elementos.*

object nivelLlaves {
	//Collecion para usar elementos, agregarlos al crear el nivel
	const property elementos = []
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="Fondo_Area_51.png"))
		
		//game.addVisual(energiaAlien)
		//game.addVisual(saludAlien)
		
		keyboard.e().onPressDo{game.say(alien, alien.energia())}
		keyboard.q().onPressDo{game.say(alien, alien.salud())}
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		// teclado
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()}}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()}}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()}}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()}}
		
		//Los elementos se utilizan al colisionar con ellos
		game.whenCollideDo(alien, {elemento => elemento.alColisionar() elementos.remove(elemento)} )
		
		// este es para probar, no es necesario dejarlo
		keyboard.g().onPressDo({ self.ganar() })

		// colisiones, acá sí hacen falta
		// faltan casos de movimiento/empujar
		
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
}
