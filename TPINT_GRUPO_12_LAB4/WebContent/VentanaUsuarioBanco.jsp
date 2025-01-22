<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="StyleSheet" href="css/StyleUsuarioBanco.css" type="text/css">
    
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/es.js"></script>
    
    <title>Informes Estadisticos</title>
    
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        flatpickr("#fechaInicio", {
            dateFormat: "Y-m-d", // Formato compatible con java.sql.Date
            maxDate: "today",// Evita seleccionar fechas futuras
            locale: "es"
        });
    });
    
    document.addEventListener("DOMContentLoaded", function () {
        flatpickr("#fechaFin", {
            dateFormat: "Y-m-d", // Formato compatible con java.sql.Date
            maxDate: "today",// Evita seleccionar fechas futuras
            locale: "es"
        });
    });
    
    
 // Validación del formulario
    function validarFormulario(event) {
        const mensajeError = document.getElementById("mensajeError");
        const form = event.target;
        const fechaInicio = form.fechaInicio.value;
        const fechaFin = form.fechaFin.value;

        mensajeError.style.display = "none";

        if (!fechaInicio || !fechaFin) {
            mensajeError.textContent = "Por favor, complete ambas fechas antes de filtrar.";
            mensajeError.style.display = "block";
            event.preventDefault();
        } else if (new Date(fechaInicio) > new Date(fechaFin)) {
            mensajeError.textContent = "La fecha de inicio no puede ser mayor que la fecha de fin.";
            mensajeError.style.display = "block";
            event.preventDefault();
        }
    }
</script>
    
</head>
<body>
<header>
    <jsp:include page="MenuBanco.jsp" />
</header>

<main style="text-align: center; margin: 0 auto; border-collapse: collapse;">
    <h2>Informes Estadisticos</h2>

    <!-- Formulario para seleccionar rango de fechas -->
    <form action="ServletInforme" method="GET">
        <label for="fechaInicio">Fecha Inicio:</label>
        <input type="date" id="fechaInicio" name="fechaInicio" required>
        <label for="fechaFin">Fecha Fin:</label>
        <input type="date" id="fechaFin" name="fechaFin" required>
        <button type="submit">Filtrar</button>
    </form>

    <table class="atributos" style="width: 100%; margin-top: 20px;">
        <tr>
            <th>Informe</th>
            <th>Total</th>
        </tr>

        <%
            Map<String, Integer> informes = (Map<String, Integer>) request.getAttribute("informes");

            if (informes != null && !informes.isEmpty()) {
                for (Map.Entry<String, Integer> entry : informes.entrySet()) {
        %>
        <tr>
            <td><%= entry.getKey() %></td>
            <td><%= entry.getValue() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="2">No hay datos disponibles</td>
        </tr>
        <%
            }
        %>
    </table>
</main>
</body>
</html>

