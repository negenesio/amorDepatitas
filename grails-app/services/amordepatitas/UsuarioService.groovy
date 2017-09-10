package amordepatitas

import grails.transaction.Transactional
import org.apache.log4j.Logger

@Transactional
class UsuarioService {

    private static final Logger LOG = Logger.getLogger(getClass())

    def serviceMethod() {

    }

    boolean createUsuario(Usuario usuario){
        Rol rol = Rol.findByRol("USUARIO")
        return create(usuario, rol)
    }

    boolean createAdmin(Usuario usuario){
        Rol rol = Rol.findByRol("ADMIN")
        return create(usuario, rol)
    }

    boolean create(Usuario usuario, Rol rol){
        UsuariosRoles usuarioRoles = new UsuariosRoles(rol: rol, usuario:usuario)
        usuarioRoles.validate()
        if (usuarioRoles.hasErrors()) {
            usuarioRoles.errors.allErrors.each {
                LOG.error("[ERROR] [CREATE USUARIO - UsuarioRoles] - [ROL: ${rol.rol}] - [Usuario: ${usuario.usuario}]")
                return false
            }
        }

        if (usuario.hasErrors()) {
            usuario.errors.allErrors.each {
                LOG.error("[ERROR] [CREATE USUARIO - Usuario] - [ROL: ${rol.rol}] - [Usuario: ${usuario.usuario}]")
                return false
            }
        }

        usuario.save()
        usuarioRoles.save()
        LOG.info("[SUCCESS] [CREATE USUARIO] - [ROL: ${rol.rol}] - [Usuario: ${usuario.usuario}]")
        return true
    }
}
