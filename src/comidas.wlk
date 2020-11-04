class Comida {
	
	
	//var valoracion
	
//	method getValoracion()
//	{
//		return valoracion
//	}
//	
//	method setValoracion(v)
//	{
//		valoracion = v
//	}
	

	
	
	//method peso(){}
	
	method valoracion()
	method esAptoVegetariano()	
	
	method esAbundante() 
	{
		//return self.peso()> 250	
	}
}


class Provoleta inherits Comida
{
	var peso
	var tieneEspecias = false
		
    method peso()
	{
		return peso
	}
	
	
	method setPeso(p)
	{
		peso = p
	}

	
	
	method setEspecia(tiene)
	{
		tieneEspecias = tiene
	}
	
	method getEspecia()
	{
		return tieneEspecias
	}
	
	override method esAptoVegetariano()
	{
		return !tieneEspecias
	}
	
	method esEspecial()
	{
		return self.esAbundante() || self.getEspecia()
	}
	
	override method valoracion()
	{
		return if (self.esEspecial()) {120} else { 80 }
	}
	
	method esAbundante() 
	{
		return self.peso()> 250	
	}
}



class HamburguesaCarne inherits Comida
{
	var tipoPan
	
	method setTipoPan(p)
	{
		tipoPan = p
	}
	
	method getTipoPan()
	{
		return tipoPan
	}
	
	 method peso()
	{
		return 250		
	}
	
	override method esAptoVegetariano()
	{
		return false
	}
	
	override method valoracion()
	{
		return 60 + tipoPan.valoracion()
	}
	
}

class HamburguesaVegana inherits HamburguesaCarne
{
	var legumbre
	
	method getLegumbre()
	{
		return legumbre
	}
	
	method setLegumbre(l)
	{
		legumbre = l
	}
	
	override method esAptoVegetariano()
	{
		return true
	}
	
	override method valoracion()
	{
		//super()
		return (2 * self.getLegumbre().size()).max(17)
		
	}
	
}

class Parrillada inherits Comida
{
	var cortesPedidos = []
	
	
	method agregarCorte(c)
	{
		cortesPedidos.add(c)
	}
	
	override method esAptoVegetariano()
	{
		return false
	}
	
	override method valoracion()
	{
		return (15 * self.maximaCalidadCorte()) - self.cantidaCortes()
	}
	
	
	 method peso()
	{
		return cortesPedidos.sum({ c => c.peso()})
	}
	
	method maximaCalidadCorte()
	{
		return cortesPedidos.max({ c => c.calidad()})
	}
	
	method cantidaCortes()
	{
		return cortesPedidos.size()
	}
}

class CorteCarne
{
	var property nombre
	var property calidad  
	var property peso
	
}



object panIndustrial
{
	method valoracion(){return 0}
}

object panCasero
{
	method valoracion(){return 20}
}

object panMasaMadre
{
	method valoracion(){return 45}
}