package amordepatitas

import amordepatitas.seguridad.SecRole
import amordepatitas.seguridad.SecUser
import amordepatitas.seguridad.SecUserSecRole
import grails.transaction.Transactional

@Transactional
class RoleService {

    def springSecurityService

    def addRoleUser(String role, Long userId) {
        SecRole rol = SecRole.findByAuthority(role)
        SecUser user = SecUser.findById(userId)
        SecUserSecRole.create user, rol
        if (!user.hasErrors() && user.save(flush: true)) {
            springSecurityService.reauthenticate user.username
        }
        return true
    }

    def removeRoleUser(String role, Long userId) {
        SecRole rol = SecRole.findByAuthority(role)
        SecUser user = SecUser.findById(userId)
        SecUserSecRole secUserSecRole = SecUserSecRole.findBySecUserAndSecRole(user, rol)
        secUserSecRole.delete(flush: true)
        springSecurityService.reauthenticate user.username
        return true
    }
}
