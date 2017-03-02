package vincool

import grails.databinding.BindingFormat

import java.time.LocalDate
import java.time.LocalTime

class Event {

    String type
    @BindingFormat("yyyy-MM-dd")
    LocalDate date
    @BindingFormat("HH:mm")
    LocalTime time
    Instructor instructor
    Office office
    String description
    String pictureUrl

    static hasMany = [resources: Resource, enrollments: Enrollment]
    static belongsTo = [batch: Batch, eventCategory: EventCategory]

    static constraints = {
        eventCategory()
        instructor()
        date()
        time()
        type()
        office()
        pictureUrl nullable: true
        description widget: 'textarea'
    }

    static mapping = {
        version false
    }

    String toString() {
        description
    }


}
