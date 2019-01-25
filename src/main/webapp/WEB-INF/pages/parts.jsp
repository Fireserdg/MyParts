<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Parts Page</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: bisque">
<div class="container">
    <c:if test="${fullList.size() != listAll.size()}">
        <a href="<c:url value='/redirect'/>" class="btn btn-info">Back to main catalog</a>
    </c:if>  
</div>
<div class="container text-center">
    <h3>Catalog items for computers</h3>
</div>
<c:if test="${!empty listParts}">
    <div class="container text-center">
        <table class="table table-bordered text-center" style="background-color: white">
            <tr class="active">
                <th>Name item</th>
                <th>Need</th>
                <th>Count</th>
                <th>Add item</th>
                <th>Delete item for catalog</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${listParts}" var="part">
                <tr class="warning">

                    <td>${part.name}</td>
                    <td> <c:choose>
                        <c:when test="${part.needed !=1}">No</c:when>
                        <c:otherwise>Yes</c:otherwise>
                    </c:choose>
                    </td>
                    <td>${part.number}</td>
                    <td><a href="<c:url value='/increment/${part.id}'/>">Add part instance</a></td>
                    <td><a href="<c:url value='/remove/${part.id}'/>">Delete this line</a></td>
                    <td><a href="<c:url value='/decrement/${part.id}'/>">Delete part of instance</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="container text-center">
        <c:if test="${listParts.size() < listAll.size()}">
            <table class="table table-bordered text-center">
                <tr class="active">
                    <td><a href="<c:url value='/previous'/>">&lt;&lt;Back&lt;&lt; </a></td>
                    <td width="120"> </td>
                    <td><a href="<c:url value='/next'/>">  &gt;&gt;Next&gt;&gt;</a></td>
                </tr>
            </table>
        </c:if>
    </div>
    <div class="container text-center">
        <table class = "table table-bordered text-center">
            <tr class="active">
                <td>Can be assembled</td>
                <td>${countComputers}</td>
                <td>computers</td>

            </tr>
        </table>
    </div>
</c:if>
<div class="container text-center">
    <h3>Part selection by value</h3>
    <table class=" table table-bordered text-center">
        <tr class="info">
            <td><a href="<c:url value='/parts/selectNeeded'/>">Get necessary detail</a></td>
            <td><a href="<c:url value='/parts/selectNoNeeded'/>">Get optional detail</a></td>
        </tr>
    </table>
</div>

<div class="container text-center">
    <h3>Add new detail in catalog</h3>

    <c:url var="addAction" value="/parts/add"/>
    <form:form action="${addAction}" commandName="part">
        <table class="table table-bordered text-center">
            <c:if test="${!empty part.name}">
                <tr class="active">
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr class="warning">
                <td>
                    <form:label path="name">
                        <spring:message text="Name detail"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr class="info">
                <td>
                    <form:label path="needed">
                        <spring:message text="Need Yes/No"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="needed"/>
                </td>
            </tr>
            <tr class="active">
                <td>
                    <form:label path="number">
                        <spring:message text="Count"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="number"/>
                </td>
            </tr>
            <tr class="warning">
                <td colspan="2">

                    <input type="submit" class="btn btn-info" value="<spring:message text="Add detail"/>"/>
                </td>
            </tr>
        </table>
    </form:form>
</div>
<div class="container text-center">
    <h3>Search detail for name</h3>
    <c:url var="searchAction" value="/parts/search"/>

    <form:form action="${searchAction}" commandName="part" class="form-group">
        <table class="table table-bordered text-center">
            <tr class="warning">
                <td>
                    <form:label path="name">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="name"/>
                </td>

            </tr>
            <tr class="info">
                <td colspan="2">
                    <input type="submit" class="btn btn-info" value="<spring:message text="Search detail"/>"/>
                </td>
            </tr>
        </table>
    </form:form>
</div>
</body>
</html>
