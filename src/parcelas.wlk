import plantas.*

class Parcela{
	var property ancho
	var property largo
	var property horasDeSol
	const plantas =[]
	
	method superficie() = ancho * largo
	
	method cantidadMaximaDePlantas() = if (ancho > largo) (self.superficie()/5).truncate(0) else (self.superficie()/3 + self.largo()).truncate(0)
	
	method tieneComplicaciones(){
		return plantas.any({p=>p.horasDeSolQueTolera() < self.horasDeSol()})
	}
	
	
	method agregarPlanta(unaPlanta){
		if ((plantas.size() + 1) > self.cantidadMaximaDePlantas() or self.horasDeSol() >=  (unaPlanta.horasDeSolQueTolera()+2) ){
			self.error ("No puede agregarse la planta. Se superan la cantidad máxima de plantas en la parcela, o no tolera el sol")			
		}
		else{
			plantas.add(unaPlanta)
		}
	}
	
	method plantas(){
		return plantas
	}
	
	method seAsociaBien(unaPlanta)
}

class ParcelaEcologica inherits Parcela{
	
	override method seAsociaBien(unaPlanta){
		return not self.tieneComplicaciones() and unaPlanta.esParcelaIdeal(self)
	}
	
}

class ParcelaIndustrial inherits Parcela{
	
	override method seAsociaBien(unaPlanta){
		return self.plantas().size()<=2 and unaPlanta.esFuerte()
	}
	
}