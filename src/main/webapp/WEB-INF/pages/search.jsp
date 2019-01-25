<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
  <title>Search Part</title>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: bisque">
<div class="container text-center">
  <h3>Result search detail</h3>
  <table class="table table-boarded">
    <tr class="active text-center">
      <th>Name</th>
      <th>Need</th>
      <th>Count</th>
      <th>Add item</th>
      <th>Delete all line</th>
      <th>Delete instance</th>
    </tr>
    <tr class="warning">
      <td>${part.name}</td>
      <td> <c:choose>
        <c:when test="${part.needed !=1}">No</c:when>
        <c:otherwise>Yes</c:otherwise>
      </c:choose>
      </td>
      <td>${part.number}</td>
      <td><a href="<c:url value='/increment/${part.id}'/>">Add instance</a></td>
      <td><a href="<c:url value='/remove/${part.id}'/>">Delete this line</a></td>
      <td><a href="<c:url value='/decrement/${part.id}'/>">Delete instance of detail</a></td>
    </tr>
  </table>
</div>
<div class="container text-center">
  <a href="<c:url value='/redirect'/>" class="btn btn-info">Back to main account</a>
</div>
</body>
</html>