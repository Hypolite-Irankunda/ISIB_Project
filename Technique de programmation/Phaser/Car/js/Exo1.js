/*
!!!! memo 
    -remplacer le nombre de repetission pour le time Event par eternity
    -Corriger le problème du restart :
        Lors du restart du jeux error => { 
            Uncaught TypeError: Cannot read property 'setSize' of undefined
                at PlayGame.spawn (Exo1.js:49)
                at initialize.update (phaser.min.js:1)
                at initialize.o.emit (phaser.min.js:1)
                at initialize.step (phaser.min.js:1)
                at initialize.update (phaser.min.js:1)
                at initialize.step (phaser.min.js:1)
                at initialize.step (phaser.min.js:1)
                at t (phaser.min.js:1)
        }
        --> le tableau obstacleGroup.getChildren() est vide 

    -Si le temps rajouter le sytème de niveau --> après x score la variable multiplicateur s'incrémente pour augmenter la vitesse du jeux 
*/


function timeCounter(){ 

            if(!theEnd){
                ms++
                if(ms==10){
                    sec++
                    ms=0
                    if(sec ==60 ){
                        min++
                        sec=0
                    }
                }
                timeText.setText("TIME:  \n " + min + ":" + sec + ":"+ ms)
            }
    }

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

        if (randomPositionCheck != randomPosition ){

            
            if(!theEnd){
            obstacle = obstacleGroup.get(ObstaclestateInit[randomPosition].x,ObstaclestateInit[randomPosition].y , obstacles[randomObstacle])
                .setActive(true)
                .setVisible(true)
                .setScale(carScale)
                .setVelocityY(carSpeed)
            }
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

function collisionCounter(){
    if(!theEnd){
        groupArray = obstacleGroup.getChildren() 
        groupArray.forEach(element => {
            if(element.active && element.y > config.width+310){

                score++
                scoreText.setText("SCORE: \n "+score+" \n ")
                console.log(score)
                //element.active = false
                element.setActive(false)
            }
            
        })
    }
}

class PlayGame extends Phaser.Scene {
    
    constructor(){
        super("PlayGame")
    }

    

    preload(){
        this.load.image('car', './assets/images/Topdown_vehicle_sprites_pack/Police.png')
        this.load.audio('RacingSound', './assets/audio/RacingSound.mp3');
        this.load.audio('CrashSound', './assets/audio/CrashSound.mp3');

        // !!! Remplacer par une boucle sur le tableau obstacles 
        this.load.image('truck', './assets/images/Topdown_vehicle_sprites_pack/truck.png')
        this.load.image('Ambulance', './assets/images/Topdown_vehicle_sprites_pack/Ambulance.png')
        this.load.image('Black_viper', './assets/images/Topdown_vehicle_sprites_pack/Black_viper.png')
        this.load.image('Mini_truck', './assets/images/Topdown_vehicle_sprites_pack/Mini_truck.png')
        this.load.image('Mini_van', './assets/images/Topdown_vehicle_sprites_pack/Mini_van.png')
        this.load.image('taxi', './assets/images/Topdown_vehicle_sprites_pack/taxi.png')

        this.load.image('road', './assets/images/background-1.png')
    }

    create(){
         
        var RacingSound = this.sound.add('RacingSound', {loop: true,})
        var CrashSound = this.sound.add('CrashSound', {loop: false,})

        console.log(RacingSound)

        RacingSound.play()

        //roadBackground 
        this.add.image(config.heigth, config.width+210, 'road').setScale(0.505)
        this.add.image(config.heigth, config.width-115, 'road').setScale(0.505)
        this.add.image(config.heigth, config.width-240, 'road').setScale(0.505)
        
        //text
        scoreText = this.add.text(1, 0, "SCORE: \n "+score+" \n ")
            .setColor("red")
            .setBackgroundColor("white")
            .setFontStyle("bold")

        timeText = this.add.text(1, 40, "TIME:  \n xxxx ")
            .setColor("red")
            .setBackgroundColor("white")
            .setFontStyle("bold")


        car = this.physics.add.sprite(CarstateInit[2].x, CarstateInit[2].y , 'car').setScale(carScale)
        car.body.setSize(carSizeX,CarSizeY )
        //limite existe un glitch --> soit le résoudre soit l'utiliser --> tant qu'on est dans le glitch les points n'augmente pas 
        car.setCollideWorldBounds(true) 

        obstacleGroup = this.physics.add.group({
            maxSize:20,
            active: false
        
        })

        this.time.addEvent({
            delay: 100, // ms
            callback: timeCounter,
            //args: [],
            callbackScope: this,
            loop: true 
            });

        let timer = this.time.addEvent({
            delay: 2000 / multiplicateur, // ms
            callback: spawn,
            //args: [],
            callbackScope: this,
            loop: true 
            });

        let timer2 = this.time.addEvent({
            delay: 2000 / multiplicateur, // ms
            callback: spawn,
            //args: [],
            callbackScope: this,
            loop: true
            });
        
        // let timer3 = this.time.addEvent({
        //     delay: 2000 / multiplicateur, // ms
        //     callback: spawn,
        //     //args: [],
        //     callbackScope: this,
        //     loop: true
        //     });
            
        
        


        this.physics.add.collider(car, obstacleGroup, function(){

            CrashSound.play()
            RacingSound.stop()
            console.log("collision")
            theEnd= true 
            carSpeed = 0
            goto=true
            
        });


        cursors = this.input.keyboard.createCursorKeys()
        console.log(cursors)
        console.log(obstacleGroup.getChildren())
        
        


    }

    
    update(){

        if(goto){
            
            
            this.time.addEvent({
                delay: 1000, // ms
                callback: function (){this.scene.start('EndScene')},
                //args: [],
                callbackScope: this,
                });

            goto=false
        }
        if (cursors.left.isDown && car.x > 80 )
        {
        car.setVelocityX(-carSpeed)
        //console.log(car.x)
        
        }
        else if (cursors.right.isDown && car.x < 330 )
        {
        car.setVelocityX(carSpeed);
            //console.log(car.x)
        
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
        collisionCounter()
        
    }


}


class MenuScene extends Phaser.Scene{

    constructor(){
        super("MenuScene")
    }

    init(){}
    preload(){
        this.load.audio('menuSound_1', './assets/audio/menuSound_1.mp3');
        this.load.audio('menuSound_2', './assets/audio/menuSound_2.mp3');
    
    }//rajouter la musique et les images
    create(){

        //problème pour cutter les song issue de menuSound et pour boucler le son parfaitement 

        var menuSound_1 = this.sound.add('menuSound_1', {loop: false,})
        var menuSound_2 = this.sound.add('menuSound_2', {loop: true,})
        console.log(menuSound_2)

        menuSound_1.play()
        menuSound_2.play()

        var StartTexte = " Welcome to my game !! \n Objectif : avoiding the other cars \n Controllers : arrow's keybord \n To win : you never win... \n Just try to make the best score \n Road safety is no accident! \n Click to start the game"
        this.add.text(20, 20, StartTexte)
        this.input.on('pointerup', function (pointer) {
            menuSound_1.stop()
            menuSound_2.stop()
            this.scene.start('PlayGame')

        }, this)
    }
    update(){}

}

class EndScene extends Phaser.Scene{

    constructor(){
        super("EndScene")
    }

    init(){}
    preload(){}//rajouter la musique et les images
    create(){

        EndTexte = "You made a score of " + score + " in " + min + ":" + sec + ":"+ ms + "\n     click to restart"
        this.add.text(config.heigth/2-35, config.width, EndTexte).setBackgroundColor("white")
                .setColor("black")
                .setFontSize(15)
                .setFontStyle("bold")

        this.input.on('pointerup', function (pointer) {

            this.scene.start('MenuScene')

        }, this)
    }
    update(){}

}

class Loading extends Phaser.Scene{

    constructor(){
        super("Loading")
    }

    init(){}
    preload(){}//rajouter la musique et les images
    create(){
        this.add.text(20, 20, "LoadingGame...")

        this.time.addEvent({
            delay: 3000, // ms
            callback: function(){this.scene.start('MenuScene')},
            //args: [],
            callbackScope: this,
            loop: true 
            });

        
    }
    update(){}

}



const config = {
    width: 400,
    heigth: 200,
    type: Phaser.AUTO,
    autoCenter: true,
    audio: {
        disableWebAudio: true
        }, 
    physics: {
        default:'arcade',
        arcade: {
            debug : true
        }
    },
    scene:[Loading ,MenuScene, PlayGame, EndScene ]
    
}

var game = new Phaser.Game(config)

var carScale = 0.4
var carVelocity = 300
let obstacle
var obstacleGroup

//Différentes position pour placer aléatoirement la voiture lors du démarage 
var CarstateInit =[
    {x: config.heigth-95, y: config.width+310},
    {x: config.heigth-30, y: config.width+310},
    {x: config.heigth+35, y: config.width+310},
    {x: config.heigth+100, y: config.width+310}
    

]

//Différentes position pour placer aléatoirement l'obstacle lors du démarage 
var ObstaclestateInit =[ 
    {x: config.heigth-100, y: 0},
    {x: config.heigth-35, y: 0},
    {x: config.heigth+30, y: 0},
    {x: config.heigth+95, y: 0}

]

//différentes images 
var obstacles=['truck', 'Ambulance', 'Black_viper', 'Mini_truck', 'Mini_van', 'taxi']
let car
let carSizeX = 100
let CarSizeY = 210
let cursors
let repeat = true
let multiplicateur = 2.5
let carSpeed = 160 * multiplicateur
let infinity =  1.7976931348623157E+10308
var randomPositionCheck = null

var scoreText
var score = 0
var timeText
var min = 0
var sec = 0
var ms = 0 

var goto=false
var groupArray
var theEnd = false
var EndTexte="" 
var endText=""

