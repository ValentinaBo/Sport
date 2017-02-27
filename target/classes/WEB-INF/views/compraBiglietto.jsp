<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acquista Biglietti</title>
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
        <h1>Acquista un biglietto</h1>
        <p>Dettagli biglietto: 
        	<br>Data: ${partitaCorrente.data}
        	<br>Squadre: ${partitaCorrente.squadra}
        	<br>Stadio: ${stadioCorrente.indirizzo}
        	<br>Prezzo: ${partitaCorrente.prezzo}
        </p>
        <p>Utente corrente: ${c.nome} ${c.cognome}</p>
 
        <form:form action="creaBiglietto" method="post" modelAttribute="biglietto">
        <table>
            <form:hidden path="idBiglietto"/>
            <form:hidden path="idClienteBigliettoFK"/>
            <form:hidden path="idPartitaBigliettoFK"/>
            <form:hidden path="prenotato"/>
            <form:hidden path="pagato"/>
            <form:hidden path="prezzoPagato"/>
            
            <tr>
            	<td>Quantit�</td>
            	<td>
            		<input type="number" name="quantity" min="1" max="${partitaCorrente.bigliettiDisponibili}" value="1">
            		<span> Massima capienza: ${partitaCorrente.bigliettiDisponibili}</span>
            	</td>
            </tr>
            <tr>
            	<td>Azioni</td>
            	<td>
            		<input type="submit" name="prenota" value="Prenota">&nbsp;&nbsp;
            		<input type="submit" name="paga" value="Paga">
            	</td>
            </tr>
           
        </table>
        </form:form>
    </div>
</body>
</html>