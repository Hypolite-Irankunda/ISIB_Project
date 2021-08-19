/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest6_ClientRest;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.boot.CommandLineRunner;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author sever
 */
@Component
public class ClientRest implements CommandLineRunner {
    
    @Override
    public void run(String... args) throws Exception {
        
      RestTemplate rst=new RestTemplate();
     Info info=rst.getForObject("http://localhost:8080/apijson", Info.class);
     
     // Traitement qcq de l'objet ....
        System.out.println(info.toString());
        System.out.println("******************************************************"); 
       ListInfo listInfo=rst.getForObject("http://localhost:8080/apijson/listinfo",ListInfo.class); 
       
       for(Info inf: listInfo.getList())
            System.out.println(inf.toString()+" from list");
       
        System.out.println("******************************************************"); 
       
        ResponseEntity<Info[]> rep=rst.getForEntity("http://localhost:8080/apijson/tabinfo",Info[].class); 
        
        Info[] tab=rep.getBody();
       
       for(Info inf: tab)
            System.out.println(inf.toString()+" from tab");
        
    
        // RestTemplate n'est pas capable de recevoir une List<Info>
        
        
        // Ici le client envoie un objet au Web service (Objet constitué par des valeurs encodées dans un forulaire
        
        Info inf=new Info("Processus", new Date());
        rst.postForObject("http://localhost:8080/apijson/postinfo", inf, Info.class);
        
        // Envoyer une collection d'objets info
        
        ListInfo listInfo2=new ListInfo();
        List<Info> list=new ArrayList<>();
        list.add(new Info("Item a", new Date()));
        list.add(new Info("Item b", new Date()));
        list.add(new Info("Item c", new Date()));
        listInfo2.setList(list);
        rst.postForObject("http://localhost:8080/apijson/postlistinfo", listInfo2, ListInfo.class);
        
    }
}
