/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.demo10.repository;

import com.example.demo10.entity.Article;
import com.example.demo10.entity.Bcart;
import com.example.demo10.entity.BcartPK;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author sever
 */
public interface BcartDB extends CrudRepository<Bcart,BcartPK>{
    
}
