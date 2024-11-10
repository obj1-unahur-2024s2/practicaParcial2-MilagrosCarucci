import guerra2.*
class Rol {
    method extra()
    method esGroso(personaje)
}
object guerrero inherits Rol {
    override method extra() = 100
    override method esGroso(personaje) = personaje.fuerza() > 50
}
class Cazador inherits Rol {
    const mascotaActual

    override method extra() = mascotaActual.potencialOfensivo()
    override method esGroso(personaje) = mascotaActual.esLongeva()
}
object brujo inherits Rol {
    override method extra() = 0
    override method esGroso(personaje) = true
}
class Mascota {
    const property fuerza
    var property edad
    const property tieneGarras

    method potencialOfensivo() {
        if (tieneGarras) {
            return fuerza * 2
        }
        else {
            return fuerza
        }
    }
    method esLongeva() = edad > 10
}
