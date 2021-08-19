/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest4;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

/**
 *
 * @author sever
 */
@Controller
public class ListProductController {
    @GetMapping("/cart")
    public String cart( @SessionAttribute("shoppingCart") ShoppingCart shoppingCart, Model model)
    {
     model.addAttribute("cart",shoppingCart );
    return "cart";}
}