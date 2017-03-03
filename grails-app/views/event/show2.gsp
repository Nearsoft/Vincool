<g:applyLayout name="simple">
    <content tag="head">
        <g:set var="eventDate" value="${g.formatDate(date: event.date)}"/>
        <g:set var="eventTime"
               value="${g.formatDate(date: event.time, type: 'time', style: 'SHORT')}"/>
        <g:set var="shareText"
               value=" Asiste a la clase ${event.eventCategory.subCategory} este ${eventDate} a las ${eventTime} #NSCommunity"/>

        <asset:link rel="stylesheet" type="text/css" href="jssocials/jssocials.css"/>
        <asset:link rel="stylesheet" type="text/css" href="jssocials/jssocials-theme-minima.css"/>
        <meta property="og:locale" content="es_MX"/>
        <meta property="og:title" content="Nearsoft Apprentice ${event.office} '${event.eventCategory.subCategory}'">
        <meta property="og:description"
              content="${shareText}">
        <meta property="og:url" content="${request.getRequestURL()}">
        <meta property="og:type" content="website"/>
        <meta name="twitter:title" content="Nearsoft Apprentice">
        <meta name="twitter:description"
              content="Nearsoft Apprentice ${event.office} '${event.eventCategory.subCategory}'">
        <g:if test="${event.pictureUrl}">
            <meta name="twitter:image"
                  content="${event.pictureUrl}">
            <meta property="og:image"
                  content="${event.pictureUrl}"/>
        </g:if>
        <g:else>
            <meta name="twitter:image"
                  content="/assets/landing_page/img/plantilla.png">
            <meta property="og:image"
                  content="/assets/landing_page/img/plantilla.png"/>
        </g:else>

        <meta name="twitter:card" content="photo">
    </content>
    <content tag="boxTitle">
        <h3><g:message code="event.detail.label" default="Event Detail"/></h3>
    </content>
    <content tag="boxContent">
        <sec:ifNotLoggedIn>
            <br/><br/><br/><br/><br/>
        </sec:ifNotLoggedIn>
        <section class="container features" style="margin-top: 0px;">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-xs-12">
                        <g:if test="${event.pictureUrl}">
                            <img src="${event.pictureUrl}"
                                 style="width: 100%; object-fit: cover; border-radius: 25px;"/>
                        </g:if>
                        <g:else>
                            <asset:image src="landing_page/img/plantilla.png"
                                         style="width: 100%; object-fit: cover; border-radius: 25px;"/>
                        </g:else>
                    </div>

                    <div class="col-lg-4 col-md-4 col-xs-12  text-center">
                        <br/><br/><br/>

                        <div class="navy-line" style="margin: 20px auto 0;"></div>

                        <h1 class="font-bold m-b-xs">${event.eventCategory.subCategory}</h1>

                        <h1><span class="navy">${event.type}</span></h1>
                        <sec:ifAllGranted roles='ROLE_STUDENT'>
                            <g:if test="${isEnrolled}">
                                <g:set var="enrollButtonMessage"
                                       value="${message(code: "default.disenroll.button.label", default: "Cancel enrollment")}"/>
                                <g:set var="enrollButtonClass" value="${"btn pull-right btn-danger"}"/>
                                <g:set var="enrollFormAction" value="${"disenroll"}"/>
                            </g:if>
                            <g:else>
                                <g:set var="enrollButtonMessage"
                                       value="${message(code: "default.enroll.button.label", default: "Enroll in this event")}"/>
                                <g:set var="enrollButtonClass" value="${"btn pull-right btn-primary"}"/>
                                <g:set var="enrollFormAction" value="${"enroll"}"/>
                            </g:else>

                            <g:form name="enrollForm" controller="attendee" action="${enrollFormAction}"
                                    id="${event.id}" method="POST">
                                <g:submitButton class="${enrollButtonClass}" name="enrollButton" id="enrollButton"
                                                value="${enrollButtonMessage}"
                                                style="margin: 10px 0px 5px; width: 100%;"/>
                            </g:form>
                        </sec:ifAllGranted>

                        <sec:ifNotLoggedIn>
                            <g:set var="enrollButtonMessage"
                                   value="${message(code: "default.enroll.button.label", default: "Enroll in this event")}"/>
                            <g:set var="enrollButtonClass" value="${"btn pull-right btn-primary"}"/>
                            <g:set var="enrollFormAction" value="${"enroll"}"/>
                            <g:form name="enrollForm" controller="attendee" action="${enrollFormAction}"
                                    id="${event.id}" method="POST">
                                <g:submitButton class="${enrollButtonClass}" name="enrollButton" id="enrollButton"
                                                value="${enrollButtonMessage}"
                                                style="margin: 10px 0px 5px; width: 100%;"/>
                            </g:form>
                        </sec:ifNotLoggedIn>
                        <div id="share" class="text-left">

                            <asset:javascript src="plugins/jssocials/jssocials.min.js"/>
                            <script>
                                $("#share").jsSocials({
                                    text: "${shareText}",
                                    showLabel: false,
                                    shares: ["twitter", "facebook", "linkedin", "pinterest", "stumbleupon", "whatsapp", "email", "telegram", "line"]

                                });
                            </script>
                        </div>

                        <div class="navy-line" style="margin: 20px auto 0;"></div>
                    </div>
                </div>
                <br/>

                <div class="row">
                    <div class="col-lg-8 col-md-8 col-xs-12">
                        <h4><g:message code="default.session.description.label"
                                       default="Event description"/></h4>

                        <p>
                            ${raw(event.description)}
                        </p>
                        <h4>FAQs</h4>
                        <dl>
                            <dt>¿Que costo tiene?</dt><dd>Las clases son <b>gratuitas</b> solo tienes que registrarte en esta pagina.
                        </dd>
                            <dt>¿Que necesito llevar?</dt> <dd>Te recomendamos llevar tu <b>computadora</b> para las clases practicas.
                        </dd>
                            <dt>¿Cuanto dura la clase?</dt> <dd>La clase tiene una duracion de aprox. 2:30 horas.</dd>
                        </dl>
                    </div>

                    <div class="col-lg-4 col-md-4 col-xs-12">
                        <h4><g:message code="default.instructor.label" default="Instructor"/></h4>

                        <p>${event.instructor.name}</p>
                        <ul class="list-inline social-icon">
                            <g:if test="${event.instructor.twitter}">
                                <li><a target="_blank"
                                       href="https://twitter.com/${event.instructor.twitter}"><i
                                            class="fa fa-twitter"></i></a>
                                </li>
                            </g:if>
                            <g:if test="${event.instructor.github}">
                                <li><a target="_blank"
                                       href="https://github.com/${event.instructor.github}"><i
                                            class="fa fa-github"></i></a>
                                </li>
                            </g:if>
                            <g:if test="${event.instructor.linkedin}">
                                <li><a target="_blank"
                                       href="https://www.linkedin.com/in/${event.instructor.linkedin}"><i
                                            class="fa fa-linkedin"></i></a>
                                </li>
                            </g:if>
                            <li><a target="_blank"
                                   href="mailto:${event.instructor.email}"><i class="fa fa-envelope"></i></a>
                            </li>
                        </ul>
                        <br/>
                        <h4 style="margin: 10px 0px 5px;"
                            class="product-main-price"><g:message code="default.when.label" default="When?"/></h4>

                        <p>
                            <g:formatDate
                                    date="${event.date}"/> - <g:formatDate
                                    date="${event.time}" type="time" style="SHORT"/>
                        </p>
                        <br/>
                        <h4><g:message code="default.office.location.label" default="Location"/></h4>

                        <p>
                            ${event.office.location}
                        </p>

                        <br/>
                        <sec:ifAnyGranted roles='ROLE_INSTRUCTOR,ROLE_ADMIN'>
                            <h3><g:message code="default.eventCategory.label" default="Event Category"/></h3>

                            <div class="text-muted">
                                ${event.eventCategory.category}
                            </div>

                            <h3><g:message code="default.batch.label" default="Batch"/></h3>

                            <div class="text-muted">
                                ${event.batch}
                            </div>
                        </sec:ifAnyGranted>

                    </div>
                </div>
                <sec:ifLoggedIn>
                    <div class="row">
                        <div class="col-lg-12">
                            <h1><g:message code="resource.label" default="Resources"/></h1>
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th><g:message code="resource.name.label" default="Name"/></th>
                                    <th><g:message code="resource.description.label" default="Description"/></th>
                                    <th><g:message code="resource.url.label" default="URL"/></th>
                                </tr>
                                </thead>
                                <tbody>

                                <g:each in="${event.resources}" var="resource">
                                    <tr>
                                        <td>${resource.name}</td>
                                        <td>${resource.description}</td>
                                        <td><a class="btn btn-primary btn-outline" target="_blank" href="${resource.url}">Ver</a></td>
                                    </tr>
                                </g:each>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </sec:ifLoggedIn>
                <div class="row">
                    <div class="col-lg-12">
                        <iframe width="100%" height="250" frameborder="0" style="border:0"
                                src="https://www.google.com/maps/embed/v1/place?q=${event.office.location}&key=AIzaSyDTheQkFI_mOE0ry4A4JnOqn0OSWV_cnPE"
                                allowfullscreen></iframe>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-left">
                            <div class="jssocials-shares">

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </content>
    <content tag="breadcrumbs">
    </content>
</g:applyLayout>