<g:applyLayout name="simple">
    <content tag="head">
        <asset:stylesheet src="plugins/jasny/jasny-bootstrap.min.css"/>
        <asset:stylesheet href="plugins/fullcalendar/fullcalendar.css"/>
        <asset:javascript src="plugins/fullcalendar/moment.min.js"/>
        <asset:javascript src="plugins/jasny/jasny-bootstrap.min.js"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.min.js"/>
        <asset:javascript src="plugins/fullcalendar/fullcalendar.print.css" media="print"/>
    </content>
    <content tag="boxTitle">
        <g:message code="profile.label"/>
    </content>
    <content tag="boxContent">
        <div class="row animated fadeInRight">
            <div class="col-md-12">
                <div class="ibox float-e-margins">
                    <g:form controller="profile" action="update" method="PUT" enctype="multipart/form-data">

                        <div class="col-md-3">
                            <img src="${session.profilePictureUrl}" class="img-circle circle-border" height="250px"
                                 width="250px" alt="profile">

                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <span class="btn btn-default btn-file"><span class="fileinput-new"><g:message
                                        code="select.file" default="Select file"/></span>
                                    <span class="fileinput-exists"><g:message code="change"/></span><input type="file"
                                                                                                           name="picture"/>
                                </span>
                                <span class="fileinput-filename"></span>
                                <a href="#" class="close fileinput-exists" data-dismiss="fileinput"
                                   style="float: none">×</a>
                            </div>
                        </div>

                        <div class="col-md-9">

                                <br>
                                <label id="nameLabel">
                        <g:if test="${session.name == null}">
                            <g:set var="namePlaceholder" value="${true}"/>
                            <h3 id="nameValue"><strong><g:message code="click.to.add.your"
                                                                  args="${[message(code: "name.label")]}"/></strong>
                            </h3>
                        </g:if>
                        <g:else>
                            <g:set var="namePlaceholder" value="${false}"/>
                            <h3 id="nameValue"><strong>${session.name}</strong></h3>
                        </g:else>
                        </label>
                        <g:textField id="nameInput" name="name" class="form-control"/>
                        <br>

                        <sec:ifAllGranted roles='ROLE_STUDENT'>
                            <p>
                            <h5><i class="fa fa-briefcase"></i> <g:message code="work.title"/></h5>
                            <label id="workLabel">
                                <g:if test="${user.currentCompany == null}">
                                    <g:set var="workPlaceholder" value="${true}"/>
                                    <h5 id="workValue"><g:message code="click.to.add.a"
                                                                  args="${[message(code: "company.label")]}"/></h5>
                                </g:if>
                                <g:else>
                                    <g:set var="workPlaceholder" value="${false}"/>
                                    <h5 id="workValue">${user.currentCompany}</h5>
                                </g:else>
                            </label>
                            </p>
                            <g:textField id="workInput" name="currentCompany" class="form-control"/>

                            <p>
                            <h5><i class="fa fa-graduation-cap"></i> <g:message code="school.title"/></h5>
                            <label id="schoolLabel">
                                <g:if test="${user.school == null}">
                                    <g:set var="schoolPlaceholder" value="${true}"/>
                                    <h5 id="schoolValue"><g:message code="click.to.add.a"
                                                                    args="${[message(code: "school.label")]}"/></h5>
                                </g:if>
                                <g:else>
                                    <g:set var="schoolPlaceholder" value="${false}"/>
                                    <h5 id="schoolValue">${user.school}</h5>
                                </g:else>
                            </label>
                            </p>
                            <g:textField id="schoolInput" name="school" class="form-control"/>

                        </sec:ifAllGranted>

                        <p>
                        <h5><i class="fa fa-twitter"></i> Twitter</h5>
                        <label id="twitterLabel">
                            <g:if test="${user.twitter == null}">
                                <g:set var="twitterPlaceholder" value="${true}"/>
                                <h5 id="twitterValue"><g:message code="click.to.add.your" args="${['twitter']}"/></h5>
                            </g:if>
                            <g:else>
                                <g:set var="twitterPlaceholder" value="${false}"/>
                                <h5 id="twitterValue">${user.twitter}</h5>
                            </g:else>
                        </label>
                        </p>
                        <g:textField id="twitterInput" name="twitter" class="form-control"/>

                        <p>
                        <h5><i class="fa fa-linkedin-square"></i> Linkedin</h5>
                        <label id="linkedinLabel">
                            <g:if test="${user.linkedin == null}">
                                <g:set var="linkedinPlaceholder" value="${true}"/>
                                <h5 id="linkedinValue"><g:message code="click.to.add.your" args="${['linkedin']}"/></h5>
                            </g:if>
                            <g:else>
                                <g:set var="linkedinPlaceholder" value="${false}"/>
                                <h5 id="linkedinValue">${user.linkedin}</h5>
                            </g:else>
                        </label>
                        </p>
                        <g:textField id="linkedinInput" name="linkedin" class="form-control"/>

                        <p>
                        <h5><i class="fa fa-github"></i> Github</h5>
                        <label id="githubLabel">
                            <g:if test="${user.github == null}">
                                <g:set var="githubPlaceholder" value="${true}"/>
                                <h5 id="githubValue"><g:message code="click.to.add.your" args="${['github']}"/></h5>
                            </g:if>
                            <g:else>
                                <g:set var="githubPlaceholder" value="${false}"/>
                                <h5 id="githubValue">${user.github}</h5>
                            </g:else>
                        </label>
                        </p>
                        <g:textField id="githubInput" name="github" class="form-control"/>

                        <p>
                        <h5><i class="fa fa-user"></i> <g:message code="about.me.title"/></h5>
                        <label id="aboutMeLabel">
                            <g:if test="${user.description == null}">
                                <g:set var="aboutMePlaceholder" value="${true}"/>
                                <h5 id="aboutMeValue"><g:message code="click.to.tell.us.about.you"/></h5>
                            </g:if>
                            <g:else>
                                <g:set var="aboutMePlaceholder" value="${false}"/>
                                <h5 id="aboutMeValue">${user.description}</h5>
                            </g:else>
                        </label>
                        </p>
                        <g:textArea id="aboutMeInput" name="description" cols="80" rows="8" class="form-control"/>
                        <sec:ifAnyGranted roles='ROLE_INSTRUCTOR'>
                            <p>
                            <h5><i class="fa fa-user"></i> <g:message code="public.profile.title"
                                                                      default="Public Profile?"/></h5>
                            </p>
                            <div class="switch">
                                <div class="onoffswitch">
                                    <g:checkBox name="isPublic"
                                                value="${user.isPublic}"
                                                class="onoffswitch-checkbox"/>
                                    <label class="onoffswitch-label" for="isPublic">
                                        <span class="onoffswitch-inner"></span>
                                        <span class="onoffswitch-switch"></span>
                                    </label>

                                </div>
                            </div>
                            <br>
                        </sec:ifAnyGranted>
                        <div class="user-button">
                            <div class="row">
                                <div class="col-md-12">
                                    <g:link controller="home" class="btn btn-white btn-outline">
                                        <g:message code="button.cancel"/>
                                    </g:link>
                                    <button type="submit" name="submit" value="Update info"
                                            class="btn btn-primary btn-outline">
                                        <i class="fa fa-user"></i> <g:message code="button.update"
                                                                              args="${[message(code: "profile.label")]}"/>
                                    </button>
                                </div>
                            </div>
                        </div>

                    </g:form>

                </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {

                function labelClick(label, labelValue, input, setPlaceholder) {
                    label.hide();
                    if (setPlaceholder) {
                        input.attr('placeholder', labelValue.text());
                    } else {
                        input.val(labelValue.text());
                    }
                    input.show().focus();
                    return;
                }

                function inputFocusOut(label, labelValue, input) {
                    if (input.val() == '') {
                        labelValue.text(input.attr('placeholder'));
                    } else {
                        labelValue.text(input.val());
                    }
                    input.hide();
                    label.show();
                }

                var nameInput = $('#nameInput');
                var nameLabel = $('#nameLabel');
                var nameValue = $('#nameValue');

                nameInput.hide();

                nameLabel.click(function () {
                    labelClick(nameLabel, nameValue, nameInput, ${namePlaceholder});
                });

                nameInput.focusout(function () {
                    inputFocusOut(nameLabel, nameValue, nameInput);
                });

                <sec:ifAllGranted roles='ROLE_STUDENT'>

                var workInput = $('#workInput');
                var workLabel = $('#workLabel');
                var workValue = $('#workValue');

                workInput.hide();

                workLabel.click(function () {
                    labelClick(workLabel, workValue, workInput, ${workPlaceholder});
                });

                workInput.focusout(function () {
                    inputFocusOut(workLabel, workValue, workInput);
                });

                var schoolInput = $('#schoolInput');
                var schoolLabel = $('#schoolLabel');
                var schoolValue = $('#schoolValue');

                schoolInput.hide();

                schoolLabel.click(function () {
                    labelClick(schoolLabel, schoolValue, schoolInput, ${schoolPlaceholder});
                });

                schoolInput.focusout(function () {
                    inputFocusOut(schoolLabel, schoolValue, schoolInput);
                });

                </sec:ifAllGranted>

                var twitterInput = $('#twitterInput');
                var twitterLabel = $('#twitterLabel');
                var twitterValue = $('#twitterValue');

                twitterInput.hide();

                twitterLabel.click(function () {
                    labelClick(twitterLabel, twitterValue, twitterInput, ${twitterPlaceholder});
                });

                twitterInput.focusout(function () {
                    inputFocusOut(twitterLabel, twitterValue, twitterInput);
                });

                var linkedinInput = $('#linkedinInput');
                var linkedinLabel = $('#linkedinLabel');
                var linkedinValue = $('#linkedinValue');

                linkedinInput.hide();

                linkedinLabel.click(function () {
                    labelClick(linkedinLabel, linkedinValue, linkedinInput, ${linkedinPlaceholder});
                });

                linkedinInput.focusout(function () {
                    inputFocusOut(linkedinLabel, linkedinValue, linkedinInput);
                });

                var githubInput = $('#githubInput');
                var githubLabel = $('#githubLabel');
                var githubValue = $('#githubValue');

                githubInput.hide();

                githubLabel.click(function () {
                    labelClick(githubLabel, githubValue, githubInput, ${githubPlaceholder});
                });

                githubInput.focusout(function () {
                    inputFocusOut(githubLabel, githubValue, githubInput);
                });

                var aboutMeInput = $('#aboutMeInput');
                var aboutMeLabel = $('#aboutMeLabel');
                var aboutMeValue = $('#aboutMeValue');

                aboutMeInput.hide();

                aboutMeLabel.click(function () {
                    labelClick(aboutMeLabel, aboutMeValue, aboutMeInput, ${aboutMePlaceholder});
                });

                aboutMeInput.focusout(function () {
                    inputFocusOut(aboutMeLabel, aboutMeValue, aboutMeInput);
                });

            });
        </script>
    </content>
</g:applyLayout>
