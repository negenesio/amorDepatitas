package amordepatitas

import amordepatitas.seguridad.SecRole
import grails.plugin.springsecurity.annotation.Secured

class MascotaController {

    def mascotaService, springSecurityService
    RoleService roleService

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def uploadMascota() {
        println "---- KERO KERO KERO KERO KERO -------"
        return render(view:"../usuario/indexUsuario.gsp")
    }


    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def createMascota() {
        Long userId = springSecurityService.principal.id.toLong()
        Map model = [
                nombre_mascota : params.nombre_mascota,
                fecha_nacimiento : params.fecha_nacimiento,
                raza : params.raza,
                secUser : userId,
                sexo_mascota: params.sexo_mascota
        ]
        def resultMascota = mascotaService.createMascota(model)
        roleService.addRoleUser('ROLE_MASCOTA', userId)

        return render(resultMascota)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def createIndex() {
        return render(view:"create")
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def uploadImagen() {
        Mascota mascota = Mascota.findById(params."mascota")
        def file = params."input-b8[]"
        byte[] fileBytes = file.bytes
        String contentType = file.contentType
        Imagenes imagenen = new Imagenes(mascota: mascota, imagen: fileBytes, type: contentType, nombre: file.getOriginalFilename())
        imagenen.save()
        if(imagenen.hasErrors()){
            imagenen.errors.allErrors.each {
                println it
            }
            return render("false")
        }
        return render("true")
    }
}
