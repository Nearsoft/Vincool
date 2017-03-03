package vincool.auth

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes = 'username')
class SecUser implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String username
    String password
    String email
    String name
    String firstName
    String lastName
    String gender
    String profilePictureUrl
    String description

    String twitter
    String github
    String linkedin

    static hasMany = [oAuthIDs: OAuthID, roles: SecUserSecRole]

    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    SecUser(String username, String password) {
        this()
        this.username = username
        this.password = password
    }

    Set<SecRole> getAuthorities() {
        SecUserSecRole.findAllBySecUser(this)*.secRole
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true
        password blank: false, display: false
        email email: true, blank: false
        name blank: true, nullable: true
        firstName nullable: true
        lastName nullable: true
        description blank: true, nullable: true
        gender nullable: true
        profilePictureUrl nullable: true
        twitter blank: true, nullable: true
        github blank: true, nullable: true
        linkedin blank: true, nullable: true
    }

    static mapping = {
        password column: '`password`'
        id sqlType:"serial"

    }

    String toString() {
        username
    }
}
