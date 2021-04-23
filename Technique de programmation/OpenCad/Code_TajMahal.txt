/*
Realisation du Taj Mahal
Auteur : Hypolite Irankunda
*/




//$fn=200;

//Tête 
module headOfHead(Scale_){
    
 scale( [Scale_, Scale_, Scale_] ) { minkowski() {
     
        cylinder(20,11.3 );
        sphere(10.2 );
     }
    translate([0,0,1]) sphere(20);
     
    }
    
    }
    

module head(Scale_){
    
 scale( [Scale_, Scale_, Scale_] ) {
    
  difference () {
      //, $fn=200
   sphere(r=25);
   translate([0,0,-25])cylinder(h=25,r=25/1.2);
   cylinder(h=25,r=25/1.2);
   }
   
  translate([0,0,10.2]) minkowski() {
      //, $fn=200
     cylinder(10,11.3);
      //, $fn=200
     sphere(10.2);
      }
 
  scale([2, 2, 1]) {
    //, $fn=100  
    translate([0,0,35]) sphere(3);
}
  translate([0,0,29]) cylinder(5,5, 2); 
 
  translate([0,0,6]){
     translate([0,0,40]) headOfHead(0.5); 
     translate([0,0,58]) headOfHead(0.5/2); 
     translate([0,0,67]) headOfHead(0.5/4); 
 }
 }
} 











//Base 
module basePrototype(Scale_){
    
     scale( [Scale_, Scale_, Scale_] ) { 

         translate([58,0,0])cube([5,20,10]);

         cube([60,60,10]);
             
         
         
         translate([58,58,0]) rotate([0, 0, 12])    cylinder(h=10, r=5, $fn=6);
    }
}

module base(){
    difference(){
        basePrototype(1);
        translate([56,-1,9])cube([6,20,2]); 
       translate([-1,-1,8.5])cube([60,60,2]); 
        translate([58,58,8.5]) rotate([0, 0, 12])    cylinder(h=2, r=4, $fn=6); 
        translate([49,0,9])entrance(0.8); 
        translate([0,48,9])entrance(0.8);
    }
    
    //Tour
    translate([58,58,8.4]) tower(0.7);
    
}








//entrée
module entrance(Scale_){
    scale( [Scale_, Scale_, Scale_] ) {
    translate([0,0,10.2]) minkowski() {
      
     cylinder(12,11,1);
     sphere(3);
        
      }
     cylinder(10,13.9, 13.9);   
    
    }
    }




//Bati 
module bati(){
    
    difference(){
    translate([0,0,9]) cube([50,50,27]);
    translate([-1,-1,34]) cube([49,49,8]);
    translate([50,39,9]) rotate([0, 0, 45]) cube([16,16,28]);
    }
    
    translate([49.3,38.3,9]) rotate([0, 0, 45]) cube([1,15.5,28]);
    
    
    translate([49,0,9])cube([1,16,30]);
    translate([0,49,9])cube([16,1,30]);
    
    }
    
    


module batiAndEntrance(){
    difference(){
    bati();
    translate([49,0,9])entrance(0.8);
    translate([0,49,9])entrance(0.8);
    }
    }



//Tour
module tower(Scale_){
    scale( [Scale_, Scale_, Scale_] ) {
    translate([0, 0, 49.5]) head(0.2);
    for(i=[0:2]) {
        
     translate([0, 0, i*15]){ 
         
        cylinder(15,5, 4);
        translate([0,0,15]) cylinder(h=2,r=7, $fn=10 );
         
        }
        
     }
     
    }
    
    }





    
translate([0,0,49.9]) head(0.5);
translate([0,0,33]) cylinder(10,10.5, 10.5); 
    
batiAndEntrance();  
base();    
mirror([0, 1, 0]) {
    batiAndEntrance();
    base();
    }
    
  

mirror([1, 0, 0]) {
    
   
    
batiAndEntrance();  
base();
   
mirror([0, 1, 0]) {
    batiAndEntrance();
    base();
    }
}






//fin 