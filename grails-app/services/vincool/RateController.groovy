package vincool

/**
 * Created by apimentel on 3/3/17.
 */
trait RateController {
    def rate(Long id) {
        def event = Event.get(id)
        println event
        event.addRating(session.userDetails, 5)
        println event.getRatings()
        redirect(action: "index")
    }
}

