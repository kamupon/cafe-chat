<%@page pageEncoding="UTF-8"%>

<tiles:insertTemplate template="/WEB-INF/view/common/layout.jsp" flush="true">
    <tiles:putAttribute name="title" >
        top
    </tiles:putAttribute>
    <tiles:putListAttribute name="javascripts">
    </tiles:putListAttribute>
    <tiles:putListAttribute name="stylesheets">
    </tiles:putListAttribute>
    <tiles:putAttribute name="head" type="string">
    </tiles:putAttribute>
        
    <tiles:putAttribute name="content" type="string">
        <div class="col-lg-3">
            menu
        </div>
        <div class="col-lg-9">
            contents
        </div>
    </tiles:putAttribute>
</tiles:insertTemplate>