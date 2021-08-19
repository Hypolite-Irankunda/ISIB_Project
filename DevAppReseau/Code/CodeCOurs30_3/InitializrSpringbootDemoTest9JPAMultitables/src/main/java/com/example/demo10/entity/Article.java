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
@Table(name = "ARTICLE")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Article.findAll", query = "SELECT a FROM Article a"),
    @NamedQuery(name = "Article.findByNart", query = "SELECT a FROM Article a WHERE a.nart = :nart"),
    @NamedQuery(name = "Article.findByLibelle", query = "SELECT a FROM Article a WHERE a.libelle = :libelle"),
    @NamedQuery(name = "Article.findByPu", query = "SELECT a FROM Article a WHERE a.pu = :pu"),
    @NamedQuery(name = "Article.findByChemin", query = "SELECT a FROM Article a WHERE a.chemin = :chemin")})
public class Article implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "NART")
    private String nart;
    @Basic(optional = false)
    @Column(name = "LIBELLE")
    private String libelle;
    @Basic(optional = false)
    @Column(name = "PU")
    private int pu;
    @Column(name = "CHEMIN")
    private String chemin;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "article")
    private Collection<Bcart> bcartCollection;

    public Article() {
    }

    public Article(String nart) {
        this.nart = nart;
    }

    public Article(String nart, String libelle, int pu) {
        this.nart = nart;
        this.libelle = libelle;
        this.pu = pu;
    }

    public String getNart() {
        return nart;
    }

    public void setNart(String nart) {
        this.nart = nart;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public int getPu() {
        return pu;
    }

    public void setPu(int pu) {
        this.pu = pu;
    }

    public String getChemin() {
        return chemin;
    }

    public void setChemin(String chemin) {
        this.chemin = chemin;
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
        hash += (nart != null ? nart.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Article)) {
            return false;
        }
        Article other = (Article) object;
        if ((this.nart == null && other.nart != null) || (this.nart != null && !this.nart.equals(other.nart))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.demo10.entity.Article[ nart=" + nart + " ]";
    }
    
}
