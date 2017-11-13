package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional
import org.apache.log4j.Logger

@Transactional
class PostulacionService {

    private static final Logger LOG = Logger.getLogger(getClass())
    SpringSecurityService springSecurityService
    RoleService roleService


    def savePostulacion(Map postulacion_params){
        Mascota mascota = Mascota.findById(postulacion_params.mascotaId)
        SecUser usuario = getUser()

        Postulacion postulacion = Postulacion.findByUserAndMascota(SecUser.findById(postulacion_params.usuarioId), Mascota.findById(postulacion_params.mascotaId))
        if(postulacion){
            postulacion = Postulacion.findByUserAndMascota(SecUser.findById(postulacion_params.usuarioId), Mascota.findById(postulacion_params.mascotaId))
            postulacion.desde = postulacion_params.desde
            postulacion.dias = postulacion_params.dias
            postulacion.hasta = postulacion_params.hasta
            postulacion.mascota = mascota
            postulacion.user = usuario
            postulacion.observaciones = postulacion_params.observaciones
            postulacion.pausa = postulacion_params.pausa
            postulacion.save()
            println postulacion as JSON
            LOG.info("[SUCCESS] [POSTULAR UPDATE] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario.username}]")
            return postulacion
        }

        mascota.postulado = true
        mascota.save()
        postulacion = new Postulacion(
            desde: postulacion_params.desde,
            dias: postulacion_params.dias,
            hasta: postulacion_params.hasta,
            mascota: mascota,
            user: usuario,
            observaciones: postulacion_params.observaciones,
            pausa: postulacion_params.pausa).save()
        println postulacion as JSON
        LOG.info("[SUCCESS] [POSTULAR CREAR] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario.username}]")

        roleService.addRoleUser('ROLE_POSTULACION', usuario.id)
        return postulacion
    }


    def cancelarPostular(Long mascotaId){
        SecUser usuario = getUser()
        Mascota mascota = Mascota.findById(mascotaId)
        Postulacion postulacion = Postulacion.findByMascotaAndUser(mascota, usuario)
        if(!postulacion){
            LOG.info("[CANCELAR POSTULACION] [NO SE PUDO REALIZAR PORQUE NO EXISTEN POSTULACIONES] - [Usuario: ${usuario.username}]")
            return false
        }
        postulacion.delete()
        mascota.postulado = false
        mascota.save(flush:true)
        if(mascota.hasErrors()){
            mascota.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [CANCELAR POSTULAR MASCOTA] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
            }
            return false
        }
        LOG.info("[SUCCESS] [CANCELAR POSTULAR MASCOTA] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario.username}]")
        Postulacion postulacionCheck = Postulacion.findByUser(usuario)
        println postulacionCheck as JSON
        if(!postulacionCheck){
            roleService.removeRoleUser("ROLE_POSTULACION", usuario.id)
        }
        return true
    }

    private SecUser getUser(){
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }
}
