/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest6;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 *
 * @author sever
 */
@RestController
@CrossOrigin(origins="*")
@RequestMapping("/api")
public class ServiceRest {
    @GetMapping("/hello")
    public String hello(){return "Hello les MA1 Info";}
    
    @GetMapping("/hello2")
    public String hello2(@RequestParam(defaultValue="Inconnu") String name){return "Hello2 "+name;}
    
    @GetMapping("/hello3/{name}")  // Principe de la réécriture d'URL --> le paramètre est concaténé à l'URL
    public String hello3(@PathVariable String name){return "Hello3 "+name;}
    
    @PostMapping("/hello4")
    public String hello4(String name)
    { return "Hello4 "+name; }
    
    @GetMapping("/**")
    public String helloError()
    {return "URL invalide !!!!";}
    
    @GetMapping("/hello5")
    public ResponseEntity<String> hello5( @RequestParam String name)
     
    {  if(name.equals("Severs")) return new ResponseEntity<>(null, HttpStatus.FORBIDDEN);
    else return new ResponseEntity<>("Hello5 "+name, HttpStatus.OK); }
    
      @GetMapping("/hello6")
    public ResponseEntity<String> hello6( @RequestParam(required=true, defaultValue="-1") String name)
     
    {  if(name.equals("-1")) return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
    else return new ResponseEntity<>("Hello6 "+name, HttpStatus.OK); }
    
    // Dans ServiceRest, on va créer un service qui consomme le service JsonServiceRest
    @GetMapping("/clientjson")
    public String clientJson()
    { RestTemplate rst=new RestTemplate();
     Info info=rst.getForObject("http://localhost:8080/apijson", Info.class);
      // Trt qcq sur l'objet .... par exemple stockage dans la BD
    
      return info.toString();
    
    
    }
    
    
}
