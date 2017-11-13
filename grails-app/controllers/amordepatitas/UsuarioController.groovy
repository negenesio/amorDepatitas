package amordepatitas

import amordepatitas.seguridad.SecUser
import grails.plugin.springsecurity.SpringSecurityService
import org.codehaus.groovy.grails.web.json.JSONObject
import grails.plugin.springsecurity.annotation.Secured
import java.text.DateFormat
import java.text.SimpleDateFormat

class UsuarioController {

    UsuarioService usuarioService
    SpringSecurityService springSecurityService

    @Secured(['permitAll'])
    def createUsuario() {
        DateFormat sourceFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateAsString = params.fechaNacimiento
        Date fechaNacimiento = sourceFormat.parse(dateAsString)
        SecUser usuario = new SecUser(
                password: params.password,
                dateBirth: fechaNacimiento,
                name: params.name,
                email: params.email,
                username: params.username,
                dateCreated: new Date(),
                sexo: params.sexo,
                enabled: true
        )

        boolean usuarioResult = usuarioService.createUsuario(usuario)
        if(!usuarioResult){
            return redirect(mapping: 'create_usuario_error')
        }
        return redirect(mapping: 'login_usuario')
    }

    @Secured(['permitAll'])
    def ajaxFindUsuario() {
        if(SecUser.findByUsername(params.username)){
            return render(new JSONObject('valid':false))
        }
        return render(new JSONObject('valid':true))
    }

    @Secured(['permitAll'])
    def ajaxFindEmail() {
        if(SecUser.findByEmail(params.email)){
            return render(new JSONObject('valid':false))
        }
        return render(new JSONObject('valid':true))
    }

    @Secured(['permitAll'])
    def createUsuarioError(){
        return render(view: "createUsuarioError")
    }

    @Secured(['permitAll'])
    def loginUsuario(){
        return render(view: '../login/auth', model:[message:'Ya puedes iniciar sesion!'])
    }

    @Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def indexUsuario(){

        SecUser user = SecUser.findById(springSecurityService.principal.id.toLong())
        List<Mascota> mascotaList = Mascota.findAllBySecUser(user)
        if(mascotaList) {
            if(mascotaList.find {it.postulado == true}){
               List<Postulacion> postulacionList = Postulacion.findAllByUser(user)
                return [mascotas: mascotaList, postulaciones: postulacionList]
            } else {
                return [mascotas: mascotaList]
            }
        }
    }
}
