package vincool

import vincool.auth.SecRole
import vincool.auth.SecUser
import vincool.auth.SecUserSecRole
import java.time.LocalDate
import java.time.LocalTime

class BootStrap {
    def grailsApplication
    def init = { servletContext ->
        environments {
            development {
                ['ROLE_STUDENT', 'ROLE_INSTRUCTOR', 'ROLE_ADMIN'].each {
                    if (!SecRole.findByAuthority(it)) {
                        def secRole = new SecRole(it).save()
                        if (it == 'ROLE_ADMIN') {
                            def secUser = new SecUser(username: "PedroAdmin", password: "12345abcd", email: "eladmin@gmail.com").save()
                            SecUserSecRole.create(secUser, secRole)
                        }
                    }
                }
                def attendee1 = new Attendee(username: "luisdaniel", password: "pass", email: "lalducin@nearsoft.com", firstName: "Luis Daniel", lastName: "Alducin", age: 22, school: "ESCOM", currentCompany: "Nearsoft").save()
                def attendee2 = new Attendee(username: "erikueen", password: "pass", email: "ereyna@nearsoft.com", firstName: "Erick", lastName: "Reyna", age: 23, school: "UPVT", currentCompany: "Nearsoft").save()
                new Attendee(username: "jlozano", password: "pass", email: "jlozano@nearsoft.com", firstName: "Javier", lastName: "Lozano", age: 21, school: "UPIITA", currentCompany: "Nearsoft").save()
                new Attendee(username: "aibarra", password: "pass", email: "aibarra@nearsoft.com", firstName: "Antonio", lastName: "Ibarra", age: 19, school: "ESCOM", currentCompany: "Nearsoft").save()

                def cdmx = new Office(officeCode: "CDMX", name: "Ciudad de México", location: "San Luis Potosí 196 int. 401 Col. Roma Norte Del. Cuauhtémoc Ciudad de México 06700", phoneNumber: "+52 (55) 6388-6650").save()
                def hmo = new Office(officeCode: "HMO", name: "Hermosillo, Sonora", location: "Blvd. Antonio Quiroga 21 Col. El Llano Hermosillo, Sonora, México 83210", phoneNumber: "+52 (662) 216-7401").save()

                def instructor1 = new Instructor(username: "igomez", password: "pass", email: "igomez@nearsoft.com", firstName: "Israel", lastName: "Gómez", name: "Israel Gomez").save()

                def eventCategory1 = new EventCategory(category: EventCategory.Category.APPRENTICE, subCategory: "Introductory Topics", color: "orange").save()
                def eventCategory2 = new EventCategory(category: EventCategory.Category.APPRENTICE, subCategory: "Data Structures and Big O Notation I", color: "orange").save()
                def eventCategory3 = new EventCategory(category: EventCategory.Category.APPRENTICE, subCategory: "SOLID I", color: "orange").save()
                def eventCategory4 = new EventCategory(category: EventCategory.Category.APPRENTICE, subCategory: "Data Structures and Big O Notation II", color: "orange").save()

                def apprenticeCDMX_2016B = new Batch(edition: "Apprentice CDMX 2016 B", isActive: false).save()
                def event1 = new Event(type: "Practical", date: LocalDate.parse("2016-11-10"), time: LocalTime.now(), instructor: instructor1, office: cdmx, eventCategory: eventCategory1, description: "VCS and C, C++, Java", batch: apprenticeCDMX_2016B).save()
                new Event(type: "Practical", date: LocalDate.parse("2016-11-17"), time: LocalTime.now(), instructor: instructor1, office: cdmx, eventCategory: eventCategory2, description: "Arrays, lists and sets", batch: apprenticeCDMX_2016B).save()
                new Event(type: "Theoretical", date: LocalDate.parse("2016-11-24"), time: LocalTime.now(), instructor: instructor1, office: cdmx, eventCategory: eventCategory3, description: "Single Responsibility Principle", batch: apprenticeCDMX_2016B).save()

                def apprenticeCDMX_2017A = new Batch(edition: "Apprentice CDMX 2017 A", isActive: true).save()
                new Event(type: "Practical", date: LocalDate.parse("2017-01-07"), time: LocalTime.now(), instructor: instructor1, office: cdmx, eventCategory: eventCategory1, description: "VCS and Python, Java, Javascript", batch: apprenticeCDMX_2017A).save()
                new Event(type: "Practical", date: LocalDate.parse("2017-01-14"), time: LocalTime.now(), instructor: instructor1, office: cdmx, eventCategory: eventCategory2, description: "Arrays and Lists", batch: apprenticeCDMX_2017A).save()
                new Event(type: "Theoretical", date: LocalDate.parse("2017-01-21"), time: LocalTime.now(), instructor: instructor1, office: cdmx, eventCategory: eventCategory4, description: "Sets and Hash Tables", batch: apprenticeCDMX_2017A).save()

                def apprenticeHMO_2017A = new Batch(edition: "Apprentice HMO 2017 A", isActive: true).save()
                new Event(type: "Practical", date: LocalDate.parse("2017-01-05"), time: LocalTime.now(), instructor: instructor1, office: hmo, eventCategory: eventCategory1, description: "VCS and Python, Java, Javascript", batch: apprenticeHMO_2017A).save()
                new Event(type: "Practical", date: LocalDate.parse("2017-01-12"), time: LocalTime.now(), instructor: instructor1, office: hmo, eventCategory: eventCategory2, description: "Arrays and Lists", batch: apprenticeHMO_2017A).save()
                new Event(type: "Theoretical", date: LocalDate.parse("2017-01-19"), time: LocalTime.now(), instructor: instructor1, office: hmo, eventCategory: eventCategory4, description: "Sets and Hash Tables", batch: apprenticeHMO_2017A).save()

                new Resource(name: "Slides", url: "http://www.slides.com", description: "Slides about Arrays and Lists", event: event1).save()
                new Resource(name: "Repo", url: "http://www.repo.com", description: "Repo with exercises about Arrays and Lists", event: event1).save()

                new Enrollment(event: event1, attendee: attendee1, attendance: false).save()
                new Enrollment(event: event1, attendee: attendee2, attendance: false).save()
            }
        }

        for (domainClass in grailsApplication.domainClasses) {
            if (!Rateable.isAssignableFrom(domainClass.clazz)) {
                continue
            }
/*
            domainClass.clazz.metaClass {

                addRating { user, ratingValue ->
                    if (delegate.id == null) throw println("You must save the entity [${delegate}] before calling addToFavouritesOf")

                    //check if delegate already added into favourites
                    def alreadyIntoRated = Rating.find("from Rating as r where r.user=? and r.entityId=? and r.entityClass=?", [user, delegate.id, delegate.class.name])

                    if (alreadyIntoRated) {
                        println "Already Into Favourites"
                    } else {
                        def f = new Rating(user: user, entityId: delegate.id, entityClass: delegate.class.name, rating: ratingValue)
                        if (!f.save()) {
                            throw println("Cannot create favourite for arguments $user, they are invalid.")
                        }
                    }
                    return delegate
                }

                getRatings = { ->
                    def instance = delegate
                    if (instance.id != null) {
                        return Rating.findAll("from Rating as r where r.entityId=? and r.entityClass=?", [instance.id, instance.class.name])
                    } else {
                        return Collections.EMPTY_LIST
                    }
                }

                removeRating { user ->
                    if (delegate.id == null) throw println("You must save the entity [${delegate}] before calling removeFromFavouritesOf")
                    def userClass = user.class.name
                    if (entityClass.contains('_$$_javassist')) {
                        entityClass -= '_$$_javassist'
                    }


                    def toRemove = Rating.find("from Rating as r where r.user=? and r.entityId=? and r.entityClass=?", [user, delegate.id, delegate.class.name])

                    toRemove.delete()
                }
            }*/
        }

        for (domainClass in grailsApplication.domainClasses) {
            if (!Rateable.isAssignableFrom(domainClass.clazz)) {
                continue
            }

            domainClass.clazz.metaClass {


            }
        }
        for (controller in grailsApplication.controllerClasses) {
            if (!Rateable.isAssignableFrom(controller.clazz)) {
                continue
            }

        }
    }

    def destroy = {
    }
}
