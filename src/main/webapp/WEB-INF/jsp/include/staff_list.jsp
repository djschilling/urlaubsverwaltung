<%-- 
    Document   : staff_list
    Created on : 31.10.2011, 11:49:42
    Author     : Aljona Murygina
--%>
            
        <table id="staff-list" cellspacing="0" border="0.5">
            <tr>
                <th>&nbsp;</th>
                <th class="attributes"><spring:message code="login" /></th>
                <th class="attributes"><spring:message code="name" /></th>
                <th class="attributes"><spring:message code="email" /></th>
                <th class="vac"><spring:message code="entitlement" />&nbsp;<spring:message code="whole" /></th>
                <th class="vac"><spring:message code="overview.left" /></th>
                <th><spring:message code="apps" /></th>
                <th><spring:message code="edit" /></th>
            </tr>
        <c:forEach items="${persons}" var="person" varStatus="loopStatus">
            <tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
                <td><img src="<c:out value='${gravatarUrls[person]}?s=20&d=mm'/>" /></td>
                <td><c:out value="${person.loginName}"/></td>
                <td><c:out value="${person.lastName}"/>&nbsp;<c:out value="${person.firstName}"/></td>
                <td><a href="mailto:${person.email}"><c:out value="${person.email}"/></a></td>
                <td class="vac"><c:out value="${entitlements[person].vacationDays + entitlements[person].remainingVacationDays}"/></td>
                <td class="vac">
                    <c:choose>
                        <c:when test="${april == 1}">
                            <c:out value="${accounts[person].vacationDays + accounts[person].remainingVacationDays}"/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${accounts[person].vacationDays}"/>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td style="text-align: center;"><a href="${formUrlPrefix}/${person.id}/application"><img src="<spring:url value='/images/playlist.png' />" /></a></td>
                <td class="td-edit"><a href="${formUrlPrefix}/staff/${person.id}/edit"><img src="<spring:url value='/images/edit.png' />" /></a></td>
            </tr>    
        </c:forEach>
        </table>
