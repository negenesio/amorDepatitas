package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.transaction.Transactional
import org.apache.log4j.Logger

@Transactional
class MascotaService {

    private static final Logger LOG = Logger.getLogger(getClass())
    def springSecurityService

    def createMascota(Map mascotaParams) {
        def usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findById(mascotaParams.secUser)
        Raza raza = Raza.findById(mascotaParams.raza.toLong())
        Date fechaNacimiento = Date.parse('yyyy-MM-dd', mascotaParams.fecha_nacimiento)
        Mascota mascota = new Mascota(nombre: mascotaParams.nombre_mascota, raza: raza,
                fechaNacimiento: fechaNacimiento, secUser: secUser, sexo: mascotaParams.sexo_mascota)
        mascota.save()
        if(mascota.hasErrors()){
            println "---->> ERROR --->>>"
            mascota.errors.allErrors.each {
                println it
            }
            return false
        }
        LOG.info("[SUCCESS] [CREATE MASCOTA] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario}]")
        return mascota.id
    }
}
