/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest8DerbyJPA;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;
import tse.isib.demoTest8DerbyJPA.entity.Employe;

/**
 *
 * @author sever
 */
@Service
public class AccessBD implements CommandLineRunner{
    
    @Autowired
    EmployeDB empDB;
    
    @Override
    public void run(String...args)
    {
    
       Iterable<Employe> list=empDB.findAll();
       for(Employe emp:list) System.out.println(emp.toString());
    }
    
}
