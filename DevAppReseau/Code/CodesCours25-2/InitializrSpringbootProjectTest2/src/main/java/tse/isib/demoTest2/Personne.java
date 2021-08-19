/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest2;

import lombok.Data;
import org.springframework.stereotype.Component;

/**
 *
 * @author sever
 */
@Data
// IoC Inversion of Control
@Component  // On prévient Sprin que la classe Personne pourra être utilisée par Spring pour créer des objts gérés par Spring (IoC)
public class Personne {  // Bean Java
    private String firstname, lastname;
    private String type, sexe;
    private String langue;   
}
