/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.emergentes;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author illim
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");

        Estudiante objEst = new Estudiante();
        int id, posicion;

        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");

        switch (op) {
            case "nuevo":

                request.setAttribute("miobjEst", objEst);
                request.getRequestDispatcher("insertar.jsp").forward(request, response);
                break;
            case "editar":
                id = Integer.parseInt(request.getParameter("id"));

                posicion = buscaPorIndice(request, id);

                objEst = lista.get(posicion);

                request.setAttribute("miobjEst", objEst);
                request.getRequestDispatcher("modificar.jsp").forward(request, response);

                break;
            case "eliminar":
                id = Integer.parseInt(request.getParameter("id"));
                posicion = buscaPorIndice(request, id);
                if (posicion >= 0) {
                    lista.remove(posicion);
                }
                request.setAttribute("listaEst", lista);

                response.sendRedirect("index.jsp");

                break;

            default:
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession ses = request.getSession();
        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");

        Estudiante objEst = new Estudiante();
        objEst.setId(0); // Configurar un ID predeterminado o cualquier otro valor por defecto
        objEst.setFecha(""); // Configurar valores predeterminados para otros campos si es necesario
        objEst.setNombre("");
        objEst.setApellidos("");
        objEst.setTurno(""); // Configurar un valor predeterminado para el turno
        objEst.setSeminarios("");

        objEst.setId(id);
        objEst.setFecha(request.getParameter("fecha"));
        objEst.setNombre(request.getParameter("nombre"));
        objEst.setApellidos(request.getParameter("apellidos"));
        objEst.setTurno(request.getParameter("turno"));
        
        
        
        String[] seminariosSeleccionados = request.getParameterValues("seminarios");
        if (seminariosSeleccionados != null) {
            String seminarios = String.join(", ", seminariosSeleccionados);
            objEst.setSeminarios(seminarios);
        }
        
        System.out.println("valor del seminarios: "+objEst.getSeminarios());
        if (id == 0) {

            int idNuevo = obtenerID(request);
            objEst.setId(idNuevo);
            lista.add(objEst);
        } else {

            int pos = buscaPorIndice(request, id);
            lista.set(pos, objEst);

        }
        request.setAttribute("listaEst", lista);
        response.sendRedirect("index.jsp");

    }

    public int buscaPorIndice(HttpServletRequest request, int id) {
        HttpSession ses = request.getSession();

        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");

        int pos = -1;
        if (lista != null) {
            for (Estudiante ele : lista) {
                ++pos;
                if (ele.getId() == id) {
                    break;
                }
            }
        }
        return pos;
    }

    public int obtenerID(HttpServletRequest request) {
        HttpSession ses = request.getSession();

        ArrayList<Estudiante> lista = (ArrayList<Estudiante>) ses.getAttribute("listaEst");

        int idN = 0;

        for (Estudiante ele : lista) {
            idN = ele.getId();
        }

        return idN + 1;

    }

}
