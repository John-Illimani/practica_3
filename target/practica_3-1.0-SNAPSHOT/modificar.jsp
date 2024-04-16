<%-- 
    Document   : modificar
    Created on : 16 abr. 2024, 9:39:32
    Author     : illim
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.emergentes.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Estudiante per = (Estudiante) request.getAttribute("miobjEst");
    String turnoSeleccionado = per.getTurno();


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .main{
            display: flex;
            padding: 3rem;

        }
        .title{
            text-align: center;
        }
        .container_1{
            width: 50%;
            padding: 2rem;
            margin-right: 3rem;
        }
        .container_2{
            width: 20%;
            padding: 2rem;
        }
        .boton{
            text-align: center;
        }
    </style>
    <body>
        <h1 class="title">Registro de Seminarios</h1><br><!-- comment -->
        <form action="MainServlet" method="post">

            <div class="main" >
                <fieldset class="container_1">
                    <legend>Datos</legend>

                    <table>
                        <tr style="display: none;">
                            <td>ID</td>
                            <td><input type="text" name="id" value="<%=per.getId()%>" placeholder="ID"></td>
                        </tr>
                        <tr>
                            <td><label>Fecha: </label></td>
                            <td><input type="date" name="fecha" value="<%=per.getFecha()%>"></td>
                        </tr>

                        <tr>
                            <td> <label>Nombre: </label></td>
                            <td><input type="text" name="nombre" value="<%=per.getNombre()%>"></td>
                        </tr>
                        <tr>
                            <td><label>Apellidos: </label></td>
                            <td><input type="text" name="apellidos" value="<%=per.getApellidos()%>"></td>
                        </tr>
                        <tr>
                            <td><label>Turno   </label></td>
                            <td>
                                <input type="radio" name="turno" value="manana" <%= turnoSeleccionado.equals("manana") ? "checked" : ""%>>
                                <label>Mañana</label>
                                <input type="radio" name="turno" value="tarde" <%= turnoSeleccionado.equals("tarde") ? "checked" : ""%>>
                                <label>Tarde</label>
                                <input type="radio" name="turno" value="noche" <%= turnoSeleccionado.equals("noche") ? "checked" : ""%>>
                                <label>Noche</label>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <%
                    String[] seminariosDisponibles = {"Inteligencia Artificial", "Machine Learning", "Simulacion con Arena", "Robotica Educativa"};

                    // Obtener los seminarios seleccionados del objeto Estudiante
                    String seminariosGuardados = per.getSeminarios();
                    ArrayList<String> seminariosSeleccionados = new ArrayList<>();
                    if (seminariosGuardados != null && !seminariosGuardados.isEmpty()) {
                        seminariosSeleccionados = new ArrayList<>(Arrays.asList(seminariosGuardados.split(", ")));
                    }
                %>

                <fieldset class="container_2">
                    <legend>Seminarios Disponibles</legend>
                    <% for (String seminario : seminariosDisponibles) {%>
                    <input type="checkbox" name="seminarios" value="<%=seminario%>" <%=(seminariosSeleccionados.contains(seminario)) ? "checked" : ""%>>
                    <label><%=seminario%></label><br>
                    <% }%>
                </fieldset>

            </div><br>



            <div class="boton"><input type="submit" value="Enviar Registro" /></div>

        </form>


    </body>
</html>
