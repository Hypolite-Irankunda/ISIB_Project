/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest3;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import lombok.Data;
import org.springframework.stereotype.Component;

/**
 *
 * @author sever
 */
@Data
@Component
public class MyBean {
    private String pseudo;
    private char sexe;
    private List<String> list;
    
    @PostConstruct
    public void init()
    {
      pseudo="TSE"; sexe='M'; 
      list = new ArrayList();
    //  list.add("Admin Syst");list.add("Open Source");
   //   list.add("Ex Ing log");list.add("App réseau");
    }
    
}
