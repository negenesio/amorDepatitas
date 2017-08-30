package amordepatitas

class UsuarioController {

    def index() { }

    def createUsuario() {
        println "------ **** ------"
        println params
        println "------ **** ------"
        return true
    }

    def ajaxFindUsuario() {
        println "------ **** 123------"
        println params
        println "------ **** 123------"
        return render(false)
    }

}
