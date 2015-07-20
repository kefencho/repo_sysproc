<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/estiloIndex.css" />
<link rel="stylesheet" type="text/css" href="css/menuHorizontal.css" />
<!-- Archivos para calendario -->
	<link rel="stylesheet" href="css/formularios/themes/base/jquery.ui.all.css">
	<script src="script/jquery-1.9.1.js"></script>
	 <script src="script/ui/i18n/jquery.ui.datepicker-es.js"></script>
	<script src="script/ui/jquery.ui.core.js"></script>
	<script src="script/ui/jquery.ui.widget.js"></script>
	<script src="script/ui/jquery.ui.datepicker.js"></script>
	<link rel="stylesheet" href="css/formularios/demos.css">
	<!-- Autocomplete jquery 
	<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" />
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>-->
	<script type="text/javascript" src="script/ui/minified/jquery-ui.min.js"></script>
	<!-- Fin-para Autocomplete jquery -->
	<script>
	$(function() {
		$.datepicker.setDefaults($.extend({showMonthAfterYear: false}, $.datepicker.regional['es']));
		$( "#datepicker" ).datepicker({
			showOn: "button",
			buttonImage: "images/calendar.gif",
			buttonImageOnly: true
		});
		$( "#datepicker1" ).datepicker({
			showOn: "button",
			buttonImage: "images/calendar.gif",
			buttonImageOnly: true,
			disabled: true
		});
		$( "#idNuevoDemandado" ).autocomplete({
			source: "<c:out value='${pageContext. request. contextPath}'/>/obtener_lista_demandado.htm"
		});
		$( "#idNuevoDemandante" ).autocomplete({
			source: "<c:out value='${pageContext. request. contextPath}'/>/obtener_lista_demandante.htm"
		});
		
		$("#datepicker").datepicker().datepicker("setDate", new Date());
	});
	
	function transformarMinuscuaMayuscula(e, elemento) {
		tecla=(document.all) ? e.keyCode : e.which; 
		 elemento.value = elemento.value.toUpperCase();
		}
	</script>
<!-- Fin Archivos para calendario -->


<link rel="stylesheet" type="text/css" href="css/formularios/form.css" />
<link rel="stylesheet" type="text/css" href="css/formularios/inputs.css" />

<title>Agregar Expediente</title>

<script language="javascript" src="script/asignarFolder.js"></script>
<script language="javascript" src="script/jquery.cascade.js"></script>
<script language="javascript" src="script/jquery.cascade.ext.js"></script>
<script language="javascript" src="script/jquery.templating.js"></script>

<script type="text/javascript">
	function commonTemplate(item) {
		return "<option value='" + item.Value + "'>" + item.Text + "</option>";
	};
	function commonMatch(selectedValue) {
		return this.When == selectedValue;
	};
</script>

<script type="text/javascript">

var anio = (new Date).getFullYear();

$(document).ready(function() {
  $("#anio").val(anio);
  
  $("#chBoxSetencia").change(function () {
      var isCheckedSentencia = $(this).is(":checked");
      if (isCheckedSentencia) {
    	  $("#txtAreaSentencia").prop("disabled", false);
    	  $("#datepicker1").datepicker("option", "disabled", false);

      } else {
    	  $("#txtAreaSentencia").prop("disabled", true);
    	  $("#datepicker1").datepicker("option", "disabled", true);
      }
  });
});


