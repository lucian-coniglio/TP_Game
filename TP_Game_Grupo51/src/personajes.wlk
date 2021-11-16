import wollok.game.*
import utilidades.*
import elementos.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object alien {
	var property position = game.at(10,8)
	var property image = "Alien_frente.png"
	var property energia = 30
	var property salud = 30
	var property dinero = 0
	//Direccion para usar durante colision
	var property ultimaDireccion = "arriba"
	
	method consumir(cantEnergia) {
		energia += cantEnergia
		energiaAlien.energia(energia)
	}
	method curar(cantSalud) {
		salud += cantSalud
		saludAlien.salud(salud)
	}
	method daniar(cantDanio) {
		salud -= cantDanio
		saludAlien.salud(salud)
	}
	method ahorra(cantDinero) {
		dinero += cantDinero
	}
	
	method tieneEnergia() = energia > 0
	method hayElementosCerca(tipo) {}
	
	method subir() {
		image = "Alien_atrás.png"
		if (position.y() == game.height() - 1) {position = game.at(position.x(), 0)}
		else {position = position.up(1)}
		energia -= 1
		ultimaDireccion = "arriba"
		energiaAlien.energia(energia)
	}
	method bajar() {
		image = "Alien_frente.png"
		if (position.y() == 0) {position = game.at(position.x(), game.height() - 1)}
		else {position = position.down(1)}
		energia -= 1
		ultimaDireccion = "abajo"
		energiaAlien.energia(energia)
	}
	method derecha() {
		image = "Alien_derecha.png"
		if (position.x() == game.width() - 1) {position = game.at(0, position.y())}
		else {position = position.right(1)}
		energia -= 1
		ultimaDireccion = "derecha"
		energiaAlien.energia(energia)
	}
	method izquierda() {
		image = "Alien_izquierda.png"
		if (position.x() == 0) {position = game.at(game.width() - 1, position.y())}
		else {position = position.left(1)}
		energia -= 1
		ultimaDireccion = "izquierda"
		energiaAlien.energia(energia)
	}
}
