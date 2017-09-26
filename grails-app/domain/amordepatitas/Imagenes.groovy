package amordepatitas

class Imagenes {

    Mascota mascota
    String nombre
    String type
    byte[] imagen

    static constraints = {
        imagen contentType: ['png','jpg']
    }
}
