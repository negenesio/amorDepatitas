package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import org.apache.log4j.Logger

class DireccionController {

    SpringSecurityService springSecurityService
    private static final Logger LOG = Logger.getLogger(getClass())

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ENCUENTRO'])
    def index() {
        println "DIRECCION INDEX"
        Mascota mascota = Mascota.findById(params.mascotaId.toLong())
        Direccion direccion = Direccion.findByUsuario(mascota.secUser)
        return render(view: '_direccionDatos', model:[direccion:direccion])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ENCUENTRO'])
    def cargarDireccion() {
        println "CARGAR DIRECCION"
        Long ciudadParams = params.ciudad.toLong()
        String telefono = params.telefono
        int numero = params.numero.toInteger()
        String calle = params.calle
        SecUser usuario = getUser()
        Ciudad ciudad = Ciudad.findById(ciudadParams)
        Direccion direccion = Direccion.findByUsuario(usuario) ?: new Direccion(usuario: usuario, telefono: telefono,
                calle: calle, numero: numero, ciudad: ciudad, fechaModificacion: new Date())

        direccion.save(flush: true)
        if(direccion.hasErrors()){
            direccion.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [CREATE DIRECCION] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
            }
            return render(false)
        }
        LOG.info("[SUCCESS] [CREATE DIRECCION] - [DIRECCION: ${direccion.id}] - [Usuario: ${usuario.username}]")
        return render(true)
    }

    private SecUser getUser(){
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }
}
