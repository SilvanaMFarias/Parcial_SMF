import parcelas.*
import plantas.*

object inta {
	const parcelas = []
	
	method agregarParcela(unaParcela){
		parcelas.add(unaParcela)
	}
	
	method promedioDePlantas(){
		const cantPlantas = parcelas.sum({p=>p.plantas().size()})
		const cantParcelas = parcelas.size()
		return cantPlantas/cantParcelas
	}
	
	method parcelaMasAutosustentable(){
		//return parcelas.filter({p=>p.plantas().size()>4}).max()
	}
}
