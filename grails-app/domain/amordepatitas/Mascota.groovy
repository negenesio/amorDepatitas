package amordepatitas

import amordepatitas.seguridad.SecUser

class Mascota {

    String nombre
    Raza raza
    Date fechaNacimiento
    SecUser secUser
    Date fechaCreacion = new Date()
    String sexo
    boolean postulado = false
    String descripcion

    static constraints = {
        descripcion (nullable: true)
    }
}
