package amordepatitas

class Persona {

    String nombre
    Date fechaNacimiento
    String email
//    String direccion
//    String telefono

    static hasMany = [mascotas: Mascota]

    static mapping = {
        version false
        nombre sqlType: 'varchar(50)'
        email sqlType: 'varchar(50)'
//        direccion sqlType: 'varchar(50)'
//        telefono sqlType: 'varchar(50)'

    }

    static constraints = {
        nombre nullable: false, blank : false
        fechaNacimiento nullable: false, blank : false
        email nullable: false, blank : false
//        direccion nullable: false, blank : false
//        telefono nullable: false, blank : false
    }
}
