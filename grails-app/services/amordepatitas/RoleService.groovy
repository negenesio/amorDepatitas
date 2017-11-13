package amordepatitas

import amordepatitas.seguridad.SecRole
import amordepatitas.seguridad.SecUser
import amordepatitas.seguridad.SecUserSecRole
import grails.transaction.Transactional
import org.apache.log4j.Logger

@Transactional
class RoleService {

    def springSecurityService
    private static final Logger LOG = Logger.getLogger(getClass())

    def addRoleUser(String role, Long userId) {
        SecRole rol = SecRole.findByAuthority(role)
        SecUser user = SecUser.findById(userId)
        SecUserSecRole.create user, rol
        if (!user.hasErrors() && user.save(flush: true)) {
            springSecurityService.reauthenticate user.username
        }
        LOG.info("[SUCCESS] [ADD ROLE] - [ROLE: ${role}] - [Usuario: ${user.username}]")
        return true
    }

    def removeRoleUser(String role, Long userId) {
        SecRole rol = SecRole.findByAuthority(role)
        SecUser user = SecUser.findById(userId)
        SecUserSecRole secUserSecRole = SecUserSecRole.findBySecUserAndSecRole(user, rol)
        secUserSecRole.delete(flush: true)
        springSecurityService.reauthenticate user.username
        LOG.info("[SUCCESS] [BORRAR ROLE] - [ROLE: ${role}] - [Usuario: ${user.username}]")
        return true
    }
}
