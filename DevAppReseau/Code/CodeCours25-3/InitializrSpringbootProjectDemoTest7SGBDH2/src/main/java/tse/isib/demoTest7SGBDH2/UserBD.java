/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest7SGBDH2;

import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author sever
 */
public interface UserBD extends CrudRepository<User,String>
{
// User --> classe Entity gérée par  UserBD
// String  le type de la clé primaire de User
   
}
