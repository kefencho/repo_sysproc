<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estiloIndex.css" />
<link rel="stylesheet" type="text/css" href="css/menuHorizontal.css" />

<!-- inputs -->
<link rel="stylesheet" href="css/formularios/inputs.css" type="text/css">
<link rel="stylesheet" href="css/formularios/form.css" type="text/css">
<!-- fin-inputs -->

<!-- Archivos para calendario -->
	<link rel="stylesheet" href="css/formularios/themes/base/jquery.ui.all.css">
	<script src="script/jquery-1.9.1.js"></script>
	 <script src="script/ui/i18n/jquery.ui.datepicker-es.js"></script>
	<script src="script/ui/jquery.ui.core.js"></script>
	<script src="script/ui/jquery.ui.widget.js"></script>
	<script src="script/ui/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="css/formularios/demos.css">
	<script>
	$(function() {
		$.datepicker.setDefaults($.extend({showMonthAfterYear: false}, $.datepicker.regional['es']));
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "images/calendar.gif",
			buttonImageOnly: true
		});
		var fechaIngresoNotificacion = "<c:out value='${notificacionGuardar.fechaIngreso}' />";

		if(fechaIngresoNotificacion==null || fechaIngresoNotificacion==""){
			$("#datepicker").datepicker().datepicker("setDate", new Date());
		}
	});
	
	$(function() {
		$.datepicker.setDefaults($.extend({showMonthAfterYear: false}, $.datepicker.regional['es']));
		$( "#datepicker_dos" ).datepicker({
			showOn: "button",
			buttonImage: "images/calendar.gif",
			buttonImageOnly: true
		});
		var fechaResolucionNotificacion = "<c:out value='${notificacionGuardar.fechaResolucion}' />";

		if(fechaResolucionNotificacion==null || fechaResolucionNotificacion==""){
			$("#datepicker_dos").datepicker().datepicker("setDate", new Date());
		}
	});
	
	function transformarMinuscuaMayuscula(e, elemento) {
		tecla=(document.all) ? e.keyCode : e.which; 
		 elemento.value = elemento.value.toUpperCase();
		}

	</script>
<!-- Fin Archivos para calendario -->

<title>Agregar Notificaci�n</title>

<script language="javascript" src="script/popcalendar.js"></script>
</head>
<body>
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
		<div align="center">

			<form:form name="form1" modelAttribute="notificacionGuardar" method="POST">
				<div id="form">
					<fieldset id="formFielset">
						<div>
							<fieldset id="formFielset">
								<label id="label_titulo_pestanas">Registrar Notificaci�n</label>
							</fieldset>
						</div>
						<table border="0">
							<tr>
								<th align="left"><label class="label">N�mero de	Expediente:</label></th>
								<th align="left">
								<form:input path="proceso.nroExpediente" readonly="true" class="input_one" />
								<font color="#FF0000">
									<form:errors id="procesoErrors" name="procesoErrors" path="proceso.nroExpediente" />
								</font>
								</th>
							</tr>
							<tr>
								<th align="left"><label class="label">N�mero de	Notificaci�n:</label></th>
								<th align="left">
									<form:input id="nronotificacionUno" path="componenteUnoNroNotificacion" maxlength="4" size="4" class="input_notif_uno" /> 
									<big>-</big>
									<form:input id="nronotificacionDos" path="componenteDosNroNotificacion" maxlength="6" size="6" class="input_notif_dos" /> 
									<big>-</big>
									<form:input id="nronotificacionTres" path="componenteTresNroNotificacion" maxlength="2" size="2" class="input_notif_tres" onkeyup="transformarMinuscuaMayuscula(event, this)" onblur="transformarMinuscuaMayuscula(event, this)" /> 
									<big>-</big>
									<form:input id="nronotificacionCuatro" path="componenteCuatroNroNotificacion" maxlength="2" size="2" class="input_notif_cuatro" onkeyup="transformarMinuscuaMayuscula(event, this)" onblur="transformarMinuscuaMayuscula(event, this)"/>
									
									<br/>
								<font color="#FF0000">
									<form:errors id="nroNotificacionErrors" name="nroNotificacionErrors" path="nroNotificacion" />
								</font>
								</th>
							</tr>
							<tr>
								<th align="left"><label class="label">Fecha de	Ingreso:</label></th>
								<th align="left">
									<form:input path="fechaIngreso"	id="datepicker" maxlength="10" class="input_date" />
									<font color="#FF0000">
										<form:errors id="fechaIngresoErrors" name="fechaIngresoErrors" path="fechaIngreso" />
									</font>
								</th>
							</tr>
							<tr>
								<th align="left"><label class="label">N�mero de	Resoluci�n:</label></th>
								<th align="left"><form:input path="nroResolucion" maxlength="2" class="input_numero" />
									<font color="#FF0000">
										<form:errors id="nroResolucionErrors" name="nroResolucionErrors" path="nroResolucion" />
									</font>		
								</th>
							</tr>
							<tr>
								<th align="left"><label class="label">Fecha de	Resoluci�n:</label></th>
								<th align="left"><form:input path="fechaResolucion" id="datepicker_dos" maxlength="10" class="input_date" />
								<font color="#FF0000">
									<form:errors id="fechaResolucionErrors" name="fechaResolucionErrors" path="fechaResolucion" />
								</font>	
								</th>
							</tr>
							<tr>
								<th align="left"><label class="label">N�mero de	Fojas:</label></th>
								<th align="left"><form:input path="nroFojas" class="input_numero" maxlength="3" />
								<font color="#FF0000">
									<form:errors id="nroFojasErrors" name="nroFojasErrors" path="nroFojas"  />
								</font>
								</th>
							</tr>
							<tr>
								<th align="left"><label class="label">Anexo:</label></th>
								<th align="left"><form:textarea cols="10" rows="5" path="anexo" class="input_observacion" />
								<font color="#FF0000">
									<form:errors id="anexoErrors" name="anexoErrors" path="anexo" />
								</font>
								</th>
							</tr>
							<tr>
								<th align="left"><label class="label"></label></th>
								<th align="left">
									<p align="center">
										<c:if test="${not empty notificacionGuardar.nroNotificacion}">
											<c:url var="listaNotificacionExpediente" value="busquedaNotificacion.htm">
												<c:param name="numExpediente" value="${notificacionGuardar.proceso.nroExpediente}" />
											</c:url>
											<input type="button" onclick="location.href='<c:out value="${listaNotificacionExpediente}"/>'" value="Cancelar" class="btn_asignar" />
										</c:if>
										
										<c:if test="${empty notificacionGuardar.nroNotificacion}">
											<input type="button" onclick="location.href='<c:url value="/inicio.htm"/>'" value="Cancelar" class="btn_asignar" />
										</c:if>
										
										<input type="submit" value="Guardar" class="btn_guardar" />
									</p>
								</th>
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