<g:applyLayout name="simple">
    <content tag="boxTitle">
        <h5>Topic Name: ${eventName}</h5> &nbsp;/ <a
            href="<g:createLink action="enroll" id="${eventId}"/>" class="text-info">Enroll an attendee</a>
    </content>
    <content tag="boxContent">
        <g:form action="save" id="${eventId}">
            <div class="row table-responsive">
                <table class="table table-striped table-hover ">
                    <thead>
                    <tr>
                        <th>Attendee's name</th>
                        <th>Attendance</th>
                    </tr>
                    </thead>
                    <tbody>

                    <g:each in="${enrollments}">
                        <tr>
                            <td>${it.attendee.name}/${it.attendee.email}</td>
                            <td>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <g:checkBox name="attendance_${it.attendee.id}"
                                                    value="${it.attendance}"
                                                    class="onoffswitch-checkbox"/>
                                        <label class="onoffswitch-label" for="attendance_${it.attendee.id}">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </g:each>

                    </tbody>
                </table>
            </div>

            <div class="row">
                <div class="col-sm-offset-9">
                    <a href="<g:createLink controller="event" />" class="btn btn-outline btn-white">Cancel</a>
                    <button class="btn btn-outline btn-primary" type="submit">Save changes</button>
                </div>
            </div>
        </g:form>
    </content>
    <content tag="breadcrumbs">
        <li><a href="<g:createLink controller="event" />">Events</a></li>
    </content>
</g:applyLayout>
