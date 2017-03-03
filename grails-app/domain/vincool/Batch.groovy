package vincool

class Batch {

    String edition
    Boolean isActive

    static hasMany = [events : Event]

    static constraints = {
        edition blank: false, unique: true, display: true
        isActive()
    }

    static mapping = {
        version false
        id sqlType:"serial"
    }

    String toString(){
        edition
    }
}
