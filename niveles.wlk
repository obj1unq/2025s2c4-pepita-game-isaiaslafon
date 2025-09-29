import pepita.*
import extras.*
import comidas.*
import direcciones.*
import wollok.game.*

object controlador {
	var nivelActual = 0
	const niveles = [nivel1, nivel2]

	method inicializar() {
		game.clear()
		niveles.get(nivelActual).inicializar()
		pepita.inicializar()
	}

	method subirDeNivel() {
		nivelActual += 1
		self.inicializar()
	}

	method perder() {
		game.say(pepita, "Perdiste, presiona la R para reiniciar")
		keyboard.r().onPressDo {
			nivelActual = 0
			self.inicializar()
		}
	}
}

object nivel1 {
	method inicializar() {
		const personajes = [ nido, silvestre, alpiste, manzana, pepita ]
		personajes.forEach { el => game.addVisual(el) }

		keyboard.up().onPressDo { pepita.mover(arriba) }
		keyboard.down().onPressDo { pepita.mover(abajo) }
		keyboard.left().onPressDo { pepita.mover(izquierda) }
		keyboard.right().onPressDo { pepita.mover(derecha) }

    game.onCollideDo(pepita, { algo => pepita.encontraste(algo) })
	}
}

object nivel2 {
	method inicializar() {
		const personajes = [nido, silvestre, manzana, pepita]
		personajes.forEach { el => game.addVisual(el) }

		keyboard.up().onPressDo { pepita.mover(arriba) }
		keyboard.down().onPressDo { pepita.mover(abajo) }
		keyboard.left().onPressDo { pepita.mover(izquierda) }
		keyboard.right().onPressDo { pepita.mover(derecha) }

    game.onCollideDo(pepita, { algo => pepita.encontraste(algo) })
	}
}