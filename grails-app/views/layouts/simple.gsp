<!doctype html>
<html>
<head>
    <sec:ifLoggedIn>
        <meta name="layout" content="main">
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
        <meta name="layout" content="landing">
    </sec:ifNotLoggedIn>
    <g:layoutHead/>
    <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    <g:pageProperty name="page.head"/>
</head>

<body>
<sec:ifLoggedIn>
    <div id="page-wrapper" class="gray-bg">

        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i>
                    </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"></span>
                    </li>
                    <!--li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i>  <span class="label label-warning">0</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i>  <span class="label label-primary">0</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">

                        </ul>
                    </li-->


                    <li>
                        <g:link controller="logout"><i class="fa fa-sign-out"></i>Logout</g:link>
                    </li>
                </ul>

            </nav>
        </div>

        <div class="row wrapper border-bottom white-bg page-heading" style="padding: 10px 10px 10px 10px">
            <div class="col-lg-8">
                <ol class="breadcrumb">
                    <li>
                        <a href="/"><g:message code="default.home.label"/></a></a>
                    </li>
                    <g:pageProperty name="page.breadcrumbs"/>
                </ol>
            </div>
        </div>

        <div class="row wrapper wrapper-content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <g:pageProperty name="page.boxTitle"/>
                        </div>

                        <div class="ibox-content">
                            <g:pageProperty name="page.boxContent"/>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer">
            <div class="pull-right">
            </div>

            <div>
                <strong>Copyright</strong> Nearsoft Inc. &copy; 2014-2015
            </div>
        </div>

    </div>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
        <g:pageProperty name="page.boxContent"/>
</sec:ifNotLoggedIn>
</body>
</html>
