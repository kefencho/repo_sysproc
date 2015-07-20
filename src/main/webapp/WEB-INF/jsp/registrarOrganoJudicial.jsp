<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estiloIndex.css" />
<link rel="stylesheet" type="text/css" href="css/menuHorizontal.css" />
<link rel="stylesheet" href="css/displaytag.css" type="text/css">
<link rel="stylesheet" href="css/screen.css" type="text/css">
<link rel="stylesheet" href="css/site.css" type="text/css">

<!--  Imports -->
<link rel="stylesheet" href="css/formularios/form.css" type="text/css">
<link rel="stylesheet" href="css/formularios/inputs.css" type="text/css">
<!--  Fin - Imports -->

<title>Registrar Organo Judicial</title>

</head>
<body>
	<c:url var="editImgUrl" value="images/resources/edit.png" />
	<c:url var="deleteImgUrl" value="images/resources/delete.png" />
	<div id="contenedorPrincipal">
	<security:authorize access="hasRole('Procurador')">
		<jsp:include page="/WEB-INF/cabecera/cabeceraProcurador.jsp" />
	</security:authorize>
	<security:authorize access="hasRole('Abogado')">
		<jsp:include page="/WEB-INF/cabecera/cabeceraAbogado.jsp" />
	</security:authorize>
	<security:authorize access="hasRole('Mesa de Partes')">
		<jsp:include page="/WEB-INF/cabecera/cabeceraMesaPartes.jsp" />
	</security:authorize>
		<div>
			<form:form commandName="organoJudicialBuscar">
				<div id="form">
					<fieldset id="formFielset">
						<br>
						<div>
							<fieldset id="formFielset">
								<label id="label_titulo_pestanas">�rgano Judicial</label>
							</fieldset>
						</div>
						
						<table border="0" align="center" id="form">
							<tr>								
								<th>
									<label class="label">�rgano Judicial:</label>
									<form:input path="denominacion" maxlength="50" class="input_one" placeholder="Ingrese �rgano Judicial" />
									<input type="submit" id="Buscar" name="Buscar" value="Buscar" class="btn_guardar" />									
								</th>								
								<th>																		
									<input type="button" id="AgregarOrganoJudicial" name="AgregarOrganoJudicial" onclick="location.href='<c:url value="/addOrganoJudicial.htm"/>'" value="Organo Judicial" class="btn_nuevo_expediente" />
								</th>
							</tr>
						</table>
					
						
						<table border="0" align="center">		
							<tr>
								<td>&nbsp;</td>
								<td valign="top">
									<display:table id="organoJudicial" name="listaOrganosJudiciales" requestURI="/registrarOrganoJudicial.htm" pagesize="5" defaultsort="1" defaultorder="ascending">

									<display:column title="Nro" property="idOrganojudicial" sortable="true" />
									<display:column property="denominacion" title="DENOMINACI�N" />

									<c:url var="editCcUrl" value="addOrganoJudicial.htm">
										<c:param name="idOrganoJudicial" value="${organoJudicial.idOrganojudicial}" />
									</c:url>
										
									<c:url var="deleteCcUrl" value="borrarOrganoJudicial.htm">
										<c:param name="idOrganoJudicial" value="${organoJudicial.idOrganojudicial}" />
									</c:url>
										
									<display:column title="ACCIONES">
										<a href="<c:out value="${editCcUrl}"/>"><img src="<c:out value="${editImgUrl}"/>" title="Editar Organo Judicial"></img></a>
										<a href="<c:out value="${deleteCcUrl}"/>"><img src="<c:out value="${deleteImgUrl}"/>" title="Eliminar Organo Judicial"></img></a>
									</display:column>
									</display:table>
								</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</fieldset>
				</div>
			</form:form>
		</div>
		<!-- FIN Cuerpo -->
		<jsp:include page="/WEB-INF/pie/pie.jsp" />
	</div>
	<!-- FIN Contenedor PRINCIPAL -->

</body>
</html>