$(function() {
	// Clona la fila oculta que tiene los campos base, y la agrega al final de la tabla
	$('#agregarDemandado').on('click',function() {
		var idNuevoDemandado=$("#idNuevoDemandado").val();
		if(idNuevoDemandado!=''){
			var nroExpediente = $("#nroexpedienteUno").val()+ "-" 
			+ $("#nroexpedienteDos").val() + "-"
			+ $("#nroexpedienteTres").val() + "-"
			+ $("#nroexpedienteCuatro").val() + "-"
			+ $("#nroexpedienteCinco").val()+ "-"
			+ $("#nroexpedienteSeis").val()+ "-"
			+ $("#nroexpedienteSiete").val();
			
			var idi = $('#tablaDemandado >tbody >tr').length;
			var i = idi - 1;
			$('#tablaDemandado > tbody:last')
					.append("<tr>"
								+"<td class='label'><input name='nuevoDemandado["+i+"].denominacion' value='"+idNuevoDemandado+"' class=input_one /></td>"
								+"<td class='eliminarDemandado'>Eliminar</td></tr>");
			
			$('#idNuevoDemandado').val('');
		}else{
			$('#idNuevoDemandado').tooltip({
				position: {
			        my: "center bottom",
			        at: "left top",
			        fadeInSpeed:400
			      }
			 }).tooltip( "open" );
		}					
});
	// Evento que selecciona la fila y la elimina 
	$(document).on("click", ".eliminarDemandado", function() {
		var parent = $(this).parents().get(0);
		$(parent).remove();
	});

	$('#agregarDemandante').on('click',function() {
		var idNuevoDemandante=$("#idNuevoDemandante").val();
		if(idNuevoDemandante!=''){
						var nroExpediente = $("#nroexpedienteUno").val()+ "-" 
								+ $("#nroexpedienteDos").val() + "-"
								+ $("#nroexpedienteTres").val() + "-"
								+ $("#nroexpedienteCuatro").val() + "-"
								+ $("#nroexpedienteCinco").val()+ "-"
								+ $("#nroexpedienteSeis").val()+ "-"
								+ $("#nroexpedienteSiete").val();
						
						var idi = $('#tablaDemandante >tbody >tr').length;
						var i = idi - 1;
						$('#tablaDemandante > tbody:last')
								.append("<tr>"
											+"<td class='label'><input name='nuevoDemandante["+i+"].denominacion' value='"+idNuevoDemandante+"' class=input_one /></td>"
											+"<td class='eliminarDemandante'>Eliminar</td></tr>");
						
						$('#idNuevoDemandante').val('');
		}else{
			$('#idNuevoDemandante').tooltip({
				position: {
					my: "center bottom",
				    at: "right top",
				    fadeInSpeed:400
			      }
			 }).tooltip( "open" );
		}
	});
	// Evento que selecciona la fila y la elimina 
	$(document).on("click", ".eliminarDemandante", function() {
		var parent = $(this).parents().get(0);
		$(parent).remove();
	});

});
</script>
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
		<div>
