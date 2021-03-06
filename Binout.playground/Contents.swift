/*: ##  Welcome to Binout !
 ### Introduction
Binout is an inspired Breakout game with Indonesian cuisines theme. The idea behind this is to encourage people to get to know more regarding Indonesian cuisines through a familiar context for everyone, the classic breakout game.
 
 Binout does this by giving the players the ability to customize some game elements. Such as the background, the ball and the paddle. So instead of the plain backgrounds we're used to see in a breakout game, players can pick an Indonesian cuisine as the ball or they can choose the background to be a popular place to eat around Indonesia while also learned a bit about their backgrounds.
 
 Not only that, Binout sneaks in other form of Indonesian traditional art through the SFX. The SFX for Binout is actually the sound of Gamelan, a traditional musical instrument from Indonesia. The "Win" and "Game Over" song is a snippet of a popular Indonesian folk song called "Gundul - Gundul Pacul"
 
 ### How to Play
 * When tapping/clicking the initial screen, players can play a normal breakout game. The rules are the same: touch the bottom of the screen and you'll loose. Break all of the blocks, and you'll win.
 * Players can choose their customization in the catalog button on the left top corner of the screen just by clicking on the image of the cuisine/place they want.
 * Have fun !
*/
import PlaygroundSupport
import UIKit
import SpriteKit
import GameplayKit

//Items categories
let BallCategoryName = "ball"
let PaddleCategoryName = "paddle"
let BlockCategoryName = "block"
let GameMessageName = "gameMessage"

//Bitmask categories
let BallCategory   : UInt32 = 0x1 << 1
let BottomCategory : UInt32 = 0x1 << 2
let BlockCategory  : UInt32 = 0x1 << 3
let PaddleCategory : UInt32 = 0x1 << 4
let BorderCategory : UInt32 = 0x1 << 5

//Main view
let sceneView = SKView(frame: CGRect(x:0 , y: 0, width: 768, height: 1024))

//Catalog view
let catalogview = UIScrollView(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))
catalogview.contentSize = CGSize(width: 768, height: 2000)

//Back to main view button
let backButton = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 20))

//Pick background title
let pickABackground = UILabel(frame: CGRect(x: 60, y: 50, width: 400, height: 40))
pickABackground.tintColor = .black
pickABackground.text = "Pick Your Environment"
pickABackground.textAlignment = .left
pickABackground.font = UIFont(name: "Avenir-Heavy", size: 32)
catalogview.addSubview(pickABackground)

//Backgrounds
let background1 = UIButton(frame: CGRect(x: 60, y: 100, width: 200, height: 250))
let bgImage1 = UIImageView(image: UIImage(named: "glodok"))
bgImage1.frame = CGRect(x: 0, y: 0, width: 200, height: 250)
catalogview.addSubview(background1)
background1.addSubview(bgImage1)

let background2 = UIButton(frame: CGRect(x: 280, y: 100, width: 200, height: 250))
let bgImage2 = UIImageView(image: UIImage(named: "suryakencana"))
bgImage2.frame = CGRect(x: 0, y: 0, width: 200, height: 250)
catalogview.addSubview(background2)
background2.addSubview(bgImage2)

let background3 = UIButton(frame: CGRect(x: 500, y: 100, width: 200, height: 250))
let bgImage3 = UIImageView(image: UIImage(named: "malioboro"))
bgImage3.frame = CGRect(x: 0, y: 0, width: 200, height: 250)
catalogview.addSubview(background3)
background3.addSubview(bgImage3)


//Pick paddle title
let choosePaddle = UILabel(frame: CGRect(x: 60, y: 580, width: 400, height: 40))
choosePaddle.tintColor = .black
choosePaddle.text = "Choose A Paddle"
choosePaddle.font = UIFont(name: "Avenir-Heavy", size: 32)
catalogview.addSubview(choosePaddle)

