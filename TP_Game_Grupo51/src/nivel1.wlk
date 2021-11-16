import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import utilidades.*

object nivel1 {
	//Collecion para usar elementos, agregarlos al crear el nivel
	const property paneles = []
	const property cajas = []
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="Fondo_Area_51.png"))
		
		const panel1 = new Panel(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(panel1)
		paneles.add(panel1)
		const panel2 = new Panel(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(panel2)
		paneles.add(panel2)
		const panel3 = new Panel(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(panel3)
		paneles.add(panel3)
		
		const caja1 = new Caja(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(caja1)
		cajas.add(caja1)
		const caja2 = new Caja(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(caja2)
		cajas.add(caja2)
		const caja3 = new Caja(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(caja3)
		cajas.add(caja3)
		
		const booster1 = new Booster(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(booster1)
		
		//al ejecutar tira un error
		//game.addVisual(saludAlien)
		//game.addVisual(energiaAlien)
		//game.addVisual(alien.energia().toString())
		//game.addVisual(alien.salud().toString())
		
		//preferible, por ahora, que se lo pregunte
		keyboard.e().onPressDo{game.say(alien,"energia: " + alien.energia())}
		keyboard.q().onPressDo{game.say(alien, "salud: " + alien.salud())}
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		game.whenCollideDo(alien, {elemento => elemento.alColisionar()})
		game.whenCollideDo(caja1, {elemento => elemento.alColisionar()})
		game.whenCollideDo(caja2, {elemento => elemento.alColisionar()})
		game.whenCollideDo(caja3, {elemento => elemento.alColisionar()})
		
		// teclado
		
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()}}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()}}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()}}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()}}
		
		//Usar elementos
		
		
		// este es para probar, no es necesario dejarlo
		keyboard.t().onPressDo({ self.terminar() })

		// en este no hacen falta colisiones*/
	}
	method terminar() {
		game.schedule(200, {
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
					nivel2.configurate()
				})
			})
		})
	}
	method comprobarVictoria() {
		if(paneles.all({panel => panel.estaOcupado()})) {self.terminar()}
	}
}
