package vincool

class RatingTagLib {
    static defaultEncodeAs = "raw"
    static namespace = "rate"

    def avg = {attrs, body->
        out<<'<div class="rate-summary-container rateable" data-id="'+attrs.entity.id+'" data-name="'+attrs.name+'"'
        out<<'data-entity="'+attrs.entity.getClass().getSimpleName()+'" >'
        out<<'<input value="'+attrs.entity.avgRating+'" class="rate-summary">'
        out<<'</div>'

    }
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    def modal = { attrs, body ->
        def c = grailsApplication.mainContext.getBean('asset.pipeline.grails.AssetsTagLib');
        out << c.javascript(['src': 'plugins/rating/star-rating.min.js'])
        out << c.javascript(['src': 'plugins/rating/locales/es.js'])
        out << '''
        <div class="modal inmodal" id="rateModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content animated bounceInRight">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 id="rateTitle" class="modal-title">Rate Me</h4>
                    </div>

                    <div class="modal-body">
                        <input id="ratingValue" type="text" class="rating" data-min="0" data-max="5" data-step="1"/>
                        <input id="ratingId" type="hidden"/>
                        <input id="ratingEntity" type="hidden"/>

                        <div class="form-group"><label>Comentario</label>
                            <textarea id="comment" class="form-control"></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
                        <button id="sendRating" type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <script type="application/javascript">
            $(document).on('ready', function(){
                $("#rating").rating();
                $('.rate-summary').rating({displayOnly: true, step: 1});
                $('.rate-summary-container>.rating-container>.rating-stars').unbind('click');
                $(".rateable").bind("click", function () {
                    var element = $(this);
                    var id = element.data('id');
                    var name = element.data('name');
                    var entity = element.data('entity');
                    $('#ratingId').val(id);
                    $('#ratingEntity').val(entity);
                    $('#rateTitle').html(name);
                    $.get("/rating/myRate/" + id + ".json?entity=" + entity)
                        .done(function (data) {
                            if (data.rating > 0) {
                                $('#ratingValue').rating('update', data.rating);
                            }
                            if (data.comment) {
                                $('#comment').val(data.comment);
                            }
                        }).always(
                        function () {
                            $('#rateModal').modal('show');
                        }
                    );
                });
                $("#sendRating").bind("click", function () {
                    var payload = {
                        id: $('#ratingId').val(),
                        entity: $('#ratingEntity').val(),
                        rate: $("#ratingValue").val(),
                        comment: $("#comment").val()
                    };
                    console.log(payload);
                    $.ajax({
                        type: "POST",
                        url: "/rating/rate.json",
                        data: JSON.stringify(payload),
                        contentType: "application/json",
                        dataType: "json"
                    }).done(function () {
                        console.log("success");
                    })
                        .fail(function () {
                            console.log("error");
                        })
                        .always(function () {
                            $('#rateModal').modal('hide')
                        });
                });
            });
        </script>
        '''
    }
}
