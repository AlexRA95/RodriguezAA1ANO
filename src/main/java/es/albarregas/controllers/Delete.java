package es.albarregas.controllers;

import es.albarregas.DAO.IGenericoDAO;
import es.albarregas.DAOFactory.DAOFactory;
import es.albarregas.beans.Ciclo;
import es.albarregas.beans.Modulo;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Delete", value = "/Delete")
public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(".").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = ".";
        DAOFactory daof = DAOFactory.getDAOFactory();
        IGenericoDAO gdao = daof.getGenericoDAO();
        HttpSession sesion = request.getSession();
        Ciclo ciclo = new Ciclo();
        Modulo modulo = new Modulo();
        if (request.getParameter("opcion").equals("verDelCiclo")){
            //Significa que el usuario ha seleccionado un ciclo para eliminar
            ciclo = (Ciclo) gdao.getById(Integer.parseInt(request.getParameter("cicloSeleccionado")), ciclo.getClass() );
            sesion.setAttribute("ciclo", ciclo);
            URL = "JSP/Delete/ConfDelete.jsp";
        } else if (request.getParameter("opcion").equals("verDelModulo")) {
            //Significa que el usuario ha seleccionado un modulo para eliminar
            modulo = (Modulo) gdao.getById(Integer.parseInt(request.getParameter("moduloSeleccionado")), modulo.getClass() );
            sesion.setAttribute("modulo", modulo);
            URL = "JSP/Delete/ConfDelete.jsp";
        } else if (request.getParameter("opcion").equals("doDelete")){
            //Significa que el usuario ha confirmado el querer borrar ese ciclo o modulo
            if (sesion.getAttribute("ciclo") != null) {
                gdao.delete((Ciclo) sesion.getAttribute("ciclo"));
                sesion.removeAttribute("ciclo");
            } else if (sesion.getAttribute("modulo") != null) {
                gdao.delete((Modulo) sesion.getAttribute("modulo"));
                sesion.removeAttribute("modulo");
            }
            sesion.removeAttribute("servicio");
            URL = ".";
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}