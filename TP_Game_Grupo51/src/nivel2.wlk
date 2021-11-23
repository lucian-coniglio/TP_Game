import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import nivel1.*
import elementos.*

object nivel2 {
	//Coleccion para usar elementos, agregarlos al crear el nivel
	const property elementos = []
	const property elementos2 = []
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="Fondo_Area_51.png"))
		
		self.agregarElementos()
		
		// Salud y energia del personaje
		game.addVisual(energiaAlien)
		game.addVisual(saludAlien)
		game.addVisual(dineroAlien)
		
		//Desabilitado Innecesario
		//keyboard.e().onPressDo{game.say(alien, "energia: " + alien.energia())}
		//keyboard.q().onPressDo{game.say(alien, "salud: " +  alien.salud())}
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		// teclado
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()} else {nivel1.perder()}}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()} else {nivel1.perder()}}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()} else {nivel1.perder()}}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()} else {nivel1.perder()}}
		
		game.whenCollideDo(alien, {elemento => elemento.alColisionar() 
			elementos.remove(elemento) 
			self.comprobarVictoria()
			self.comprobarDerrota()
		} )
		keyboard.e().onPressDo{elementos.filter({elem => utilidadesParaJuego2.puedeRecogerse(elem)}).forEach({elem => 
			elem.usar() 
			elementos.remove(elem) 
			self.comprobarVictoria()
		})}
		
		
		keyboard.g().onPressDo({ self.ganar() })
	}
	method comprobarVictoria() {
		if(elementos.isEmpty()) {self.ganar()}
	}
	
	method comprobarDerrota() {
		if (alien.energia() <= 0 or alien.salud() <= 0) {nivel1.perder()}
	}
	
	method ganar() {
		game.schedule(200, {
			game.clear()
			game.addVisual(new Fondo(image="Fondo_Victoria_nivel1.png"))
			game.addVisual(nivelSuperado)
			game.schedule(2500, {
				game.clear()
				game.addVisual(new Fondo(image="Fondo_Ganamos.png"))
				game.addVisual(victoriaDefinitiva)
				game.schedule(3000, {
					game.stop()
				})
			})
		})
	}
	method agregarElementos() {
		2.times({p => elementos2.add(new Enemigo(position = utilidadesParaJuego.posicionArbitraria()))})
		elementos.add(new Nanomaquinas(position = utilidadesParaJuego2.posicionArbitraria()))
		2.times({p => elementos2.add(new Trampa(position = utilidadesParaJuego.posicionArbitraria()))})
		2.times({p => elementos.add(new Materia(position = utilidadesParaJuego.posicionArbitraria()))})
		elementos2.add(new Teletransportador(position = utilidadesParaJuego2.posicionArbitraria()))
		5.times({p => elementos.add(new Dinero(position = utilidadesParaJuego.posicionArbitraria()))})
		
		elementos.forEach({elem => game.addVisual(elem)})
		elementos2.forEach({elem => game.addVisual(elem)})
	}
	

}
