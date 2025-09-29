import extras.*
import comidas.*
import niveles.*
import wollok.game.*

object pepita {
	const posicionInicial = game.at(0,1)
	const energiaInicial = 100
	const predador = silvestre
	const hogar = nido
	const joules = 9

	var property position = posicionInicial
	var energia = energiaInicial
	var property atrapada = false
	var ultimaDireccion = null

	method inicializar() {
		position = game.at(0,1)
		energia = energiaInicial
		atrapada = false
	}

	method image() {
		return "pepita-" + self.estado() + ".png"
	}

	method estado() {
		return if (!self.puedeMover()) { "gris" }
		  else if (self.enHogar()) { "grande"  }
			else { "base" }
	}

	method puedeMover() = 
		energia >= self.energiaNecesaria(1) && not self.atrapada()

	method comerAca(comida){
		self.comer(comida)
		comida.andate()
	}
	
	method teAtraparon() {
		self.atrapada(true)
		game.say(self, "Me atraparon!")
		controlador.perder()
	}

	method enHogar() = self.estaSobre(hogar)

	method estaSobre(alguien) = position == alguien.position()
		
	method text() = "Energia: \n" + energia

	method textColor() = "FF0000"

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method energiaNecesaria(kms) = joules * kms

	method volar(kms) {
		energia -= self.energiaNecesaria(kms) 
	}

	method mover(direccion){
		if(self.puedeMover()){
			self.volar(1)
			position = direccion.siguiente(position)
			ultimaDireccion = direccion
		} else {
			controlador.perder()
		}
	}

	method energia() {
		return energia
	}

	method encontraste(algo) {
		algo.queHagoConVos(self)
	}

	method ganaste() {
		game.say(self, "Ganaste!")
		controlador.subirDeNivel()
	}
}






