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

	method loQueHayAca() = game.uniqueCollider(self)

	method comerAca(){
		const comida = self.loQueHayAca()
		self.comer(comida)
		comida.andate()
	}
	
	method teAtraparon() {
		self.atrapada(true)
		game.say(self, "Me atraparon!")
		self.perder()
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
		//energia = energia - 9 * kms
		//energia -= 9 * kms
		energia -= self.energiaNecesaria(kms) 
		//energia = energia - self.energiaNecesaria(kms)
	}

	method mover(direccion){
		if(self.puedeMover()){
			self.volar(1)
			position = direccion.siguiente(position)
		} else {
			self.perder()
		}
	}

	method perder(){
		game.say(self, "Perdiste, presiona la R para reiniciar")
		keyboard.r().onPressDo {
			game.clear()
			nivel1.inicializar()
			self.inicializar()
		}
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






