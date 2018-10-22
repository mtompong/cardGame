//
//  GameScene.swift
//  CardGameProject
//
//  Created by Mark Tompong on 6/28/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var firstTable = Card(cardType: .random, isPlayer: true)
    var firstTable2 = Card(cardType: .random, isPlayer: true)
    
    var dealtCards: [Card] = []
    var cardPosition: [CGPoint] = []
    var playerHand :[Card] = []
    var gameOver : Bool = false
    var counter = 0.0
    var opCounter = 0.0
    var count = 0
    let handPosition = cardHand(player: .player1)
    let player2Position = cardHand(player: .player2)
    let player2Texture = SKTexture(imageNamed: "player_2")
    let cardInitPosition = CGPoint(x: 360, y: 450)
    let cardMovePosition = CGPoint(x: 360, y: 450)
    var player2Hand: [Card] = []
    var player2Table: [Card] = []
    
    var highlightCornerNode :HilightedHexagon?
    
    
    let countDown3 = SKTexture(imageNamed: "countDown_3")
    let countDown2 = SKTexture(imageNamed: "countDown_2")
    let countDown1 = SKTexture(imageNamed: "countDown_1")
    let countDownGo = SKTexture(imageNamed: "countDown_Go")
    let Ring_Inner1 = SKTexture(imageNamed: "Ring_Inner1")
    let Ring_Inner2 = SKTexture(imageNamed: "Ring_Inner2")
    let Ring_Outer1 = SKTexture(imageNamed: "Ring_Outer1")
    let Ring_Outer2 = SKTexture(imageNamed: "Ring_Outer2")
    
    let electricFlash1 = SKTexture(imageNamed: "electric_Flash1")
    let electricFlash2 = SKTexture(imageNamed: "electric_Flash2")
    let electricFlash3 = SKTexture(imageNamed: "electric_Flash3")
    let electricFlash4 = SKTexture(imageNamed: "electric_Flash4")
    
    let victoryScreen = SKTexture(imageNamed: "victoryScreen")
    let defeatScreen = SKTexture(imageNamed: "defeatScreen")
    let mainMenu = SKTexture(imageNamed: "mainMenu")
    let mainMenuPressed = SKTexture(imageNamed: "mainMenuPressed")
    let playAgain = SKTexture(imageNamed: "playagain")
    let playAgainPressed = SKTexture(imageNamed: "playagainpressed")
    var selectedButton : SKSpriteNode?
    
 
    
    
    override func didMove(to view: SKView) {
        
        let bg = SKSpriteNode(imageNamed: "bg_blank")
        bg.anchorPoint = CGPoint.zero
        bg.position = CGPoint.zero
        addChild(bg)
        
        let deckTexture = SKTexture(imageNamed: "card_back")
        

        let player2Node = SKSpriteNode(imageNamed: "player_2")
        player2Node.position = CGPoint(x: 200, y: 680)
        player2Node.size = CGSize(width: 40, height: 40)
        player2Node.zPosition = 11
        addChild(player2Node)
      
        
        //deck------------------------------
        let deck = Deck(Decktexture: deckTexture)
        deck.position = CGPoint(x: 360, y: 360)
        deck.zPosition = 11
        addChild(deck)
        
        //hand------------------------------
        
        
        
        let fadeIn = SKAction.fadeIn(withDuration: 1.0)
        let moveOutofFrame = SKAction.move(to:(CGPoint(x: 200 ,y: 0)), duration: 3.0)
        let moveOutofFrame_placer_tail2 = SKAction.move(to:(CGPoint(x: -200 ,y: 0)), duration: 3.0)

        
        let card_placer_tail2 = SKSpriteNode(imageNamed: "Rcard_placer_tail")
        card_placer_tail2.position = CGPoint(x:337, y:245)
        //card_placer_tail2.zRotation = 3 * CGFloat.pi / 2
        addChild(card_placer_tail2)
        let thisfadeIn = SKAction.run({
            card_placer_tail2.run(fadeIn)
        })
        let addGlow = SKAction.run({
            card_placer_tail2.addGlowInit()
        })
        
        card_placer_tail2.run(SKAction.group([thisfadeIn,addGlow]))
        let activateSlide_placer_tail2 = SKCropNode()
        activateSlide_placer_tail2.position = CGPoint(x:337, y:245)
        //activateSlide_placer_tail2.zRotation = 3 * CGFloat.pi / 2
        activateSlide_placer_tail2.maskNode = SKSpriteNode(imageNamed: "Rcard_placer_tail")
        let uncoverNode_placer_tail2 = SKSpriteNode(imageNamed: "bg_blank")
        uncoverNode_placer_tail2.size = CGSize(width: 200, height: 200)
        uncoverNode_placer_tail2.position = CGPoint(x:0 ,y: 0)
        activateSlide_placer_tail2.addChild(uncoverNode_placer_tail2)
        addChild(activateSlide_placer_tail2)
        
        uncoverNode_placer_tail2.run(moveOutofFrame_placer_tail2,  completion: {() -> Void in activateSlide_placer_tail2.removeAllChildren()})
 
        
        
        let card_placer_tail1 = SKSpriteNode(imageNamed: "Lcard_placer_tail")
        card_placer_tail1.position = CGPoint(x:75, y: 245)
        //card_placer_tail1.zRotation = CGFloat.pi / 2
        addChild(card_placer_tail1)
        
        card_placer_tail1.run(fadeIn)
        card_placer_tail1.addGlowInit()
        
        let activateSlide_placer_tail1 = SKCropNode()
        activateSlide_placer_tail1.position = CGPoint(x:75, y: 245)
        //activateSlide_placer_tail1.zRotation = CGFloat.pi / 2
        activateSlide_placer_tail1.maskNode = SKSpriteNode(imageNamed: "Lcard_placer_tail")
        let uncoverNode_placer_tail1 = SKSpriteNode(imageNamed: "bg_blank")
        uncoverNode_placer_tail1.size = CGSize(width: 200, height: 200)
        uncoverNode_placer_tail1.position = CGPoint(x:0 ,y: 0)
        activateSlide_placer_tail1.addChild(uncoverNode_placer_tail1)
        addChild(activateSlide_placer_tail1)
        
        uncoverNode_placer_tail1.run(moveOutofFrame,  completion: {() -> Void in activateSlide_placer_tail1.removeAllChildren()})
 
 
        
        let circuitBorder1 = SKSpriteNode(imageNamed: "circuitBorder_left")
        circuitBorder1.position = CGPoint(x:55, y: 50)
        circuitBorder1.zRotation = 3 * CGFloat.pi / 4
        addChild(circuitBorder1)
        
        circuitBorder1.run(fadeIn)
        circuitBorder1.addGlowInit()
        
        
        let activateSlide_Border1 = SKCropNode()
        activateSlide_Border1.position = CGPoint(x:55, y: 50)
        activateSlide_Border1.zRotation = 3 * CGFloat.pi / 4
        activateSlide_Border1.maskNode = SKSpriteNode(imageNamed: "circuitBorder_left")
        let uncoverNode_Border1 = SKSpriteNode(imageNamed: "bg_blank")
        uncoverNode_Border1.size = CGSize(width: 200, height: 200)
        uncoverNode_Border1.position = CGPoint(x:0 ,y: 0)
        activateSlide_Border1.addChild(uncoverNode_Border1)
        addChild(activateSlide_Border1)
        
        uncoverNode_Border1.run(moveOutofFrame, completion: {() -> Void in activateSlide_Border1.removeAllChildren()})
        
        let circuitBorder2 = SKSpriteNode(imageNamed: "circuitBorder_right")
        circuitBorder2.position = CGPoint(x:355, y: 55)
        circuitBorder2.zRotation = CGFloat.pi / 4
        addChild(circuitBorder2)
        
        circuitBorder2.run(fadeIn)
        circuitBorder2.addGlowInit()
        
        
        let activateSlide_Border2 = SKCropNode()
        activateSlide_Border2.position = CGPoint(x:355, y: 55)
        activateSlide_Border2.zRotation = CGFloat.pi / 4
        activateSlide_Border2.maskNode = SKSpriteNode(imageNamed: "circuitBorder_right")
        let uncoverNode_Border2 = SKSpriteNode(imageNamed: "bg_blank")
        uncoverNode_Border2.size = CGSize(width: 200, height: 200)
        uncoverNode_Border2.position = CGPoint(x:0 ,y: 0)
        activateSlide_Border2.addChild(uncoverNode_Border2)
        addChild(activateSlide_Border2)
        
        uncoverNode_Border2.run(moveOutofFrame, completion: {() -> Void in activateSlide_Border2.removeAllChildren()})
       
       
        
        highlightCornerNode = HilightedHexagon()
        highlightCornerNode!.position = CGPoint(x: 200, y: 350)
        highlightCornerNode!.alpha = 0.75
        addChild(highlightCornerNode!)
        highlightCornerNode?.run({
            SKAction.group([
                SKAction.run {
                    self.highlightCornerNode!.activateHighlightTop()
                },
                SKAction.run {
                    self.highlightCornerNode!.activateHighlightBottom()
                }
                ])
            }())

        
       
        let circuitCorner_left = SKSpriteNode(imageNamed: "circuitcorner_left")
        circuitCorner_left.position = CGPoint(x:80, y: 535)
        circuitCorner_left.alpha = 0
        addChild(circuitCorner_left)
        
        circuitCorner_left.run(fadeIn)
        circuitCorner_left.addGlowInit()
        
        
        let circuitCorner_right = SKSpriteNode(imageNamed: "circuitcorner_right")
        circuitCorner_right.position = CGPoint(x:330, y: 535)
        circuitCorner_right.alpha = 0
        addChild(circuitCorner_right)
        
        circuitCorner_right.run(fadeIn)
        circuitCorner_right.addGlowInit()
        
        
        //table------------------------------
   
        
        let cardDrawn1 = Card(cardType: .random, isPlayer: true)
        cardDrawn1.position = CGPoint(x: 50, y: 400)
        cardDrawn1.zPosition = 0.3
        cardPosition.append(cardDrawn1.position)
        addChild(cardDrawn1)
        dealtCards.append(cardDrawn1)
        cardDrawn1.position = deck.position
        
        
        let cardDrawn2 = Card(cardType: .random, isPlayer: true)
        cardDrawn2.position = CGPoint(x: 110, y: 400)
        cardDrawn2.zPosition = 0.3
        cardPosition.append(cardDrawn2.position)
        addChild(cardDrawn2)
        dealtCards.append(cardDrawn2)
        cardDrawn2.position = deck.position
        
  
        
        let cardDrawn3 = Card(cardType: .random, isPlayer: true)
        cardDrawn3.position = CGPoint(x: 170, y: 400)
        cardPosition.append(cardDrawn3.position)
        cardDrawn3.zPosition = 0.3
        addChild(cardDrawn3)
        dealtCards.append(cardDrawn3)
        cardDrawn3.position = deck.position
       
        
        let cardDrawn4 = Card(cardType: .random, isPlayer: true)
        cardDrawn4.position = CGPoint(x: 230, y: 400)
        cardPosition.append(cardDrawn4.position)
        cardDrawn4.zPosition = 0.3
        addChild(cardDrawn4)
        dealtCards.append(cardDrawn4)
        cardDrawn4.position = deck.position
       
        
        let cardDrawn5 = Card(cardType: .random, isPlayer: true)
        cardDrawn5.position = CGPoint(x: 290, y: 400)
        cardPosition.append(cardDrawn5.position)
        cardDrawn5.zPosition = 0.3
        addChild(cardDrawn5)
        dealtCards.append(cardDrawn5)
        cardDrawn5.position = deck.position
        
        
        //second row
        
        let cardDrawn6 = Card(cardType: .random, isPlayer: true)
        cardDrawn6.position = CGPoint(x: 50, y: 320)
        cardDrawn6.zPosition = 0.3
        cardPosition.append(cardDrawn6.position)
        addChild(cardDrawn6)
        dealtCards.append(cardDrawn6)
        cardDrawn6.position = deck.position
        
        let cardDrawn7 = Card(cardType: .random, isPlayer: true)
        cardDrawn7.position = CGPoint(x: 110, y: 320)
        cardDrawn7.zPosition = 0.3
        cardPosition.append(cardDrawn7.position)
        addChild(cardDrawn7)
        dealtCards.append(cardDrawn7)
        cardDrawn7.position = deck.position
        
        let cardDrawn8 = Card(cardType: .random, isPlayer: true)
        cardDrawn8.position = CGPoint(x: 170, y: 320)
        cardDrawn8.zPosition = 0.3
        cardPosition.append(cardDrawn8.position)
        addChild(cardDrawn8)
        dealtCards.append(cardDrawn8)
        cardDrawn8.position = deck.position

        
        let cardDrawn9 = Card(cardType: .random, isPlayer: true)
        cardDrawn9.position = CGPoint(x: 230, y: 320)
        cardDrawn9.zPosition = 0.3
        cardPosition.append(cardDrawn9.position)
        addChild(cardDrawn9)
        dealtCards.append(cardDrawn9)
        cardDrawn9.position = deck.position

        
        let cardDrawn10 = Card(cardType: .random, isPlayer: true)
        cardDrawn10.position = CGPoint(x: 290, y: 320)
        cardDrawn10.zPosition = 0.3
        cardPosition.append(cardDrawn10.position)
        addChild(cardDrawn10)
        dealtCards.append(cardDrawn10)
        cardDrawn10.position = deck.position
        
        ///////////////////////////////////////////////////////        /////////////////////////////////////////////
        
        let opponentCard1 = Card(cardType: .random, isPlayer: false)
        opponentCard1.position = cardInitPosition
        addChild(opponentCard1)
        player2Table.append(opponentCard1)
        
        let opponentCard2 = Card(cardType: .random, isPlayer: false)
        opponentCard2.position = cardInitPosition
        addChild(opponentCard2)
        player2Table.append(opponentCard2)
        
        let opponentCard3 = Card(cardType: .random, isPlayer: false)
        opponentCard3.position = cardInitPosition
        addChild(opponentCard3)
        player2Table.append(opponentCard3)
        
        let opponentCard4 = Card(cardType: .random, isPlayer: false)
        opponentCard4.position = cardInitPosition
        addChild(opponentCard4)
        player2Table.append(opponentCard4)
        
        let opponentCard5 = Card(cardType: .random, isPlayer: false)
        opponentCard5.position = cardInitPosition
        addChild(opponentCard5)
        player2Table.append(opponentCard5)
        
        let opponentCard6 = Card(cardType: .random, isPlayer: false)
        opponentCard6.position = cardInitPosition
        addChild(opponentCard6)
        player2Table.append(opponentCard6)
        
        let opponentCard7 = Card(cardType: .random, isPlayer: false)
        opponentCard7.position = cardInitPosition
        addChild(opponentCard7)
        player2Table.append(opponentCard7)
        
        let opponentCard8 = Card(cardType: .random, isPlayer: false)
        opponentCard8.position = cardInitPosition
        addChild(opponentCard8)
        player2Table.append(opponentCard8)
        
        let opponentCard9 = Card(cardType: .random, isPlayer: false)
        opponentCard9.position = cardInitPosition
        addChild(opponentCard9)
        player2Table.append(opponentCard9)
        
        let opponentCard10 = Card(cardType: .random, isPlayer: false)
        opponentCard10.position = cardInitPosition
        addChild(opponentCard10)
        player2Table.append(opponentCard10)
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let countDown = Countdown(countDown3: countDown3 , countDown2: countDown2, countDown1: countDown1, countDownGo: countDownGo)
        let counDownSlidePosition = CGPoint(x: 220, y: 360)
        let counDownStartPosition = CGPoint(x: 200, y: 360)
        countDown.position = CGPoint(x: -100 , y: 360)
        countDown.size = CGSize(width: 200, height: 200)
        addChild(countDown)
        
       countDown.zPosition = 11
        countDown.startCountDown(slideLocation: counDownSlidePosition, startLocation: counDownStartPosition)
         
      
        
 
        counter = resetCounter(counter: counter)
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        let Loading_Circle = LoadingCircle(Ring_Inner1: Ring_Inner1, Ring_Inner2: Ring_Inner2, Ring_Outer1: Ring_Outer1, Ring_Outer2: Ring_Outer2)
        Loading_Circle.position = CGPoint(x:200, y:680)
        addChild(Loading_Circle)
        let startRotatingCycle = SKAction.run ({
            if (self.gameOver == false) {
                Loading_Circle.startRotatingCycle()
                Loading_Circle.Inner_Ring2.addGlowInit()
                Loading_Circle.Outer_Ring1.addGlowInit()
                Loading_Circle.Outer_Ring2.addGlowInit()
            }
            else {
                Loading_Circle.removeAllActions()
            }
        })
        
        Loading_Circle.run(SKAction.sequence([(SKAction.wait(forDuration: 3)),startRotatingCycle]))
        
       
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        let data_Screen = dataScreen()
        data_Screen.position = CGPoint(x:200,y:50)
        //let initSize = CGSize(width: 133.33, height: 100)
        data_Screen.setScale(0)
        //data_Screen.size = CGSize(width: 133.33, height: 100)
        addChild(data_Screen)
        
        data_Screen.expand()
        
          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
        let flashAura1 = electricFlash(electricFlash: electricFlash1)
        flashAura1.position = CGPoint(x: 100, y: 55)
        addChild(flashAura1)
        flashAura1.isHidden = true
        flashAura1.startElectricFlash(waitDuration: 2)
        
        let subflashAura1 = electricFlash(electricFlash: electricFlash3)
        subflashAura1.position = CGPoint(x: 320, y: 120)
        addChild(subflashAura1)
        subflashAura1.isHidden = true
        subflashAura1.startElectricFlash(waitDuration: 2)
        
        let flashAura2 = electricFlash(electricFlash: electricFlash2)
        flashAura2.position = CGPoint(x: 300, y: 55)
        addChild(flashAura2)
        flashAura2.isHidden = true
        flashAura2.startElectricFlash(waitDuration: 2.2)
        
        let subflashAura2 = electricFlash(electricFlash: electricFlash1)
        subflashAura2.position = CGPoint(x: 70, y: 150)
        addChild(subflashAura2)
        subflashAura2.isHidden = true
        subflashAura2.startElectricFlash(waitDuration: 2.2)
        
        let flashAura3 = electricFlash(electricFlash: electricFlash3)
        flashAura3.position = CGPoint(x: 50, y: 245)
        addChild(flashAura3)
        flashAura3.isHidden = true
        flashAura3.startElectricFlash(waitDuration: 2.4)
        
        let subflashAura3 = electricFlash(electricFlash: electricFlash4)
        subflashAura3.position = CGPoint(x: 80, y: 55)
        addChild(subflashAura3)
        subflashAura3.isHidden = true
        subflashAura3.startElectricFlash(waitDuration: 2.3)
        
        let flashAura4 = electricFlash(electricFlash: electricFlash4)
        flashAura4.position = CGPoint(x: 350, y: 245)
        addChild(flashAura4)
        flashAura4.isHidden = true
        flashAura4.startElectricFlash(waitDuration: 2.6)
        
       
        
        
     
        
        
    }
    
    override func sceneDidLoad() {
        
        let disableTouch = SKAction.run({
            for card in self.dealtCards {
                card.isUserInteractionEnabled = true
            }
        })
        
        let delay = SKAction.wait(forDuration: 3.6)
       
        let enableTouch = SKAction.run({
            for card in self.dealtCards {
                card.isUserInteractionEnabled = false
            }
        })
        
        let countDownDisable = SKAction.sequence([disableTouch, delay, enableTouch])
        
        self.run(countDownDisable)
        
        let player2 = Opponent(opTexture: player2Texture)
        player2.position = CGPoint(x: 200, y: 720)
        player2.size = CGSize(width: 100, height: 30)
        addChild(player2)
       
        
     

        let player2handType = player2.player2Type()
        
        
        let dealTable = SKAction.run({
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                var position = 0
                for card in self.dealtCards {
                    card.isPaused = false
                    self.counter += 0.3
                    self.firstTable = self.revealTable(card: card,  cardPosition: self.cardPosition[position], counter: self.counter)
                    self.firstTable.isPaused = false
                    position += 1
                    self.flipFirstDeal(card: self.firstTable, counter: self.counter)
                }
                
                for card in self.player2Table {
                    self.opCounter += 0.3
                    self.firstTable2 = self.revealTable(card: card,  cardPosition: self.cardMovePosition, counter: self.opCounter)
                    self.firstTable2.isPaused = false
                    self.flipFirstDeal(card: self.firstTable2, counter: self.opCounter)
                }
             
            }
            
            self.counter = self.resetCounter(counter: self.counter)
            self.opCounter = self.resetCounter(counter: self.opCounter)
        })
        
        
        let player2Action = SKAction.run({
           
            self.opCounter = self.resetCounter(counter: self.opCounter)
            self.checkHand(playerHand: self.player2Hand, isPlayer: false)
            let moveTo = CGPoint(x: 360, y: 650)
           
                    //add to hand
            for card in self.player2Table {
                if card.cardType == player2handType && card.faceDown == false {
                    self.opCounter += 0.3
                    card.redrawing = false
                    let handLocation = self.player2Position.cardPostion[self.player2Hand.count]
                    
                    card.zPosition = CGFloat(self.player2Hand.count)
                    let rotateAction = SKAction.rotate(toAngle: self.player2Position.cardRotation[self.player2Hand.count], duration: 0.2)
                    let delayAction = SKAction.wait(forDuration: 1.0 * self.opCounter)
                    let move2Hand = SKAction.move(to: handLocation, duration: 0.2)
                    let checkRadialHighlight = SKAction.run({
                        self.checkforRadialHighlight(playerHand: self.player2Hand, isPlayer: false)
                    })
                    let moveSequence = SKAction.sequence([delayAction,rotateAction,delayAction, move2Hand, checkRadialHighlight ])
                    card.run(moveSequence)
                    
                    self.checkHand(playerHand: self.player2Hand, isPlayer: false)
                    self.player2Table = self.player2Table.filter {$0 != card}
                    self.player2Hand.append(card)
                    
                    
                }
                
            }
                //redraw
            for card in self.player2Table {
                self.opCounter += 0.3
                self.firstTable2 = self.revealTable(card: card,  cardPosition:  moveTo, counter: self.opCounter)
                self.firstTable2.isPaused = false
                card.flip(counter: self.opCounter)
            }
        })
        
    
        
        let delaylastCard = SKAction.wait(forDuration: 2)
        let delayAction = SKAction.wait(forDuration: 2.5)
        let tabletoDeck = SKAction.wait(forDuration: 2.5)
       
        let player2FullTurn = SKAction.sequence([tabletoDeck,player2Action])
        
        let player2lastCard = SKAction.sequence([delaylastCard,player2Action])
        
        let player2RegularAction = SKAction.repeatForever(player2FullTurn)
        let player2LastAction = SKAction.repeatForever(player2lastCard)
    
        
        
        let startgameSequence = SKAction.sequence([dealTable, delayAction])
        
        self.run(startgameSequence, completion: {() -> Void in self.player2Logic(regularTurn:  player2RegularAction, lastTurn: player2LastAction, playerhand: self.player2Hand)})
      
        
        
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      
  
        //self.pointsOnCircleFor(numberOfPoints: 20, centerX: 200, centerY: 680, radius: 80)
    }
    
    
    ////////////////////////////////////////////////////////////////// //////////////////////////////////////////////////////////////////
    
    override func touchesBegan(_ touches:
        Set<UITouch>, with event: UIEvent?) {
        counter = resetCounter(counter: counter)
        for touch in touches {
            let location = touch.location(in: self)
            
            if let deck = atPoint(location) as? Deck {
                if touch.tapCount == 1 && gameOver == false{
                    
                    
                    let redraw = SKAction.run({
                        //reshuffle table & move to deck
                        for card in self.dealtCards{
                            if card.selected == true {
                                card.Unhighlight()
                            }
                            if card.redrawing == true {
                                card.isUserInteractionEnabled = true
                                self.counter += 0.3
                                let card = deck.redraw(card: card, deckLocation: deck.position,counter: self.counter )
                                card.flip(counter: self.counter)
                            }
                        }
                        
                        //deal new table & reposition
                        var position = 0
                        for card in self.dealtCards{
                            if card.redrawing == true {
                                self.counter += 0.3
                                let card = deck.reposition(card: card, cardPosition: self.cardPosition[position], hand: self.playerHand ,counter: self.counter)
                                position += 1
                                card.flip(counter: self.counter)
                            }
                        }
                        
                    })
                    
                    let reEnableTouch = SKAction.run({
                        for card in self.dealtCards{
                            if card.redrawing == true {
                                card.isUserInteractionEnabled = false
                            }
                        }
                    })
                    let delayAction = SKAction.wait(forDuration: 0.5)
                    self.run(SKAction.sequence([redraw, delayAction]),completion: {self.run(reEnableTouch)})
                    
                }
                counter = resetCounter(counter: counter)
                deck.addGlowtoHand()
            }
            
            
            if let card = atPoint(location) as? Card {
                if card.isPlayer == true {
                    var touches = touch.tapCount
                    switch touches {
                        
                    case 1:
                        let cardTableLocation = card.position
                        var switching = false
                        var handLocation : CGPoint? = nil
                        var handRotation : CGFloat? = nil
                        var handPlacement : CGFloat? = nil
                        let redrawing = card.redrawing
                        for card in dealtCards{
                            if card.selected == true && card.redrawing == true {
                                card.Unhighlight()
                            }
                            else if redrawing == false && card.selected == true && card.redrawing == false{
                                card.Unhighlight()
                                
                            }else if redrawing == true && card.selected == true && card.redrawing == false{
                                handLocation = card.position
                                handRotation = card.zRotation
                                handPlacement = card.zPosition
                                card.swapToTable(tablePosition: cardTableLocation)
                                playerHand = playerHand.filter {$0 != card}
                                switching = true
                            }
                            
                        }
                        if switching == true {
                            card.swapToHand(handPosition: handLocation!, cardRotation: handRotation!, cardPlacement: handPlacement!)
                            playerHand.append(card)
                            checkHand(playerHand: playerHand, isPlayer: true)
                        }else{
                            card.Highlight()
                        }
                        
                        
                        break
                        
                    case 2:
                        
                        for card in dealtCards{
                            if card.selected == true && card.redrawing == true {
                                //isUserInteractionEnabled is backwards in this case
                                card.isUserInteractionEnabled = true
                                let Zposition = CGFloat(playerHand.count)
                                card.zPosition = Zposition
                                let rotateAction = SKAction.rotate(toAngle: handPosition.cardRotation[playerHand.count], duration: 0.2)
                                let delayAction = SKAction.wait(forDuration: 0.1)
                                let moveToward = SKAction.move(to: handPosition.cardPostion[playerHand.count], duration: 0.2 )
                                let bloomFlash = SKAction.run({
                                    card.addBloomtoHand()
                                })
                                let glowFlash = SKAction.run({
                                    card.addGlowtoHand()
                                })
                                let highlightFlash = SKAction.group([bloomFlash,glowFlash])
                                
                                let checkRadialHighlight = SKAction.run({
                                    self.checkforRadialHighlight(playerHand: self.playerHand, isPlayer: true)
                                })
                                
                                card.run(SKAction.sequence([rotateAction,delayAction, moveToward,highlightFlash,checkRadialHighlight]), completion: {() -> Void in card.isUserInteractionEnabled = false})
                                card.Unhighlight()
                                card.redrawing = false
                                card.selected = false
                                playerHand.append(card)
                                checkHand(playerHand: playerHand, isPlayer: true)
                            }
                        }
                        break
                        
                    default:
                        touches = 0
                        
                    }
                }
            }
            
        }
    }
    
    
    func checkforRadialHighlight (playerHand: [Card], isPlayer : Bool) {
        if playerHand.count == 5 {
            if isPlayer == true{
                self.highlightCornerNode?.activateHighlightBottom()
            }
            else {
                self.highlightCornerNode?.activateHighlightTop()
            }
        }
        
        
    }
    
    func revealTable(card: Card, cardPosition: CGPoint, counter: Double) -> Card {
        firstTable = card
        let firstCard = 0.0
        if firstTable.redrawing == true && firstTable.faceDown {
            let delayAction = SKAction.wait(forDuration: 0.5 * counter)
            let firstMove = SKAction.wait(forDuration: 0.5 * firstCard)
            let movetoTable = SKAction.move(to: cardPosition, duration: 0.2)
            let firstSequence = SKAction.sequence([firstMove, movetoTable])
            let moveSequence = SKAction.sequence([delayAction, movetoTable])
            if counter == 0.3 {
                firstTable.run(firstSequence)
            }
            else {
                firstTable.run(moveSequence)
            }
        }
        return firstTable
    }
    
    
    
    func resetCounter (counter: Double) -> Double {
        let counter = 0.0
        return counter
    }
 //_______________________________________________////////////////////////////////////////////////////////////////////
    
    func checkHand (playerHand: [Card], isPlayer: Bool) {
        
        let checkHand :[Card] = playerHand
        let size = checkHand.count
        if size == 10 {
            checkGameOver(playerHand: checkHand, isPlayer: isPlayer)
        }
    }
    
    func checkGameOver (playerHand: [Card],isPlayer: Bool) {
        let checkHand :[Card] = playerHand
        counter = 0
        let typeofCard = checkHand[0].cardType
        for card in checkHand {
            if card.cardType == typeofCard {
                counter += 1
            }
        }
        if counter == 10{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.removeAction(forKey: "player2finalAction")
                self.callGameOver( isPlayer: isPlayer)
                
            }
        }
    }
    
    func callGameOver (isPlayer: Bool) {
        
        if isPlayer == true{
            self.removeAllActions()
            self.preventTouchActions()
            self.gameOver = true
            
            let victoryPlate = gameOverMenu(gameOverMenu: victoryScreen, mainMenu: mainMenu, playAgain: playAgain, mainMenuPressed: mainMenuPressed, playAgainPressed: playAgainPressed, currentScene: self)
            victoryPlate.position = CGPoint(x: -200, y: 360)
            let victoryPlateSlidePosition = CGPoint(x: 220, y: 360)
            let victoryPlateStartPosition = CGPoint(x: 200, y: 360)
            victoryPlate.size = CGSize(width: 300, height: 200)
            victoryPlate.isUserInteractionEnabled = true
            addChild(victoryPlate)
            victoryPlate.zPosition = 11
              victoryPlate.movetoScreen(slidePosition: victoryPlateSlidePosition, startPosition: victoryPlateStartPosition)
        }
        else {
            self.removeAllActions()
            self.preventTouchActions()
            self.gameOver = true
            
            let defeatPlate = gameOverMenu(gameOverMenu: defeatScreen, mainMenu: mainMenu, playAgain: playAgain, mainMenuPressed: mainMenuPressed, playAgainPressed: playAgainPressed, currentScene: self)
            defeatPlate.position = CGPoint(x: -200, y: 360)
            let defeatPlateSlidePosition = CGPoint(x: 220, y: 360)
            let defeatPlateStartPosition = CGPoint(x: 200, y: 360)
            defeatPlate.size = CGSize(width: 300, height: 200)
            defeatPlate.isUserInteractionEnabled = true
            addChild(defeatPlate)
            defeatPlate.zPosition = 11
            defeatPlate.movetoScreen(slidePosition: defeatPlateSlidePosition, startPosition: defeatPlateStartPosition)
        }
    }
