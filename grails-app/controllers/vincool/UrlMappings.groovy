package vincool

class UrlMappings {

    static mappings = {
        "/ns-${program}"(controller: "landing", action: "view")
        "/ns-$program/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "home", action: "index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
