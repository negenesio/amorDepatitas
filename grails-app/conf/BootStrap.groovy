import amordepatitas.Rol
import amordepatitas.UsuariosRoles
import amordepatitas.Usuario

import java.text.DateFormat
import java.text.SimpleDateFormat

class BootStrap {
    def init = { servletContext ->

        DateFormat sourceFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateAsString = '1989-07-15'
        Date fechaNacimiento = sourceFormat.parse(dateAsString)
        Rol usuario = new Rol(rol:'USUARIO')
        Rol admin = new Rol(rol:'ADMIN')
        Usuario userAdmin = new Usuario(password:1234, fechaNacimiento: fechaNacimiento, nombre: "Nicolas Genesio", email: "nicolas.genesio@mercadolibre.com", usuario: "admin", fechaCreacion: new Date())
        userAdmin.validate()
        if (userAdmin.hasErrors()) {
            userAdmin.errors.allErrors.each {
                println it
            }
        }
        userAdmin.save()
        admin.save()
        usuario.save()
        UsuariosRoles usuarioRoles = new UsuariosRoles(rol:admin, usuario: userAdmin)
        if (usuarioRoles.hasErrors()) {
            usuarioRoles.errors.allErrors.each {
                println it
            }
        }
        usuarioRoles.save()
    }
    def destroy = {
    }
}
