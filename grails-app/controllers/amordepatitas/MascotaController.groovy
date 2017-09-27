package amordepatitas

import grails.plugin.springsecurity.annotation.Secured

class MascotaController {

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def index() {
        println "---asd123"
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def createMascota() {
        println "---asd"
        render(view:"create")
    }

    def create() {

    }
}
