/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo10.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author sever
 */
@Entity
@Table(name = "CLIENT")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Client.findAll", query = "SELECT c FROM Client c"),
    @NamedQuery(name = "Client.findByNcli", query = "SELECT c FROM Client c WHERE c.ncli = :ncli"),
    @NamedQuery(name = "Client.findByNom", query = "SELECT c FROM Client c WHERE c.nom = :nom"),
    @NamedQuery(name = "Client.findByPrenom", query = "SELECT c FROM Client c WHERE c.prenom = :prenom"),
    @NamedQuery(name = "Client.findBySexe", query = "SELECT c FROM Client c WHERE c.sexe = :sexe"),
    @NamedQuery(name = "Client.findByLoc", query = "SELECT c FROM Client c WHERE c.loc = :loc"),
    @NamedQuery(name = "Client.findByPasswd", query = "SELECT c FROM Client c WHERE c.passwd = :passwd")})
public class Client implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "NCLI")
    private String ncli;
    @Basic(optional = false)
    @Column(name = "NOM")
    private String nom;
    @Basic(optional = false)
    @Column(name = "PRENOM")
    private String prenom;
    @Basic(optional = false)
    @Column(name = "SEXE")
    private String sexe;
    @Basic(optional = false)
    @Column(name = "LOC")
    private String loc;
    @Basic(optional = false)
    @Column(name = "PASSWD")
    private String passwd;
    @OneToMany(mappedBy = "ncli",fetch=FetchType.EAGER)
    private Collection<Bc> bcCollection;

    public Client() {
    }

    public Client(String ncli) {
        this.ncli = ncli;
    }

    public Client(String ncli, String nom, String prenom, String sexe, String loc, String passwd) {
        this.ncli = ncli;
        this.nom = nom;
        this.prenom = prenom;
        this.sexe = sexe;
        this.loc = loc;
        this.passwd = passwd;
    }

    public String getNcli() {
        return ncli;
    }

    public void setNcli(String ncli) {
        this.ncli = ncli;
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

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    @XmlTransient
    public Collection<Bc> getBcCollection() {
        return bcCollection;
    }

    public void setBcCollection(Collection<Bc> bcCollection) {
        this.bcCollection = bcCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (ncli != null ? ncli.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Client)) {
            return false;
        }
        Client other = (Client) object;
        if ((this.ncli == null && other.ncli != null) || (this.ncli != null && !this.ncli.equals(other.ncli))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.demo10.entity.Client[ ncli=" + ncli + " ]";
    }
    
}
