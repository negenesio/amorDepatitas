package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import org.apache.log4j.Logger

class EncuentroController {

    private static final Logger LOG = Logger.getLogger(getClass())
    SpringSecurityService springSecurityService
    RoleService roleService
    MatchEncuentrosService matchEncuentrosService

    @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO'])
    def encuentroIndex(){
        SecUser usuario = getUser()
        List<Encuentro> misSolicitudes = Encuentro.findAllBySolicitud(usuario)
        List<Encuentro> misPeticiones = Encuentro.findAllByPeticion(usuario)
        Direccion direccion = Direccion.findByUsuario(getUser())
        return [misSolicitudes: misSolicitudes, misPeticiones: misPeticiones, direccion:direccion]
    }

    @Secured(['ROLE_ADMIN','ROLE_ENCUENTRO'])
    def enviarEncuentro() {
        SecUser usuarioSesion = getUser()
        Mascota mascotaPeticion = Mascota.findById(params.mascotaEncuentro.toLong())
        Mascota mascotaSolicitud = Mascota.findById(params.mascotaUsuario.toLong())
        Boolean activo = false
        String estado = 'pending'
        SecUser peticion = mascotaPeticion.secUser
        SecUser solicitud = mascotaSolicitud.secUser
        String descripcion = "Solicitud de encuentro enviada."

        Encuentro encuentro = new Encuentro(activo: activo, mascotaPeticion: mascotaPeticion,
                mascotaSolicitud: mascotaSolicitud, descripcion: descripcion, solicitud: solicitud, peticion: peticion, estado: estado)
        Encuentro encuentroExistentente = Encuentro.findByMascotaPeticionAndMascotaSolicitud(mascotaPeticion, mascotaSolicitud)
        Encuentro encuentroExistententeAux = Encuentro.findByMascotaPeticionAndMascotaSolicitud(mascotaSolicitud, mascotaPeticion)
        println "[CREANDO NUEVO EVENTO]"
        if(encuentroExistententeAux && encuentroExistentente) {
            println "[YA EXISTE UN ENCUENTRO DE PETICION Y OTRO DE SOLICITUD]"
            if(encuentroExistentente.estado in ['cancelled','finished'] && encuentroExistententeAux.estado in ['cancelled','finished']) {
                println "[AMBOS ENCUENTROS SE ENCUENTRAN EN ESTADO CANCELADO O FINISHED]"
                encuentroExistentente.estado = 'pending'
                encuentroExistentente.fechaModificacion = new Date()
                println "[SE ACTUALIZO EL ENCUENTRO DE PETICION A PENDING]"
                encuentroExistentente.save(flush: true)
                if (encuentro.hasErrors()) {
                    encuentro.errors.allErrors.each {
                        LOG.error("[FAIL-ERROR] [CREATE ENCUENTRO] - [MESSAGE: ${it}] - [Usuario: ${usuarioSesion.username}]")
                    }
                    return render(status: 404, text: 'internal server error.')
                }
                println "[NUEVO ENCUENTRO ACTUALIZADO CORRECTAMENTE]"
                return render(status: 201, text: 'La solicitud de encuentro fue enviada correctamente', encuentro: encuentro)
            }
            println "[NO ES POSIBLE ACTUALIZAR EL ENCUENTRO YA QUE ALGUNO SE ENCUENTRA EN UN ESTADO NO VALIDO]"
            return render(status: 404, text: 'Ya existe un encuentro pendiente para este par de mascotas!.')
        }
        else if(encuentroExistentente) {
            if (encuentroExistentente.estado == 'cancelled') {
                encuentroExistentente.estado = 'pending'
                encuentroExistentente.fechaModificacion = new Date()
                encuentroExistentente.save(flush: true)
                if (encuentro.hasErrors()) {
                    encuentro.errors.allErrors.each {
                        LOG.error("[FAIL-ERROR] [CREATE ENCUENTRO] - [MESSAGE: ${it}] - [Usuario: ${usuarioSesion.username}]")
                    }
                    return render(status: 404, text: 'internal server error.')
                }
                return render(status: 201, text: 'La solicitud de encuentro fue enviada correctamente', encuentro: encuentro)
            }
            return render(status: 404, text: 'El encuentro ya existe.')
        }
        encuentro.save(flush: true)
        if(encuentro.hasErrors()){
            encuentro.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [CREATE ENCUENTRO] - [MESSAGE: ${it}] - [Usuario: ${usuarioSesion.username}]")
            }
            return render(status:404, text: 'internal server error.')
        }
        LOG.info("[SUCCESS] [CREATE ENCUENTRO] - [SOLICITUD: ${solicitud.id}] - [Usuario: ${usuarioSesion.username}]")
        roleService.addRoleUser('ROLE_ENCUENTRO', solicitud.id)
        roleService.addRoleUser('ROLE_ENCUENTRO', peticion.id)
        return render(status: 201, text: 'La solicitud de encuentro fue enviada correctamente', encuentro: encuentro)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO'])
    def encuentroCancelar(){
        SecUser usuario = getUser()
        Mascota solicitud = Mascota.findById(params.solicitud.toLong())
        Mascota peticion = Mascota.findById(params.peticion.toLong())
        Encuentro encuentro = Encuentro.findByMascotaPeticionAndMascotaSolicitud(peticion, solicitud)
        encuentro.estado = 'cancelled'
        encuentro.fechaModificacion = new Date()
        encuentro.save(flush: true)

        if(encuentro.hasErrors()){
            encuentro.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [CREATE ENCUENTRO] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
            }
            return render(status:404, text: 'internal server error.')
        }

