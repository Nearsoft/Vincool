package vincool

class Enrollment {


    boolean attendance

    static belongsTo = [attendee: Attendee, event: Event]

    static constraints = {
        attendee unique: 'event'
        event()
        attendance()
    }

    static mapping = {
        version false
        id sqlType:"serial"
    }

    String toString(){
        "" + attendee + " : "+event +" : "+event?.eventCategory
    }
}
