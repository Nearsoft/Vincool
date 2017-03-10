<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Mainly CSS -->
        <asset:stylesheet src="bootstrap.min.css"/>
        <asset:stylesheet src="font-awesome/css/font-awesome.min.css"/>
        <asset:stylesheet src="animate.css"/>
        <asset:stylesheet src="style.min.css"/>
        <asset:stylesheet src="plugins/social-buttons/social-buttons.css"/>
        <asset:stylesheet src="css/bootstrap.min.css" rel="stylesheet"/>
        <asset:stylesheet src="font-awesome/css/font-awesome.css" rel="stylesheet"/>
        <asset:stylesheet src="css/plugins/bootstrapSocial/bootstrap-social.css" rel="stylesheet"/>


            <!-- Mainly scripts -->
        <asset:javascript src="jquery-2.2.0.min.js"/>
        <asset:javascript src="bootstrap.js"/>
        <asset:javascript src="plugins/metisMenu/jquery.metisMenu.js"/>
        <asset:javascript src="plugins/slimscroll/jquery.slimscroll.min.js"/>

    </head>

    <body class="gray-bg">
        <div class="middle-box text-center loginscreen animated fadeInDown">
            <div>
                <div>
                    <asset:image src="nearsoft.png" alt="laptop"/>
                </div>
                <h3><g:message code='login.apprentice.label' default="Welcome to Nearsoft Apprentice"/></h3>
                <p><g:message code='login.apprentice.message' default="Learn the basics of software development from some of the best engineers of Nearsoft."/></p>
                <p><g:message code='login.apprentice.sigin' default="Singin to start learning."/></p>
                <form class="m-t" role="form">
                    <div class="">
                        <oauth2:connect provider="google" id="google-connect-link" class="btn btn-block btn-social btn-google" ><span class="fa fa-google"></span><g:message code='login.apprentice.sigin.google' default="Sign in with Google"/></oauth2:connect>
                    </div>
                </form>
                <br/>
                <p>
                    <g:message code='login.apprentice.agree' default="By clicking Sign in you agree to the"/>
                    <a href="/login/privacy"><g:message code='privacypolicy' default="Privacy Policy"/></a>
                </p>
                <!--a class="btn btn-block btn-social btn-facebook">
                    <span class="fa fa-facebook"></span> Sign in with Facebook
                </a>
                <br/>
                <a class="btn btn-block btn-social btn-github">
                    <span class="fa fa-github"></span> Sign in with GitHub
                </a>
                <br/>
                <a class="btn btn-block btn-social btn-twitter">
                    <span class="fa fa-twitter"></span> Sign in with Twitter
                </a-->
                <p class="m-t"><small>Nearsoft where the magic begins &copy; 2017</small></p>
            </div>
        </div>

        <!-- Mainly scripts -->
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function(){
                function fix_height(){
                    var h = $("#tray").height();
                    $("#preview").attr("height", (($(window).height()) - h) + "px");
                }
                $(window).resize(function(){ fix_height(); }).resize();
                //$("#preview").contentWindow.focus();
            });
        </script>
    </body>

</html>
