/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo11_JDBC;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

/**
 *
 * @author sever
 */
@Component
public class AccesDB implements CommandLineRunner {
    @Autowired
     JdbcTemplate jdbc;
    @Override
    public void run(String... strings) throws Exception {
      
        SqlRowSet rs=jdbc.queryForRowSet("select * from Employe");
      
            while(rs.next())
      {System.out.println(rs.getString("Nom")+rs.getString("Prenom"));}
        
     
      System.out.println("###########################################################################################"); 
      DataSource ds=jdbc.getDataSource();
      Connection con2=null;
      con2=ds.getConnection();
      // for(Employe e:Dao.findAll(con2)) 
      for(Employe e:Dao.findAll(jdbc))   
            System.out.println(e.toString());;
      
       System.out.println("###########################################################################################"); 
      Connection con=null;
      Statement stmt=null;
     try {Class.forName("org.apache.derby.jdbc.ClientDriver");
            
        } catch (ClassNotFoundException ex) {}
        
     
   try { con = DriverManager.getConnection("jdbc:derby://localhost:1527/BDEmp2020;user=app;password=app");
           
        } catch (SQLException ex) {  }
      stmt=con.createStatement();
      ResultSet rst=stmt.executeQuery("Select * from Employe");
      while(rst.next())
      {System.out.println(rst.getString("Nom")+rst.getString("Prenom"));}
    }
    
}
