import comidas.*

class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	
	method satisfecho()
	{
		return self.pesoComidasIngeridas() >= peso * 0.01
	}
	
	method pesoComidasIngeridas()
	{
		return comidas.sum({ c => c.peso()})
	}
	
	method setComidas(unaComida)
	{
		comidas.add(unaComida)
	}
}


class Vegetariano inherits Comensal
{
	override method leAgrada(unaComida)
	{
		return (unaComida.esAptoVegetariano() && (unaComida.valoracion() > 85))
	}
	
	override method satisfecho()
	{		
		return super() && self.ningunaComidaAbundante()
	}
	
	method ningunaComidaAbundante()
	{
		return	comidas.all({ c => !c.esAbundante()})		
	}
}

class HambrePopular inherits Comensal
{
	override method leAgrada(unaComida)
	{
		return (unaComida.esAbundante())
	}
		
}

class PaladarFino inherits Comensal
{
	override method leAgrada(unaComida)
	{
		return (unaComida.peso().between(150, 300) && unaComida.valoracion() > 100 )
	}
	
	override method satisfecho()
	{		
		return super() && self.cantidadParDeComidas()
	}
	
	method cantidadParDeComidas()
	{
		return comidas.size().odd()
	}
	
}