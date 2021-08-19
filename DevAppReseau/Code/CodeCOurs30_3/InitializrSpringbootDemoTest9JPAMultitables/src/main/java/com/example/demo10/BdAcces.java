/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo10;

import com.example.demo10.entity.Article;
import com.example.demo10.entity.Bc;
import com.example.demo10.entity.Bcart;
import com.example.demo10.repository.ClientDB;
import com.example.demo10.entity.Client;
import com.example.demo10.repository.ArticleDB;
import com.example.demo10.repository.BcDB;
import com.example.demo10.repository.BcartDB;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 *
 * @author sever
 */
@Component
public class BdAcces implements CommandLineRunner {
    @Autowired
    private  ClientDB clientDB;    
    @Autowired 
    private  BcDB bcDB;    
    @Autowired 
    private  ArticleDB articleDB;   
    
    @Autowired BcartDB bcArt;
    @Override
    public void run(String... strings) throws Exception {
      Iterable<Client> i=this.clientDB.findAll();  // On va chercher tous les clients
        System.out.println("Results:");
        for(Client C:i) 
        {   System.out.println(C.getNom()+" "+C.getPrenom());
           Collection<Bc> col=C.getBcCollection();   // On récupère tous les BC du client traité
           for(Bc bc: col) 
            {System.out.println(bc.getNbon()+" "+bc.getLibelle());
             Collection<Bcart> col2=bc.getBcartCollection();        // Pour chaque BC, on récupère les enregistrements de jointure
             for(Bcart bcart:col2 )
             {System.out.println("Article n°"+bcart.getBcartPK().getNart());
              Optional<Article> optArt=articleDB.findById(bcart.getBcartPK().getNart());
                 System.out.println(optArt.get().getLibelle());
             }        
            }
        }
       
       
       Bc bon=new Bc();                              // Création d'un nouveau bon de commande qui sera associé à différents articles
       bon.setLibelle("Test creation bon");
       Optional<Client> optCli=clientDB.findById("2");
       // Tester normalement si client existe
       bon.setNcli(optCli.get());      // On associe à ce bon un client existant
       bcDB.save(bon);
       
       int nbon=bon.getNbon();   // On accède au Nbon créé automatiquement par la BD
       System.out.println("nbon:"+nbon);
        
        Collection<Bcart> bcCol=new ArrayList<>();   
        
        Bcart bcart=new Bcart(nbon, "1");
        bcart.setBc(bon);        
        Optional<Article> optArt=articleDB.findById("1");
        bcart.setArticle(optArt.get());
        bcart.setQ(5);
        bcCol.add(bcart);
        
        bcart=new Bcart(nbon, "3");
        bcart.setBc(bon);
        Optional<Article> optArt2=articleDB.findById("3");
        bcart.setArticle(optArt2.get());
        bcart.setQ(3);
        bcCol.add(bcart);
        
        // Ajouter d'autres articles eventuellement ....
        bon.setBcartCollection(bcCol);
        bcDB.save(bon);                 // Le bon est associé à la liste de Bcart qui associe ce bon à des articles commandés
        
     
         Optional<Bc> optBc=bcDB.findById(6);
      
        
        bcDB.deleteById(optBc.get().getNbon());
       //  bcDB.delete(optBc.get());  
      
       
   }
}

