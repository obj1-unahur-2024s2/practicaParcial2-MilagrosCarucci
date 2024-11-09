object Alianza {
 const razas = []

 method agregarRaza(raza){
  razas.add(raza)
 }
}
object Horda {
 const razas = [] 
}
class Ejercitos {
  var integrantes = []

  method invadir(localidad) {
    if (self.potencialOfensivoTotal() > localidad.potencialOfensivo()) {
      localidad.ocupante(self)
    }
  }
  method potencialOfensivoTotal() {
    return integrantes.sum({i => i.potencialOfensivo()})
  }
}
class Razas {
  var property fuerza
  var rol

  method esGroso() = self.esInteligente()
  method esInteligente()
  method potencialOfensivo() = fuerza * 10 + rol.extra()

  method rol(rolNuevo) {
    rol = rolNuevo
  }
}
class Orcos inherits Razas {
  override method potencialOfensivo() = self.potencialOfensivo() + ((10 * 100) / self.fuerza())
  override method esInteligente() = false
}
class Humanos inherits Razas {
  var inteligencia
  override method esInteligente() = inteligencia > 50
}
class Localidades {
  var habitantes
  var property ocupante

  method cantMaximaHabitantes()
  method intentaOcupar(ejercito) {
    if (ejercito.cantIntegrantes() > self.cantMaximaHabitantes()) {
      ocupante = new Ejercitos(integrantes = ejercito.masFuertes(self.cantMaximaHabitantes()))
    }
    else {
      ocupante = ejercito
    }
  }
}
class Aldeas inherits Localidades {
  

  method potencialOfensivoTotal() = ocupante.potencialOfensivoTotal()
  override method cantMaximaHabitantes() = habitantes
  
}
class Ciudades inherits Localidades {

}