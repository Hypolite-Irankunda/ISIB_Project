/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo11_JDBC;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

/**
 *
 * @author sever
 */
public class Dao {
    
    
    public static List<Employe> findAll(JdbcTemplate jdbc)
    {
     List<Employe> list=new ArrayList<>();
      SqlRowSet rst=jdbc.queryForRowSet("select * from Employe");
        while(rst.next())
            {Employe E=new Employe( rst.getInt("Nemp"),
                                    rst.getString("Nom"),
                                    rst.getString("Prenom"),
                                    rst.getString("Sexe").charAt(0),
                                    rst.getDouble("Bareme"),
                                    rst.getString("Loc"));
            list.add(E);
            }
           return list;
    }
    
    public static List<Employe> findAll(Connection con)
    {   
       List<Employe> list=new ArrayList<>();
        try {
            Statement stmt=con.createStatement();
            ResultSet rst=stmt.executeQuery("Select * from Employe");
            while(rst.next())
            {Employe E=new Employe( rst.getInt("Nemp"),
                                    rst.getString("Nom"),
                                    rst.getString("Prenom"),
                                    rst.getString("Sexe").charAt(0),
                                    rst.getDouble("Bareme"),
                                    rst.getString("Loc"));
            list.add(E);
           
            }
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}


 