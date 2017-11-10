package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.plugin.springsecurity.SpringSecurityService
import org.apache.log4j.Logger
import grails.transaction.Transactional

@Transactional
class ImagenesService {

    SpringSecurityService springSecurityService
    private static final Logger LOG = Logger.getLogger(getClass())

    def uploadImagen(Long mascotaId, def file){
        Mascota mascota = Mascota.findById(mascotaId)
        ArrayList<Imagenes> imagenes = Imagenes.findAllByMascota(mascota)
        if(imagenes.size() < 3){
            byte[] fileBytes = file.bytes
            String contentType = file.contentType
            Imagenes imagen = new Imagenes(mascota: mascota, imagen: fileBytes, type: contentType, nombre: file.getOriginalFilename())
            imagen.save()
            if(imagen.hasErrors()){
                imagen.errors.allErrors.each {
                    LOG.error("[IMAGEN UPLOAD FAIL] ["+it+".]")
                }
                return 'false'
            }
            LOG.info("[IMAGEN UPLOAD SUCCESS] [IMAGEN: "+imagen.id+"] [MASCOTA: "+mascota.id+"]")
            return "true"
        }

        return "fail"
    }

    def deletedImagenMascota(def imagenId){
        SecUser usuario = getUser()
        Imagenes imagen = Imagenes.findById(imagenId)
        imagen.delete()
        if(imagen.hasErrors()){
            println "---->> ERROR --->>>"
            imagen.errors.allErrors.each {
                println it
            }
            return false
        }
        LOG.info("[SUCCESS] [BORRAR IMAGEN] - [IMAGEN: ${imagen.id}] - [Usuario: ${usuario.username}]")
        return true
    }

    private SecUser getUser(){
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }
}
