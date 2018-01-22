package amordepatitas

import grails.transaction.Transactional

@Transactional
class MatchEncuentrosService {

    boolean validarMatch(Mascota buscador, Mascota encontrado) {
        MatchEncuentros match = MatchEncuentros.findByBuscadorAndEncontrado(buscador, encontrado)

        return match ? false : true
    }
}
