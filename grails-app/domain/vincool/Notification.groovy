package vincool

import vincool.auth.SecUser

class Notification {

    NotificationType type
    SecUser user
    Boolean seen
    String message

    static mapping = {
        seen defaultValue: false
        id sqlType:"serial"
        version false
        type column: "notification_type", enumType:"ordinal"
    }
}