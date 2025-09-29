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
		const personajes = [ nido, silvestre, alpiste, 
			new Manzana(position = game.at(4,4)), 
			new Manzana(position = game.at(6,6), madurez = 10), 
			pepita 
		]
		personajes.forEach { el => game.addVisual(el) }

		const muros = (3..7).map { y => new Muro(position = game.at(3, y)) }
		muros.forEach { muro => game.addVisual(muro) }

		keyboard.up().onPressDo { pepita.mover(arriba) }
		keyboard.down().onPressDo { pepita.mover(abajo) }
		keyboard.left().onPressDo { pepita.mover(izquierda) }
		keyboard.right().onPressDo { pepita.mover(derecha) }

    game.onCollideDo(pepita, { algo => pepita.encontraste(algo) })
	}
}

object nivel2 {
	method inicializar() {
		const personajes = [nido, silvestre, new Manzana(position = game.at(1,1)), pepita]
		personajes.forEach { el => game.addVisual(el) }

		keyboard.up().onPressDo { pepita.mover(arriba) }
		keyboard.down().onPressDo { pepita.mover(abajo) }
		keyboard.left().onPressDo { pepita.mover(izquierda) }
		keyboard.right().onPressDo { pepita.mover(derecha) }

    game.onCollideDo(pepita, { algo => pepita.encontraste(algo) })
	}
}