//Paddles
let paddle1 = UIButton(frame: CGRect(x: 60, y: 630, width: 200, height: 100))
let paddleImage1 = UIImageView(image: UIImage(named: "pastel"))
paddleImage1.frame = CGRect(x: 0, y: 0, width: 200, height: 100 )
catalogview.addSubview(paddle1)
paddle1.addSubview(paddleImage1)

let paddle2 = UIButton(frame: CGRect(x: 280, y: 630, width: 200, height: 100))
let paddleImage2 = UIImageView(image: UIImage(named: "pancong.png"))
paddleImage2.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
catalogview.addSubview(paddle2)
paddle2.addSubview(paddleImage2)

let paddle3 = UIButton(frame: CGRect(x: 500, y: 630, width: 200, height: 100))
let paddleImage3 = UIImageView(image: UIImage(named: "pisangijo"))
paddleImage3.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
catalogview.addSubview(paddle3)
paddle3.addSubview(paddleImage3)


//Pick ball title
let chooseBall = UILabel(frame: CGRect(x: 60, y: 1000, width: 400, height: 40))
chooseBall.tintColor = .black
chooseBall.text = "Choose Your Ball"
chooseBall.font = UIFont(name: "Avenir-Heavy", size: 32)
catalogview.addSubview(chooseBall)

//Balls
let ball1 = UIButton(frame: CGRect(x: 60, y: 1050, width: 200, height: 200))
let ballImage1 = UIImageView(image: UIImage(named: "ondeonde.png"))
ballImage1.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
catalogview.addSubview(ball1)
ball1.addSubview(ballImage1)

let ball2 = UIButton(frame: CGRect(x: 280, y: 1050, width: 200, height: 200))
let ballImage2 = UIImageView(image: UIImage(named: "cucur.png"))
ballImage2.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
catalogview.addSubview(ball2)
ball2.addSubview(ballImage2)

let ball3 = UIButton(frame: CGRect(x: 500, y: 1050, width: 200, height: 200))
let ballImage3 = UIImageView(image: UIImage(named: "serabi.png"))
ballImage3.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
catalogview.addSubview(ball3)
ball3.addSubview(ballImage3)


//Background descriptions
func description1(){
    let title = UILabel(frame: CGRect(x: 60, y: 320, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 40, width: 200, height: 200))
    title.text = "Glodok Market"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    desc.text = "A local traditional market located in Indonesia's biggest chinatown: Glodok, Jakarta. Glodok Market sells a bunch of things ranging from fashionable clothes to traditional medicine. But they're most known for their huge variety of indo-chinese cuisine."
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
        

    catalogview.addSubview(title)
    title.addSubview(desc)
}

