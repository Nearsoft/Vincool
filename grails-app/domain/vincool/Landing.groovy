package vincool

class Landing {
    boolean showInstructors
    boolean showNextEvents
    boolean showFullBatch
    String mainColor
    String batchHtmlInfo
    static belongsTo = [batch: Batch]
    static constraints = {
        showInstructors()
        showNextEvents()
        showFullBatch()
        mainColor()
        batchHtmlInfo widget: 'textarea'
    }

}
