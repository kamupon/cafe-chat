<%@page pageEncoding="UTF-8"%>

<%-- BeanValidationエラーメッセージ --%>
<c:if test="${not empty(sessionScope.violations)}">
    <div class="alert error validation-error">
        <ul>
            <c:forEach var="violation" items="${sessionScope.violations}">
                <li>${violation.message}</li>
            </c:forEach>
        </ul>
    </div>
</c:if>
<c:remove scope="session" var="violations" />

<%-- 独自のエラーメッセージ --%>
<c:if test="${not empty(sessionScope.globalErrorMessage)}">
    <div class="alert error">
        <ul>
            <li>
                ${sessionScope.globalErrorMessage}
            </li>
        </ul>
    </div>
</c:if>
<c:remove scope="session" var="globalErrorMessage" />

<%-- 独自のSuccessメッセージ --%>
<c:if test="${not empty(sessionScope.globalSuccessMessage)}">
    <div class="alert info">
        <ul>
            <li>
                ${sessionScope.globalSuccessMessage}
            </li>
        </ul>
    </div>
</c:if>
<c:remove scope="session" var="globalSuccessMessage" />