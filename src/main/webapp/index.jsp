<%-- 
    Document   : index
    Created on : 16 abr. 2024, 8:40:09
    Author     : illim
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.Estudiante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    if (session.getAttribute("listaEst") == null) {
        ArrayList<Estudiante> lisAux = new ArrayList<Estudiante>();
        session.setAttribute("listaEst", lisAux);
    }
    ArrayList<Estudiante> lista = (ArrayList<Estudiante>) session.getAttribute("listaEst");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>


        <div style="text-align: center;" >
            <h1>Listado de inscritos</h1>
        </div>

        <div style="padding-left: 29px; ">

            <form action="MainServlet" method="get" style="display: inline;">
                <input type="hidden" name="op" value="nuevo">
                <button type="submit">Nuevo</button>
            </form>


        </div>
        <br>


        <table border="1" style="width: 95%; margin: 0 auto; text-align: center;" cellspacing="0">
            <tr style="background: yellow">

                <th>Id</th>
                <th>Fecha</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Turno</th>
                <th>Seminarios</th>
                <th></th>
                <th></th>
            </tr>

            <%
                if (lista != null) {
                    for (Estudiante item : lista) {


            %>


            <tr>
                <td><%=item.getId()%></td>
                <td><%=item.getFecha()%></td>
                <td><%=item.getNombre()%></td>
                <td><%=item.getApellidos()%></td>
                <td><%=item.getTurno()%></td>

                <td>
                    <%
                        // Separar la cadena de seminarios y mostrar cada uno
                        String[] seminarios = item.getSeminarios().split(", ");
                        for (String seminario : seminarios) {
                            out.println(seminario + "<br>");
                        }
                    %>
                </td>


                <td><a href="MainServlet?op=editar&id=<%=item.getId()%>">Editar</a></td>
                <td><a href="MainServlet?op=eliminar&id=<%=item.getId()%>"onclick="return(confirm('Seguro que desea eliminar al estudiante y sus calificaciones?'))"  
                       >Eliminar</a></td>


            </tr>
            <%
                    }
                }
            %>

        </table>
    </div>

</body>
</html>
