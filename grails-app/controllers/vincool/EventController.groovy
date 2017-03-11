package vincool

import grails.io.IOUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.apache.commons.io.FilenameUtils
import org.springframework.http.ResponseEntity

import java.time.LocalDate

import static org.springframework.http.HttpStatus.OK

@Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
class EventController{

    def springSecurityService
    def roleUserService
    def cloudinaryService
    static scaffold = Event

    static allowedMethods = [index: "GET", show: "GET", resource: "GET", addResource: "POST"]

    final MAX_ATTENDEES_PICTURES = 10


    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR', 'ROLE_STUDENT'])
    def index(Integer max) {
        def userDetails = session.userDetails
        def events, eventCount
        params.max = Math.min(max ?: 10, 100)
        if (roleUserService.isCurrentUserAnAdmin()) {
            events = Event.list(params)
            eventCount = Event.count()
        } else if (roleUserService.isCurrentUserAInstructor()) {
            events = Event.findAllByInstructor(userDetails, params)
            eventCount = Event.countByInstructor(userDetails, params)
        } else if (roleUserService.isCurrentUserAnAttendee()) {

            events = Event.createCriteria().list(params) {
                enrollments {
                    attendee {
                        eq('id', userDetails.id)
                    }
                }
            }
            eventCount = Event.createCriteria().count() {
                enrollments {
                    attendee {
                        eq('id', userDetails.id)
                    }
                }
            }
        }
        respond events, model: [eventCount: eventCount]
    }

    @Secured(['permitAll'])
    def show(Long id) {

        def event = Event.get(id)
        boolean expired = LocalDate.now().isAfter(event.date)
        if (!springSecurityService.loggedIn) {

            if (event == null) {
                redirect(controller: "calendar", action: "index")
                return
            }

            render([view: "show2", model: [event: event, isEnrolled: false, expired:expired]])

        } else if (roleUserService.currentUserAnAttendee) {

            if (event == null) {
                redirect(controller: "calendar", action: "index")
                return
            }
            Enrollment enrollment =  Enrollment.findByAttendeeAndEvent(springSecurityService.currentUser, event)
            def isEnrolled = enrollment != null

            render([view: "show2", model: [event: event, isEnrolled: isEnrolled, expired: expired, enrollment: enrollment]])

        } else {

            if (event == null) {
                redirect(action: "index")
                return
            }

            def ownsEvent = true
            if (roleUserService.currentUserAInstructor) {
                def instructorEvents = Event.findAllByInstructor(springSecurityService.currentUser)
                if (!instructorEvents.contains(event)) {
                    ownsEvent = false
                }
            }

            def enrollments = Enrollment.findAllByEvent(event)
            def attendeesPictures = enrollments.take(MAX_ATTENDEES_PICTURES).collect { it.attendee.profilePictureUrl }

            def assistance = 0

            for (enrollment in enrollments) {
                if (enrollment.attendance) {
                    assistance++
                }
            }

            def assistancePercentage = 0
            if (!enrollments.isEmpty()) {
                assistancePercentage = ((assistance / enrollments.size()) * 100).intValue()
            }

            def eventDetails = [enrollments         : enrollments,
                                attendeesPictures   : attendeesPictures,
                                assistancePercentage: assistancePercentage,
                                ownsEvent           : ownsEvent]
            render([view: "detail", model: [event: event, eventDetails: eventDetails]])
        }

    }

    def resource(Long id) {
        render([view: "resource", model: [event: Event.findById(id)]])
    }

    def addResource(Resource resource) {
        resource.save(flush: true)
        redirect(action: "show", id: resource.event.id)
    }

    @Secured(['ROLE_ADMIN', 'ROLE_INSTRUCTOR'])
    @Transactional
    def update(Event event) {

        if (event == null) {
            transactionStatus.setRollbackOnly()
            ResponseEntity.notFound()
            return
        }

        def picture = request.getPart("picture")

        if (picture) {
            def fileName = FilenameUtils.getName(event.pictureUrl)
            def publicId = FilenameUtils.removeExtension(fileName) ?: "a"

            def data = IOUtils.copyToByteArray(picture.getInputStream())
            if (data && data.length > 0) {
                def uploadResult = cloudinaryService.update(publicId, data)
                event.pictureUrl = uploadResult.url
            }

        }

        event.validate()

        if (event.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond event.errors, view: 'edit'
            return
        }

        event.save(flush: true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: event, default: Event), event.id])
                redirect event
            }
            '*' { respond event, [status: OK] }
        }
    }

}

