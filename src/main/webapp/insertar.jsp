<%-- 
    Document   : insertar
    Created on : 16 abr. 2024, 10:46:07
    Author     : illim
--%>

<%@page import="com.emergentes.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Estudiante per = (Estudiante) request.getAttribute("miobjEst");

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
                            <td><input type="date" name="fecha" ></td>
                        </tr>

                        <tr>
                            <td> <label>Nombre: </label></td>
                            <td><input type="text" name="nombre" ></td>
                        </tr>
                        <tr>
                            <td><label>Apellidos: </label></td>
                            <td><input type="text" name="apellidos" ></td>
                        </tr>
                        <tr>
                            <td><label>Turno   </label></td>
                            <td>
                                <input type="radio" name="turno" value="manana" >
                                <label>Mañana</label>
                                <input type="radio" name="turno" value="tarde" >
                                <label>Tarde</label>
                                <input type="radio" name="turno" value="noche" >
                                <label>Noche</label>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="container_2">
                    <legend>Seminarios Disponibles</legend>
                    <input type="checkbox" name="seminarios" value="Inteligencia Artificial">
                    <label>Inteligencia Artificial</label><br>
                    <input type="checkbox" name="seminarios" value="Machine Learning">
                    <label>Machine Learning</label><br>
                    <input type="checkbox" name="seminarios" value="Simulacion con Arena">
                    <label>Simulación con Arena</label><br>
                    <input type="checkbox" name="seminarios" value="Robotica Educativa">
                    <label>Robótica Educativa</label>
                </fieldset>

            </div><br>



            <div class="boton"><input type="submit" value="Enviar Registro" /></div>

        </form>


    </body>
</html>