func description2(){
    let title = UILabel(frame: CGRect(x: 280, y: 320, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 35, width: 200, height: 200))
    
    title.text = "Suryakencana Street"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Located in Bogor. This place comes alive and filled with lots of unique Indonesian street food during night time. It's a very popular spot for Indonesian youths to hang out to pass the time."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}

func description3(){
    let title = UILabel(frame: CGRect(x: 500, y: 320, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 35, width: 200, height: 200))
    
    title.text = "Malioboro Street"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Located in Yogyakarta, West Java. It's a major shopping street. The street's sidewalks are crowded with lots of motels/hotels, shops, restaurants even small stalls selling various goods. There are also street musicians, dancers and other artists exhibiting their creations on this road."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}


//Paddles description
func description4(){
    let title = UILabel(frame: CGRect(x: 60, y: 720, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 35, width: 200, height: 200))
    
    title.text = "Pastel"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Pastel is a very popular dish in Indonesia. It's a pastry filled with vegetables, typically eaten as a light breakfast. The word \"pastel\" originated from Portuguese meaning \"pastry\". The dish itself was brought into the country during the occupation of Portuguese back in the 16th century."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}

func description5() {
    let title = UILabel(frame: CGRect(x: 280, y: 720, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 45, width: 200, height: 200))
    
    title.text = "Pukis Cake"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Pukis cake is one of the most well-known street food/snack in Indonesia. It has a soft sponge-like texture, usually sprinkled with various toppings such as grated cheese, chocolate sprinkles or any type of jams. Since it's very popular, Pukis cake can be found pretty much anywhere in Indonesia."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}

func description6() {
    let title = UILabel(frame: CGRect(x: 500, y: 720, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 55, width: 200, height: 200))
    
    title.text = "Cake Pisang Ijo"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Cake Pisang Ijo is a type of chewy dish, usually eaten as a dessert alongside sweet marrow porridge with banana syrup. It's originated from South Sulawesi. For the Bugis people, the bright green color represents peace and elegance. This is a very popular dish for breaking the fast, especially during Ramadhan."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}

//Ball descriptions
func description7() {
    let title = UILabel(frame: CGRect(x: 60, y: 1230, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 55, width: 200, height: 200))
    
    title.text = "Onde-Onde"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Onde-onde is another popular indo-chinese snack. It's a fried pastry coated with sesame seeds and usually has mung bean paste as the filling. The Indonesian version of Onde-Onde originates from Mojokerto, it is thought to have come from a city called \"Onde-Onde\" during the Majapahit Empire era."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}

func description8(){
    let title = UILabel(frame: CGRect(x: 280, y: 1230, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 55, width: 200, height: 200))
    
    title.text = "Cucur"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Cucur is a traditional Indonesian snack, though it's also very popular in parts of Southeast Asia such as Malaysia and Vietnam. Cucur has a unique sweet taste. It's made with brown palm sugar, which gives Cucur their brown color. Cucur is typically eaten for dessert."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}

func description9() {
    let title = UILabel(frame: CGRect(x: 500, y: 1230, width: 200, height: 100))
    let desc = UILabel(frame: CGRect(x: 0, y: 55, width: 200, height: 200))
    
    title.text = "Serabi"
    title.font = UIFont(name: "Avenir-Heavy", size: 20)
    desc.font = UIFont(name: "Avenir", size: 12)
    
    desc.text = "Serabi is a pancake originated from Java, Indonesia. It's made from rice flour with coconut milk or shredded coconut. It tastes really sweet and is usually eaten with coconut sugar syrup, though there are many variants of toppings nowadays such as saussages and cheese."
    
    desc.lineBreakMode = NSLineBreakMode.byWordWrapping
    desc.numberOfLines = 0
    
    catalogview.addSubview(title)
    title.addSubview(desc)
}


//Environment descriptions
description1()
description2()
description3()

//Paddle descriptions
description4()
description5()
description6()

//Ball descriptions
description7()
description8()
description9()


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var catalogTouched: Bool = false
    var isFingerOnPaddle = false
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    
    var borderBg: SKSpriteNode!
    var paddleBg: SKSpriteNode!
    var ballBg: SKSpriteNode!
    
    //Game States
    lazy var gameState: GKStateMachine = GKStateMachine(states: [
    WaitingForClick(scene: self),
    Playing(scene: self),
    GameOver(scene: self)])

    
    var gameWon : Bool = false {
      didSet {
        let gameOver = childNode(withName: GameMessageName) as! SKSpriteNode
        let textureName = gameWon ? "youwon" : "gameOver"
        let texture = SKTexture(imageNamed: textureName)
        let actionSequence = SKAction.sequence([SKAction.setTexture(texture),
          SKAction.scale(to: 1.0, duration: 0.25)])
          
        run(gameWon ? gameWonSound : gameOverSound)
        gameOver.run(actionSequence)
      }
    }
    
    //MARK: Music/SFX
    let blipSound = SKAction.playSoundFileNamed("ballbounce", waitForCompletion: false)
    let blipPaddleSound = SKAction.playSoundFileNamed("paddleBounce", waitForCompletion: false)
    let bambooBreakSound = SKAction.playSoundFileNamed("BlockBreak", waitForCompletion: false)
    
    /* Song snippet courtesy of "r1dz instrumental" arrangement of "Gundul-gundul Pacul" (https://www.youtube.com/watch?v=bIsADTdkHwM&t=0s) */
    let gameWonSound = SKAction.playSoundFileNamed("winning", waitForCompletion: false)
    let gameOverSound = SKAction.playSoundFileNamed("gameover", waitForCompletion: false)
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        //Checking collision for each bitmask category
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
          firstBody = contact.bodyA
          secondBody = contact.bodyB
        } else {
          firstBody = contact.bodyB
          secondBody = contact.bodyA
        }
        
        //Collision with bottom of the screen
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BottomCategory {
            gameState.enter(GameOver.self)
            gameWon = false
        }
        //Collision with bamboo
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BlockCategory {
            run(bambooBreakSound)
            breakBlock(secondBody.node!)
            
            //Winning the game
            if isGameWon() {
              gameState.enter(GameOver.self)
              gameWon = true
            }
        }
        
        //Ball contacts with border
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == BorderCategory {
          run(blipSound)
        }
        //Ball contacts with paddle
        if firstBody.categoryBitMask == BallCategory && secondBody.categoryBitMask == PaddleCategory {
          run(blipPaddleSound)
        }
    }
    
    
    override func didMove(to view: SKView) {
        catalogview.isHidden = true
        
        //Choosing backgrounds
        background1.addTarget(self, action: #selector(glodokPressed), for: .touchUpInside)
        background2.addTarget(self, action: #selector(suryakencanaPressed), for: .touchUpInside)
        background3.addTarget(self, action: #selector(malioboroPressed), for: .touchUpInside)
        
        //Choosing paddles
        paddle1.addTarget(self, action: #selector(pastelPressed), for: .touchUpInside)
        paddle2.addTarget(self, action: #selector(pukisPressed), for: .touchUpInside)
        paddle3.addTarget(self, action: #selector(pisangPressed), for: .touchUpInside)
        
        //Choosing balls
        ball1.addTarget(self, action: #selector(ondeOndePressed), for: .touchUpInside)
        ball2.addTarget(self, action: #selector(cucurPressed), for: .touchUpInside)
        ball3.addTarget(self, action: #selector(serabiPressed), for: .touchUpInside)
        
        //Back to main view button styling
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = .black
        backButton.tintColor = .white
        backButton.layer.cornerRadius = 5
        backButton.addTarget(self, action: #selector(backButtonPressed(_:)), for: .touchUpInside)
                
        goToCatalogButton()
        
        //Border settings
        let border = childNode(withName: "collision_test") as! SKSpriteNode
        let borderBody = SKPhysicsBody(edgeLoopFrom: border.frame)
        borderBody.friction = 0
        self.physicsBody = borderBody
        borderBg = border
        
        //World is not affected by gravity
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        //Ball settings
        let ball = childNode(withName: "ball") as! SKSpriteNode
        ballBg = ball
        
        //Setting up trails/particles
        let trailNode = SKNode()
        trailNode.zPosition = 1
        addChild(trailNode)
        let trail = SKEmitterNode(fileNamed: "BallTrail")!
        trail.targetNode = trailNode
        ball.addChild(trail)
        
        //Bottom rectangle
        let bottomRect = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 1)
        let bottom = SKNode()
        bottom.physicsBody = SKPhysicsBody(edgeLoopFrom: bottomRect)
        addChild(bottom)
        
        //Paddle settings
        let paddle = childNode(withName: PaddleCategoryName) as! SKSpriteNode
        paddleBg = paddle
        
        //Assigning bitmask categories
        bottom.physicsBody!.categoryBitMask = BottomCategory
        ball.physicsBody!.categoryBitMask = BallCategory
        paddle.physicsBody!.categoryBitMask = PaddleCategory
        borderBody.categoryBitMask = BorderCategory
        
        //Setting up which categories the ball can has contact with
        ball.physicsBody!.contactTestBitMask = BottomCategory | BlockCategory | BorderCategory | PaddleCategory
        
        
        //Blocks settings
        let numberOfBlocks = 8
        let blockWidth = SKSpriteNode(imageNamed: "block.png").size.width
        let totalBlocksWidth = blockWidth * CGFloat(numberOfBlocks)
        let xOffset = (frame.width - totalBlocksWidth) / 2
        
        //Spawning blocks
        for i in 0..<numberOfBlocks {
          let block = SKSpriteNode(imageNamed: "block.png")
            block.position = CGPoint(x: xOffset + CGFloat(CGFloat(i) + 0.5) * blockWidth, y: frame.height * 0.7)
          
          block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
          block.physicsBody!.allowsRotation = false
          block.physicsBody!.friction = 0.0
          block.physicsBody!.affectedByGravity = false
          block.physicsBody!.isDynamic = false
          block.name = BlockCategoryName
          block.physicsBody!.categoryBitMask = BlockCategory
          block.zPosition = 2
          addChild(block)
        }
        
        for i in 0..<numberOfBlocks {
          let block = SKSpriteNode(imageNamed: "block.png")
            block.position = CGPoint(x: xOffset + CGFloat(CGFloat(i) + 0.5) * blockWidth, y: frame.height * 0.7 - block.frame.height * 0.4)
          
          block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
          block.physicsBody!.allowsRotation = false
          block.physicsBody!.friction = 0.0
          block.physicsBody!.affectedByGravity = false
          block.physicsBody!.isDynamic = false
          block.name = BlockCategoryName
          block.physicsBody!.categoryBitMask = BlockCategory
          block.zPosition = 2
          addChild(block)
        }
        
        for i in 0..<numberOfBlocks {
          let block = SKSpriteNode(imageNamed: "block.png")
            block.position = CGPoint(x: xOffset + CGFloat(CGFloat(i) + 0.5) * blockWidth, y: frame.height * 0.7 - block.frame.height * 0.8)
          
          block.physicsBody = SKPhysicsBody(rectangleOf: block.frame.size)
          block.physicsBody!.allowsRotation = false
          block.physicsBody!.friction = 0.0
          block.physicsBody!.affectedByGravity = false
          block.physicsBody!.isDynamic = false
          block.name = BlockCategoryName
          block.physicsBody!.categoryBitMask = BlockCategory
          block.zPosition = 2
          addChild(block)
        }
        
        //Setting Tap to Play overlay
        let overlayTitle = SKSpriteNode(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.85), size: CGSize(width: frame.width * 2, height: frame.height * 2))
        overlayTitle.zPosition = 4
        overlayTitle.name = "Overlay"
        addChild(overlayTitle)
        
        //Game title settings
        let gameTitle = SKSpriteNode(imageNamed: "gameLogo")
        gameTitle.name = "GameLogo"
        gameTitle.position = CGPoint(x: frame.midX, y: frame.midY * 1.45)
        gameTitle.zPosition = 5
        gameTitle.setScale(1.0)
        addChild(gameTitle)
        
        //Game messages settings
        let gameMessage = SKSpriteNode(imageNamed: "taptoplay")
        gameMessage.name = GameMessageName
        gameMessage.position = CGPoint(x: frame.midX, y: frame.midY)
        gameMessage.zPosition = 5
        gameMessage.setScale(1.0)
        addChild(gameMessage)
        
        //Enter first state of the game
        gameState.enter(WaitingForClick.self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                enumerateChildNodes(withName: "//*", using: {(node, stop) in
                    //Press the catalog button
                    if node.name == "catalogButton" {
                        if node.contains(touch.location(in: self)) {
                            self.gameState.enter(WaitingForClick.self)
                            catalogview.isHidden = false
                            self.catalogTouched = true
                        }
                    }
                })
            }
        }
        
        //Game state settings
        switch gameState.currentState {
        case is WaitingForClick:
            //Continue playing if not on catalogue
            if !catalogTouched {
              gameState.enter(Playing.self)
              isFingerOnPaddle = true
            }
            
        case is Playing:
          let touch = touches.first
          let touchLocation = touch!.location(in: self)
          if let body = physicsWorld.body(at: touchLocation) {
            if body.node!.name == PaddleCategoryName {
              isFingerOnPaddle = true
            }
          }
            
        case is GameOver:
            let newScene = GameScene(fileNamed:"GameScene")
            newScene!.scaleMode = .aspectFit
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            self.view?.presentScene(newScene!, transition: reveal)
            
        default:
          break
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Updating paddle position relative to the touch
        if isFingerOnPaddle {
          let touch = touches.first
          let touchLocation = touch!.location(in: self)
          let previousLocation = touch!.previousLocation(in: self)
          
          let paddle = childNode(withName: PaddleCategoryName) as! SKSpriteNode
          
          var paddleX = paddle.position.x + (touchLocation.x - previousLocation.x)
          
          paddleX = max(paddleX, paddle.size.width/2)
          paddleX = min(paddleX, size.width - paddle.size.width/2)
          
          paddle.position = CGPoint(x: paddleX, y: paddle.position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isFingerOnPaddle = false
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        gameState.update(deltaTime: currentTime)
    }
    
    //MARK: Helpers
    @objc func backButtonPressed(_ sender: UIButton!){
        catalogTouched = false
        catalogview.isHidden = true
    }
    
    //Background buttons pressed
    @objc func glodokPressed(_ sender: UIButton!) {
        print("pressed Glodok")
        borderBg.texture = SKTexture(imageNamed: "glodok.png")
    }
    @objc func suryakencanaPressed(_ sender: UIButton!) {
        borderBg.texture = SKTexture(imageNamed: "suryakencana.png")
    }
    @objc func malioboroPressed(_ sender: UIButton!) {
        borderBg.texture = SKTexture(imageNamed: "malioboro.png")
    }
    
    //Paddle buttons pressed
    @objc func pastelPressed(_ sender: UIButton!) {
        paddleBg.texture = SKTexture(imageNamed: "pastel")
    }
    @objc func pukisPressed(_ sender: UIButton!) {
        paddleBg.texture = SKTexture(imageNamed: "pancong.png")
    }
    @objc func pisangPressed(_ sender: UIButton!) {
        paddleBg.texture = SKTexture(imageNamed: "pisangijo.png")
    }
    
    
    //Ball buttons pressed
    @objc func ondeOndePressed(_ sender: UIButton!) {
        ballBg.texture = SKTexture(imageNamed: "ondeonde.png")
    }
    @objc func cucurPressed(_ sender: UIButton!) {
        ballBg.texture = SKTexture(imageNamed: "cucur.png")
    }
    @objc func serabiPressed(_ sender: UIButton!) {
        ballBg.texture = SKTexture(imageNamed: "serabi.png")
    }
    
    //Activating catalog view
    func goToCatalogButton(){
        let catalogButton = SKSpriteNode(imageNamed: "catalogButton.png")
        catalogButton.name = "catalogButton"
        catalogButton.size = CGSize(width: 120, height: 120)
        catalogButton.position = CGPoint(x: frame.width * 0.11, y: frame.height * 0.92)
        catalogButton.zPosition = 5
        addChild(catalogButton)
    }
    
    //Breaking block actions
    func breakBlock(_ node: SKNode){
        let particles = SKEmitterNode(fileNamed: "BrokenPlatform")!
        particles.position = node.position
        particles.zPosition = 3
        addChild(particles)
        particles.run(SKAction.sequence([SKAction.wait(forDuration: 1.0),
          SKAction.removeFromParent()]))
        node.removeFromParent()
    }
    
    //Randomizer for the ball's direction
    func randomFloat(from:CGFloat, to:CGFloat) -> CGFloat {
      let rand:CGFloat = CGFloat(Float(arc4random()) / 0xFFFFFFFF)
      return (rand) * (to - from) + from
    }
    
    //Checking win state
    func isGameWon() -> Bool {
      var numberOfBricks = 0
      self.enumerateChildNodes(withName: BlockCategoryName) {
        node, stop in
        numberOfBricks = numberOfBricks + 1
      }
      return numberOfBricks == 0
    }
}



//MARK: Game State Classes
class WaitingForClick: GKState {
  unowned let scene: GameScene
  
  init(scene: SKScene) {
    self.scene = scene as! GameScene
  }
  
  override func didEnter(from previousState: GKState?) {
    let scale = SKAction.scale(to: 1.0, duration: 0.25)
    scene.childNode(withName: GameMessageName)!.run(scale)
    scene.childNode(withName: "Overlay")!.run(scale)
    scene.childNode(withName: "GameLogo")!.run(scale)
    
  }
  
  override func willExit(to nextState: GKState) {
    if nextState is Playing {
      let scale = SKAction.scale(to: 0, duration: 0.4)
      scene.childNode(withName: GameMessageName)!.run(scale)
        scene.childNode(withName: "Overlay")!.run(scale)
        scene.childNode(withName: "GameLogo")!.run(scale)
    }
  }
  
  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    return stateClass is Playing.Type
  }

}

class Playing: GKState {
  unowned let scene: GameScene
  
  init(scene: SKScene) {
    self.scene = scene as! GameScene
    super.init()
  }
  
  override func didEnter(from previousState: GKState?) {
    if previousState is WaitingForClick {
      let ball = scene.childNode(withName: BallCategoryName) as! SKSpriteNode
      ball.physicsBody!.applyImpulse(CGVector(dx: randomDirection(), dy: randomDirection()))
    }
  }
  
  override func update(deltaTime seconds: TimeInterval) {
    //Ball behaviours
    
    let ball = scene.childNode(withName: BallCategoryName) as! SKSpriteNode
    
    let maxSpeed: CGFloat = 400.0
    
    let xSpeed = sqrt(ball.physicsBody!.velocity.dx * ball.physicsBody!.velocity.dx)
    let ySpeed = sqrt(ball.physicsBody!.velocity.dy * ball.physicsBody!.velocity.dy)
    
    let speed = sqrt(ball.physicsBody!.velocity.dx * ball.physicsBody!.velocity.dx + ball.physicsBody!.velocity.dy * ball.physicsBody!.velocity.dy)
    
    if xSpeed <= 10.0 {
      ball.physicsBody!.applyImpulse(CGVector(dx: randomDirection(), dy: 0.0))
    }
    if ySpeed <= 10.0 {
      ball.physicsBody!.applyImpulse(CGVector(dx: 0.0, dy: randomDirection()))
    }
    
    if speed > maxSpeed {
      ball.physicsBody!.linearDamping = 0.4
    }
    else {
      ball.physicsBody!.linearDamping = 0.0
    }
  }
  
  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    return stateClass is GameOver.Type
  }
  
    //randomizing direction of the ball
  func randomDirection() -> CGFloat {
    let speedFactor: CGFloat = 3.0
    if scene.randomFloat(from: 0.0, to: 100.0) >= 50 {
      return -speedFactor
    } else {
      return speedFactor
    }
  }
}

class GameOver: GKState {
  unowned let scene: GameScene
  
  init(scene: SKScene) {
    self.scene = scene as! GameScene
    super.init()
  }
  
  override func didEnter(from previousState: GKState?) {
    if previousState is Playing {
      let ball = scene.childNode(withName: BallCategoryName) as! SKSpriteNode
      ball.physicsBody!.linearDamping = 1.0
      scene.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
    
    }
  }
  
  override func isValidNextState(_ stateClass: AnyClass) -> Bool {
    return stateClass is WaitingForClick.Type
  }
}

//Presenting scene
if let scene = GameScene(fileNamed: "GameScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    catalogview.backgroundColor = .white
    catalogview.addSubview(backButton)
    
    //add catalog view
    sceneView.addSubview(catalogview)
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundPage.current.liveView = sceneView
