package es.albarregas.DAOFactory;

import es.albarregas.DAO.GenericoDAO;
import es.albarregas.DAO.IGenericoDAO;
/**
 * Fábrica concreta para la fuente de datos MySQL
 * @author Alejandro Rodr&iacute;guez &Aacute;lvarez
 */
public class MySQLDAOFactory extends DAOFactory{

    @Override
    public IGenericoDAO getGenericoDAO() {return new GenericoDAO();}
}
