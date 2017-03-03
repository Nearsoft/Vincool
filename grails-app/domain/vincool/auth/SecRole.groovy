package vincool.auth

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='authority')
class SecRole implements Serializable {

	private static final long serialVersionUID = 1

	String authority

	SecRole(String authority) {
		this()
		this.authority = authority
	}

	static constraints = {
		authority blank: false, unique: true
	}

	static mapping = {
		cache true
		id sqlType:"serial"

	}

	String toString(){
		authority
	}
}
