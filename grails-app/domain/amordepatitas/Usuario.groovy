package amordepatitas

class Usuario {

    String password
    String usuario
    Date fechaCreacion = new Date()
    String nombre
    Date fechaNacimiento
    String email

//    static belongsTo = [fotoPerfil: Imagenes]

    static mapping = {
        version false
        password sqlType: 'varchar(30)'
        usuario sqlType: 'varchar(30)'
        nombre sqlType: 'varchar(50)'
        email sqlType: 'varchar(50)'
        fechaCreacion sqlType: 'datetime'
        fechaNacimiento sqlType: 'date'
    }

    static constraints = {
        password nullable: false, blank: false
        usuario nullable: false, blank: false
        fechaCreacion nullable: false, blank: false
        nombre nullable: false, blank : false
        fechaNacimiento nullable: false, blank : false
        email nullable: false, blank : false
    }
}
