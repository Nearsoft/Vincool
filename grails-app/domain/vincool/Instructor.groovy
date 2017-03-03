package vincool

import vincool.auth.SecUser

class Instructor extends SecUser{

    Boolean isPublic = false

    static constraints = {

    }

    static mapping = {
        version false
        id sqlType:"serial"
    }

    String toString(){
        name
    }

}
