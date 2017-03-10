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
            <div class="header-back two"></div>

        </div>
        <!--div class="item">
            <div class="container">
            </div>

            <div class="header-back two"></div>
        </div>
        <div class="item">
            <div class="container">
            </div>

            <div class="header-back tree"></div>
        </div>
        <div class="item">
            <div class="container">
            </div>
            <div class="header-back four"></div>
        </div>
        <div class="item">
            <div class="container">
            </div>

            <div class="header-back five"></div>
        </div-->
    </div>
</div>
<section class="features" id="program">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="navy-line"></div>

                <h1>El <span class="navy">Programa</span></h1>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-5 col-lg-offset-1 features-text">
                <small>NS Apprentice</small>

                <h2>¿Quién?</h2>
                <i class="fa fa-user big-icon pull-right"></i>

                <p>Nearsoft Apprentice es un programa dirigido a cualquier persona que tenga deseos de aprender, desde estudiantes hasta profesionistas de otras áreas que deseen adentrarse en el mundo del desarrollo de software.</p>
            </div>

            <div class="col-lg-5 features-text">
                <small>NS Apprentice</small>

                <h2>Requisitos</h2>
                <i class="fa fa-laptop big-icon pull-right"></i>

                <p>Debes registrarte en nuestra plataforma a las clases que desees asistir, necesitarás una computadora para las sesiones prácticas. Te recomendamos ampliamente asistir a ambas clases, teóricas y prácticas.</p>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-5 col-lg-offset-1 features-text">
                <small>NS Apprentice</small>

                <h2>Clase Abierta</h2>
                <i class="fa fa-dollar big-icon pull-right"></i>

                <p>Las clases no tienen ningún costo, puedes asistir a todas las que quieras. Estarán dividias en teóricas y prácticas.</p>
            </div>

            <div class="col-lg-5 features-text">
                <small>NS Apprentice</small>

                <h2>¿Cuándo?</h2>
                <i class="fa fa-calendar big-icon pull-right"></i>

                <p>Habrá una clase semanal de aproximadamente 3 horas, primero se revisarán los temas teóricos y posteriormente se realizará la sesión prática.</p>
            </div>
        </div>
    </div>

</section>
<section class="features">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="navy-line"></div>

                <h1>Estructura de <span class="navy">las Clases</span></h1>
            </div>
        </div>

        <div class="row features-block">
            <div class="col-lg-3 features-text wow fadeInLeft">
                <small>NS Apprentice</small>

                <h2>Clases Teóricas</h2>

                <p>Asiste a nuestras sesiones teóricas para conocer los conceptos y definiciones usadas en las Ciencias de la Computación.</p>

            </div>

            <div class="col-lg-6 text-right m-t-n-lg wow zoomIn">
                <asset:image src="landing_page/img/brain.png" class="img-responsive" alt="dashboard"/>
            </div>

            <div class="col-lg-3 features-text text-right wow fadeInRight">
                <small>NS Apprentice</small>

                <h2>Clases Prácticas</h2>

                <p>Asiste a nuestras sesiones prácticas para ver aplicados los temas teóricos en código y ejemplos reales.</p>
            </div>
        </div>
    </div>

</section>
<section class="container features">
    <div class="row">
        <div class="col-lg-12 text-center">
            <div class="navy-line"></div>

            <h1>Los <span class="navy">Temas</span></h1>
            <g:link controller="program" class="btn btn-primary">Temario Completo</g:link>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 text-center wow fadeInLeft">
            <div>
                <i class="fa fa-graduation-cap features-icon"></i>

                <h2>Ciencia de la Computacion</h2>

                <p>Aprende de estructuras de datos, algoritmos y notación Big O.</p>
            </div>

            <div class="m-t-lg">
                <i class="fa fa-trello features-icon"></i>

                <h2>Métodos Ágiles</h2>

                <p>Conoce las metodologías ágiles usadas en la industria.</p>
            </div>
        </div>

        <div class="col-md-6 text-center wow fadeInRight">
            <div>
                <i class="fa fa-database features-icon"></i>

                <h2>Bases de Datos</h2>

                <p>Explora las capacidades de las bases de datos SQL y No SQL.</p>
            </div>

            <div class="m-t-lg">
                <i class="fa fa-book features-icon"></i>

                <h2>Diseño de Software</h2>

                <p>Descubre las buenas prácticas del desarrollo de software, patrones de diseño, pruebas unitarias.</p>
            </div>
        </div>
    </div>
