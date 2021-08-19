/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest7SGBDH2;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author sever
 */
@RestController
@RequestMapping("api")
public class ServiceRest {
    @Autowired
     UserBD userBD;
    
    @GetMapping("find")
    public String find(@RequestParam String login)
    {   Optional<User> opt=userBD.findById(login);
        if(!opt.isPresent()) return "Pas trouvé";
        return opt.get().toString();
    }
    
    @GetMapping("findjson")
    public User findJson(@RequestParam String login)
    { return userBD.findById(login).get();
    }
    
    
    @GetMapping("findall")
    public Iterable<User> findAll()
    {return userBD.findAll();}        
    
    
    @GetMapping("save")
    public String save(@RequestParam String login, @RequestParam String name, @RequestParam String bareme)
    {   
        User user =new User(login, name, Float.valueOf(bareme));
        userBD.save(user);
        return user.toString()+ "a été ajouté";
          
    }
    
    @GetMapping("delete")
      public String delete(@RequestParam String login)
    {       
        Optional<User> opt=userBD.findById(login);
        if(!opt.isPresent()) return "Pas trouvé";
        User user=opt.get();
        userBD.delete(user);
        return user.toString()+ "a été effacé";
          
    }
    
    @GetMapping("update")
    public String update(@RequestParam String login,  @RequestParam String bareme)
    {       
        Optional<User> opt=userBD.findById(login);
        if(!opt.isPresent()) return "Pas trouvé";
        User user=opt.get();
        user.setBareme(Float.valueOf(bareme));
        userBD.save(user);
        return user.toString()+ "a été modifié";
          
    }  
    
        

}
