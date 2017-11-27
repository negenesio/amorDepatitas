package amordepatitas

import amordepatitas.seguridad.SecUser

class Direccion {


    Date fechaModificacion
    Date fechaCreacion = new Date()
    SecUser usuario
    String telefono
    String calle
    int numero
    Ciudad ciudad

    static constraints = {
    }
}
