package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.apache.log4j.Logger

@Transactional
class MascotaService {

    SpringSecurityService springSecurityService
    RoleService roleService
    private static final Logger LOG = Logger.getLogger(getClass())

    def createMascota(Map mascotaParams) {
        SecUser usuario = getUser()
        Raza raza = Raza.findById(mascotaParams.raza.toLong())
        Date fechaNacimiento = Date.parse('yyyy-MM-dd', mascotaParams.fecha_nacimiento)
        Mascota mascota = new Mascota(nombre: mascotaParams.nombre_mascota, raza: raza,
                fechaNacimiento: fechaNacimiento, secUser: usuario, sexo: mascotaParams.sexo_mascota)
        mascota.save()
        if(mascota.hasErrors()){
            println "---->> ERROR --->>>"
            mascota.errors.allErrors.each {
                println it
            }
            return false
        }
        LOG.info("[SUCCESS] [CREATE MASCOTA] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario.username}]")
        return mascota.id
    }

    def deletedMascota(def mascotaId) {
        SecUser usuario = getUser()
        String username = usuario.username
        Mascota mascota = Mascota.findById(mascotaId)
        Imagenes.findAllByMascota(mascota).each { it.delete() }
        mascota.delete(flush: true)
        if(mascota.hasErrors()) {
            println "---->> ERROR --->>>"
            mascota.errors.allErrors.each {
                println it
            }
            return false
        }
        LOG.info("[SUCCESS] [BORRAR MASCOTA] - [MASCOTA: ${mascota.id}] - [Usuario: ${username}]")
        ArrayList<Mascota> mascotaList = Mascota.findAllBySecUser(usuario)
        mascotaList.size()
        if(mascotaList){
            mascotaList.size()
            return true
        } else {
            roleService.removeRoleUser('ROLE_MASCOTA', usuario.id)
            LOG.info("[SUCCESS] [BORRAR ROLE_MASCOTA] - [Usuario: ${username}]")
            return true
        }
    }

    def getMascota(def mascotaId){
        SecUser usuario = getUser()
        Mascota mascota = Mascota.findById(mascotaId)
        if(mascota) {
            LOG.info("[SUCCESS] [GET MASCOTA] - [MASCOTA: ${mascota.nombre}] - [Usuario: ${usuario.username}]")
        } else {
            LOG.error("[FAIL] [GET MASCOTA] - [PARAMS: ${mascotaId}] - [Usuario: ${usuario.username}]")
        }
        return mascota
    }

    def updateMascota(Map mascotaParams) {
        SecUser usuario = getUser()
        Raza raza = Raza.findById(mascotaParams.raza.toLong())

        Date fechaNacimiento = Date.parse('yyyy-MM-dd', mascotaParams.fecha_nacimiento)
        Mascota mascota = getMascota(mascotaParams.mascotaId)
        mascota.nombre = mascotaParams.nombre_mascota
        mascota.raza = raza
        mascota.sexo = mascotaParams.sexo_mascota
        mascota.fechaNacimiento = fechaNacimiento

        mascota.save()
        if(mascota.hasErrors()){
            println "---->> ERROR --->>>"
            mascota.errors.allErrors.each {
                println it
            }
            return false
        }
        LOG.info("[SUCCESS] [CREATE MASCOTA] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario.username}]")
        return mascota.id
    }

    def postular(Long mascotaId){
        SecUser usuario = getUser()
        Mascota mascota = Mascota.findById(mascotaId)
        Postulacion postulacion = new Postulacion(mascota: mascota, user:usuario)
        postulacion.save()
        mascota.postulacion = true
        mascota.save()

        return true
    }

    def cancelarPostular(Long mascotaId){
        SecUser usuario = getUser()
        Mascota mascota = Mascota.findById(mascotaId)
        Postulacion postulacion = Postulacion.findByMascotaAndUser(mascota, usuario)
        postulacion.delete()
        mascota.postulacion = false
        mascota.save()

        return true
    }

    private SecUser getUser(){
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }
}
