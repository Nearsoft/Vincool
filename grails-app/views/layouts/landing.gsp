<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--Social -->

    <!-- Add Your favicon here -->
    <asset:link rel="icon" href="favicon.ico"/>

    <title>Nearsoft Apprentice</title>

    <!-- Bootstrap core CSS -->
    <asset:link href="landing_page/css/bootstrap.css" rel="stylesheet"/>

    <!-- Animation CSS -->
    <asset:link href="landing_page/css/animate.min.css" rel="stylesheet"/>

    <asset:link href="landing_page/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-91625173-1', 'auto');
        ga('send', 'pageview');

    </script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <asset:javascript src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"/>
    <asset:javascript src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"/>
    <![endif]-->

    <!-- Custom styles for this template -->
    <asset:link href="landing_page/css/style.css" rel="stylesheet"/>
    <asset:javascript src="landing_page/js/jquery-2.1.1.js"/>
    <asset:javascript src="landing_page/js/pace.min.js"/>
    <asset:javascript src="landing_page/js/bootstrap.min.js"/>

    <g:layoutHead/>
</head>

<body id="page-top">
<div class="navbar-wrapper">
    <nav class="navbar navbar-default navbar-fixed-top navbar-scroll" role="navigation">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <asset:image src="landing_page/img/nearsoft.png"></asset:image>
            </div>

            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/#page-top">Home</a></li>
                    <li><a href="/#program">El Programa</a></li>
                    <li><a href="/#team">Los Mentores</a></li>
                    <li><a href="/#next">Próximas clases</a></li>
                    <li><g:link controller="calendar">Calendario</g:link></li>
                    <sec:ifNotLoggedIn><li><a class="page-scroll" href="/login">Login</a></li></sec:ifNotLoggedIn>
                </ul>
            </div>
        </div>
    </nav>
</div>



<g:layoutBody/>



<section id="contact" class="gray-section contact" style="margin-top: 0px;">
    <div class="container">
        <div class="row m-b-lg">
            <div class="col-lg-12 text-center">
                <div class="navy-line"></div>

                <h1>Contáctanos</h1>
            </div>
        </div>

        <div class="row m-b-lg">
            <div class="col-lg-3 col-lg-offset-2">
                <address>
                    <strong><span class="navy">Hermosillo</span></strong><br/>
                    Blvd. Antonio Quiroga 21<br/>
                    Col. El Llano<br/>
                    Hermosillo, Sonora,<br/>
                    México 83210<br/>
                    <i class="fa fa-phone"></i> +52 (662) 216-7401
                </address>
            </div>

            <div class="col-lg-3">
                <address>
                    <strong><span class="navy">Ciudad de México</span></strong><br/>
                    San Luis Potosí 196 int. 401<br/>
                    Col. Roma Norte<br/>
                    Del. Cuauhtémoc<br/>
                    Mexico, D.F. 06700<br/>
                    <i class="fa fa-phone"></i> +52 (55) 6388-6650
                </address>
            </div>

            <div class="col-lg-3">
                <address>
                    <strong><span class="navy">Chihuahua</span></strong><br/>
                    Calle 2da 2016<br/>
                    Col. Centro<br/>
                    Chihuahua, Chihuahua,<br/>
                    México 31000<br/>
                    <i class="fa fa-phone"></i> +52 (614) 259-3974
                </address>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 text-center">
                <a href="mailto:jobs@nearsoft.com" class="btn btn-primary">Envíanos un correo</a>

                <p class="m-t-sm">
                    O síguenos en nuestras redes sociales
                </p>
                <ul class="list-inline social-icon">
                    <li><a href="https://twitter.com/nearsoftjobs"><i class="fa fa-twitter"></i></a>
                    </li>
                    <li><a href="https://www.facebook.com/nearsoftjobs/"><i class="fa fa-facebook"></i></a>
                    </li>

                </ul>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center m-t-lg m-b-lg">
                <p><strong>&copy; 2017 Nearsoft Inc.</strong><br/></p>
            </div>
        </div>
    </div>
</section>

<asset:javascript src="landing_page/js/classie.js"/>
<asset:javascript src="landing_page/js/wow.min.js"/>
<asset:javascript src="landing_page/js/inspinia.js"/>
</body>
</html>
