package vincool

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.NOT_FOUND

@Secured(['isAuthenticated()'])

class RatingController {

    static allowedMethods = [rate: ['PUT', 'POST'], myRate: 'GET']

    def nameMapping = ['Event': Event, 'Resource': Resource, 'Attendee': Attendee, 'Instructor': Instructor, 'Batch': Batch]

    def rate() {
        def jsonObject = request.JSON
        println(jsonObject)
        def instance = nameMapping[jsonObject.entity]?.get(jsonObject.id)
        if(instance) {
            instance.addRating(session.userDetails, jsonObject.rate, jsonObject.comment)
            instance.getRating(session.userDetails)
            def json = [avg: instance.getAvgRating(), entity: instance.getClass().getSimpleName(), id: instance.id]
            render json as JSON
        } else {
            render status: NOT_FOUND
        }
    }

    def myRate(Long id){
        def instance = nameMapping[params.entity]?.get(id)
        respond instance.getRating(session.userDetails)
    }
}
