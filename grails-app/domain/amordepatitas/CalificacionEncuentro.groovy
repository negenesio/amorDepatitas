package amordepatitas

import amordepatitas.seguridad.SecUser

class CalificacionEncuentro {

    SecUser creador
    SecUser calificado
    int nota
    String descripcion
    Date fechaCreacion = new Date()
    Date fechaModificacion = new Date()
    String estado
    Encuentro encuentro

    static constraints = {
    }
}
