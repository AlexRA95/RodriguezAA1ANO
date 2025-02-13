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
        if (request.getParameter("opcion").equals("verDelete")){
            //Significa que el usuario ha seleccionado un servicio para eliminar
            //servicio = (Servicio) gdao.getOne( servicio ,Integer.parseInt(request.getParameter("servDelete")));
            //sesion.setAttribute("servicio", servicio);
            URL = "JSP/Delete/ConfDelete.jsp";
        }else if (request.getParameter("opcion").equals("doDelete")){
            //Significa que el usuario ha confirmado el querer borrar a ese profesor
            //gdao.delete((Servicio) sesion.getAttribute("servicio"));
            sesion.removeAttribute("servicio");
            URL = ".";
        } else if (request.getParameter("opcion").equals("cancelar")){
            //Significa que el usuario ha cancelado la actualización
            URL = ".";
            sesion.removeAttribute("servicio");
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}