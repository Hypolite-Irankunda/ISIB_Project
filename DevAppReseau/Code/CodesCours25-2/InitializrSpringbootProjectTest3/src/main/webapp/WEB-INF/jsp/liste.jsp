<!DOCTYPE HTML>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>
            Liste 
        </title>
    </head>
    
    <body>
        <h1>Liste des cours</h1>
        <h2>
            Bonjour
            <c:choose>
                <c:when test="${mb.sexe=='M'}"> Monsieur</c:when>
                <c:when test="${mb.sexe=='F'}"> Madame</c:when>
            </c:choose>
            ${mb.pseudo}
        </h2>
        <c:if test="${ empty mb.list}">
            Liste vide
        </c:if>
        <c:if test="${! empty mb.list}">   
            <table border="1">
                 <tr>
                   <th>Nom</th>
                </tr>
                <c:forEach items="${mb.list}" var="item">
                      <tr>
                          <td> ${item}</td>
                      </tr>
                </c:forEach>
             </table>
        </c:if>     
    </body>
    
</html>
