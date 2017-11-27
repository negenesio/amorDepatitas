package amordepatitas

import amordepatitas.seguridad.SecUser

class Encuentro implements Serializable {

    private static final long serialVersionUID = 1

    Boolean activo
    Mascota mascotaPeticion
    Mascota mascotaSolicitud
    String descripcion
    String estado
    Date fechaCreacion = new Date()
    SecUser peticion
    SecUser solicitud
    Date fechaModificacion = new Date()

    static constraints = {
    }

    static mapping = {
        id composite: ['mascotaPeticion', 'mascotaSolicitud']
        version false
    }
}
