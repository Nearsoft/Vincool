package vincool

class RatingTagLib {
    static defaultEncodeAs = "raw"
    static namespace = "vincool"
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def ratingModal = { attrs, body ->
        def c = grailsApplication.mainContext.getBean('asset.pipeline.grails.AssetsTagLib');
        out << c.javascript(['src': 'plugins/rating/star-rating.min.js'])
        out << c.javascript(['src': 'plugins/rating/locales/es.js'])
        out << '''
        
        '''
    }
}
