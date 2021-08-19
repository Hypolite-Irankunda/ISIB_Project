/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author sever
 */
@Controller
public class ListController {
    
    @Autowired
    private MyBean myBean;
    
    @GetMapping("/liste")
    public  String liste(Model model)
    { model.addAttribute("mb", myBean);
      return "liste";
              
    }
    
}
