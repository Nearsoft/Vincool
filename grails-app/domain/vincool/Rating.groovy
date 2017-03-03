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
}
