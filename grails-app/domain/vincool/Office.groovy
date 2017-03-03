package vincool

class Office {

    String officeCode
    String name
    String location
    String phoneNumber

    static constraints = {
        officeCode blank: false, unique: true
        phoneNumber blank: false
        location blank: false
        name blank: false
    }

    static mapping = {
        version false
        id sqlType:"serial"
    }

    String toString(){
        name
    }
}
