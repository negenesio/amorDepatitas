package amordepatitas

import grails.plugin.springsecurity.annotation.Secured

class MascotaController {

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def index() {

    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def createMascota() {

    }
}
