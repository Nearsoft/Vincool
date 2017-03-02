<g:applyLayout name="simple">

    <content tag="head">

    </content>

    <content tag="boxTitle">
        <h3>Event Detail</h3>
    </content>

    <content tag="boxContent">
        <div class="row">
            <div class="col-lg-12">
                <div class="m-b-md">
                    <h2>${event.eventCategory.subCategory}</h2>
                </div>
                <dl class="dl-horizontal">
                    <dt>Status:</dt> <dd><span class="label label-primary">Active</span></dd>
                </dl>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-5">
                <dl class="dl-horizontal">
                    <dt>Category:</dt> <dd>${event.eventCategory.category}</dd>
                    <dt>Type:</dt> <dd>${event.type}</dd>
                    <dt>Instructor:</dt> <dd>${event.instructor}</dd>
                    <dt>Description:</dt> <dd>${raw(event.description)}</dd>
                    <dt>Picture Url:</dt> <dd>
                        <g:if test="${event.pictureUrl}">
                            <a href="${event.pictureUrl}" target="_blank"><g:message
                                code="event.pictureUrl.image"/></a>
                        </g:if>
                        <g:else>
                            <g:message code="event.pictureUrl.empty"/>
                        </g:else>
                </dd>
                </dl>
            </div>
            <div class="col-lg-7" id="cluster_info">
                <dl class="dl-horizontal" >

                    <dt>Location:</dt> <dd>${event.office}</dd>
                    <dt>Date:</dt> <dd>${event.date} at ${event.time}</dd>
                    <dt>Calendar Color:</dt> <dd>${event.eventCategory.color}</dd>
                    <dt>Attendees:</dt>
                    <dd class="project-people">
                        <g:if test="${eventDetails.attendeesPictures.isEmpty()}">
                            No attendees for the moment
                        </g:if>
                        <g:else>
                            <g:each in="${eventDetails.attendeesPictures}" var="url" >
                                <g:if test="${url == null}">
                                    <asset:image src="default_user.svg" class="img-circle" />
                                </g:if>
                                <g:else>
                                    <img alt="image" class="img-circle" src="${url}">
                                </g:else>
                            </g:each>
                        </g:else>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <dl class="dl-horizontal">
                    <dt>Assistance Percentage:</dt>
                    <dd>
                        <div class="progress progress-striped active m-b-sm">
                            <div style="width: ${eventDetails.assistancePercentage}%;" class="progress-bar"></div>
                        </div>
                        <small><strong>${eventDetails.assistancePercentage}%</strong> of the enrolled attendees assisted to this event.</small>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="row m-t-sm">
            <div class="col-lg-12">
                <div class="panel blank-panel">
                    <div class="panel-heading">
                        <div class="panel-options">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-1" data-toggle="tab">Resources</a></li>
                                <li class=""><a href="#tab-2" data-toggle="tab">Enrollments</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-body">

                        <div class="tab-content">

                            <div class="tab-pane active" id="tab-1">

                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>
                                            Url
                                            <g:if test="${eventDetails.ownsEvent}">
                                                <g:link controller="event" action="resource" id="${event.id}" class="btn btn-sm button btn-outline btn-primary pull-right">
                                                    <i class="fa fa-check"></i> Add a new resource
                                                </g:link>
                                            </g:if>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <g:each in="${event.resources}" var="resource">
                                        <tr>
                                            <td>${resource.name}</td>
                                            <td>${resource.description}</td>
                                            <td><a href="${resource.url}"> ${resource.url}</a></td>
                                        </tr>
                                    </g:each>

                                    </tbody>
                                </table>

                            </div>

                            <div class="tab-pane" id="tab-2">

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Profile Picture</th>
                                            <th>Name</th>
                                            <th>School</th>
                                            <th>Assistance</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <g:each in="${eventDetails.enrollments}" var="enrollment">
                                            <tr>
                                                <td style="vertical-align:middle">
                                                    <g:if test="${enrollment.attendee.profilePictureUrl == null}">
                                                        <asset:image src="default_user.svg" class="img-circle" height="40px" width="40px" />
                                                    </g:if>
                                                    <g:else>
                                                        <img alt="image" class="img-circle" height="40px" width="40px" src="${enrollment.attendee.profilePictureUrl}">
                                                    </g:else>
                                                </td>
                                                <td style="vertical-align:middle"><strong>${enrollment.attendee.name}</strong></td>
                                                <td style="vertical-align:middle"><strong>${enrollment.attendee.school}</strong></td>
                                                <td style="vertical-align:middle">
                                                    <g:if test="${enrollment.attendance}">
                                                        <span class="label label-primary"><i class="fa fa-check"></i> Assisted</span>
                                                    </g:if>
                                                    <g:else>
                                                        <span class="label label"><i class="fa fa-close"></i> Not Assisted</span>
                                                    </g:else>
                                                </td>
                                            </tr>
                                        </g:each>

                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </content>

    <content tag="breadcrumbs">
    </content>

</g:applyLayout>