//_______________________________________________////////////////////////////////////////////////////////////////////
    
    
    func flipFirstDeal(card: Card, counter: Double){
        card.isPaused = false
        if card.faceDown == true {
            card.flip(counter: counter)
        }
    }
    
    func preventTouchActions () {
            for card in self.dealtCards {
                card.isUserInteractionEnabled = true
            }
    }
    
    func player2Logic (regularTurn: SKAction, lastTurn: SKAction, playerhand: [Card]) {
        
        if playerhand.count != 9 {
            self.run(lastTurn, withKey: "player2regularAction")
            }
        
        if playerhand.count == 9 {
            self.removeAction(forKey: "player2regularAction")
            self.run(regularTurn, withKey: "player2finalAction")
            
        }
        
    }

    /* public func pointsOnCircleFor(numberOfPoints: UInt, centerX: CGFloat, centerY: CGFloat, radius: CGFloat, precision: UInt = 2) -> [CGPoint] {
        var points = [CGPoint]()
        let angle = CGFloat(Double.pi) / CGFloat(numberOfPoints) * 2.0
        let p = CGFloat(pow(10.0, Double(precision)))
        
        for i in 0..<numberOfPoints {
            let x = centerX - radius * cos(angle * CGFloat(i))
            let roundedX = Double(round(p * x)) / Double(p)
            let y = centerY - radius * sin(angle * CGFloat(i))
            let roundedY = Double(round(p * y)) / Double(p)
            points.append(CGPoint(x: roundedX, y: roundedY))
        }
        
        print(points)
        return points
    }*/
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

extension SKSpriteNode {
    
    func addGlowInit(radius: Float = 5){
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": radius])
        //effectNode.zPosition = -1
        let delay = SKAction.wait(forDuration: 0.25)
        let fadeIn = SKAction.fadeIn(withDuration: 3.0)
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let slowGlow = SKAction.sequence([delay,fadeIn,fadeOut])
        effectNode.run(slowGlow)
    }
    
}




