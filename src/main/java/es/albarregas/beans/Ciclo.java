package es.albarregas.beans;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Entity
@Table(name = "ciclosA1an")
public class Ciclo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCiclo")
    private int idCiclo;

    @Column(name = "nombre")
    private String nombre;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @JoinColumn(name = "idDeCiclo")
    @OrderColumn(name = "idx")
    private List<Modulo> modulos;

    public int getIdCiclo() {
        return idCiclo;
    }

    public void setIdCiclo(int idCiclo) {
        this.idCiclo = idCiclo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Modulo> getModulos() {
        return modulos;
    }

    public void setModulos(List<Modulo> modulos) {
        this.modulos = modulos;
    }
}
