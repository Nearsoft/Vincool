package vincool
/**
 * Created by apimentel on 3/3/17.
 */
trait Rateable {
    def addRating(user, ratingValue, comment = '') {
        if (this.id == null) throw println("You must save the entity [${this}] before calling addToFavouritesOf")

        //check if this already added into favourites
        def alreadyIntoRated = Rating.find("from Rating as r where r.user=? and r.entityId=? and r.entityClass=?", [user, this.id, this.class.name])

        if (alreadyIntoRated) {
            println "Already Into Favourites"
        } else {
            def f = new Rating(user: user, entityId: this.id, entityClass: this.class.name, rating: ratingValue, comment: comment)
            f.save(failOnError: true)
        }
        return this
    }

    def getRatings() {

        def instance = this
        if (instance.id != null) {
            return Rating.findAll("from Rating as r where r.entityId=? and r.entityClass=?", [instance.id, instance.class.name])
        } else {
            return Collections.EMPTY_LIST
        }
    }

    def getRating(user) {
        def instance = this
        if (instance.id != null) {
            return Rating.find("from Rating as r where r.user=? and r.entityId=? and r.entityClass=?", [user, this.id, this.class.name])
        } else {
            return null
        }
    }

    def getAvgRating() {
        def instance = this
        if (instance.id != null) {
            def query = Rating.where {
                entityId == instance.id
                entityClass == instance.class.name
            }.projections {
                avg('rating')
            }
            return query.find() as Integer
        } else {
            return null
        }
    }

    def removeRating(user) {
        if (this.id == null) throw println("You must save the entity [${this}] before calling removeFromFavouritesOf")
        def entityClass = this.class.name
        if (entityClass.contains('_$$_javassist')) {
            entityClass -= '_$$_javassist'
        }


        def toRemove = Rating.find("from Rating as r where r.user=? and r.entityId=? and r.entityClass=?", [user, this.id, this.class.name])

        toRemove.delete()
    }
}
