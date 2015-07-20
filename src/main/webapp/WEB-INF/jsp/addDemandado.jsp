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

<title>Agregar Demandado</title>
<script language="javascript" src="script/popcalendar.js"></script>

</head>
<body>
	<div id="contenedorPrincipal">		
		<div>

			<form:form commandName="demandadoGuardar">
				<div id="form">
					<fieldset id="formFielset">
						<div>
							<fieldset id="formFielset">
								<label id="label_titulo_pestanas">Agregar Demandado</label>
							</fieldset>
						</div>
						
						<ol>
							<form:hidden path="idDemandado"/>
							<li>
								<label>N�mero Expediente:</label> 
								<form:input path="proceso.nroExpediente" maxlength="30" class="input_one"/>
								<font color="#FF0000">
									<form:errors id="procesoErrors" name="procesoErrors" path="proceso" />
								</font>
							</li>
							<li>
								<label>Denominaci�n:</label> 
								<form:input path="denominacion" maxlength="100" class="input_one"/>
								<font color="#FF0000">
									<form:errors id="denominacionErrors" name="denominacionErrors" path="denominacion" />
								</font>
							</li>
						</ol>
						<p align="center">
							<input type="button" onclick="location.href='<c:url value="/demandadoList.htm"/>'" value="Cancelar" class="btn_asignar" />
							<input type="submit" value="Guardar" class="btn_guardar"/>
						</p>
					</fieldset>
				</div>
			</form:form>
		</div>
	</div>
	<!-- FIN Contenedor PRINCIPAL -->
</body>
</html>