package vincool

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.NOT_FOUND

@Secured(['isAuthenticated()'])

class RatingController {

    static allowedMethods = [rate: ['PUT', 'POST']]

    def nameMapping = ['event': Event, 'resource': Resource, 'attendee': Attendee, 'instructor': Instructor, 'batch': Batch]

    def rate() {
        def instance = nameMapping[params.entity]?.get(params.id)
        if(instance) {
            instance.addRating(session.userDetails, params.rate)
            respond instance.getRating(session.userDetails), model: []
        } else {
            render status: NOT_FOUND
        }
    }

}
