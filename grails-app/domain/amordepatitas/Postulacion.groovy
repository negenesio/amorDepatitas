package amordepatitas

import amordepatitas.seguridad.SecUser

class Postulacion {

    SecUser user
    Mascota mascota
    Date desde
    Date hasta
    String dias
    String observaciones
    boolean pausa = false

    static constraints = {
        observaciones(nullable: true)
    }
}
