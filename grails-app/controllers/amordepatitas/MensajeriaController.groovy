 package amordepatitas

 import amordepatitas.seguridad.SecUser
 import grails.plugin.springsecurity.SpringSecurityService
 import grails.plugin.springsecurity.annotation.Secured

 class MensajeriaController {

     SpringSecurityService springSecurityService

     @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO_APROBADO'])
     def mensajes(){
        println "CARGANDO TEMPLATE DE CHAT"
        return render(view: '_mensajes', model:[peticion:params.peticion, solicitud:params.solicitud, confirm:params?.confirm])
    }

     @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO_APROBADO'])
    def retrieveLatestMessages() {
         SecUser usuario = getUser()
         Mascota mascotaSolicitud = Mascota.findById(params.solicitud.toLong())
         Mascota mascotaPeticion = Mascota.findById(params.peticion.toLong())
         String nombrePersona
         String nombreMascota
         if(mascotaSolicitud.secUser.id != usuario.id){
             nombrePersona = mascotaSolicitud.secUser.name
             nombreMascota = mascotaSolicitud.nombre
         } else {
             nombrePersona = mascotaPeticion.secUser.name
             nombreMascota = mascotaPeticion.nombre
         }
        List<Mensajeria> mensajeriaList = Mensajeria.listOrderByFecha(order: 'desc', max:20)

         Direccion solicitudDireccion = Direccion.findByUsuario(mascotaSolicitud.secUser)
         Direccion peticionDireccion = Direccion.findByUsuario(mascotaPeticion.secUser)
         Direccion direccionUsuario = Direccion.findByUsuario(getUser())
         if(direccionUsuario.usuario.username != solicitudDireccion.usuario.username) {
             peticionDireccion = solicitudDireccion
         }
        return render(view: "_chatPresentacionMensajes", model:[peticionDireccion:peticionDireccion, mensajes:mensajeriaList.reverse(),
                                                                solicitud: mascotaSolicitud, peticion: mascotaPeticion, nombreAmo: nombrePersona, nombreMascota: nombreMascota])
    }

     @Secured(['ROLE_ADMIN', 'ROLE_ENCUENTRO_APROBADO'])
    def submitMessage() {
         println 'SUBMIT MENSAJES ----> '+params
         Mascota solicitud = Mascota.findById(params.solicitud.toLong())
         Mascota peticion = Mascota.findById(params.peticion.toLong())
        new Mensajeria(usuario: getUser(), message:params.mensaje,
                mascotaPeticion: solicitud,
                        mascotaSolicitud: peticion).save()
        return render("<script>retrieveLatestMessages("+solicitud.id+ "," +peticion.id+ ")</script>")
    }

     private SecUser getUser() {
         String usuario = springSecurityService.principal.username
         SecUser secUser = SecUser.findByUsername(usuario)
         return secUser
     }
}
