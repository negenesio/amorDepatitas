package amordepatitas

import amordepatitas.seguridad.SecUser
import org.codehaus.groovy.grails.web.json.JSONObject
import grails.plugin.springsecurity.annotation.Secured
import java.text.DateFormat
import java.text.SimpleDateFormat

class UsuarioController {

    UsuarioService usuarioService

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
                enabled: true
        )

        boolean usuarioResult = usuarioService.createUsuario(usuario)
        if(!usuarioResult){
            return redirect(mapping: 'create_usuario_error')
        }
        return redirect(mapping: 'create_usuario_index')
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
    def createUsuarioIndex(){
        return render(view: "createUsuarioIndex")
    }

}
