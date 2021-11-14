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
	var dinero = 0
	//Direccion para usar durante colision
	var ultimaDireccion = "arriba"
	
	method consumir(cantEnergia) {energia += cantEnergia}
	method curar(cantSalud) {salud += cantSalud}
	method daniar(cantDanio) {salud -= cantDanio}
	method ahorra(cantDinero) {dinero += cantDinero}
	
	method tieneEnergia = energia > 0 
	
	method subir() {
		if (position.y() == game.height() - 1) {position = game.at(position.x(), 0)}
		else {position = position.up(1)}
		ultimaDireccion = "arriba"
	}
	method bajar() {
		if (position.y() == 0) {position = game.at(position.x(), game.height() - 1)}
		else {position = position.down(1)}
		ultimaDireccion = "abajo"
	}
	method derecha() {
		if (position.x() == game.width() - 1) {position = game.at(0, position.y())}
		else {position = position.right(1)}
		ultimaDireccion = "derecha"
	}
	method izquierda() {
		if (position.x() == 0) {position = game.at(game.width() - 1, position.y())}
		else {position = position.left(1)}
		ultimaDireccion = "izquierda"
	}
	//Metodo tentativo para usar items puede que sea mejor dejarlo en el nivel o elementos
	method usarItem() {
			
	}
	
	
}

