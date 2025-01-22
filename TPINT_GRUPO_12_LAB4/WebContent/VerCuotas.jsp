<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="entidad.Cuota" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Cuotas del Préstamo</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.dataTables.css" />
    <style>
        body {
            background-color: #E9F1FA;
            font-family: Arial, Helvetica, sans-serif;
        }

        .botonSalir {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 120px;
            height: 40px;
            background-color: beige;
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

        .customers tr:nth-child(even) {
            background-color: #00ABE4;
        }

        .customers tr:hover {
            background-color: #ddd;
        }

        .customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #04AA6D;
            color: white;
        }

        .centrar {
            text-align: center;
        }

        button {
            background-color: #04AA6D;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
        }

        button:hover {
            background-color: #03954C;
        }
    </style>
</head>
<body>
    <!-- Botón para salir -->
    <input id="button" type="button" class="botonSalir" value="Salir" onclick="location.href='VentanaInicioSesion.jsp'">

    <div class="centrar">
        <h1>Cuotas del Préstamo</h1>
        
   <!-- Mostrar mensaje de éxito si está disponible -->
        <c:if test="${not empty mensajeExito}">
            <div class="alert alert-success">${mensajeExito}</div>
        </c:if>

        <!-- Mostrar mensaje de error si está disponible -->
        <c:if test="${not empty mensajeError}">
            <div class="alert alert-danger">${mensajeError}</div>
        </c:if>

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
  

        <!-- Validar que la lista de cuotas no esté vacía -->
        <%
            List<Cuota> listaCuotas = (List<Cuota>) request.getAttribute("listaCuotas");
            if (listaCuotas != null && !listaCuotas.isEmpty()) {
        %>
        <table id="table_id" class="customers">
            <thead>
                <tr>
                    <th>ID Cuota</th>
                    <th>Monto</th>
                    <th>Fecha de Pago</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <% for (Cuota cuota : listaCuotas) { %>
                <tr>
                    <td><%= cuota.getIdCuota() %></td>
                    <td>$<%= cuota.getImporte() %></td>
                    <td><%= cuota.getFechaPago() != null ? cuota.getFechaPago().toString() : "N/A" %></td>
                    <td><%= cuota.isPagado() ? "Pagado" : "Pendiente" %></td>
                    <td>
                        <% if (!cuota.isPagado()) { %>
                        <form method="post" action="ServletPagarCuota">
                        	<input type="hidden" name="idPrestamo" value="<%= cuota.getIdPrestamo() %>">
                            <input type="hidden" name="idCuota" value="<%= cuota.getIdCuota() %>">
                            <input type="hidden" name="monto" value="<%= cuota.getImporte() %>">
                            
                            <button type="submit">Pagar</button>
                        </form>
                        <% } else { %>
                        <button disabled>Pagado</button>
                        
                        
                        
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    $('#table_id').DataTable({
        "paging": true,               // Habilita la paginación
        "pageLength": 10,              // van a hacer el numero de filas que aparecera en la pagina
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
        <% } else { %>
      
        <% } %>

        <!-- Botón para regresar -->
        <button onclick="location.href='UsuarioCliente.jsp';">Volver</button>
    </div>
</body>
</html>
