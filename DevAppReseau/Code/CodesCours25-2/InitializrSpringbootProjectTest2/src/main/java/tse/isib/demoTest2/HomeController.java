/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author sever
 */
@Controller
public class HomeController {
    
    @Autowired
    Personne personne;
    
    
    @GetMapping("/")
    public String  home(Model model)
    {
        // personne=new Personne();      si on n'est pas en inversion de contrôle
       //  model.addAttribute("user", personne);
         return "home";}
    
    
    
    
    @PostMapping("/urlCtrl")
    public String page( Personne personne,
                        Model model)
    { model.addAttribute("user", personne);
      return "suite";
    }
    
    
    @ModelAttribute("user")
    public Personne aMethod(Model model)
    { return personne;}
    
    
}
