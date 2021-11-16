import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import utilidades.*

object nivelBloques {
	//Collecion para usar elementos, agregarlos al crear el nivel
	const property elementos = []
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="Fondo_Area_51.png"))
		
		const guardia1 = new Enemigo(position = game.at(3,12))
		const booster1 = new Booster(position = game.at(5,12))
		const maquina1 = new Nanomaquinas(position = game.at(7,4))
		
		//pruebas con colisiones y energia
		game.addVisual(guardia1)
		elementos.add(guardia1)
		game.addVisual(booster1)
		elementos.add(booster1)
		game.addVisual(maquina1)
		elementos.add(maquina1)
		
		//al ejecutar tira un error
		//game.addVisual(saludAlien)
		//game.addVisual(energiaAlien)
		
		//preferible, por ahora, que se lo pregunte
		keyboard.e().onPressDo{game.say(alien, alien.energia())}
		keyboard.q().onPressDo{game.say(alien, alien.salud())}
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		// teclado
		
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()}}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()}}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()}}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()}}
		
		//Usar elementos
		game.whenCollideDo(alien, {elemento => elemento.alColisionar() elementos.remove(elemento)} )
		
		// este es para probar, no es necesario dejarlo
		keyboard.t().onPressDo({ self.terminar() })

		// en este no hacen falta colisiones*/
	}
	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="Fondo_Victoria_nivel1.png"))
		game.addVisual(nivelSuperado)
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="Fondo_Victoria_nivel1.png"))
			game.addVisual(mensajeCargandoNivel2)
			// después de un ratito ...
			game.schedule(3000, {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
				nivelLlaves.configurate()
			})
		})
	}
}
