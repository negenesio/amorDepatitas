package amordepatitas

import amordepatitas.seguridad.SecRole
import amordepatitas.seguridad.SecUser
import amordepatitas.seguridad.SecUserSecRole
import grails.transaction.Transactional
import org.apache.log4j.Logger

@Transactional
class UsuarioService {

    private static final Logger LOG = Logger.getLogger(getClass())

    boolean createUsuario(SecUser usuario){
        println "-- createUsuario Service ---"
        println "-- createUsuario Service ---"
        println "-- createUsuario Service ---"
        println "-- createUsuario Service ---"
        SecRole rol = SecRole.findByAuthority("ROLE_USER")
        return create(usuario, rol)
    }

    boolean createAdmin(SecUser usuario){
        SecRole rol = SecRole.findByAuthority("ROLE_ADMIN")
        return create(usuario, rol)
    }

    boolean create(SecUser usuario, SecRole rol){
        println "-- create Service ---"
        println "-- create Service ---"
        println "-- create Service ---"
        println "-- create Service ---"
        SecUserSecRole usuariosRoles = new SecUserSecRole(secRole: rol, secUser: usuario)

        if (usuario.hasErrors()) {
            usuario.errors.allErrors.each {
                println it
            }
//            LOG.error("[ERROR] [CREATE USUARIO - Usuario] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
            return false
        }

        usuario.save()
        usuariosRoles.save()
        LOG.info("[SUCCESS] [CREATE USUARIO] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
        return true
    }
}
