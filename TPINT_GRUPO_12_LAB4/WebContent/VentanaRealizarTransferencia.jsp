<%@page import="entidad.Cuentas"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Realizar transferencia</title>

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
        
        .formulario {
            width: 400px;
            background: white;
            margin: auto;
            margin-top: 90px;
            box-shadow: 7px 13px 37px #000;
            padding: 20px 30px;
            color: black;
            text-align: center;
        }

        .formulario h2 {
            margin: 0;
            padding: 0;
            height: 40px;
            border-bottom: 1px solid #ddd;
            font-size: 20px;
            margin-bottom: 30px;
        }

        #text , #cuenta {
            width: 100%;
            border: 1px solid #60d8d2;
            margin-bottom: 15px;
            padding: 11px 10px;
            background: #ffffff;
            font-size: 14px;
            font-weight: bold;
        }

        #submitButton {
            width: 100%;
            height: 40px;
           background-color: beige;
            cursor: pointer;
            border: none;
            color: black;
            margin-top: 20px;

            border-bottom: 1px solid;
       
        }
        
        .number{
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

</head>
<body>
  <input type="button" id="btnSalir" class="botonSalir" value="Salir" onclick="location.href='VentanaInicioSesion.jsp'">

  <input type="button" id="btnAtras" class="botonAtras" value="Atras" onclick="location.href='UsuarioCliente.jsp'">

  
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
  


		<form class="formulario" action="ServletRealizarTransferencia"  method="post" >
		
			<h2>Realizar Transferencia</h2>
			<select name="filtroCuenta" id="cuenta" required>
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
			<label for="transferencia">Monto de la transferencia</label><br>
			<input class="number" type="number" id="transferencia" name="transferencia" placeholder="Ingresa el monto" required min="1"><br>
			<label for="Trasnferir a">Agrega una Cuenta</label><br>
			<input class="number" type="number" name="CBUDestino" placeholder="Ingresa el CBU" required><br>
            <input class="button" type="submit" id="enviarTransferencia" value="Enviar Transferencia">
			<br><br>

	        		
			<% 
			    String error = (String) request.getAttribute("error");
			    String success = (String) request.getAttribute("success");
			%>
			<% if (error != null) { %>
			    <div class="error"><%= error %></div>
			<% } %>
			<% if (success != null) { %>
			    <div class="success"><%= success %></div>
			<% } %>
			
		</form>



</body>
</html>