</section>

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
<section id="next" class="timeline gray-section" style="margin-top: 0px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="navy-line"></div>

                <h1>Próximas clases</h1>

                <p>Estas son las clases que tendremos en las próximas dos semanas. Para conocer todo el calendario visita</p>
                <g:link controller="calendar" class="btn btn-primary">Calendario</g:link>
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
                                <g:link controller="event" action="show" id="${it.id}"
                                        class="btn btn-xs btn-primary">Más información</g:link>
                                <span class="vertical-date"><g:formatDate date="${it.date}"/></span>
                            </div>
                        </div>
                    </g:each>
                </div>
            </div>

        </div>
    </div>

</section>

<section id="testimonials" class="navy-section testimonials" style="margin-top: 0">

    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center wow zoomIn">
                <i class="fa fa-comment big-icon"></i>

                <h1>
                    Testimonios
                </h1>

                <div class="testimonials-text">
                    <i>"NS Apprentice es un programa directo, completo y actualizado sobre el desarrollo de software y sus buenas prácticas.

                    El ambiente que se genera es muy agradable pues asisten desde estudiantes hasta profesionales con varios años de experiencia y todos compartimos conocimiento.

                    No son clases tipo escuela y los instructores viven día a día en el desarrollo de software por lo que la información que se da realmente te ayuda a abrirte el panorama de lo que creías que era el desarrollo de software."</i>
                </div>
                <small>
                    <strong>Feb.07.2016 - Luis Alducin, Estudiante de ESCOM, Egresado de NS Academy</strong>
                </small>
            </div>
        </div>
    </div>

</section>
<section class="comments gray-section" style="margin-top: 0">
    <div class="container">
        <div class="row features-block">

            <div class="col-lg-4">
                <div class="bubble">
                    "A mí me sirvio bastante para mejorar mi manera de trabajar y sobre todo reforzar temas donde me tambaleo bastante."
                </div>

                <div class="comments-avatar">
                    <a href="" class="pull-left">
                        <asset:image alt="image" src="landing_page/img/test2.jpg"/>
                    </a>

                    <div class="media-body">
                        <div class="commens-name">
                            Martín Manriquez León
                        </div>
                        <small class="text-muted">Estudiante de UPIICSA-IPN</small>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="bubble">
                    "Gracias a Nearsoft Apprentice tuve la oportunidad de entrar en contacto con tecnologías de las que solo había escuchado hablar pero nunca había utilizado en el ambiente académico, también tuve la oportunidad de reflexionar acerca de mis prácticas de programación y conocer mediante qué estándares se trabaja actualmente en el mundo real."
                </div>

                <div class="comments-avatar">
                    <a href="" class="pull-left">
                        <asset:image alt="image" src="landing_page/img/test3.jpg"/>
                    </a>

                    <div class="media-body">
                        <div class="commens-name">
                            Dalia de  Felipe
                        </div>
                        <small class="text-muted">Estudiante de ESCOM-IPN</small>

                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="bubble">
                    "El programa de Nearsoft Apprentice me permitió retomar los fundamentos de la programación y tomar conciencia de su importancia en las entrevistas técnicas. Además de que tuve la oportunidad de conocer gente muy experimentada en el desarrollo de software y conocer de viva voz los problemas a los que se enfrentan y cómo los resuelven."
                </div>

                <div class="comments-avatar">
                    <a href="" class="pull-left">
                        <asset:image alt="image" src="landing_page/img/test1.jpg"/>
                    </a>

                    <div class="media-body">
                        <div class="commens-name">
                            Miguel Moreno
                        </div>
                        <small class="text-muted">Estudiante de ESCOM-IPN</small>

                    </div>
                </div>
            </div>
        </div>
    </div>

</section>

</body>
</html>
