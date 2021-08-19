/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


/**
 *
 * @author sever
 */
@Controller
public class HomeController {
    
    @GetMapping("/test")
    public String  home()
    {
       // code spécifique ....
       return "home";
    }
    
    
    @GetMapping("/test2")
    public String home2()
    {return "home2";}
}
