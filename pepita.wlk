import extras.*
import comidas.*
import wollok.game.*

object pepita {
	var property position = game.at(0,1) //
	var energia = 100
    const predador = silvestre
    const hogar = nido

	//method image() = "pepita-base.png"
	method image(){
        return "pepita-" + self.estado() + ".png"
    }

	method estado(){
		return if (self.esAtrapada()){ "gris" }
		    	else if (self.enHogar()){ "grande"  }
				else { "base" }
	}

	method esAtrapada() = self.estaSobre(predador)

	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = position == alguien.position()
		
	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}

	method energia() {
		return energia
	}

	//Esto no se usa.
	method redibujarse(){
	  game.removeVisual(self)
	  game.addVisual(self)
	}
}






