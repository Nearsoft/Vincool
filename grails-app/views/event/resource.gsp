<g:applyLayout name="simple">

    <content tag="boxTitle">
        <h5>Create Resource</h5>
    </content>

    <content tag="boxContent">

        <g:form controller="event" action="addResource"  class="form-horizontal">

            <div class="form-group">
                <label class="col-sm-2 control-label">Event</label>
                <div class="col-sm-10">
                    <label class="col-sm-12">${event.eventCategory.subCategory} - ${raw(event.description)}</label>
                    <input type="hidden" name="event.id" value="${event.id}" />
                </div>
            </div>

            <div class="hr-line-dashed"></div>

            <div class="form-group">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="name" value="" required="" id="name" />
                    </div>
                </div>

                <div class="hr-line-dashed"></div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Url</label>
                    <div class="col-sm-10">
                        <input type="url" class="form-control" name="url" value="" required="" id="url" />
                    </div>
                </div>

                <div class="hr-line-dashed"></div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="description" value="" required="" id="description" />
                    </div>
                </div>

                <div class="hr-line-dashed"></div>


            </div>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-2">
                    <button class="btn btn-white btn-outline" type="submit">Cancel</button>
                    <input class="btn btn-primary btn-outline" type="submit" value="Crear" />
                </div>
            </div>
        </g:form>

    </content>

    <content tag="breadcrumbs">
    </content>

</g:applyLayout>
