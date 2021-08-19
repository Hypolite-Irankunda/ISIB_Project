/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest4;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author sever
 */
@Controller
@SessionAttributes("shoppingCart")
public class viewProduct {
    
   
    
    @GetMapping("/product")
    public String viewP(Model model, ShoppingCart shoppingCart)
    {
     model.addAttribute ("cart", shoppingCart);
     return "product";
    }
    
    
    @PostMapping("/addToCart")
    public String addToCart(Model model, ShoppingCart shoppingCart,String productCode)
    { 
        shoppingCart.setProduct(productCode);
        model.addAttribute("cart", shoppingCart);
        return "redirect:"+"/product";
    
    }
    
}
