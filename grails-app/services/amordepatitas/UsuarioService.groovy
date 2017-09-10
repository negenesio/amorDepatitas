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
        SecRole rol = SecRole.findByAuthority("USUARIO")
        return create(usuario, rol)
    }

    boolean createAdmin(SecUser usuario){
        SecRole rol = SecRole.findByAuthority("ADMIN")
        return create(usuario, rol)
    }

    boolean create(SecUser usuario, SecRole rol){
        SecUserSecRole usuarioRoles = new SecUserSecRole(secRole: rol, secUser: usuario)
        usuarioRoles.validate()
        if (usuarioRoles.hasErrors()) {
            usuarioRoles.errors.allErrors.each {
                LOG.error("[ERROR] [CREATE USUARIO - UsuarioRoles] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
                return false
            }
        }

        if (usuario.hasErrors()) {
            usuario.errors.allErrors.each {
                LOG.error("[ERROR] [CREATE USUARIO - Usuario] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
                return false
            }
        }

        usuario.save()
        usuarioRoles.save()
        LOG.info("[SUCCESS] [CREATE USUARIO] - [ROL: ${rol.authority}] - [Usuario: ${usuario.username}]")
        return true
    }
}
