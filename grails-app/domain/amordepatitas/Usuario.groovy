package amordepatitas

class Usuario {

    String password
    String usuario
    Date fechaCreacion = new Date()

    static belongsTo = [fotoPerfil: Imagenes]

    static mapping = {
        version false
        password sqlType: 'varchar(30)'
        usuario sqlType: 'varchar(30)'
    }

    static constraints = {
        password nullable: false, blank: false
        usuario nullable: false, blank: false
        fechaCreacion nullable: false, blank: false
    }
}
