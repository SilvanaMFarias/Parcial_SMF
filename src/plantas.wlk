class Planta {
	var property anioObtencionSemilla
	var property altura
	
	method horasDeSolQueTolera()
	
	method esFuerte()= self.horasDeSolQueTolera()>10
	
	method daNuevasSemillas() = self.esFuerte()
	
	method espacioQueOcupa()
	
	method esParcelaIdeal(unaParcela)
	
	method seAsociaBien(unaParcela) = unaParcela.seAsociaBien(self)
}


class Menta inherits Planta{
	
	override method horasDeSolQueTolera()=6
	
	override method daNuevasSemillas() = super() or self.altura()>0.4
	
	override method espacioQueOcupa() = self.altura() * 3
	
	override method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta{
	
	
	override method horasDeSolQueTolera(){
		var horas
		if (self.altura()<0.5){
			horas = 6
		}
		else if (self.altura().between(0.5,1)){
			horas = 7
		}
		else if (self.altura()>1){
			horas = 9
		}
		return horas
	}
	
	override method daNuevasSemillas() = super() or (self.anioObtencionSemilla() > 2007 and self.altura() > 1)
	
	override method espacioQueOcupa()= self.altura()/2
	
	override method esParcelaIdeal(unaParcela) = unaParcela.horasDeSol() == self.horasDeSolQueTolera()
}

class Quinoa inherits Planta{
	var property horasDeSolQueTolera
	
	override method daNuevasSemillas() = super() or self.anioObtencionSemilla() < 2005
	
	override method espacioQueOcupa()= 0.5
	
	override method esParcelaIdeal(unaParcela){
		return unaParcela.plantas().all({p=>p.plantas()<=1.5})
	}
}

class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(unaParcela) = unaParcela.cantidadMaximaDePlantas()==1
}

class Hierbabuena inherits Menta{
	
	override method espacioQueOcupa() = super() * 2
}