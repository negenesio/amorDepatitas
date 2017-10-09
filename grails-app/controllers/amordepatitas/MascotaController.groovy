package amordepatitas

import grails.plugin.springsecurity.annotation.Secured

class MascotaController {

    def mascotaService, springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def uploadMascota() {
        println "---------> "
        println params
        println "---------> "
        return render(view:"../usuario/indexUsuario.gsp")
    }


    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def createMascota() {
        println "----PARAMS--->"
        println params
        println "----PARAMS--->"
        Map model = [
                nombre_mascota : params.nombre_mascota,
                fechaNacimiento : params.fechaNacimiento,
                raza : params.raza,
                secUser : springSecurityService.principal.id,
                sexo: params.sexo
        ]
        def result = mascotaService.createMascota(model)
        println "----save--->"
        println result
        println "----save--->"
        model << [mascotaId: result]
        return render(view:"createMascota", model:model)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def createIndex() {
        return render(view:"create")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def uploadImagen() {
        println "----IMAGEN>"
        println params
        println "----IMAGEN>"
        Mascota mascota = Mascota.findById(params."mascota")
        def file = params."input-b8[]"
        byte[] fileBytes = file.bytes
        String contentType = file.contentType
        Imagenes imagenen = new Imagenes(mascota: mascota, imagen: fileBytes, type: contentType, nombre: file.getOriginalFilename())
        imagenen.save()
        if(imagenen.hasErrors()){
            println "---->> ERROR --->>>"
            imagenen.errors.allErrors.each {
                println it
            }
            println "---->> ERROR --->>>"
            return false
        }
        return render("true")
    }
}
