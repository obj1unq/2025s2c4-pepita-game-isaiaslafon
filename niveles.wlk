import pepita.*
import extras.*
import comidas.*
import direcciones.*
import wollok.game.*

object nivel1 {
	method inicializar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(alpiste)
		game.addVisual(manzana)

		game.addVisual(pepita)

		keyboard.up().onPressDo { pepita.mover(arriba) }
		keyboard.down().onPressDo { pepita.mover(abajo) }
		keyboard.left().onPressDo { pepita.mover(izquierda) }
		keyboard.right().onPressDo { pepita.mover(derecha) }
		keyboard.c().onPressDo { pepita.comerAca() }		
	}
}