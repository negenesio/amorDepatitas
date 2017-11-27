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
            postulacion.save(flus: true)
            if(postulacion.hasErrors()){
                postulacion.errors.allErrors.each {
                    LOG.error("[FAIL-ERROR] [ELIMINAR POSTULACION] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
                }
                println "ALGO NO FUNCIONO :'("
                return false
            }
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
            pausa: postulacion_params.pausa).save(flush: true)
        if(postulacion.hasErrors()){
            postulacion.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [ELIMINAR POSTULACION] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
            }
            println "ALGO NO FUNCIONO :'("
            return false
        }
        println postulacion as JSON
        LOG.info("[SUCCESS] [POSTULAR CREAR] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario.username}]")

        roleService.addRoleUser('ROLE_POSTULACION', usuario.id)
        return postulacion
    }


    def cancelarPostular(Long mascotaId){
        println "INICIO PROCESO DE ELIMINACION DE POSTULACION"
        SecUser usuario = getUser()
        Mascota mascota = Mascota.findById(mascotaId)
        println "LA MASCOTA A LA CUAL SE LE VA A ELIMINAR LA POSTULACION ES: "+mascota.nombre
        Postulacion postulacion = Postulacion.findByMascotaAndUser(mascota, usuario)
        Long postulacionEliminada = postulacion.id
        println "LA POSTULACION QUE VA A SER ELIMINADA ES: "+postulacion.id
        if(!postulacion){
            LOG.info("[CANCELAR POSTULACION] [NO SE PUDO REALIZAR PORQUE NO EXISTEN POSTULACIONES] - [Usuario: ${usuario.username}]")
            return false
        }
        postulacion.delete(flush: true)

        if(postulacion.hasErrors()){
            postulacion.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [ELIMINAR POSTULACION] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
            }
            println "ALGO NO FUNCIONO :'("
            return false
        }
        println "YA SE ELIMINO LA POSTULACION"
        mascota.postulado = false
        mascota.save(flush:true)
        println "YA SE ACTULIAZO EL ESTADO DE LA MASCOTA"
        if(mascota.hasErrors()){
            mascota.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [CANCELAR POSTULAR MASCOTA] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
            }
            println "ALGO NO FUNCIONO :'("
            return false
        }
        println "TODO LISTO VERIFICANDO SI QUEDAN POSTULACIONES PARA EL USUARIO"
        LOG.info("[SUCCESS] [CANCELAR POSTULAR MASCOTA] - [RAZA: ${mascota.raza.descripcion}] - [Usuario: ${usuario.username}]")
        List<Postulacion> postulacionCheck = Postulacion.findAllByUser(usuario)
        postulacionCheck = postulacionCheck.findAll { it.id !=  postulacionEliminada }
        if(!postulacionCheck){
            println "NO TIENE MAS POSTULACIONES, VAMOS A ELIMINAR EL ROLE_POSTULACION"
            roleService.removeRoleUser("ROLE_POSTULACION", usuario.id)
            return true
        }
        println "TODO OK, el USUARIO AUN TIENE POSTULACIONES POR LO QUE VAMOS A MENTENER SU ROLE_POSTULACION"
        return true
    }

    private SecUser getUser(){
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }
}
