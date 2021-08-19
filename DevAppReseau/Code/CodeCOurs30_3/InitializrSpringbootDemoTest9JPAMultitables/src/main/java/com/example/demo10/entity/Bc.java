/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo10.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "BC")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bc.findAll", query = "SELECT b FROM Bc b"),
    @NamedQuery(name = "Bc.findByNbon", query = "SELECT b FROM Bc b WHERE b.nbon = :nbon"),
    @NamedQuery(name = "Bc.findByLibelle", query = "SELECT b FROM Bc b WHERE b.libelle = :libelle")})
public class Bc implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "NBON")
    private Integer nbon;
    @Basic(optional = false)
    @Column(name = "LIBELLE")
    private String libelle;
    @JoinColumn(name = "NCLI", referencedColumnName = "NCLI")
    @ManyToOne
    private Client ncli;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bc",fetch=FetchType.EAGER)
    private Collection<Bcart> bcartCollection;

    public Bc() {
    }

    public Bc(Integer nbon) {
        this.nbon = nbon;
    }

    public Bc(Integer nbon, String libelle) {
        this.nbon = nbon;
        this.libelle = libelle;
    }

    public Integer getNbon() {
        return nbon;
    }

    public void setNbon(Integer nbon) {
        this.nbon = nbon;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Client getNcli() {
        return ncli;
    }

    public void setNcli(Client ncli) {
        this.ncli = ncli;
    }

    @XmlTransient
    public Collection<Bcart> getBcartCollection() {
        return bcartCollection;
    }

    public void setBcartCollection(Collection<Bcart> bcartCollection) {
        this.bcartCollection = bcartCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (nbon != null ? nbon.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bc)) {
            return false;
        }
        Bc other = (Bc) object;
        if ((this.nbon == null && other.nbon != null) || (this.nbon != null && !this.nbon.equals(other.nbon))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.demo10.entity.Bc[ nbon=" + nbon + " ]";
    }
    
}
