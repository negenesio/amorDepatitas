package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class CalificacionEncuentroController {

    SpringSecurityService springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_CALIFICACION'])
    def califiacionIndex() {
        List<CalificacionEncuentro> calificacionEncuentroList = CalificacionEncuentro.findAllByCreador(getUser())
        return render(view:'calificacionIndex' , model:[calificaciones:calificacionEncuentroList])
    }

    private SecUser getUser() {
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }
}
