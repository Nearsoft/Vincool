import vincool.NotificationType
import vincool.auth.SecUser

interface NotificationService {

    def void send(List<SecUser> addressees, NotificationType type, Map<String, Object> params)

    /**
     * Created by apimentel on 3/3/17.
     */
    interface Rateable {
    }
}