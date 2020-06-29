import Isla.*

class Ave {
	 
	method fuerza()
	method recibirDisgusto()
	method relajarse()
	method estaConforme (isla)
	method alimentarseDe(isla)
	
}


class Aguiluchos inherits Ave {
	var property velocidad = 20 
	override method fuerza(){
		if(velocidad <= 60){return 180}
		else{return velocidad * 3}
	}
	override method recibirDisgusto(){velocidad *= 2}
	override method relajarse() { velocidad -= 10}
	override method estaConforme(isla) = isla.unidadesDeAlpiste() >= 8
	override method alimentarseDe(isla) {
		velocidad += 15
		isla.alimentarConAlpiste(3)
	}
}
class Albatros inherits Ave {
	var property masaMuscular = 600
	var property peso = 4000
	override method fuerza(){
		if(peso < 6000){return masaMuscular}
		else{return masaMuscular / 2}
	}
	override method recibirDisgusto(){peso +=800}
	method irAlGimnacio(){
		masaMuscular += 500
		peso += 500
	}
	override method relajarse() {peso -=300}
	override method estaConforme(isla) {
	const avesMasFuertes = isla.aves().count{ave=>ave.fuerza() > self.fuerza()}
	return avesMasFuertes >= 2	
	}
 	override method alimentarseDe(isla) {
		masaMuscular += 700
		peso += 700
		isla.alimentarConMaiz(4)
	}
}
class Palomas inherits Ave {
	var property ira = 200 
	
	override method fuerza() = ira *2
	override method recibirDisgusto(){ira +=300}
	override method relajarse() {ira -=50}
	override method estaConforme(isla) = isla.avesDebiles().size() >= 1
	method equilibrase() {
		if(self.fuerza() <= 700){
			self.recibirDisgusto()
		}
		else {self.relajarse()}
	}
	override method alimentarseDe(isla){}
}
class AguiluchoColorado inherits Aguiluchos {
	override method fuerza() =super() + 400 
}
class PalomaTorcaza inherits Palomas {
	var property huevos = 3
	
	override method recibirDisgusto(){
		super() 
		huevos += 1
	}
	override method fuerza() = super() + (huevos * 100)

}
class PalomaMontera inherits Palomas {
	var property topeDeFuerza = 2000
	var property fuerzaActual 
	override method fuerza() = fuerzaActual
		 method agregarFuerza(fuerzaASumar){
			fuerzaActual = (self.fuerza() + fuerzaASumar).min(topeDeFuerza)
	}
}
class PalomaManchada inherits Palomas {
	var property nidos = #{}
	method agregarNido(nido){ nidos.add(nido)}
	override method recibirDisgusto(){
		super()
		self.agregarNido(new Nidos())
	}
	override method relajarse(){
		super()
		nidos.forEach{nido=>nido.grosor() + 1}
	
	}
	override method ira(){
		if(nidos.size() > 2){
			return super() + nidos.sum{nido=>nido.potencia()}
		}
		else {return super()}
	}
}
class Nidos {
	var property grosor = 5
	var property resistenciaDelMaterial =3
	method potencia()= grosor * resistenciaDelMaterial + 20 
}

