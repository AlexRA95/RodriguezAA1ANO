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

@WebServlet(name = "Update", value = "/Update")
public class Update extends HttpServlet {
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
        Map<String, String[]> parametros = request.getParameterMap();
        Boolean error = false;
        Ciclo ciclo = new Ciclo();
        List<Modulo> modulos = new ArrayList<>();
        if (request.getParameter("opcion").equals("verUpdate")){
            //Significa que el usuario ha seleccionado un ciclo para actualizar
            ciclo = (Ciclo) gdao.getById(Integer.parseInt(request.getParameter("ciclo")),ciclo.getClass());
            sesion.setAttribute("ciclo", ciclo);
            URL = "JSP/Update/FormUpdate.jsp";
        }else if (request.getParameter("opcion").equals("doUpdate")){
            //Significa que el usuario ha enviado el formulario de actualización
            List<String> opcionales = new ArrayList<>();
            opcionales.add("modulo");
            error = Utils.validarParameters(parametros,opcionales);
            if (!error) {
                Ciclo cicloSesion = (Ciclo) sesion.getAttribute("ciclo");
                try{
                    BeanUtils.populate(ciclo, parametros);
                    ciclo.setIdCiclo(cicloSesion.getIdCiclo());
                    Integer contador = 0;
                    for (String s: request.getParameterValues("modulo")) {
                        if (!s.isEmpty()) {
                            Modulo modulo = new Modulo();
                            if (cicloSesion.getModulos().size() > contador) {
                                modulo.setIdModulo(cicloSesion.getModulos().get(contador).getIdModulo());
                            }
                            modulo.setDenominacion(s);
                            modulos.add(modulo);
                            contador++;
                        }
                    }
                    ciclo.setModulos(modulos);
                } catch (IllegalAccessException | InvocationTargetException e) {
                    throw new RuntimeException(e);
                }
                gdao.insertOrUpdate(ciclo);
                URL = ".";
                sesion.removeAttribute("ciclo");
            }else {
                request.setAttribute("error", "Todos los campos con * son obligatorios");
                URL = "JSP/Update/FormUpdate.jsp";
            }
        } else if (request.getParameter("opcion").equals("cancelar")){
            //Significa que el usuario ha cancelado la actualización
            URL = ".";
            sesion.removeAttribute("ciclo");
        }

        request.getRequestDispatcher(URL).forward(request, response);
    }
}