import comidas.*
import comensales.*


object cocina{
	
	var listaComidas = []
	
	method agregarComida(comida)
	{
		listaComidas.add(comida)
	}
	
	method sacarComida(comida)
	{
		listaComidas.remove(comida)
	}
	
	method tieneBuenaOfertaVegetariana()
	{
		return (self.cantidadComidasVegetarianas() - self.cantidadComidasNoVegetarianas()) <= 2		
	}
	
	method cantidadComidasVegetarianas()
	{
		return listaComidas.filter({ c => c.esAptoVegetariano()}).size()
	}
	
	method cantidadComidasNoVegetarianas()
	{
		return listaComidas.filter({ c => !c.esAptoVegetariano()}).size()
	}
	
	method platoFuerteCarniboro()
	{		
		return listaComidas.filter({ c => !c.esAptoVegetariano()}).max({ p => p.valoracion()})
	}
	
	method comidasQueLeGustan(comensal)
	{
		return listaComidas.map({ c => c.leAgrada(self)})
	}
	
	method elegirPlatoComenzal(comenzal)
	{
		var leGustan = listaComidas.map({ c => c.leAgrada(self)})
		
		if(leGustan.isEmpty())
			throw new Exception (message= "Error lista vacia")
		else
		{
			comenzal.setComidas(leGustan.first())
			self.sacarComida(leGustan.first())
			
		}			
	}
}