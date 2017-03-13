package vincool

import grails.plugin.springsecurity.annotation.Secured

@Secured(['permitAll'])

class ProgramController {

    def index(String program) {
        if (program) {
            Batch batch = Batch.findByEdition(program)
            render(view: "index", model: [nextClasses: Event.findAllByBatch(batch, [sort: "date", order: "asc"]), batch: batch])
        } else {
            render(view: "index", model: [nextClasses: Event.findAllByBatch(Batch.findByIsActive(true), [sort: "date", order: "asc"])])
        }

    }
}
