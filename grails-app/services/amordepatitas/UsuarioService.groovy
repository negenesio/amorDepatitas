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
        SecRole rol = SecRole.findByAuthority("ROLE_USER")
        if (usuario.hasErrors()) {
            usuario.errors.allErrors.each {
                println it
            }
//            LOG.error("[ERROR] [CREATE USUARIO - Usuario] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
            return false
        }
        if (rol.hasErrors()) {
            rol.errors.allErrors.each {
                println it
            }
//            LOG.error("[ERROR] [CREATE USUARIO - Usuario] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
            return false
        }
        return create(usuario, rol)
    }

    boolean createAdmin(SecUser usuario){
        SecRole rol = SecRole.findByAuthority("ROLE_ADMIN")
        return create(usuario, rol)
    }

    boolean create(SecUser usuario, SecRole rol){
        SecUserSecRole usuariosRoles = new SecUserSecRole(secRole: rol, secUser: usuario)
        usuario.save()
        usuariosRoles.save()
        LOG.info("[SUCCESS] [CREATE USUARIO] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
        return true
    }
}
