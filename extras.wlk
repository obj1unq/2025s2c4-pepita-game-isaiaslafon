import wollok.game.*
import pepita.*

object nido {
    const property position = game.at(8, 8)
    method image() = "nido.png"

    method queHagoConVos(alguien) {
        alguien.ganaste()
    }
}

object silvestre {
    const presa = pepita

    method image() = "silvestre.png"

    method position() = game.at(self.x(), 0)

    method x() = 3.max(presa.position().x()) //presa.position().x().max(3)
    //if(presa.position().x() >= 3) { presa.position().x()} else { 3 }

    method queHagoConVos(alguien) {
        alguien.teAtraparon()
    }
}

object muro {
    method image() = "muro.png"
    method position() = game.at(3, 3)

    method queHagoConVos(alguien) {
        alguien.retroceder()
    }
}