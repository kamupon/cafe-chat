<%@page pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@page import="java.util.Date"%>
<%-- 現在時刻 (キャッシュ対策のため) --%>
<c:set var="currentMilltime" value="<%= new Date().getTime()%>" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <meta http-equiv="expires" content="0" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
		<%-- 全画面共通のstylesheet --%>
        <link media="all" rel="stylesheet" href="<c:url value='/css/lib/bootstrap.min.css'/>?d=${currentMilltime}"/>
            
		<%-- 画面固有のstylesheet --%>
        <tiles:importAttribute name="stylesheets" ignore="true" />
        <c:forEach var="stylesheet" items="${stylesheets}">
            <c:set var="pageCssPath" value="/css/${stylesheet}" />
            <link media="all" rel="stylesheet" href="<c:url value='${pageCssPath}'/>?d=${currentMilltime}"/>
        </c:forEach>
		
		<%-- 全画面共通のjavascript --%>
		<script src="<c:url value='/js/lib/bootstrap.min.js'/>?d=${currentMilltime}"></script>
		<script src="<c:url value='/js/lib/react.js'/>?d=${currentMilltime}"></script>
        
		<%-- 画面固有のjavascript --%>
        <tiles:importAttribute name="javascripts" ignore="true" />
        <c:forEach var="javascript" items="${javascripts}">
            <c:set var="pageJsPath" value="/js/${javascript}" />
            <script src="<c:url value='${pageJsPath}'/>?d=${currentMilltime}"></script>
        </c:forEach>
                
        <tiles:insertAttribute name="head" ignore="true"/>
        <title>
            <tiles:getAsString name="title" /> | Jersey Example Web
        </title>
    </head>
    <body>
        <jsp:include page="../common/_header.jsp" />
        <jsp:include page="../common/_message.jsp" />
        
        <div id="main" class="container">
            <tiles:insertAttribute name="content" />
        </div>
    </body>
</html>
