/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo10.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author sever
 */
@Embeddable
public class BcartPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "NBON")
    private int nbon;
    @Basic(optional = false)
    @Column(name = "NART")
    private String nart;

    public BcartPK() {
    }

    public BcartPK(int nbon, String nart) {
        this.nbon = nbon;
        this.nart = nart;
    }

    public int getNbon() {
        return nbon;
    }

    public void setNbon(int nbon) {
        this.nbon = nbon;
    }

    public String getNart() {
        return nart;
    }

    public void setNart(String nart) {
        this.nart = nart;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) nbon;
        hash += (nart != null ? nart.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BcartPK)) {
            return false;
        }
        BcartPK other = (BcartPK) object;
        if (this.nbon != other.nbon) {
            return false;
        }
        if ((this.nart == null && other.nart != null) || (this.nart != null && !this.nart.equals(other.nart))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.example.demo10.entity.BcartPK[ nbon=" + nbon + ", nart=" + nart + " ]";
    }
    
}
