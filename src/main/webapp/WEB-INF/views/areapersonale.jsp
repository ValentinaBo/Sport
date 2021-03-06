<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Area personale</title>
		<link href="<c:url value='/resources/style.css' />" rel="stylesheet"></link>
    </head>
	<body>
	
	<div class="menuWrap">
		<ul>
			<li><a class="active" href="/SocietaSportiva">Home</a></li>
			<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="/SocietaSportiva/clienti">Clienti</a></li>
			</security:authorize>
			<li><a href="/SocietaSportiva/partite">Partite</a></li>
			<li><a href="/SocietaSportiva/stadi">Stadi</a></li>
			
			<c:if test="${pageContext.request.userPrincipal.name == null}">
				<li class="userAreaButton"><a href="/SocietaSportiva/login">Login</a></li>
			</c:if>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<li class="userAreaButton"><a href="/SocietaSportiva/areapersonale?username=${pageContext.request.userPrincipal.name}">${pageContext.request.userPrincipal.name}</a>
					<ul>
						<li><a href="/SocietaSportiva/areapersonale?username=${pageContext.request.userPrincipal.name}">Area Personale</a></li>
						<li><a href="${pageContext.request.contextPath}/logout?${_csrf.parameterName}=${_csrf.token}">Logout</a></li>
					</ul>
				</li>
			</c:if>
		</ul>
	</div>
                	
		<div class="container" align="center">
		<h2>Area personale</h2>
<c:choose>
	<c:when  test="${!empty ListBiglietti}">
	
			<table border="1" class="data">
        	<tr class = "descriptor">
         	   <th>Id Biglietto</th>
         	   <th>Id Partita</th>
         	   <th>Squadre</th>
        	   <th>Prezzo</th>
        	   <th>Azioni</th>
            </tr> 
            
            <c:forEach var="biglietto" items="${ListBiglietti}" varStatus="status">
            <tr>
                <td>${biglietto.idBiglietto}</td>
                <td>${biglietto.idPartitaBigliettoFK}</td>
                <td>${squadre[status.index]}</td>
                <td>${biglietto.prezzoPagato}</td>
                <td>
                    <c:choose>
                    	<c:when test='${biglietto.pagato == 0}'>
              				<a href="pagaPrenotazioneForm?id=${biglietto.idBiglietto}" class="buylink">
              					Acquista il tuo biglietto prenotato
              				</a>
              				<br>
              				<a href="deleteBiglietto?id=${biglietto.idBiglietto}" class="reglink">
              					Cancella questa prenotazione
              				</a>
                		</c:when>
                		<c:otherwise>
                			<p>Hai già completato l'acquisto!</p>
                		</c:otherwise>
                	</c:choose>
                </td>     
            </tr>
            </c:forEach>             
        </table>
	</c:when>
	<c:otherwise>
		<p>Non hai ancora comprato biglietti. Consulta la lista delle 
		<a href="partite" class="reglink">partite</a></p>
	</c:otherwise>
</c:choose>
		</div>
	</body>
</html>