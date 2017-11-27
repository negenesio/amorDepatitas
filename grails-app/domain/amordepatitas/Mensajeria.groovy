package amordepatitas

import amordepatitas.seguridad.SecUser

class Mensajeria {

    SecUser usuario
    Date fecha = new Date()
    String message
    Mascota mascotaPeticion
    Mascota mascotaSolicitud

    static constraints = {
    }
}
