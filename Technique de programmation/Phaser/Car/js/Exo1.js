

const config = {
    width: 400,
    heigth: 200,
    type: Phaser.AUTO,
    autoCenter: true, 
    physics: {
        default:'arcade',
        arcade: {
            debug : true
        }
    },
    scene: {
        preload: preload,
        create: create, 
        update, update
    }
    
}

var game = new Phaser.Game(config)
var carScale = 0.4
var carVelocity = 300
let obstacle

var CarstateInit =[
    {x: config.heigth-95, y: config.width+310},
    {x: config.heigth-30, y: config.width+310},
    {x: config.heigth+35, y: config.width+310},
    {x: config.heigth+100, y: config.width+310}
    

]
var ObstaclestateInit =[ 
    {x: config.heigth-100, y: 0},
    {x: config.heigth-35, y: 0},
    {x: config.heigth+30, y: 0},
    {x: config.heigth+95, y: 0}

    
]

var obstacles=['truck', 'Ambulance', 'Black_viper', 'Mini_truck', 'Mini_van', 'taxi']
let car
let carSizeX = 100
let CarSizeY = 210
let cursors
let repeat = true
let multiplicateur = 2.5
let carSpeed = 160 * multiplicateur
let infinity =  1.7976931348623157E+10308


function preload(){
    this.load.image('car', './assets/images/Topdown_vehicle_sprites_pack/Police.png')
    this.load.image('truck', './assets/images/Topdown_vehicle_sprites_pack/truck.png')
    this.load.image('Ambulance', './assets/images/Topdown_vehicle_sprites_pack/Ambulance.png')
    this.load.image('Black_viper', './assets/images/Topdown_vehicle_sprites_pack/Black_viper.png')
    this.load.image('Mini_truck', './assets/images/Topdown_vehicle_sprites_pack/Mini_truck.png')
    this.load.image('Mini_van', './assets/images/Topdown_vehicle_sprites_pack/Mini_van.png')
    this.load.image('taxi', './assets/images/Topdown_vehicle_sprites_pack/taxi.png')

    this.load.image('road', './assets/images/background-1.png')
}

function create(){


    //roadBackground 
    this.add.image(config.heigth, config.width+210, 'road').setScale(0.505)
    this.add.image(config.heigth, config.width-115, 'road').setScale(0.505)
    this.add.image(config.heigth, config.width-240, 'road').setScale(0.505)
    
   


    car = this.physics.add.image(CarstateInit[2].x, CarstateInit[2].y , 'car').setScale(carScale)
    car.body.setSize(carSizeX,CarSizeY )
    //limite existe un glitch --> soit le résoudre soit l'utiliser --> tant qu'on est dans le glitch les points n'augmente pas 
    car.setCollideWorldBounds(true) 

    let timer = this.time.addEvent({
        delay: 1300 / multiplicateur, // ms
        callback: spawn,
        //args: [],
        callbackScope: this,
        repeat: 20
        });

    let timer2 = this.time.addEvent({
        delay: 1300 / multiplicateur, // ms
        callback: spawn,
        //args: [],
        callbackScope: this,
        repeat: 20
        });
    
    let timer3 = this.time.addEvent({
        delay: 1300 / multiplicateur, // ms
        callback: spawn,
        //args: [],
        callbackScope: this,
        repeat: 20
        });
        
    
    cursors = this.input.keyboard.createCursorKeys()
    console.log(cursors)
}


function update(){

    
    
//61 348

    if (cursors.left.isDown && car.x > 80 )
    {
       car.setVelocityX(-carSpeed)
       console.log(car.x)
       
    }
    else if (cursors.right.isDown && car.x < 321 )
    {
       car.setVelocityX(carSpeed);
       console.log(car.x)
       
    }
    else if (cursors.up.isDown)
    {
       car.setVelocityY(-carSpeed)
      
       
    }
    else if (cursors.down.isDown)
    {
       car.setVelocityY(+carSpeed);
       repeat = false
        
    }
    else 
    {
       car.setVelocityX(0);
       car.setVelocityY(0);
    }
    
}

var randomPositionCheck = null

function spawn(){
    var randomPosition = Math.floor(Math.random()*ObstaclestateInit.length )
    var randomObstacle = Math.floor(Math.random()*obstacles.length )

    //différent taille de collider box en fonction de l'obstacle : 
    // car 0 --> obstacle.body.setSize(75, 200)   et ofset --> obstacle.body.setOffset(100, 35)
    // car 1 --> obstacle.body.setSize(80, 200)   et ofset --> obstacle.body.setOffset(95, 25)
    // car 2 --> obstacle.body.setSize(85, 215)   et ofset --> obstacle.body.setOffset(95, 25)
    // car 3 --> obstacle.body.setSize(90, 205)   et ofset --> obstacle.body.setOffset(95, 20)
    // car 4 --> obstacle.body.setSize(80, 200)   et ofset --> obstacle.body.setOffset(96, 35)
    // car 5 --> obstacle.body.setSize(80, 200)   et ofset --> obstacle.body.setOffset(96, 35)

    if (randomPositionCheck != randomPosition){

    var obstacle = this.physics.add.image(ObstaclestateInit[randomPosition].x,ObstaclestateInit[randomPosition].y , obstacles[randomObstacle]).setScale(carScale).setVelocityY(carSpeed)
    
    //différent taille de collider box 
    if (randomObstacle == 0) {

        obstacle.body.setSize(75, 200)
        obstacle.body.setOffset(100, 35)  

    } 
    else if (randomObstacle == 1) {
         
        obstacle.body.setSize(80, 200)
        obstacle.body.setOffset(95, 25)

    }
    else if (randomObstacle == 2) {
        
        obstacle.body.setSize(85, 215)
        obstacle.body.setOffset(95, 25)  

    }
    else if (randomObstacle == 3) {
        
        obstacle.body.setSize(90, 205)
        obstacle.body.setOffset(95, 20)  

    }
    else if (randomObstacle == 4) {
        
        obstacle.body.setSize(80, 200)
        obstacle.body.setOffset(96, 35)  

    }
    else if (randomObstacle == 5) {
        
        obstacle.body.setSize(95, 225)
        obstacle.body.setOffset(86, 20)  

    }

    randomPositionCheck = randomPosition
    //console.log("randomPosition = " + randomPosition + " et randomPositionCheck =" + randomPositionCheck )
    }
    else {
        //console.log("DEJA PRIS")
    }
}
