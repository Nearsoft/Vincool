<g:applyLayout name="simple">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>

    <content tag="boxTitle">
        <h5><g:message code="default.list.label" args="[entityName]"/></h5>
        <sec:ifAnyGranted roles='ROLE_ADMIN,ROLE_INSTRUCTOR'>
            <div class="ibox-tools">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-plus"></i>
                </a>

                <ul class="dropdown-menu dropdown-user">
                    <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                          args="[entityName]"/></g:link>
                    </li>
                </ul>
            </div>
        </sec:ifAnyGranted>
    </content>
    <content tag="boxContent">
        <div id="list-event" class="content scaffold-list" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${eventList}" properties="['eventCategory', 'type','date', 'time', 'instructor', 'office']"/>

            <div class="pagination">
                <vincool:paginate total="${eventCount ?: 0}"/>
            </div>
        </div>
    </content>
</g:applyLayout>


