
import Aves.*
class Isla {
	var property aves = []
	var property unidadesDeAlpiste = 10 
	var property unidadeDeMaiz =  10 
	method agregarAve(ave) = aves.add(ave)
	method avesDebiles()= aves.filter{ave=>ave.fuerza() < 1000}  
	method fuerzaTotal()= aves.sum{ave=>ave.fuerza()}
	method esRobusta() = aves.all{ave=>ave.fuerza() > 300}
	method huboTerremoto()= aves.forEach{ave=>ave.recibirDisgusto()}
	method huboTomenta() = self.avesDebiles().forEach{ave=>ave.recibirUnDisgusto()}
	method aveCapitana() = self.avesPulentas().max{ave=>ave.fuerza()}
	method avesPulentas() = aves.filter{ave=>ave.fuerza().between(1000,3000)}
	method estaEnPaz()= aves.all{ave=>ave.estaConforme(self)}
	method relax() = aves.forEach{ave=>ave.relajarse()}
	method alimentacion(){}
	method alimentarConAlpiste(cant){ unidadesDeAlpiste -= cant}
	method alimentarConMaiz(cant){ unidadeDeMaiz -= cant}
}
