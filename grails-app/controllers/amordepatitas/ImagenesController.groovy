package amordepatitas

import grails.plugin.springsecurity.annotation.Secured

class ImagenesController {

    ImagenesService imagenesService
    def index() { }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def uploadImagen() {
       return render(imagenesService.uploadImagen(params.mascota.toLong(), params."input-b8[]"))
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def viewImage() {
        Imagenes imagen = Imagenes.get(params.id)
        byte[] image = imagen.imagen
        log.info("[MOSTRAR IMAGEN ID: "+params.id + "] - [NOMBRE: " + imagen.nombre+"]")
        response.outputStream << image
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def deleteImage(){
        boolean result = imagenesService.deletedImagenMascota(params.id)
        render(result.toString())
    }
}
