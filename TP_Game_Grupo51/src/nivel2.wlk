import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import nivel1.*
import elementos.*

object nivel2 {
	//Coleccion para usar elementos, agregarlos al crear el nivel
	const property elementos = []
	
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
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()} self.comprobarDerrota()}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()} self.comprobarDerrota()}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()} self.comprobarDerrota()}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()} self.comprobarDerrota()}
		
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
		const guardia1 = new Enemigo(position = utilidadesParaJuego2.posicionArbitraria())
		const guardia2 = new Enemigo(position = utilidadesParaJuego2.posicionArbitraria())
		const maquina1 = new Nanomaquinas(position = utilidadesParaJuego2.posicionArbitraria())
		const trampa1 = new Trampa(position = utilidadesParaJuego2.posicionArbitraria())
		const materia1 = new Materia(position = utilidadesParaJuego2.posicionArbitraria())
		const teletransportador = new Teletransportador(position = utilidadesParaJuego2.posicionArbitraria())
		const trampa2 = new Trampa(position = utilidadesParaJuego2.posicionArbitraria())
		const materia2 = new Materia(position = utilidadesParaJuego2.posicionArbitraria())
		const dinero1 = new Dinero(position = utilidadesParaJuego2.posicionArbitraria())
		const dinero2 = new Dinero(position = utilidadesParaJuego2.posicionArbitraria())
		const dinero3 = new Dinero(position = utilidadesParaJuego2.posicionArbitraria())
		const dinero4 = new Dinero(position = utilidadesParaJuego2.posicionArbitraria())
		const dinero5 = new Dinero(position = utilidadesParaJuego2.posicionArbitraria())
		
		game.addVisual(guardia1)
		game.addVisual(guardia2)
		game.addVisual(maquina1)
		elementos.add(maquina1)
		game.addVisual(trampa1)
		game.addVisual(materia1)
		elementos.add(materia1)
		game.addVisual(trampa2)
		game.addVisual(materia2)
		elementos.add(materia2)
		game.addVisual(teletransportador)
		game.addVisual(dinero1)
		game.addVisual(dinero2)
		game.addVisual(dinero3)
		game.addVisual(dinero4)
		game.addVisual(dinero5)
		elementos.add(dinero1)
		elementos.add(dinero2)
		elementos.add(dinero3)
		elementos.add(dinero4)
		elementos.add(dinero5)
	}
	

}