<form:form name="form1" commandName="procesoGuardar">
				<div id="form">
					<fieldset id="formFielset">
						<div>
							<fieldset id="formFielset">
								<label id="label_titulo_pestanas">Registrar Expediente</label>
							</fieldset>
						</div>

						<ol>
							<li><label class="label">Numero de Expediente:</label> 
								<form:input id="nroexpedienteUno" path="componenteUnoNroExpediente" maxlength="4" size="4" class="input_exp_uno" /> 
								<big>-</big>
								<form:input id="nroexpedienteDos" path="componenteDosNroExpediente" maxlength="5" size="5" class="input_exp_dos" /> 
								<big>-</big>
								<form:input id="nroexpedienteTres" path="componenteTresNroExpediente" maxlength="1" size="1" class="input_exp_tres" /> 
								<big>-</big>
								<form:input id="nroexpedienteCuatro" path="componenteCuatroNroExpediente" maxlength="4" size="4" class="input_exp_cuatro" />
								<big>-</big>
								<form:input id="nroexpedienteCinco" path="componenteCincoNroExpediente" maxlength="2" size="2" class="input_exp_cinco" onkeyup="transformarMinuscuaMayuscula(event, this)" onblur="transformarMinuscuaMayuscula(event, this)" />
								<big>-</big>
								<form:input id="nroexpedienteSeis" path="componenteSeisNroExpediente" maxlength="2" size="2" class="input_exp_seis" onkeyup="transformarMinuscuaMayuscula(event, this)" onblur="transformarMinuscuaMayuscula(event, this)" />
								<big>-</big>
								<form:input id="nroexpedienteSiete" path="componenteSieteNroExpediente" maxlength="1" size="1" class="input_exp_siete" />
								<br/>
								<font color="#FF0000">
									<form:errors id="nroexpedienteErrors" name="nroexpedienteErrors" path="nroExpediente" />
								</font>
							</li>

							<li><label class="label">Tipo de Naturaleza:</label> 
								<form:select id="idNaturaleza" path="" class="combo_uno">
									<form:option value="0">----Seleccione Naturaleza----</form:option>
									<form:options items="${tipoNaturaleza}" itemLabel="denominacion" itemValue="idNaturaleza" />
								</form:select>
							</li>
							<form:hidden id="naturalezaId" path="materia.naturaleza.idNaturaleza"/>
							<li><label class="label">Tipo de Materia:</label> 
								<form:select id="idMateria" path="materia.idMateria" class="combo_uno">
								</form:select>
								<font color="#FF0000">
									<form:errors id="materiaErrors" name="materiaErrors" path="materia" />
								</font>
							</li>

							<li><label class="label">Tipo de Estado:</label> 
								<form:select path="estado.idEstado" id="mostrarEstado" class="combo_uno">
		
									<form:options items="${tipoEstado}" itemLabel="denominacion" itemValue="idEstado" id="estado" />
								</form:select>
								<font color="#FF0000">
									<form:errors id="estadoErrors" name="estadoErrors" path="estado" />
								</font>
							</li>
							
							<li><label class="label">Año:</label> 
								<form:input id="anio" name="anio" path="anio" maxlength="4" class="input_exp_uno"/> 
								<input name="btn_asignar" type="button" onclick="doAjaxPost();" value="Asignar Folder" class="btn_nuevo_expediente">
								<font color="#FF0000">
								<form:errors id="anioErrors" name="anioErrors" path="anio" /></font>
							</li>
							<li><label class="label">Número de Folder:</label> 
								<form:input readonly="true" id="numfolder" name="numfolder"  path="nroFolder" class="input_one" /> 
								<font color="#FF0000">
								<form:errors id="numfolderErrors" name="numfolderErrors" path="nroFolder" /></font>
							</li>

							<li><label class="label">Cuantia:</label> 
								<form:input path="cuantia" maxlength="50" class="input_one"/>
							</li>
							
							<li><label class="label">Pretensión:</label> 
								<form:textarea path="pretension" cols="10" rows="5" class="input_one"/>
							</li>
							
							<li><label class="label">Fecha de Inicio:</label> <%--<form:input path="fechaInicio"/><br>--%>
								<form:input id="datepicker" maxlength="10" path="fechaInicio" class="input_date" />
								<font color="#FF0000">
								<form:errors id="fechaInicioErrors" name="fechaInicioErrors" path="fechaInicio" /></font>
							</li>
							<li><label class="label">Cuaderno:</label> 
								<form:input path="cuaderno" maxlength="1" class="input_numero"/>
								<font color="#FF0000"><form:errors id="cuadernoErrors" name="cuadernoErrors" path="cuaderno" /></font>
							</li>
							<li>
								<form:checkbox id="chBoxSetencia" path="" value="true"  />
								<label class="label">¿Tiene Sentencia?:</label>
							</li>
							<li><label class="label">Fecha de Fin:</label> 
								<form:input id="datepicker1" maxlength="10" path="fechaFin" class="input_date_dos"  /> 
								<font color="#FF0000">
								<form:errors id="fechaFinErrors" name="fechaFinErrors" path="fechaFin" /></font>
							</li>
							<li><label class="label">Sentencia:</label> 
								<form:textarea id="txtAreaSentencia" path="sentencia" cols="10" rows="5" class="input_one" disabled="true"/>
							</li>

										
							<table>
								<tr>
									<th>
									
										<table id="tablaDemandado" border="0" width="450">
											<tr>												
												<th class="label">Lista de Demandados
													<input  type="text" id="idNuevoDemandado" class="input_one" title="Ingrese un Demandado" />
												</th>
												<th>
													<input type="button" id="agregarDemandado" value="Agregar" class="btn_guardar" />
												</th>
											</tr>
											<tbody>
												<font color="#FF0000"><form:errors id="demandadoErrors" name="demandadoErrors" path="demandado" /></font>
												<c:if test="${not empty procesoGuardar.nuevoDemandado}">
													<c:forEach items="${procesoGuardar.nuevoDemandado}" var="demandados" varStatus="status">
														<input type="hidden" name="nuevoDemandado[<c:out value="${status.index}" />].idDemandado" value="<c:out value="${demandados.idDemandado}" />" class="input_one" />
														<tr>
