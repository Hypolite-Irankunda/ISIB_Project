/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoAppValidationBeans;


import java.io.Serializable;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

/**
 *
 * @author sever
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Employe  {
    @Positive(message="Le Id doit être un entier positif !")
    private int id;
    @NotBlank(message="Le nom ne peut pas être à null") 
    @NotEmpty(message="Le nom ne peut pas être vide") 
    @Pattern(regexp="[A-Z][A-Za-z]*", message="Non respect des règles pour le nom... ")
    private String nom;
  /*
    @NotBlank(message="Le prénom ne peut peut^^etre à null ou un chaîne vide")
    String prenom;   
    @Min(value=1000, message="La valeur minimum doit être de 1000")
    @Max(value=20000, message="La valeur maximum doit être de 20000")
    private float bareme;
    @Pattern(regexp="[A-Z][A-Za-z-0-9]*", message="Non respect des règles pour le passwd")
    private String passwd;   
    
    */
    
}
