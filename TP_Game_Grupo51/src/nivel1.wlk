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
		
		//Testear times() 2 formas si funcionan las 2 dejar la primera
		/* 
		3.times({paneles.add(new Panel(position = utilidadesParaJuego2.posicionArbitraria()))})
		paneles.forEach({p => game.addVisual(p)})
		*/
		
		/* 
		3.times({e => e = new Panel(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(e)
		paneles.add(e)})
		 */
		
		const panel1 = new Panel(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(panel1)
		paneles.add(panel1)
		const panel2 = new Panel(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(panel2)
		paneles.add(panel2)
		const panel3 = new Panel(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(panel3)
		paneles.add(panel3)
		
		
		//Testear times() 2 formas si funcionan las 2 dejar la primera
		/* 
		 3.times({cajas.add(new Caja(position = utilidadesParaJuego2.posicionArbitraria()))})
		 * cajas.forEach({c => game.addVisual(c)})
		 */
		
		/*
		 *3.times({c => c = Caja(position = utilidadesParaJuego2.posicionArbitraria())
		 * game.addVisual(c)
		 * cajas.add(c)
		 * }) 
		 */
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
		
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		game.addVisual(saludAlien)
		game.addVisual(energiaAlien)
		
		game.whenCollideDo(alien, {elemento => elemento.alColisionar()})
		game.whenCollideDo(caja1, {elemento => elemento.alColisionar()})
		game.whenCollideDo(caja2, {elemento => elemento.alColisionar()})
		game.whenCollideDo(caja3, {elemento => elemento.alColisionar()})
		
		// teclado
		
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()} else {self.perder()}}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()} else {self.perder()}}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()} else {self.perder()}}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()} else {self.perder()}}
		
		//Usar elementos TESTEAR
		//keyboard.e().onPressDo{elementos.forEach({elemento => if (posicion.seEncuentranCerca(alien, elemento)) {elemento.usar()} else {} } ) }
		
		// este es para probar, no es necesario dejarlo
		keyboard.t().onPressDo({ self.terminar() })

		// en este no hacen falta colisiones*/
	}
	
	method perder() {
		game.schedule(100, {
			game.clear()
			game.addVisual(new Fondo(image="Fondo_Derrota.png"))
			game.addVisual(derrota)
			game.schedule(2500, {game.stop()})
		})
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
	method comprobarDerrota() {
		if (alien.energia() <= 0 and alien.salud() <= 0) {self.perder()}
	}
}
