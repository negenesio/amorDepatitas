import amordepatitas.seguridad.SecRole
import amordepatitas.seguridad.SecUser
import amordepatitas.seguridad.SecUserSecRole

import java.text.DateFormat
import java.text.SimpleDateFormat

class BootStrap {

    def springSecurityService

    def init = { servletContext ->

        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                name: 'admin',
                email: 'nicolas.gnesio@mercadolibre.com',
                dateBirth: new Date(),
                password: 'admin',
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }
//        DateFormat sourceFormat = new SimpleDateFormat("yyyy-MM-dd");
//        String dateAsString = '1989-07-15'
//        Date fechaNacimiento = sourceFormat.parse(dateAsString)
//        Rol usuario = new Rol(rol:'USUARIO')
//        Rol admin = new Rol(rol:'ADMIN')
//        Usuario userAdmin = new Usuario(password:1234, fechaNacimiento: fechaNacimiento, nombre: "Nicolas Genesio", email: "nicolas.genesio@mercadolibre.com", usuario: "admin", fechaCreacion: new Date())
//        userAdmin.validate()
//        if (userAdmin.hasErrors()) {
//            userAdmin.errors.allErrors.each {
//                println it
//            }
//        }
//        userAdmin.save()
//        admin.save()
//        usuario.save()
//        UsuariosRoles usuarioRoles = new UsuariosRoles(rol:admin, usuario: userAdmin)
//        if (usuarioRoles.hasErrors()) {
//            usuarioRoles.errors.allErrors.each {
//                println it
//            }
//        }
//        usuarioRoles.save()
    }
    def destroy = {
    }
}
