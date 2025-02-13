package es.albarregas.beans;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "modulosA1an")
public class Modulo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idModulo")
    private int idModulo;

    @Column(name = "denominacion")
    private String denominacion;

    // Getters and setters
    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }

    public String getDenominacion() {
        return denominacion;
    }

    public void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }
}