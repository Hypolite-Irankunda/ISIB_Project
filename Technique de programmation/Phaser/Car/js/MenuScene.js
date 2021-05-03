
class MenuScene extends Phaser.Scene{

    constructor(){
        super("menuScene")
    }

    init(){}
    preload(){}//rajouter la musique et les images
    create(){
        this.add.text(20, 20, "Start the game")
        this.scene.start("playGame")
    }
    update(){}

}

