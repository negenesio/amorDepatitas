package amordepatitas

import amordepatitas.seguridad.SecUser
import org.codehaus.groovy.grails.web.json.JSONObject

import java.text.DateFormat
import java.text.SimpleDateFormat

class UsuarioController {

    UsuarioService usuarioService

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
                dateCreated: new Date()
        )

        boolean usuarioResult = usuarioService.createUsuario(usuario)
        if(!usuarioResult){
            return redirect(mapping: 'create_usuario_error')
        }
        session.usuario = usuario
        return redirect(mapping: 'create_usuario_index')
    }

    def ajaxFindUsuario() {
        if(Usuario.findByUsuario(params.username)){
            return render(new JSONObject('valid':false))
        }
        return render(new JSONObject('valid':true))
    }

    def ajaxFindEmail() {
        if(Usuario.findByEmail(params.email)){
            return render(new JSONObject('valid':false))
        }
        return render(new JSONObject('valid':true))
    }

    def createUsuarioError(){
        return render(view: "createUsuarioError")
    }

    def createUsuarioIndex(){
        return render(view: "createUsuarioIndex", model:[usuario:session.usuario])
    }

}
