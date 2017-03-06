package vincool

import grails.plugin.springsecurity.oauth2.token.OAuth2SpringToken
import groovy.json.JsonSlurper
import org.grails.web.gsp.io.GrailsConventionGroovyPageLocator
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.social.google.api.Google
import org.springframework.social.google.api.impl.GoogleTemplate
import org.springframework.web.servlet.support.RequestContextUtils
import vincool.auth.SecUser

class LoginController {

    public static final String SPRING_SECURITY_OAUTH_TOKEN = 'springSecurityOAuthToken'

    def springSecurityOauth2BaseService
    def vincoolOAuthService
    def GrailsConventionGroovyPageLocator groovyPageLocator

    LoginController() {}

    def index() {
        render(view: "login")
    }

    def signin() {

        OAuth2SpringToken token = (OAuth2SpringToken) session[SPRING_SECURITY_OAUTH_TOKEN]

        def jsonSlurper = new JsonSlurper()
        Map<String, String> parts = jsonSlurper.parseText(token.credentials)
        String accesToken = parts.get("access_token")

        Google google = new GoogleTemplate(accesToken);
        def userInfo = google.userOperations().userInfo

        def user = vincoolOAuthService.createUser(userInfo, token.providerName, accesToken)
        springSecurityOauth2BaseService.updateOAuthToken(token, user)
        session.removeAttribute SPRING_SECURITY_OAUTH_TOKEN
        SecurityContextHolder.context.authentication = token
        redirect(controller: "home")
    }

    def privacy() {

        def locale = RequestContextUtils.getLocale(request).getLanguage()
        def privacyPolicyTemplateName = "/privacyPolicy"
        def localTemplate = privacyPolicyTemplateName + "_" + locale

        def located = groovyPageLocator.findView(localTemplate)
        print localTemplate
        if (located != null) {
            groovyPageLocator.findView(localTemplate)
            render(view: localTemplate)
        } else {
            render(view: privacyPolicyTemplateName)
        }

    }
}
