package amordepatitas

import amordepatitas.seguridad.SecUser

class Mascota {

    String nombre
    Raza raza
    Date fechaNacimiento
    SecUser secUser
    Date fechaCreacion = new Date()

//    static belongsTo = [persona: Persona]
//    static hasMany = [imagenes: Imagenes]

    static constraints = {
    }
}
