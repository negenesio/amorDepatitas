package amordepatitas

class Imagenes {

    Mascota mascota
    String nombre
    String type
    byte[] imagen
    Date fechaCreacion = new Date()

    static constraints = {
        imagen (contentType: ['png','jpg', 'gif'], sqlType: 'longblob', maxSize: 1024*500)
    }
}
