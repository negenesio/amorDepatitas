package amordepatitas

import grails.plugin.springsecurity.annotation.Secured

class MascotaController {

    MascotaService mascotaService
    def springSecurityService
    RoleService roleService

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def update(){
        Mascota mascota = mascotaService.getMascota(params.mascotaId)
        ArrayList<Imagenes> imagenes = Imagenes.findAllByMascota(mascota)
        render(view: 'update', model:[mascota:mascota, imagenes:imagenes])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def deletedMascota(){
        mascotaService.deletedMascota(params.mascotaId)
        redirect (action: 'indexUsuario', controller: 'usuario')
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def uploadMascota() {
        Long userId = springSecurityService.principal.id.toLong()
        Map model = [
                nombre_mascota : params.nombre_mascota,
                fecha_nacimiento : params.fecha_nacimiento,
                raza : params.raza,
                secUser : userId,
                sexo_mascota: params.sexo_mascota,
                mascotaId: params.mascotaId
        ]
        mascotaService.updateMascota(model)

        redirect (action: 'indexUsuario', controller: 'usuario')
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

    @Secured(['ROLE_ADMIN', 'ROLE_USER', 'ROLE_ENCUENTRO'])
    def vistaPrevia(){
        return render(view:'_vistaPrevia', model:[mascota:Mascota.findById(params.mascotaId.toLong())])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def createIndex() {
        return render(view:"create")
    }

}
