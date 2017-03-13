package vincool

import vincool.auth.SecUser

class Instructor extends SecUser implements Rateable{

    Boolean isPublic = false

    static hasMany = [events: Event]

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
