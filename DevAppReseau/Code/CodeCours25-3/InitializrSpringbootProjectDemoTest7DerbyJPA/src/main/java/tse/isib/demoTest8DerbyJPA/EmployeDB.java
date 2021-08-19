/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest8DerbyJPA;

import org.springframework.data.repository.CrudRepository;
import tse.isib.demoTest8DerbyJPA.entity.Employe;

/**
 *
 * @author sever
 */
public interface EmployeDB extends CrudRepository<Employe,Integer> {
    
}
