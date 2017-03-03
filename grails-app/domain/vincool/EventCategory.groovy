package vincool

class EventCategory {

    enum Category {
        APPRENTICE,
        MEETUP,
        WORKSHOP

        String toString(){
            this.name().toLowerCase().capitalize()
        }
    }

    Category category
    String subCategory
    String color

    static hasMany = [events: Event]

    static constraints = {
        subCategory blank: false
        color blank: false
    }

    static mapping = {
        version false
        id sqlType:"serial"
    }
    String toString(){
        subCategory
    }
}
