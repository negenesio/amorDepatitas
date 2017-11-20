package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class PostulacionController {

    PostulacionService postulacionService
    SpringSecurityService springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_POSTULACION'])
    def busquedaIndex(){
        SecUser usuario = getUser()
        List<Postulacion> postulacionList = Postulacion.findAllByUser(usuario)
        List<Raza> resultRaza = postulacionList.mascota.raza.unique()
        return render(view: 'busquedaIndex', model:[razas: resultRaza])
    }
    private List<Mascota> getMascotasByRaza(List<Mascota> mascotaList, Long raza_id){
        List<Mascota> resultMascota = mascotaList.findAll { it.raza.id == raza_id}
        log.info (" [MASCOTA FILTRO POR RAZAS ID: "+raza_id+" - CANTIDAD: "+resultMascota?.size()+"]")
        return resultMascota
    }

    private List<Mascota> getMascotasBySexo(List<Mascota> mascotaList, String sexo){
        List<Mascota> resultMascota = mascotaList.findAll { it.sexo == sexo}
        log.info (" [MASCOTA FILTRO POR SEXO: "+sexo+" - CANTIDAD: "+resultMascota?.size()+"]")
        return resultMascota
    }

    private List<Mascota> getMascotasByPostulado(List<Mascota> mascotaList, Boolean estado){
        List<Mascota> resultMascota = mascotaList.findAll { it.postulado == estado}
        log.info (" [MASCOTA FILTRO POR ESTADO: "+estado+" - CANTIDAD: "+resultMascota?.size()+"]")
        return resultMascota
    }

    private List<Mascota> getMascotasByEdad(List<Mascota> mascotaList, int edad_desde, int edad_hasta){
        int anios_actual = new Date().format('YYYY').toInteger()
        List<Mascota> resultMascota = mascotaList.findAll { anios_actual - it.fechaNacimiento.format('YYYY').toInteger() in edad_desde..edad_hasta }
        log.info (" [MASCOTA FILTRO POR EDAD DESDE:"+edad_desde+" - EDAD HASTA: "+edad_hasta+" - CANTIDAD: "+resultMascota?.size()+"]")
    }

    private List<Mascota> getMascotaByFiltros(Long raza_id, String sexo, String disponible_edad){
        List<Mascota> resultMascota = getMascotasByRaza(Mascota.findAll(), raza_id)
        resultMascota = getMascotasBySexo(resultMascota, sexo)
        resultMascota = getMascotasByPostulado(resultMascota, true)
        if (disponible_edad == 'SI') {
            int edad_desde = params.desde_edad.toInteger()
            int edad_hasta = params.hasta_edad.toInteger()
            resultMascota = getMascotasByEdad(resultMascota, edad_desde, edad_hasta)
        }
        log.info (" [MASCOTA FILTROS CANTIDAD: "+resultMascota?.size()+"]")
        return resultMascota
    }

    private List<Postulacion> getPostulacionesHoras(List<Postulacion> postulacionList, String hora_desde, String hora_hasta){
        List<Postulacion> result = new ArrayList<Postulacion>()
        Date result_hora_desde = Date.parse( 'HH', hora_desde)
        int desde = result_hora_desde.format("HH").toInteger()
        Date result_hora_hasta = Date.parse( 'HH', hora_hasta)
        int hasta = result_hora_hasta.format("HH").toInteger()
        postulacionList?.each { postulacion ->
            int postulacion_hora_desde = postulacion.desde.format("HH").toInteger()
            int postulacion_hora_hasta = postulacion.hasta.format("HH").toInteger()
            if(postulacion_hora_desde <= desde && postulacion_hora_hasta >= desde && postulacion_hora_desde <= hasta && postulacion_hora_hasta >= hasta){
                result << postulacion
            }
        }
        log.info (" [POSTULACIONES FILTRO POR HORA DISPONIBLE: "+result?.size()+"]")
        return result
    }

    private List<Postulacion> getPostulacionesByMascotaId(List<Postulacion> postulacionList, List<Mascota> mascotaList){
        List<Postulacion> result = new ArrayList<Postulacion>()
        result = postulacionList.findAll { it.mascota.id in mascotaList.id }
        log.info (" [POSTULACIONES FILTRO POR MASCOTA RAZA DISPONIBLE: "+result?.size()+"]")
        return result
    }

    private List<Postulacion> getPostulacionesByPausa(List<Postulacion> postulacionList, Boolean status){
        List<Postulacion> result = postulacionList.findAll { it.pausa == status }
        log.info (" [POSTULACIONES FILTRO POR PAUSA: - STATUS: "+status+" - CANTIDAD: "+result?.size()+"]")
        return result
    }

    private List<Postulacion> getPostulacioesnByDias(List<Postulacion> postulacionList, def lunes, def martes,
                                                     def miercoles, def jueves, def viernes, def sabado, def domingo) {
        List<Postulacion> result = new ArrayList<Postulacion>()
        postulacionList.each { postulacion ->
            List<String> dias = postulacion.dias.split(",")
            if(lunes && 'LUNES' in dias) {
                result << postulacion
            }
            else if(martes && 'MARTES' in dias) {
                result << postulacion
            }
            else if(miercoles && 'MIERCOLES' in dias) {
                result << postulacion
            }
            else if(jueves && 'JUEVES' in dias) {
                result << postulacion
            }
            else if(viernes && 'VIERNES' in dias) {
                result << postulacion
            }
            else if(sabado && 'SABADO' in dias) {
                result << postulacion
            }
            else if(domingo && 'DOMINGO' in dias) {
                result << postulacion
            }
        }
        log.info (" [POSTULACIONES FILTRO DIAS - CANTIDAD: "+result?.size()+"]")
        return result
    }

    private List<Postulacion> getPostulacionesByNoSameUser(List<Postulacion> postulacionList){
        SecUser usuario = getUser()
        List<Postulacion> result = postulacionList.findAll { it.user.id != usuario.id }
        log.info (" [POSTULACIONES FILTRO USUARIO DIFERENTE - CANTIDAD: "+result?.size()+"]")
        return result
    }

    private List<Postulacion> getPostulacionesFiltros(List<Postulacion> postulacionList, String disponible_hora, String hora_desde, String hora_hasta, List<Mascota> mascotaList){
        List<Postulacion> resultPostulacion = postulacionList
        if(disponible_hora == 'SI'){
            resultPostulacion = getPostulacionesHoras(resultPostulacion, hora_desde, hora_hasta)
        }
        resultPostulacion = getPostulacionesByMascotaId(resultPostulacion, mascotaList)
        resultPostulacion = getPostulacionesByPausa(resultPostulacion, false)
        resultPostulacion = getPostulacioesnByDias(resultPostulacion, params.LUNES, params.MARTES, params.MIERCOLES,
                params.JUEVES, params.VIERNES, params.SABADO, params.DOMINGO)
        resultPostulacion = getPostulacionesByNoSameUser(resultPostulacion)
        return resultPostulacion
    }

    @Secured(['ROLE_ADMIN', 'ROLE_POSTULACION'])
    def busquedaFiltros(){
        log.info (" [PARAMS: "+params+"]")
        List<Mascota> resultMascota = getMascotaByFiltros(params.raza.toLong(), params.sexo_mascota, params.check_edad)
        List<Postulacion> result = new ArrayList<Postulacion>()
        if(resultMascota){
            List<Postulacion> postulaciones = Postulacion.findAll()
            log.info (" [POSTULACIONES: "+postulaciones?.size()+"]")
            if(postulaciones){
                List<Postulacion> resultPostulacion = getPostulacionesFiltros(postulaciones, params.check_hora, params.desde, params.hasta, resultMascota)
                result = resultPostulacion
            }
        }
        return render(view:"busquedaFiltros", model:[postulaciones:result])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MASCOTA'])
    def postularMascota() {
        Mascota mascota = Mascota.findById(params.mascotaIdModal)
        SecUser usuario = springSecurityService.getCurrentUser()
        boolean pausa = false
        if(params.pausar_radio == 'true'){
            pausa = true
        }
        ArrayList<String> dias = new ArrayList<String>()
        params?.LUNES ? dias.add('LUNES') : null
        params?.MARTES ? dias.add('MARTES') : null
        params?.MIERCOLES ? dias.add('MIERCOLES') : null
        params?.JUEVES ? dias.add('JUEVES') : null
        params?.VIERNES ? dias.add('VIERNES') : null
        params?.SABADO ? dias.add('SABADO') : null
        params?.DOMINGO ? dias.add('DOMINGO') : null
        Date hasta
        Date desde
        if(params.disponible_hora == 'NO'){
            desde = Date.parse('HH:mm', '00:01')
            hasta = Date.parse('HH:mm', '23:59')
        } else {
            desde = Date.parse('HH:mm', params?.desde)
            hasta = Date.parse('HH:mm', params?.hasta)
        }
        String observaciones = params?.observaciones

        Map postulacion_params = [
                dias : dias.join(','),
                pausa : pausa,
                observaciones: observaciones,
                desde: desde,
                hasta: hasta,
                mascotaId : mascota.id,
                usuarioId : usuario.id
        ]

        postulacionService.savePostulacion(postulacion_params)
        return redirect(controller: 'usuario', action: 'indexUsuario')
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MASCOTA'])
    def cancelarPostularMascota() {
        println "CANCELACION :D"
        Long mascotaId = params.id.toLong()
        postulacionService.cancelarPostular(mascotaId)
        redirect (action: 'indexUsuario', controller: 'usuario')
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MASCOTA'])
    def getPostulacionPausa() {
        Postulacion postulacion = getPostulacion(params.mascotaId)
        return render(postulacion?.pausa)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MASCOTA'])
    def postulacionUpdatePausa(){
        Postulacion postulacion = getPostulacion(params.postulacion)
        Boolean pausa = false
        if(params.pausa == 'false'){
            pausa = false
        } else {
            pausa = true
        }
        postulacion.pausa = pausa
        postulacion.save(flush:true)
        if(postulacion.hasErrors()){
            postulacion.errors.allErrors.each {
                log.error("[ERROR] [UPDATE POSTULACION PAUSA] - [MESSAGE: ${it}]")
            }
            return false
        }
        println postulacion
        println postulacion as JSON
        log.info("[SUCCESS] [UPDATE POSTULACION PAUSA] - [USUARIO: ${postulacion.user.username}]")
        return redirect(controller: 'usuario', action:'indexUsuario', params:[postulacion: postulacion as JSON])
    }

    private Postulacion getPostulacion(def mascotaId){
        Mascota mascota = Mascota.findById(mascotaId.toLong())
        SecUser user = getUser()
        return Postulacion.findByMascotaAndUser(mascota, user)
    }

    private SecUser getUser() {
        String usuario = springSecurityService.principal.username
        SecUser secUser = SecUser.findByUsername(usuario)
        return secUser
    }
}
