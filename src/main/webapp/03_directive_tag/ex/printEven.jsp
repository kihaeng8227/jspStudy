<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Directives Tag</title>
</head>
<body>
<c:forEach var="k" begin="0" end="10" step="2">
  <c:out value="${k}" />
</c:forEach>
</body>
</html>
