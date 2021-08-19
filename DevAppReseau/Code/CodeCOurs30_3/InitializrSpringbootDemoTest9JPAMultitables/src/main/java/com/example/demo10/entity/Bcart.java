/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo10.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sever
 */
@Entity
@Table(name = "BCART")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bcart.findAll", query = "SELECT b FROM Bcart b"),
    @NamedQuery(name = "Bcart.findByNbon", query = "SELECT b FROM Bcart b WHERE b.bcartPK.nbon = :nbon"),
    @NamedQuery(name = "Bcart.findByNart", query = "SELECT b FROM Bcart b WHERE b.bcartPK.nart = :nart"),
    @NamedQuery(name = "Bcart.findByQ", query = "SELECT b FROM Bcart b WHERE b.q = :q")})
public class Bcart implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected BcartPK bcartPK;
    @Basic(optional = false)
    @Column(name = "Q")
    private int q;
    @JoinColumn(name = "NART", referencedColumnName = "NART", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Article article;
    @JoinColumn(name = "NBON", referencedColumnName = "NBON", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Bc bc;

    public Bcart() {
    }

    public Bcart(BcartPK bcartPK) {
        this.bcartPK = bcartPK;
    }

    public Bcart(BcartPK bcartPK, int q) {
        this.bcartPK = bcartPK;
        this.q = q;
    }

    public Bcart(int nbon, String nart) {
        this.bcartPK = new BcartPK(nbon, nart);
    }

    public BcartPK getBcartPK() {
        return bcartPK;
    }

    public void setBcartPK(BcartPK bcartPK) {
        this.bcartPK = bcartPK;
    }

    public int getQ() {
        return q;
    }

    public void setQ(int q) {
        this.q = q;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Bc getBc() {
        return bc;
    }

    public void setBc(Bc bc) {
        this.bc = bc;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bcartPK != null ? bcartPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Bcart)) {
            return false;
        }
        Bcart other = (Bcart) object;
        if ((this.bcartPK == null && other.bcartPK != null) || (this.bcartPK != null && !this.bcartPK.equals(other.bcartPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.demo10.entity.Bcart[ bcartPK=" + bcartPK + " ]";
    }
    
}
