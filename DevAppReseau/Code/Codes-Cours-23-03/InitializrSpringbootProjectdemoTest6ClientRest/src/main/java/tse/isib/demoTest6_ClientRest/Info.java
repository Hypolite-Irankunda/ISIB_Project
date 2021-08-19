/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest6_ClientRest;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author sever
 */
@Data  // Annotation lombok qui crée automatiquement les get / set
@AllArgsConstructor  // annotation Lombok qui créée autoùatiquement tous les constructeur avec paramètres
@NoArgsConstructor
public class Info {
    private String message;
    private Date date; 
    // public Info(){}
}
