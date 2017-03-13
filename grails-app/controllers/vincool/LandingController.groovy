package vincool

import grails.plugin.springsecurity.annotation.Secured

import java.time.LocalDate

@Secured(['permitAll'])
class LandingController {

    static scaffold = Landing


    def view(String program) {
        println params
        Batch currentBatch = Batch.findByEdition(program)
        if (!currentBatch) notFound()
        if (!currentBatch.landing) notFound()
        Landing landing = currentBatch.landing
        Map result = [landing: landing, batch: currentBatch]
        session.color = landing.mainColor
        if (landing.showInstructors) {
            result.instructors = Instructor.createCriteria().listDistinct{
                eq('isPublic', true)
                events{
                    batch{
                        eq('id', currentBatch.id)
                    }
                }
            }?.collate(3)
        }
        if (landing.showNextEvents) {
            result.nextClasses = Event.createCriteria().list {
                ge('date', LocalDate.now())
                batch {
                    eq('id', currentBatch.id)
                }
                maxResults(2)
                order("date", "asc")
            }
        }
        result
    }
}
