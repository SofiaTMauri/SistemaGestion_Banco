<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList" %>
<%@ page import="entidad.Prestamos" %>
<%@page import="entidad.Cuentas"%>
<%@ page import="entidad.Transferencias" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ventana Transferencia</title>
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
<style>
	body {
            background-color: #E9F1FA;
             font-family: Arial, Helvetica, sans-serif;
        }
        
        .DiseñoBoton {
            background-color: beige;
            width: 217px;
            height: 50px;
            margin-top: 10px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        
        .botonSalir {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 120px;
            height: 40px;
            background-color: beige;
            cursor: pointer;
        }
        
        .botonAtras {
            position: absolute;
            top: 10px;
               left: 10px;
            width: 120px;
            height: 40px;
            background-color: beige;
            cursor: pointer;
        }
        
        .customers {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		.customers td, .customers th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		.customers tr:nth-child(even){background-color: #f2f2f2;}
		
		.customers tr:hover {background-color: #ddd;}
		
		.customers th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: left;
		  background-color: #04AA6D;
		  color: white;
		}
        
        .centrar {
        display: flex;
        flex-direction: column;
        align-items: center; 
        justify-content: center; 
        gap: 45px; 
    }
    
    #cuenta {
        width: 94%;
        border: 1px solid #60d8d2;
        margin-bottom: 15px;
        padding: 11px 10px;
        background: #ffffff;
        font-size: 14px;
        font-weight: bold;
    }
    
    .button{
        	width: 100%;
    		height: 40px;
   			background: #61caca6b;
    		border: none;
    		color: black;
    		margin-bottom: 16px;
    		font-weight: bold;
    		border-bottom: 1px solid;
        }
        
</style>
	<br>
	<br>
	<br>



</head>
<body>

<input type="button" id="btnSalir" class="botonSalir" value="Salir" onclick="location.href='VentanaInicioSesion.jsp'">
<input type="button" id="btnAtras" class="botonAtras" value="Atras" onclick="location.href='UsuarioCliente.jsp'">


<div class="centrar">

<!-- Bloque de Bienvenida con sesión -->
		    <div style="text-align: right; margin: 10px; font-size: 16px;">
		        <% 
		            HttpSession sesion = request.getSession(false); 
		            String usuarioSesion = (sesion != null) ? (String) sesion.getAttribute("nombreUsuario") : null;
		            if (usuarioSesion != null) {
		        %>
		            Bienvenido, <b><%= usuarioSesion %></b>
		        <% 
		            } else { 
		        %>
		            Bienvenido, <b>Invitado</b>
		        <% 
		            } 
		        %>
    </div>

<h1>Mis Prestamos</h1>
<table class="customers">
<thead>
  <tr>
    <th>DNI</th>
  	<th>Fecha</th>
    <th>ID del prestamo</th>
    <th>Importe a pagar</th>
    <th>Cuota Mensual</th>
    <th>Cuotas</th>
    <th>Condicion</th>
  </tr>
  </thead>
  <tbody>
  	  <%
	  	ArrayList<Prestamos> listaPrestamos = (ArrayList<Prestamos>) request.getAttribute ("listaPrestamos");
	  	if (listaPrestamos != null && !listaPrestamos.isEmpty()){
	  		for (Prestamos prestamo : listaPrestamos){
	  	
	  
	  
	  %>
  
  
  <tr>
    <td><%= prestamo.getCliente() %></td>
  	<td><%= prestamo.getFecha() %></td>
    <td><%= prestamo.getIDPrestamo() %></td>
    <td>$<%= prestamo.getImporteAPagar() %></td>
    <td>$<%= prestamo.getMontoPorMes() %></td>
    <td><%= prestamo.getPlazoDePago() %></td>
    <td><%= prestamo.getCondicion().getDescripcion() %></td>

 	 <%
	  		}
	  	}else {
	%>
	        <tr><td colspan="4">No hay registros.</td></tr>
	<% 
	    }
	%>
  
  
	</tbody>
	</table>
		
	<h1>Mis Transferencias</h1>
	<label for ="cuenta"> Seleccione la cuenta:</label>
	<form method= "post" action= "ServletListarPrestamosCliente">
	<select name="filtroCBU" id="cuenta" required>
    			<option value="" disabled selected>Seleccione Cuenta</option>
    			<%
    			ArrayList<Cuentas> listaCuentas = (ArrayList<Cuentas>) request.getAttribute("listaCuentas");   			
    			if (listaCuentas != null) {
        			for (Cuentas cue : listaCuentas) { 
   				 %>
        			<option value="<%= cue.getNumeroCuenta() %>">
           			<%= cue.getCbu() %>
        			</option>
   					<% 
       					 }
    					}  
   					 %>
		</select>
    <button  class="button" type="submit">Seleccionar</button>
</form>
	
	<table id="table_id" class="customers">
	<thead>
	 <tr>
	<th>ID Transferencia</th>
  	<th>Fecha</th>
    <th>Importe</th>
    <th>Cuenta Origen</th>
	<th>Cuenta destino</th>
	</tr>
	</thead>
  <tbody>
	  	  <%
	  	ArrayList<Transferencias> listaTransferencias = (ArrayList<Transferencias>) request.getAttribute ("listaTransferencias");
	  	if (listaTransferencias != null && !listaTransferencias.isEmpty()){
	  		for (Transferencias trans : listaTransferencias){
	  	
	  
	  
	  %>
	  <tr>
    <td><%= trans.getIdTransferencia() %></td>
  	<td><%= trans.getFecha() %></td>
    <td>$<%= trans.getImporte() %></td>
    <td><%= trans.getCuentaOrigen() %></td>
	<td><%= trans.getCuentaDestino() %></td>
	</tr>
	
	 	 <%
	  		}
	  	}
	%>
	
	
	
	</tbody> 
	</table>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#table_id').DataTable({
        "paging": true,               // Habilita la paginación
        "pageLength": 5,              // van a hacer el numero de filas que aparecera en la pagina
        "lengthChange": false,        // Desactiva o avtica el menú para elegir el número de filas por página
        "searching": false,           // Desactiva o activa la búsqueda
        "ordering": true,             // Habilita el ordenamiento
        "language": {
            "emptyTable": "No se encontraron registros", // Mensaje cuando la tabla está vacía
            "info": "Mostrando _START_ a _END_ de _TOTAL_ registros", // Texto de paginación personalizado
            "infoEmpty": "Mostrando 0 a 0 de 0 registros", // Texto cuando no hay registros
        }
    });
});
</script>	
		
		
	 </div>

</body>
</html>