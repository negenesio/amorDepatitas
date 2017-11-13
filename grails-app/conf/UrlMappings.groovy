class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        name deleted_image: "/mascota/delete-image"(controller: "imagenes", parseRequest: true){
            action = [POST:"deleteImage"]
        }

        name ajaxFindUsuario: "/usuario/ajaxFindUsuario"(controller: "usuario", parseRequest: true){
            action = [POST:"ajaxFindUsuario"]
        }

        name ajaxFindEmail: "/usuario/ajaxFindEmail"(controller: "usuario", parseRequest: true){
            action = [POST:"ajaxFindEmail"]
        }

        name usuario_create: "/usuario/create"(controller:"usuario", parseRequest:true){
            action = [POST:"createUsuario"]
        }

        name create_usuario_error: "/usuario/create/error"(controller:"usuario", parseRequest: true){
            action = [GET: "createUsuarioError"]
        }

        name login_usuario: "/usuario/loginUsuario"(controller:"usuario", parseRequest: true){
            action = [GET: "loginUsuario"]
        }

        name mascota_create_index: "/mascotas/create/index"(controller: "mascota", parseRequest: true){
            action = [GET: "create"]
        }

        name mascota_create: "/mascotas/createMascota"(controller: "mascota", parseRequest: true){
            action = [POST: "createMascota"]
        }

        name mascota_create_upload: "/mascotas/uploadMascota"(controller: "mascota", parseRequest: true){
            action = [POST: "uploadMascota"]
        }

        name usuario_index: "/usuario/index"(controller: "usuario", parseRequest: true){
            action = [GET: "indexUsuario"]
        }
        name upload_imagen: "/imagenes/uploadImagen"(controller: "imagenes", parseRequest: true){
            action = [POST: "uploadImagen"]
        }

        name upload_postulacion_pausa: "/postulacion/postulacionUpdatePausa"(controller: "postulacion", parseRequest: tre){
            action = [GET: "postulacionUpdatePausa"]
        }

        name cancelar_postulacion: "/postuacion/cancelarPostularMascota"(controller: "postulacion", parseRequest: tre){
            action = [POST: "cancelarPostularMascota"]
        }


        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        "/"(view:"/index")
        "500"(view:'/error')
    }
}
