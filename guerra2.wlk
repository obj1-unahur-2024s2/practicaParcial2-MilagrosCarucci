//los objetos siempre tienen que tener los atributos instanciados en si mismos
// class Rol {
//     var edad
//     method extra()
// }
// object guerrero inherits Rol(edad=10) [fallaria si no esta instanciada] {
//     override method extra() = 10
// }

import roles2.*
class Raza {
    const fuerza
    const inteligencia
    var rol
    const razas = []

    method agregarRaza(raza) {
        razas.add(raza)
    }
    method cambiarRol(nuevoRol) {
        rol = nuevoRol
    }
    method potencialOfensivo() = (fuerza * 10) + rol.extra()
    method esGroso() = self.esInteligente() || rol.esGroso(self) //self porque tiene parametro *personaje*
    method esInteligente()
}
class Orco inherits Raza {

    override method potencialOfensivo()= super() + (super() * 0.1) //super() * 1.1 le suma un 10%
    override method esInteligente() = false
}
class Humano inherits Raza {
    override method esInteligente() = inteligencia > 50
}
// object Horda {}
// object Alianza {}
// no son necesarios estos objetos
class Ejercitos {
    const personajes = []

    method potencialDefensivoTotal() = personajes.sum({p => p.potencialOfensivo()})
    method invadirLocalidad(localidad) {
        if (self.potencialDefensivoTotal() > localidad.potencialOfensivo()) {
            localidad.desalojar(self)
        }
    }
    method ejercitoConLosMejores(cantidad) {
        return personajes.sortBy({p1, p2 => p1.potencialOfensivo() > p2.potencialOfensivo()}).take(cantidad)
        //ordena los personajes con mayor potencial defensivo
        //p1 y p2 son los elementos
        //cada potencial ofensivo del elemento p1 tiene que ser mayor a p2 para acceder
        //como va a ordenar todos, los delimitamos diciendo que toma solo *cantidad* (por eso el take)
    }
    method crearEjercito(cantidad) {
        personajes.removeAll(self.ejercitoConLosMejores(cantidad))
        return new Ejercitos(personajes=self.ejercitoConLosMejores(cantidad))
    }
}
class Localidad {
    var ejercito

    method potencialOfensivo() = ejercito.potencialDefensivoTotal()
    method serOcupada(nuevoEjercito)
}
class Aldeas inherits Localidad {
    const cantMaxHabitantes
    override method serOcupada(nuevoEjercito) {
        if (ejercito.size() > cantMaxHabitantes) {
            ejercito = nuevoEjercito.crearEjercito(10)
        }
    }
}
class Ciudad inherits Localidad {
    override method potencialOfensivo() = super() + 300
    override method serOcupada(nuevoEjercito) {
        ejercito = nuevoEjercito
    }
}