<%-- 															<td align="center"><c:out value="${status.count}" /></td> --%>
<%-- 															<td><input type="hidden" name="nuevoDemandado[<c:out value="${status.index}" />].proceso.nroExpediente" value="<c:out value="${demandados.proceso.nroExpediente}" />" class="input_one" /></td> --%>
															<td class="label"><c:out value="${status.count}" /> <input name="nuevoDemandado[<c:out value="${status.index}" />].denominacion" value="<c:out value="${demandados.denominacion}" />" class="input_one" /></td>
														</tr>
													</c:forEach>
												</c:if>
												
											</tbody>
										</table>
						
									</th>
									<th>
										<table id="tablaDemandante" border="0" width="450">
											<tr>
												
												<th class="label">Lista de Demandantes
													<input  type="text" id="idNuevoDemandante" class="input_one" title="Ingrese un Demandante"/>
												</th>
												<th><input type="button" id="agregarDemandante" value="Agregar" class="btn_guardar" /></th>
											</tr>
											<tbody>
												<font color="#FF0000"><form:errors id="demandanteErrors" name="demandanteErrors" path="demandante" /></font>
												<c:if test="${not empty procesoGuardar.nuevoDemandante}">
													<c:forEach items="${procesoGuardar.nuevoDemandante}" var="demandantes" varStatus="status">
														<input type="hidden" name="nuevoDemandante[<c:out value="${status.index}" />].idDemandante" value="<c:out value="${demandantes.idDemandante}" />" />
														<tr>
<%-- 															<td align="center"><c:out value="${status.count}" /></td> --%>
<%-- 															<td><input type="hidden" name="nuevoDemandante[<c:out value="${status.index}" />].proceso.nroExpediente" value="<c:out value="${demandantes.proceso.nroExpediente}" />" class="input_one" /></td> --%>
															<td class="label"><c:out value="${status.count}" /> <input name="nuevoDemandante[<c:out value="${status.index}" />].denominacion" value="<c:out value="${demandantes.denominacion}" />"  class="input_one" /></td>
														</tr>
													</c:forEach>
												</c:if>
												
											</tbody>
										</table>
									</th>
								</tr>
							</table>




						</ol>

						<p align="center">
							<input type="button" onclick="location.href='<c:url value="/inicio.htm"/>'" value="Cancelar" class="btn_asignar" /> 
							<input type="submit" value="Siguiente" class="btn_guardar">
						</p>
					</fieldset>
				</div>
		</div>
	</form:form>	
		<!-- FIN Cuerpo -->
		<div id="contenedorFooter">
			<div class="piePagina" align="center">
				<p>
					Direcci&oacute;n: Jr. Asamblea Nro. 2xx (Entel)- Ayacucho <br>
					Telf: 066-310000 | <a href="http://www.ppra.gob.pe" target="_parent">www.procuraduria-ayacucho.gob.pe</a> | Copyright &copy; SysProc - 2012
				</p>
			</div>
		</div>
		<!-- FIN footer -->
	</div>
	<!-- FIN Contenedor PRINCIPAL -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#idMateria").cascade("#idNaturaleza", {
				ajax : {
					url : '/SysProc/jsonMateria.htm'
				},
				//ajax: {url: 'script/datos-provincias.js'},
				template : commonTemplate,
				match : commonMatch
			});
			//forzamos un evento de cambio para que se carge por primera vez
			$("#idNaturaleza").val($("#naturalezaId").val()).change();
		});
	</script>
</body>
</html>