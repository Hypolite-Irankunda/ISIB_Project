/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tse.isib.demoTest6_ClientRest;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;

/**
 *
 * @author sever
 */
@Data
public class ListInfo implements Serializable {
 private List<Info> list;   
 
 public ListInfo()
 {list=new ArrayList<>();}
 
}
