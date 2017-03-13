<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="landing">
    <meta property="og:locale" content="es_MX"/>
    <meta property="og:title" content="Nearsoft Apprentice ">
    <meta property="og:description"
          content="Nearsoft Apprentice es un programa dirigido a cualquier persona que tenga deseos de aprender, desde estudiantes hasta profesionistas de otras áreas que deseen adentrarse en el mundo del desarrollo de software.">
    <meta property="og:url" content="${request.getRequestURL()}">
    <meta property="og:type" content="website"/>
    <meta name="twitter:title" content="Nearsoft Apprentice">
    <meta name="twitter:description"
          content="Nearsoft Apprentice es un programa dirigido a cualquier persona que tenga deseos de aprender, desde estudiantes hasta profesionistas de otras áreas que deseen adentrarse en el mundo del desarrollo de software.">
    <meta name="twitter:image"
          content="${request.getRequestURL()}assets/landing_page/img/plantilla.png">
    <meta property="og:image"
          content="${request.getRequestURL()}assets/landing_page/img/plantilla.png"/>
    <meta name="twitter:card" content="photo">

</head>

<body id="page-top">

<div id="inSlider" class="carousel carousel-fade" data-ride="carousel">
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <div class="container">
            </div>
            <!-- Set background for slide in css -->

            <asset:image src="landing_page/img/header_new2.jpg"/>

        </div>
    </div>
</div>
${raw(landing.batchHtmlInfo)}
<g:if test="${landing.showInstructors}">
    <section id="team" class="gray-section team">
        <div class="container">
            <div class="row m-b-lg">
                <div class="col-lg-12 text-center">
                    <div class="navy-line"></div>

                    <h1>Los <span class="navy">Instructores</span></h1>

                    <p>Los instructores son ingenieros de Nearsoft que cuentan con amplia experiencia en los temas y disfrutan compartir el conocimiento.</p>
                </div>
            </div>

            <g:each in="${instructors}" var="line">
                <div class="row">
                    <g:each in="${line}">
                        <div class="col-sm-4 wow fadeInLeft">
                            <div class="team-member">
                                <img src="${it.profilePictureUrl}"
                                     class="img-responsive img-circle img-small" alt=""/>
                                <h4><span class="navy">${it.name}</span></h4>

                                <p>${it.description}</p>
                                <ul class="list-inline social-icon">
                                    <g:if test="${it.twitter}">
                                        <li><a target="_blank" href="https://twitter.com/${it.twitter}"><i
                                                class="fa fa-twitter"></i></a>
                                        </li>
                                    </g:if>
                                    <g:if test="${it.github}">
                                        <li><a target="_blank" href="https://github.com/${it.github}"><i
                                                class="fa fa-github"></i></a>
                                        </li>
                                    </g:if>
                                    <g:if test="${it.linkedin}">
                                        <li><a target="_blank" href="https://www.linkedin.com/in/${it.linkedin}"><i
                                                class="fa fa-linkedin"></i></a>
                                        </li>
                                    </g:if>
                                </ul>
                            </div>
                        </div>
                    </g:each>
                </div>
            </g:each>
        </div>
    </section>
</g:if>
<g:if test="${landing.showNextEvents}">
    <section id="next" class="timeline gray-section" style="margin-top: 0px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="navy-line"></div>

                    <h1>Próximas clases</h1>

                    <p>Estas son las clases que tendremos en las próximas dos semanas. Para conocer todo el calendario visita</p>
                    <a href="/ns-${batch.edition}/program" class="btn btn-primary">Programa completo</a>
                </div>
            </div>

            <div class="row features-block">

                <div class="col-lg-12">
                    <div id="vertical-timeline" class="vertical-container light-timeline center-orientation">
                        <g:each in="${nextClasses}">
                            <div class="vertical-timeline-block">
                                <div class="vertical-timeline-icon navy-bg">
                                    <i class="fa fa-briefcase"></i>
                                </div>

                                <div class="vertical-timeline-content">
                                    <h2>${it.eventCategory}</h2>

                                    <p>${raw(it.description)}
                                    </p>
                                    <a href="/ns-${batch.edition}/event/show/${it.id}"
                                       class="btn btn-xs btn-primary">Más información</a>
                                    <span class="vertical-date"><g:formatDate date="${it.date}"/></span>
                                </div>
                            </div>
                        </g:each>
                    </div>
                </div>

            </div>
        </div>

    </section>
</g:if>
</body>
</html>
