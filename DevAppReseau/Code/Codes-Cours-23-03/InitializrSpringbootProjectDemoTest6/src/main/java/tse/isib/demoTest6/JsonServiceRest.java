/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest6;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author sever
 */
@RestController
@CrossOrigin(origins="*")
@RequestMapping("/apijson")
public class JsonServiceRest {
    @GetMapping
    public Info getInfo(){return info();}
    
    @PostMapping
    public Info postInfo(){return info();}
     
    private Info  info(){return new Info("Evénement dangereux type 4", new Date());}
    
    @GetMapping("/listinfo")
    //  public List<Info> getListInfo()  --> problème coté client pour récupérer les différents objets Info
    public ListInfo getListInfo()
    { // On devrait récupérer une liste d'Info dans la BD
        List<Info> list=new ArrayList<>();
        list.add(new Info("Item 1", new Date()));
        list.add(new Info("Item 2", new Date()));
        list.add(new Info("Item 3", new Date()));
        ListInfo listInfo=new ListInfo();
        listInfo.setList(list);
        return listInfo;
    
    }
    
    @GetMapping("/tabinfo")
    //  public List<Info> getListInfo()  --> problème coté client pour récupérer les différents objets Info
    public Info[] getTabInfo()
    { // On devrait récupérer une liste d'Info dans la BD
        Info[] tab=new Info[3];
        tab[0]=new Info("Item 1", new Date());
        tab[1]=new Info("Item 2", new Date());
        tab[2]=new Info("Item 3", new Date());
        return tab;
    }
    
    
     @GetMapping("/listinfo2")
    //  public List<Info> getListInfo()  --> problème coté client pour récupérer les différents objets Info
    public List<Info> getListInfo2()
    {   List<Info> list=new ArrayList<>();
        list.add(new Info("Item 1", new Date()));
        list.add(new Info("Item 2", new Date()));
        list.add(new Info("Item 3", new Date()));
        return list;
    }
    
    @PostMapping("/postinfo")
    public void postInfo( @RequestBody Info inf)
    {
      // En principe le web service va stocker dans la BD l'objet ....
        System.out.println(inf.toString()+ "objet posté ar le client"); 
    
    }
         
    @PostMapping("/postlistinfo")
    public void postListInfo( @RequestBody ListInfo listInf)
    {
      // En principe le web service va stocker dans la BD les différents objets de la liste
        for(Info inf:listInf.getList())
        System.out.println(inf.toString()+ "objet posté par le client dans une liste"); 
    
    }
       
    
}
