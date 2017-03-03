package vincool

import vincool.auth.SecUser

class Rating {

    int rating
    Long entityId
    String entityClass
    static belongsTo = [user: SecUser]
    static constraints = {
        id sqlType:"serial"
    }

    def getEntity() {
        // handle proxied class names
        if (entityClass.contains('_$$_javassist')) {
            entityClass -= '_$$_javassist'
        }
        getClass().classLoader.loadClass(entityClass).get(entityId)
    }
}
