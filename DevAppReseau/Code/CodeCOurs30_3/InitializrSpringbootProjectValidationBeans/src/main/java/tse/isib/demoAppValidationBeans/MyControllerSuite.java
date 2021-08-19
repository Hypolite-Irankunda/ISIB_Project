/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoAppValidationBeans;

import java.util.List;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author sever
 */
@Controller
public class MyControllerSuite {
    @PostMapping("/suite")
    public String suite( @Valid @ModelAttribute("emp") Employe emp, 
                         Errors errors , Model model)
    {   
    
        if(errors.hasErrors())              // Ok fonctionne
        { System.out.println("Erreurs !!!");
          List<ObjectError> list=errors.getAllErrors();
          for(ObjectError obj:list)
          { System.out.println("errors:"+obj.toString() ); }          
        }else System.out.println("pas d'erreurs");
       
        // model.addAttribute("emp",  emp);
        if(errors.hasErrors()) return "inscription";
        else return "suite";
    }
}
