package vincool

import vincool.auth.SecUser

class Attendee extends SecUser implements Rateable{

    Integer age
    String school
    String currentCompany

    static hasMany = [enrollments: Enrollment]

    static constraints = {
        age blank: true, min: 0, nullable: true
        school blank: true, nullable: true
        currentCompany blank: true, nullable: true
    }

    static mapping = {
        version false
    }

    String toString(){
        name
    }

}
