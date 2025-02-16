package es.albarregas.controllers;

import es.albarregas.DAO.IGenericoDAO;
import es.albarregas.DAOFactory.DAOFactory;
import es.albarregas.beans.Ciclo;
import es.albarregas.beans.Modulo;
import es.albarregas.models.Utils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Create", value = "/Create")
public class Create extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(".").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String URL = ".";
        DAOFactory daof = DAOFactory.getDAOFactory();
        Boolean error = false;
        IGenericoDAO gdao = daof.getGenericoDAO();
        Map<String, String[]> parametros = request.getParameterMap();
        Ciclo ciclo = new Ciclo();
        List<Modulo> modulos = new ArrayList<>();

        List<String> opcionales = new ArrayList<>();
        opcionales.add("modulo");
        error = Utils.validarParameters(parametros,opcionales);

        if (!error) {
            Boolean done = false;
            try{
                BeanUtils.populate(ciclo, parametros);
                for (String s: request.getParameterValues("modulo")) {
                    if (!s.isEmpty()) {
                        Modulo modulo = new Modulo();
                        modulo.setDenominacion(s);
                        modulos.add(modulo);
                        done = true;
                    }
                }
                ciclo.setModulos(modulos);

            } catch (IllegalAccessException | InvocationTargetException e) {
                throw new RuntimeException(e);
            }

            if (!done) {
                request.setAttribute("error", "Debe introducir al menos un módulo");
                URL = "JSP/Create/FormCreate.jsp";
            }else {
                gdao.insertOrUpdate(ciclo);
            }
        }else {
            request.setAttribute("error", "Todos los campos con * son obligatorios");
            URL = "JSP/Create/FormCreate.jsp";
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}