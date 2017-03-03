import vincool.NotificationType
import vincool.auth.SecUser

interface NotificationService {

    def void send(List<SecUser> addressees, NotificationType type, Map<String, Object> params)
}