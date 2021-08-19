/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest8DerbyJPA.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sever
 */
@Entity
@Table(name = "EMPLOYE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Employe.findAll", query = "SELECT e FROM Employe e"),
    @NamedQuery(name = "Employe.findByNemp", query = "SELECT e FROM Employe e WHERE e.nemp = :nemp"),
    @NamedQuery(name = "Employe.findByBareme", query = "SELECT e FROM Employe e WHERE e.bareme = :bareme"),
    @NamedQuery(name = "Employe.findByLoc", query = "SELECT e FROM Employe e WHERE e.loc = :loc"),
    @NamedQuery(name = "Employe.findByNom", query = "SELECT e FROM Employe e WHERE e.nom = :nom"),
    @NamedQuery(name = "Employe.findByPrenom", query = "SELECT e FROM Employe e WHERE e.prenom = :prenom"),
    @NamedQuery(name = "Employe.findBySexe", query = "SELECT e FROM Employe e WHERE e.sexe = :sexe")})
public class Employe implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NEMP")
    private Integer nemp;
    @Basic(optional = false)
    @Column(name = "BAREME")
    private double bareme;
    @Basic(optional = false)
    @Column(name = "LOC")
    private String loc;
    @Basic(optional = false)
    @Column(name = "NOM")
    private String nom;
    @Basic(optional = false)
    @Column(name = "PRENOM")
    private String prenom;
    @Basic(optional = false)
    @Column(name = "SEXE")
    private Character sexe;

    public Employe() {
    }

    public Employe(Integer nemp) {
        this.nemp = nemp;
    }

    public Employe(Integer nemp, double bareme, String loc, String nom, String prenom, Character sexe) {
        this.nemp = nemp;
        this.bareme = bareme;
        this.loc = loc;
        this.nom = nom;
        this.prenom = prenom;
        this.sexe = sexe;
    }

    public Integer getNemp() {
        return nemp;
    }

    public void setNemp(Integer nemp) {
        this.nemp = nemp;
    }

    public double getBareme() {
        return bareme;
    }

    public void setBareme(double bareme) {
        this.bareme = bareme;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Character getSexe() {
        return sexe;
    }

    public void setSexe(Character sexe) {
        this.sexe = sexe;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nemp != null ? nemp.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Employe)) {
            return false;
        }
        Employe other = (Employe) object;
        if ((this.nemp == null && other.nemp != null) || (this.nemp != null && !this.nemp.equals(other.nemp))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "[ nemp=" + nemp + " +nom="+nom+" ]";
    }
    
}
