<%@page pageEncoding="UTF-8"%>

<tiles:insertTemplate template="/WEB-INF/view/common/layout.jsp" flush="true">
    <tiles:putAttribute name="title" >
        404 Not Found
    </tiles:putAttribute>
    <tiles:putListAttribute name="javascripts">
    </tiles:putListAttribute>
    <tiles:putListAttribute name="stylesheets">
    </tiles:putListAttribute>
    <tiles:putAttribute name="head" type="string">
    </tiles:putAttribute>

    <tiles:putAttribute name="content" type="string">
        404 Not Found.
    </tiles:putAttribute>
</tiles:insertTemplate>