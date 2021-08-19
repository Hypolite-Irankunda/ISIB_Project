/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest4;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;

/**
 *
 * @author sever
 */
@Data
public class ShoppingCart { //  -> simple classe POJO Plain Old Java Object
    private String name;
    private List<String>  products;
    
    private  String product;
     
    public ShoppingCart(){products= new ArrayList();}
    
    public void setProduct(String product){this.products.add(product);}    
    
}
