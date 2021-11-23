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
		
		
		3.times({p => paneles.add(new Panel(position = utilidadesParaJuego.posicionArbitraria()))})
        paneles.forEach({p => game.addVisual(p)})
		
		3.times({p => cajas.add(new Caja(position = utilidadesParaJuego.posicionArbitraria()))})
        cajas.forEach({p => game.addVisual(p)})
		
		
		const booster1 = new Booster(position = utilidadesParaJuego2.posicionArbitraria())
		game.addVisual(booster1)
		
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		game.addVisual(saludAlien)
		game.addVisual(energiaAlien)
		
		game.whenCollideDo(alien, {elemento => elemento.alColisionar()})
		cajas.forEach({caja => game.whenCollideDo(caja, {elemento => elemento.alColisionar()})})
		
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
