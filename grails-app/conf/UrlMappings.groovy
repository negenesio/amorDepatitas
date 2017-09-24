class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
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

        name mascota_create: "/mascota/createMascota"(controller: "mascota", parseRequest: true){
            action = [POST: "createMascota"]
        }

        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        "/"(view:"/index")
        "500"(view:'/error')
    }
}
