package amordepatitas

import amordepatitas.seguridad.SecUser

class Postulacion implements Serializable {

    private static final long serialVersionUID = 1

    SecUser user
    Mascota mascota

    static constraints = {
    }

    static mapping = {
        id composite: ['user', 'mascota']
        version false
    }
}