        return render(status:201, text: 'Exito al cancelar el encuentro.')
    }

    @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO'])
    def aprobarEncuentro() {
        Mascota solicitudMascota = Mascota.findById(params.solicitud.toLong())
        Mascota peticionMascota = Mascota.findById(params.peticion.toLong())

        Encuentro encuentro = Encuentro.findByMascotaPeticionAndMascotaSolicitud(peticionMascota, solicitudMascota)
        encuentro.estado = 'approved'
        encuentro.fechaModificacion = new Date()
        encuentro.save(flush: true)
        if(encuentro.hasErrors()){
            encuentro.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [CREATE ENCUENTRO] - [MESSAGE: ${it}] - [Usuario: ${usuario.username}]")
            }
            return render(status:404, text: 'internal server error.')
        }

        roleService.addRoleUser('ROLE_ENCUENTRO_APROBADO', solicitudMascota.secUser.id)
        roleService.addRoleUser('ROLE_ENCUENTRO_APROBADO', peticionMascota.secUser.id)
        return render(status:201, text: 'Exito al cancelar el encuentro.')
    }

    @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO'])
    def detalleAprobarEncuentro() {
        Mascota solicitud = Mascota.findById(params.solicitud.toLong())
        Mascota peticion = Mascota.findById(params.peticion.toLong())
        Encuentro encuentro = Encuentro.findByMascotaPeticionAndMascotaSolicitud(peticion, solicitud)

        List<Imagenes> imagenesSolicitud = Imagenes.findAllByMascota(solicitud)
        List<Imagenes> imagenesPeticion = Imagenes.findAllByMascota(peticion)

        return render(view:"_encuentroDatos", model:[imagenesSolicitud:imagenesSolicitud, imagenesPeticion:imagenesPeticion, mascotaSolicitud: solicitud, mascotaPeticion: peticion, encuentro:encuentro])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO'])
    def finalizarEncuentro(){
        println params
        int nota = params.nota.toBigDecimal()
        String descripcion = params.descripcion
        Mascota peticion = Mascota.findByNombre(params.mascotaPeticion)
        Mascota solicitud = Mascota.findByNombre(params.mascotaSolicitud)
        Encuentro encuentro = Encuentro.findByMascotaPeticionAndMascotaSolicitudAndEstado(peticion, solicitud, 'approved') ?: Encuentro.findByMascotaPeticionAndMascotaSolicitudAndEstado(solicitud, peticion, 'approved')
        println encuentro as JSON
        if(params.confirm == 'confirm'){
            println "ES CONFIRM"
            encuentro = Encuentro.findByMascotaPeticionAndMascotaSolicitudAndEstado(peticion, solicitud, 'confirm') ?: Encuentro.findByMascotaPeticionAndMascotaSolicitudAndEstado(solicitud, peticion, 'confirm')
        }
        println encuentro as JSON
        if(params?.confirm == 'confirm'){
            encuentro.estado = 'finished'
        }else {
            encuentro.estado = 'confirm'
        }

        encuentro.fechaModificacion = new Date()

        encuentro.save(flush: true)
        SecUser creador = getUser()
        SecUser calificado = peticion.secUser
        if(params?.confirm == 'confirm'){
           CalificacionEncuentro calificacionEncuentroConfirm = CalificacionEncuentro.findByEncuentro(encuentro)
            calificacionEncuentroConfirm.estado = 'confirm'
            calificacionEncuentroConfirm.fechaModificacion = new Date();
            calificacionEncuentroConfirm.save(flush: true)
            CalificacionEncuentro calificacionEncuentroNuevo = new CalificacionEncuentro(encuentro:encuentro, descripcion: descripcion, nota:nota, creador: creador, calificado:calificado, estado:'confirm' )
            calificacionEncuentroNuevo.save(flush: true)
        }else {
            CalificacionEncuentro calificacionEncuentro = new CalificacionEncuentro(encuentro:encuentro, descripcion: descripcion, nota:nota, creador: creador, calificado:calificado, estado:'pending' )
            calificacionEncuentro.save(flush: true)
        }
        roleService.addRoleUser('ROLE_CALIFICACION', creador.id)
        roleService.addRoleUser('ROLE_CALIFICACION', calificado.id)
        return render(true)
    }
    private SecUser getUser() {
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MASCOTA'])
    def buscarEncuentro() {
        SecUser usuario = getUser()
        Mascota mascota = Mascota.findById(params?.mascotaId)
        if(mascota.secUser != usuario) {
            return redirect(controller: "usuario", action: "indexUsuario")
        }
        Mascota mascotaBusqueda = getEncuentroMascota(mascota, usuario.id)

        return render (view:"resultadoBusqueda", model:[mascotaBusqueda:mascotaBusqueda])
    }

    private Mascota getEncuentroMascota(Mascota buscador, Long userId) {
        String sexoSearch = ""
        if(buscador.sexo == 'MACHO') {
            sexoSearch = 'HEMBRA'
        }
        if(buscador.sexo == 'HEMBRA') {
            sexoSearch = 'MACHO'
        }
        Mascota encontrado = Mascota.findByRazaAndSexo(buscador.raza, sexoSearch)

        if(MatchEncuentros.findByBuscadorAndEncontrado(buscador, encontrado)){
            encontrado = null
        }


        return (encontrado?.secUser?.id != userId) ? encontrado : encontrado
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MASCOTA'])
    def crearMatchEncuentros(){
        Mascota buscador = Mascota.findById(params.buscadorId)
        Mascota encontrado = Mascota.findById(params.encontradoId)
        String estado = params.estado

        MatchEncuentros match = new MatchEncuentros()
        match.buscador = buscador
        match.encontrado = encontrado
        match.estado = estado

        match.save()
        if(match.hasErrors()){
            match.errors.allErrors.each {
                LOG.error("[FAIL-ERROR] [CREATE MATCH] - [MESSAGE: ${it}]")
            }
            return false
        }

        return true
    }



}
