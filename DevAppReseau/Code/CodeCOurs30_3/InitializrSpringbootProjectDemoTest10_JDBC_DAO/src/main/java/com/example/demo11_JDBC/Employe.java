/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo11_JDBC;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 *
 * @author sever
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Employe implements Serializable {     
    private Integer nemp;    
   
    private String nom;   
    private String prenom;   
    private Character sexe;
    private double bareme;   
    private String loc;  
   
}
