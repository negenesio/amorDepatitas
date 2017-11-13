package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.converters.JSON
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import groovy.time.TimeCategory

class PostulacionController {

    PostulacionService postulacionService
    SpringSecurityService springSecurityService

    @Secured(['ROLE_ADMIN', 'ROLE_POSTULACION'])
    def busquedaIndex(){

    }

    @Secured(['ROLE_ADMIN', 'ROLE_POSTULACION'])
    def busquedaFiltros(){
        def result
        SecUser usuario = springSecurityService.getCurrentUser()
        Raza raza = Raza.findById(params.raza?.toLong());
        Mascota mascota = Mascota.findByRazaAndSexo(raza, params.sexo_mascota)
        def edad_desde = 0
        def edad_hasta = 0
        Date fechaCumpleDesde = new Date()
        Date fechaCumpleHasta = new Date()
        if(params.disponible_edad){
            edad_desde = params.desde_edad.toInteger() ?: 0
            edad_hasta = params.hasta_edad.toInteger() ?: 0
            use(TimeCategory) {
                fechaCumpleDesde = fechaCumpleDesde - edad_desde.year
            }
            use(TimeCategory) {
                fechaCumpleDesde = fechaCumpleDesde - edad_desde.year
            }
        } else {
            edad_desde = 100
            use(TimeCategory) {
                fechaCumpleDesde = fechaCumpleDesde - edad_desde.year
            }
        }

        def criteriaMascota = Mascota.createCriteria()
        def resultMascota = criteriaMascota.list {
            and {
                and {
                    eq("sexo", params.sexo_mascota)
                }
                and {
                    eq("raza", raza)
                }
//                and {
//                    between("fechaNacimiento", fechaCumpleDesde, fechaCumpleHasta)
//                }
                and {
                    eq("postulado", true)
                }
            }
        }
        println params
        println resultMascota
        if(resultMascota){
            println "-- MASCOTA --- SII ---"
            String lunes = params.LUNES ? 'LUNES' : null
            String martes = params.MARTES ? 'MARTES' : null
            String miercoles = params.MIERCOLES ? 'MIERCOLES' : null
            String jueves = params.JUEVES ? 'JUEVES' : null
            String viernes = params.VIERNES ? 'VIERNES' : null
            String sabado = params.SABADO ? 'SABADO' : null
            String domingo = params.DOMINGO ? 'DOMINGO' : null
            Date desde
            Date hasta
            if(params.disponible_hora == 'NO'){
                desde = Date.parse('HH:mm', '00:01')
                hasta = Date.parse('HH:mm', '23:59')
            } else {
                desde = Date.parse('HH:mm', params?.desde)
                hasta = Date.parse('HH:mm', params?.hasta)
            }

            def criteria = Postulacion.createCriteria()
            result = criteria.list {
                or {
                    or {
                        like("dias", "%${lunes}%")
                    }
                    or {
                        like("dias", "%${martes}%")
                    }
                    or {
                        like("dias", "%${miercoles}%")
                    }
                    or {
                        like("dias", "%${jueves}%")
                    }
                    or {
                        like("dias", "%${viernes}%")
                    }
                    or {
                        like("dias", "%${sabado}%")
                    }
                    or {
                        like("dias", "%${domingo}%")
                    }
                    or {
                        like("dias", "%${martes}%")
                    }
                }
//                and {
//                    between("desde", Date.parse('HH:mm', '00:01'), desde)
//                }
//                and {
//                    between("hasta", desde, hasta)
//                }
            }
        }

        return([postulaciones: result])

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
