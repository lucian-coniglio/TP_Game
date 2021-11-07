import wollok.game.*
import utilidades.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object alien {
	var property position = game.at(10,8)
	const property image = "Alien_frente.png"
	var energia = 30
	var salud = 30
	
	method consumir(cantEnergia) {energia += cantEnergia}
	method curar(cantSalud) {salud += cantSalud}
	method daniar(cantDanio) {salud -= cantDanio}
	
	method subir() {
		if (position.y() == game.height() - 1) {position = game.at(position.x(), 0)}
		else {position = position.up(1)}
	}
	method bajar() {
		if (position.y() == 0) {position = game.at(position.x(), game.height() - 1)}
		else {position = position.down(1)}
	}
	method derecha() {
		if (position.x() == game.width() - 1) {position = game.at(0, position.y())}
		else {position = position.right(1)}
	}
	method izquierda() {
		if (position.x() == 0) {position = game.at(game.width() - 1, position.y())}
		else {position = position.left(1)}
	}
	
	method usarItem() {
			
	}
	
}

