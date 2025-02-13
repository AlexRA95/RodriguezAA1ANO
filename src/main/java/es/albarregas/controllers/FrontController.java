package es.albarregas.controllers;
import es.albarregas.DAO.IGenericoDAO;
import es.albarregas.DAOFactory.DAOFactory;
import es.albarregas.beans.Ciclo;
import es.albarregas.models.Utils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FrontController", value = "/FrontController")
public class FrontController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(".").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = null;
        HttpSession sesion = request.getSession();
        DAOFactory daof = DAOFactory.getDAOFactory();
        IGenericoDAO gdao = daof.getGenericoDAO();
        List<Ciclo> ciclos = null;
        switch (request.getParameter("opcion")){
            case "create":
                URL = "JSP/Create/FormCreate.jsp";
                break;
            case "read":
            case "update":
            case "delete":
                ciclos= Utils.convertList(gdao.selectAll(Ciclo.class), Ciclo.class);
                if (request.getParameter("opcion").equals("update")) {
                    URL = "JSP/Update/VerUpdate.jsp";
                } else if (request.getParameter("opcion").equals("delete")) {
                    URL = "JSP/Delete/VerDelete.jsp";
                }else if (request.getParameter("opcion").equals("read")) {
                    URL = "JSP/Read/VerCiclos.jsp";
                }
                if (!ciclos.isEmpty()) {
                    request.setAttribute("ciclos", ciclos);
                }else {
                    request.setAttribute("mensaje", "No hay ciclos actualmente");
                    URL = "JSP/Notify/Mensaje.jsp";
                }
                break;
            default:
                URL = ".";
                break;
        }

        if (sesion != null) {
            sesion.invalidate();
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}