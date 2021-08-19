/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest7SGBDH2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 *
 * @author sever
 */
@Component
public class AccessBD implements CommandLineRunner {
    
    @Autowired
    private UserBD userBD;
    
   
    @Override
    public void run(String... args) throws Exception {
        
        // CRUD sur une table !!!!
      
        
        // Find ALL
        System.out.println(userBD.findAll().toString());
        
         // Find by ID
        Optional<User> optionalUser=userBD.findById("BER");
        
        // Delete by Id
        if( optionalUser.isPresent()) System.out.println(optionalUser.get().toString());
        User user=optionalUser.get();      
        userBD.delete(user);    
        
          
        System.out.println(userBD.findAll().toString());
        
        // Create (Insert)
        user=new User("VAN","VanCau", 2500);
        userBD.save(user);
      
        System.out.println(userBD.findAll().toString());
        
        // Update 
        optionalUser=userBD.findById("TSE");
        if( optionalUser.isPresent()){user=optionalUser.get();
                                       user.setBareme(3999);
                                       userBD.save(user);
                                       }
        
          System.out.println(userBD.findAll().toString());
          
          Iterator<User> list=userBD.findAll().iterator();
          while(list.hasNext())
          {User user2=list.next();
           // Trt qcq sur le User 
              System.out.println(user2.toString());
          }
          
                  
          Iterable<User>  list2=userBD.findAll();
          for(User user3:list2) System.out.println(user3);
          
          
          
          
          
          }
    
    
}
