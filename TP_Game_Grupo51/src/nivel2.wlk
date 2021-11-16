import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import nivel1.*
import elementos.*

object nivel2 {
	//Collecion para usar elementos, agregarlos al crear el nivel
	const property elementos = []
	
	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="Fondo_Area_51.png"))
		
		const guardia1 = new Enemigo(position = game.at(3,12))
		const maquina1 = new Nanomaquinas(position = game.at(7,4))
		const trampa1 = new Trampa(position = game.at(3,8))
		const materia1 = new Materia(position = game.at(11, game.height()-1))
		
		game.addVisual(guardia1)
		game.addVisual(maquina1)
		elementos.add(maquina1)
		game.addVisual(trampa1)
		game.addVisual(materia1)
		elementos.add(materia1)
		
		game.addVisual(energiaAlien)
		game.addVisual(saludAlien)
		
		keyboard.e().onPressDo{game.say(alien, "energia: " + alien.energia())}
		keyboard.q().onPressDo{game.say(alien, "salud: " +  alien.salud())}
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(alien)
		
		// teclado
		keyboard.w().onPressDo{if (alien.tieneEnergia()) {alien.subir()}}
		keyboard.d().onPressDo{if (alien.tieneEnergia()) {alien.derecha()}}
		keyboard.a().onPressDo{if (alien.tieneEnergia()) {alien.izquierda()}}
		keyboard.s().onPressDo{if (alien.tieneEnergia()) {alien.bajar()}}
		
		game.whenCollideDo(alien, {elemento => elemento.alColisionar() elementos.remove(elemento) self.comprobarVictoria()} )
		keyboard.r().onPressDo{elementos.filter({elem => utilidadesParaJuego2.puedeRecogerse(elem)})
			.forEach({elem => elem.usar() elementos.remove(elem) self.comprobarVictoria()})}
		
		game.whenCollideDo(alien, {elemento => elemento.alColisionar() elementos.remove(elemento) self.comprobarVictoria()} )
		
		keyboard.g().onPressDo({ self.ganar() })
	}
	method comprobarVictoria() {
		if(elementos.isEmpty()) {self.ganar()}
	}
		
	
	method ganar() {
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
	}
	

}
