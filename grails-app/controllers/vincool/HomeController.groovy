package vincool

import java.time.LocalDate

class HomeController {
    def roleUserService

    def index() {
        if (roleUserService.isCurrentUserAnAttendee()) {
            forward controller: "event"
        } else if (roleUserService.isCurrentUserAInstructor()) {
            forward controller: "event"
        } else if (roleUserService.isCurrentUserAnAdmin()) {
            forward controller: "event"
        } else {
            render(view: "landing_esp", model: [instructors: Instructor.findAllByNameIsNotNullAndIsPublic(true)?.collate(3), nextClasses: Event.createCriteria().list {
                ge('date', LocalDate.now())
                batch {
                    eq('isActive', true)
                }
                maxResults(2)
                order("date", "asc")
            }])
        }

    }
}
