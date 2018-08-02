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
    var counter = 0.0
    var opCounter = 0.0
    var count = 0
    let handPosition = cardHand(player: .player1)
    let player2Position = cardHand(player: .player2)
    let player2Texture = SKTexture(imageNamed: "player_2")
    let cardInitPosition = CGPoint(x: 400, y: 670)
    let cardMovePosition = CGPoint(x: 350, y: 650)
    var player2Hand: [Card] = []
    var player2Table: [Card] = []
 
    
    
    override func didMove(to view: SKView) {
        let bg = SKSpriteNode(imageNamed: "bg_blank")
        bg.anchorPoint = CGPoint.zero
        bg.position = CGPoint.zero
        addChild(bg)
        
        let deckTexture = SKTexture(imageNamed: "card_back")

        let player2Node = SKSpriteNode(imageNamed: "player_2")
        player2Node.position = CGPoint(x: 200, y: 720)
        player2Node.size = CGSize(width: 100, height: 30)
        addChild(player2Node)
 
        let reshuffle_center = SKSpriteNode(imageNamed: "reshuffle_texture")
        reshuffle_center.position = CGPoint(x: 200, y: 480)
        reshuffle_center.zPosition = -1.0
        addChild(reshuffle_center)
        
        //deck------------------------------
        let deck = Deck(Decktexture: deckTexture)
        deck.position = CGPoint(x: 360, y: 360)
        deck.size = CGSize(width: 50, height: 70)
        addChild(deck)
        
        //hand------------------------------
        
        let card_placer_tail2 = SKSpriteNode(imageNamed: "Rcard_placer_tail")
        card_placer_tail2.position = CGPoint(x:360, y: 180)
        card_placer_tail2.size = CGSize(width: 150, height: 65.0)
        card_placer_tail2.zRotation = 3 * CGFloat.pi / 2
        addChild(card_placer_tail2)
  
        
        
        let card_placer_tail1 = SKSpriteNode(imageNamed: "Lcard_placer_tail")
        card_placer_tail1.position = CGPoint(x:40, y: 180)
        card_placer_tail1.size = CGSize(width: 150, height: 65)
        card_placer_tail1.zRotation = CGFloat.pi / 2
        addChild(card_placer_tail1)
     
        
        //table------------------------------
   
        
        let cardDrawn1 = Card(cardType: .random, isPlayer: true)
        cardDrawn1.position = CGPoint(x: 50, y: 400)
        cardPosition.append(cardDrawn1.position)
        cardDrawn1.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn1)
        dealtCards.append(cardDrawn1)
        cardDrawn1.position = deck.position
        
        
        let cardDrawn2 = Card(cardType: .random, isPlayer: true)
        cardDrawn2.position = CGPoint(x: 110, y: 400)
        cardPosition.append(cardDrawn2.position)
        cardDrawn2.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn2)
        dealtCards.append(cardDrawn2)
        cardDrawn2.position = deck.position
        
  
        
        let cardDrawn3 = Card(cardType: .random, isPlayer: true)
        cardDrawn3.position = CGPoint(x: 170, y: 400)
        cardPosition.append(cardDrawn3.position)
        cardDrawn3.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn3)
        dealtCards.append(cardDrawn3)
        cardDrawn3.position = deck.position
       
        
        let cardDrawn4 = Card(cardType: .random, isPlayer: true)
        cardDrawn4.position = CGPoint(x: 230, y: 400)
        cardPosition.append(cardDrawn4.position)
        cardDrawn4.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn4)
        dealtCards.append(cardDrawn4)
        cardDrawn4.position = deck.position
       
        
        let cardDrawn5 = Card(cardType: .random, isPlayer: true)
        cardDrawn5.position = CGPoint(x: 290, y: 400)
        cardPosition.append(cardDrawn5.position)
        cardDrawn5.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn5)
        dealtCards.append(cardDrawn5)
        cardDrawn5.position = deck.position
        
        
        //second row
        
        let cardDrawn6 = Card(cardType: .random, isPlayer: true)
        cardDrawn6.position = CGPoint(x: 50, y: 320)
        cardPosition.append(cardDrawn6.position)
        cardDrawn6.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn6)
        dealtCards.append(cardDrawn6)
        cardDrawn6.position = deck.position
        
        let cardDrawn7 = Card(cardType: .random, isPlayer: true)
        cardDrawn7.position = CGPoint(x: 110, y: 320)
        cardPosition.append(cardDrawn7.position)
        cardDrawn7.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn7)
        dealtCards.append(cardDrawn7)
        cardDrawn7.position = deck.position
        
        let cardDrawn8 = Card(cardType: .random, isPlayer: true)
        cardDrawn8.position = CGPoint(x: 170, y: 320)
        cardPosition.append(cardDrawn8.position)
        cardDrawn8.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn8)
        dealtCards.append(cardDrawn8)
        cardDrawn8.position = deck.position

        
        let cardDrawn9 = Card(cardType: .random, isPlayer: true)
        cardDrawn9.position = CGPoint(x: 230, y: 320)
        cardPosition.append(cardDrawn9.position)
        cardDrawn9.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn9)
        dealtCards.append(cardDrawn9)
        cardDrawn9.position = deck.position

        
        let cardDrawn10 = Card(cardType: .random, isPlayer: true)
        cardDrawn10.position = CGPoint(x: 290, y: 320)
        cardPosition.append(cardDrawn10.position)
        cardDrawn10.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn10)
        dealtCards.append(cardDrawn10)
        cardDrawn10.position = deck.position
        
       ///////////////////////////////////////////////////////
        
        
        let opponentCard1 = Card(cardType: .random, isPlayer: false)
        opponentCard1.position = cardInitPosition
        opponentCard1.size = CGSize(width: 50, height: 70)
        addChild(opponentCard1)
        player2Table.append(opponentCard1)
        
        let opponentCard2 = Card(cardType: .random, isPlayer: false)
        opponentCard2.position = cardInitPosition
        opponentCard2.size = CGSize(width: 50, height: 70)
        addChild(opponentCard2)
        player2Table.append(opponentCard2)
        
        let opponentCard3 = Card(cardType: .random, isPlayer: false)
        opponentCard3.position = cardInitPosition
        opponentCard3.size = CGSize(width: 50, height: 70)
        addChild(opponentCard3)
        player2Table.append(opponentCard3)
        
        let opponentCard4 = Card(cardType: .random, isPlayer: false)
        opponentCard4.position = cardInitPosition
        opponentCard4.size = CGSize(width: 50, height: 70)
        addChild(opponentCard4)
        player2Table.append(opponentCard4)
        
        let opponentCard5 = Card(cardType: .random, isPlayer: false)
        opponentCard5.position = cardInitPosition
        opponentCard5.size = CGSize(width: 50, height: 70)
        addChild(opponentCard5)
        player2Table.append(opponentCard5)
        
        let opponentCard6 = Card(cardType: .random, isPlayer: false)
        opponentCard6.position = cardInitPosition
        opponentCard6.size = CGSize(width: 50, height: 70)
        addChild(opponentCard6)
        player2Table.append(opponentCard6)
        
        let opponentCard7 = Card(cardType: .random, isPlayer: false)
        opponentCard7.position = cardInitPosition
        opponentCard7.size = CGSize(width: 50, height: 70)
        addChild(opponentCard7)
        player2Table.append(opponentCard7)
        
        let opponentCard8 = Card(cardType: .random, isPlayer: false)
        opponentCard8.position = cardInitPosition
        opponentCard8.size = CGSize(width: 50, height: 70)
        addChild(opponentCard8)
        player2Table.append(opponentCard8)
        
        let opponentCard9 = Card(cardType: .random, isPlayer: false)
        opponentCard9.position = cardInitPosition
        opponentCard9.size = CGSize(width: 50, height: 70)
        addChild(opponentCard9)
        player2Table.append(opponentCard9)
        
        let opponentCard10 = Card(cardType: .random, isPlayer: false)
        opponentCard10.position = cardInitPosition
        opponentCard10.size = CGSize(width: 50, height: 70)
        addChild(opponentCard10)
        player2Table.append(opponentCard10)
      
 
        counter = resetCounter(counter: counter)
    }
    
    override func sceneDidLoad() {

        
        let player2 = Opponent(opTexture: player2Texture)
        player2.position = CGPoint(x: 200, y: 720)
        player2.size = CGSize(width: 100, height: 30)
        addChild(player2)
       
     
        //let player2handType = player2.determineCardType(playerHand: self.player2Table)
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
            let moveTo = CGPoint(x: 350, y: 600)
            let moveHere = CGPoint(x: 350, y:560)
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
                    
                    let moveSequence = SKAction.sequence([delayAction,rotateAction,delayAction, move2Hand])
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
            
            for card in self.player2Table {
                 self.opCounter += 0.3
                 let moveHere = SKAction.move(to:moveHere, duration: 0.2)
                 let delayAction = SKAction.wait(forDuration: 0.5 * self.opCounter)
                 let moveSequence = SKAction.sequence([delayAction, moveHere])
                 card.run(moveSequence)
                 card.flip(counter: self.opCounter)
            }
            
      
        })
        
    
        

        let delayAction = SKAction.wait(forDuration: 2.0)
        let tabletoDeck = SKAction.wait(forDuration: 2.5)
        //let nextTurn = SKAction.wait(forDuration: self.opCounter + 3.5)
        let player2FullTurn = SKAction.sequence([tabletoDeck,player2Action])
        let player2Repeat = SKAction.repeatForever(player2FullTurn)
        
        
        let startgameSequence = SKAction.sequence([dealTable, delayAction, player2Repeat])
        
        self.run(startgameSequence)
      
        
        
        /////////////////////////////////////////////////////
      
  
        //self.pointsOnCircleFor(numberOfPoints: 20, centerX: 200, centerY: 680, radius: 80)
    }
    
    
    //////////////////////////////////////////////////////////////////
    
    override func touchesBegan(_ touches:
        Set<UITouch>, with event: UIEvent?) {
        counter = resetCounter(counter: counter)
        for touch in touches {
            let location = touch.location(in: self)
            if let deck = atPoint(location) as? Deck {
                if touch.tapCount == 1 {
                    
                    //reshuffle table & move to deck
                    
                    for card in dealtCards{
                        if card.selected == true {
                            card.Unhighlight()
                        }
                        if card.redrawing == true {
                            counter += 0.3
                            let card = deck.redraw(card: card, deckLocation: deck.position,counter: counter )
                            card.flip(counter: counter)
                        }
                    }
                    
                    //deal new table & reposition
                    var position = 0
                    for card in dealtCards{
                        if card.redrawing == true {
                            counter += 0.3
                            let card = deck.reposition(card: card, cardPosition: cardPosition[position], hand: playerHand ,counter: counter)
                            position += 1
                            card.flip(counter: counter)
                        }
                    }
                }
                counter = resetCounter(counter: counter)
            }
            
            if let card = atPoint(location) as? Card {
                if card.isPlayer == true {
                    if touch.tapCount == 1 {
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
                    }
                    //double tap card
                    if touch.tapCount == 2 {
                        for card in dealtCards{
                            if card.selected == true && card.redrawing == true {
                                let Zposition = CGFloat(playerHand.count)
                                card.zPosition = Zposition
                                let rotateAction = SKAction.rotate(toAngle: handPosition.cardRotation[playerHand.count], duration: 0.2)
                                let delayAction = SKAction.wait(forDuration: 0.1)
                                let moveToward = SKAction.move(to: handPosition.cardPostion[playerHand.count], duration: 0.2 )
                                let moveSequence = SKAction.sequence([rotateAction,delayAction, moveToward])
                                card.run(moveSequence)
                                card.Unhighlight()
                                card.redrawing = false
                                card.selected = false
                                playerHand.append(card)
                                checkHand(playerHand: playerHand, isPlayer: true)
                            }
                        }
                    }
                }
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
 //_______________________________________________//
    
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
                self.callGameOver( isPlayer: isPlayer)
                
            }
        }
    }
    
    func callGameOver (isPlayer: Bool) {
        
        if isPlayer == true{
            let transition = SKTransition.fade(withDuration: 1.0)
            let gameOverScene = GameOverScene(size: self.size, won: true)
            self.view?.presentScene(gameOverScene, transition: transition)
        }
        else {
            let transition = SKTransition.fade(withDuration: 1.0)
            let gameOverScene = GameOverScene(size: self.size, won: false)
            self.view?.presentScene(gameOverScene, transition: transition)
        }
    }
//_______________________________________________//
    
    
    func flipFirstDeal(card: Card, counter: Double){
        card.isPaused = false
        if card.faceDown == true {
            card.flip(counter: counter)
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




