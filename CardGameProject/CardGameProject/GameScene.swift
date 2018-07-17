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
    
    var firstTable = Card(cardType: .random)
    var dealtCards: [Card] = []
    var cardPosition: [CGPoint] = []
    var playerHand :[Card] = []
    var counter = 0.5
    var xCord = 30
    var count = 0

    
    override func didMove(to view: SKView) {
        let bg = SKSpriteNode(imageNamed: "bg_blank")
        bg.anchorPoint = CGPoint.zero
        bg.position = CGPoint.zero
        addChild(bg)
        
        let deckTexture = SKTexture(imageNamed: "card_back")
        let handTexture = SKTexture(imageNamed: "card_placer")
        

       
        let reshuffle_center = SKSpriteNode(imageNamed: "reshuffle_texture")
        reshuffle_center.position = CGPoint(x: 200, y: 480)
        addChild(reshuffle_center)
        
        //deck------------------------------
        let deck = Deck(Decktexture: deckTexture)
        deck.position = CGPoint(x: 360, y: 360)
        deck.size = CGSize(width: 50, height: 70)
        addChild(deck)
        
        //hand------------------------------
        let hand1 = Hand(handTexture: handTexture)
        hand1.position = CGPoint(x: 120, y: 150)
        hand1.size = CGSize(width: 45.0, height: 44.0)
        hand1.zRotation = 3 * CGFloat.pi / 2 + CGFloat.pi
        addChild(hand1)
        
        let hand2 = Hand(handTexture: handTexture)
        hand2.position = CGPoint(x: 135.279, y: 102.977)
        hand2.size = CGSize(width: 45.0, height: 44.0)
        hand2.zRotation =  CGFloat.pi / 2 + 7 * CGFloat.pi / 6
        addChild(hand2)
        
        let hand3 = Hand(handTexture: handTexture)
        hand3.position = CGPoint(x: 175.279, y: 73.915)
        hand3.size = CGSize(width: 45.0, height: 44.0)
        hand3.zRotation = 4 * CGFloat.pi / 3
        addChild(hand3)
        
        let hand4 = Hand(handTexture: handTexture)
        hand4.position = CGPoint(x: 224.721, y: 73.915)
        hand4.size = CGSize(width: 45.0, height: 44.0)
        hand4.zRotation = 5 * CGFloat.pi / 3
        addChild(hand4)
        
        let hand5 = Hand(handTexture: handTexture)
        hand5.position = CGPoint(x: 264.721, y: 102.977)
        hand5.size = CGSize(width: 45.0, height: 44.0)
        hand5.zRotation = 11 * CGFloat.pi / 6
        addChild(hand5)
        
        let hand6 = Hand(handTexture: handTexture)
        hand6.position = CGPoint(x: 280.0, y: 150)
        hand6.size = CGSize(width: 45.0, height: 44.0)
        hand6.zRotation = 2 * CGFloat.pi
        addChild(hand6)
        
        let hand7 = Hand(handTexture: handTexture)
        hand7.position = CGPoint(x: 264.721, y: 197.023)
        hand7.size = CGSize(width: 45.0, height: 44.0)
        hand7.zRotation = CGFloat.pi / 6
        addChild(hand7)
        
        let hand8 = Hand(handTexture: handTexture)
        hand8.position = CGPoint(x: 224.721, y: 226.085)
        hand8.size = CGSize(width: 45.0, height: 44.0)
        hand8.zRotation = CGFloat.pi / 3
        addChild(hand8)
        
        let hand9 = Hand(handTexture: handTexture)
        hand9.position = CGPoint(x: 175.279, y: 226.085)
        hand9.size = CGSize(width: 45.0, height: 44.0)
        hand9.zRotation = 2 * CGFloat.pi / 3
        addChild(hand9)
        
        let hand10 = Hand(handTexture: handTexture)
        hand10.position = CGPoint(x: 135.279, y: 197.023)
        hand10.size = CGSize(width: 45.0, height: 44.0)
        hand10.zRotation = 5 * CGFloat.pi / 6
        addChild(hand10)
        

        
        let card_placer_tail2 = SKSpriteNode(imageNamed: "Rcard_placer_tail")
        card_placer_tail2.position = CGPoint(x:340, y: 180)
        card_placer_tail2.size = CGSize(width: 120, height: 65.0)
        card_placer_tail2.zRotation = 3 * CGFloat.pi / 2
        addChild(card_placer_tail2)
  
        
        
        let card_placer_tail1 = SKSpriteNode(imageNamed: "Lcard_placer_tail")
        card_placer_tail1.position = CGPoint(x:60, y: 180)
        card_placer_tail1.size = CGSize(width: 120, height: 65)
        card_placer_tail1.zRotation = CGFloat.pi / 2
        addChild(card_placer_tail1)
     
        
        //table------------------------------
   
        
        let cardDrawn1 = Card(cardType: .random)
        cardDrawn1.position = CGPoint(x: 50, y: 400)
        cardPosition.append(cardDrawn1.position)
        cardDrawn1.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn1)
        dealtCards.append(cardDrawn1)
        cardDrawn1.position = deck.position
        
        
        let cardDrawn2 = Card(cardType: .random)
        cardDrawn2.position = CGPoint(x: 110, y: 400)
        cardPosition.append(cardDrawn2.position)
        cardDrawn2.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn2)
        dealtCards.append(cardDrawn2)
        cardDrawn2.position = deck.position
        
  
        
        let cardDrawn3 = Card(cardType: .random)
        cardDrawn3.position = CGPoint(x: 170, y: 400)
        cardPosition.append(cardDrawn3.position)
        cardDrawn3.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn3)
        dealtCards.append(cardDrawn3)
        cardDrawn3.position = deck.position
       
        
        let cardDrawn4 = Card(cardType: .random)
        cardDrawn4.position = CGPoint(x: 230, y: 400)
        cardPosition.append(cardDrawn4.position)
        cardDrawn4.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn4)
        dealtCards.append(cardDrawn4)
        cardDrawn4.position = deck.position
       
        
        let cardDrawn5 = Card(cardType: .random)
        cardDrawn5.position = CGPoint(x: 290, y: 400)
        cardPosition.append(cardDrawn5.position)
        cardDrawn5.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn5)
        dealtCards.append(cardDrawn5)
        cardDrawn5.position = deck.position
        

        
        
        //second row
        
        let cardDrawn6 = Card(cardType: .random)
        cardDrawn6.position = CGPoint(x: 50, y: 320)
        cardPosition.append(cardDrawn6.position)
        cardDrawn6.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn6)
        dealtCards.append(cardDrawn6)
        cardDrawn6.position = deck.position
        
        let cardDrawn7 = Card(cardType: .random)
        cardDrawn7.position = CGPoint(x: 110, y: 320)
        cardPosition.append(cardDrawn7.position)
        cardDrawn7.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn7)
        dealtCards.append(cardDrawn7)
        cardDrawn7.position = deck.position
        
        let cardDrawn8 = Card(cardType: .random)
        cardDrawn8.position = CGPoint(x: 170, y: 320)
        cardPosition.append(cardDrawn8.position)
        cardDrawn8.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn8)
        dealtCards.append(cardDrawn8)
        cardDrawn8.position = deck.position

        
        let cardDrawn9 = Card(cardType: .random)
        cardDrawn9.position = CGPoint(x: 230, y: 320)
        cardPosition.append(cardDrawn9.position)
        cardDrawn9.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn9)
        dealtCards.append(cardDrawn9)
        cardDrawn9.position = deck.position

        
        let cardDrawn10 = Card(cardType: .random)
        cardDrawn10.position = CGPoint(x: 290, y: 320)
        cardPosition.append(cardDrawn10.position)
        cardDrawn10.size = CGSize(width: 50, height: 70)
        addChild(cardDrawn10)
        dealtCards.append(cardDrawn10)
        cardDrawn10.position = deck.position
        
        //test card
        /*
        let test1 = Card(cardType: .random)
        test1.position = CGPoint(x: 123.915, y: 424.721)
        test1.size = CGSize(width: 50, height: 70)
        test1.zRotation = (3 * CGFloat.pi / 2) + 5 * CGFloat.pi / 6
        addChild(test1)
       
        let test2 = Card(cardType: .random)
        test2.position = CGPoint(x: 135.279, y: 447.023)
        test2.size = CGSize(width: 50, height: 70)
        test2.zRotation = (3 * CGFloat.pi / 2) + 3 * CGFloat.pi / 4
        addChild(test2)
        
        let test3 = Card(cardType: .random)
        test3.position = CGPoint(x: 152.977, y: 464.721)
        test3.size = CGSize(width: 50, height: 70)
        test3.zRotation = (3 * CGFloat.pi / 2) + 2 * CGFloat.pi  / 3
        addChild(test3)
        
        let test4 = Card(cardType: .random)
        test4.position = CGPoint(x: 175.279, y: 476.085)
        test4.size = CGSize(width: 50, height: 70)
        test4.zRotation = (3 * CGFloat.pi / 2) + 7 * CGFloat.pi / 12
        addChild(test4)
        
        let test5 = Card(cardType: .random)
        test5.position = CGPoint(x: 200, y: 480)
        test5.size = CGSize(width: 50, height: 70)
         test5.zRotation = (3 * CGFloat.pi / 2) + CGFloat.pi / 2
        addChild(test5)
        
        let test6 = Card(cardType: .random)
        test6.position = CGPoint(x: 224.721, y: 476.085)
        test6.size = CGSize(width: 50, height: 70)
         test6.zRotation = (3 * CGFloat.pi / 2) + 5 * CGFloat.pi / 12
        addChild(test6)
        
        let test7 = Card(cardType: .random)
        test7.position = CGPoint(x: 247.023, y: 464.721)
        test7.size = CGSize(width: 50, height: 70)
         test7.zRotation = (3 * CGFloat.pi / 2) + CGFloat.pi / 3
        addChild(test7)
        
        let test8 = Card(cardType: .random)
        test8.position = CGPoint(x: 264.721, y: 447.023)
        test8.size = CGSize(width: 50, height: 70)
         test8.zRotation = (3 * CGFloat.pi / 2) + CGFloat.pi / 4
        addChild(test8)
        
        let test9 = Card(cardType: .random)
        test9.position = CGPoint(x: 276.085, y: 424.721)
        test9.size = CGSize(width: 50, height: 70)
         test9.zRotation = (3 * CGFloat.pi / 2) + CGFloat.pi / 6
        addChild(test9)
        
        let test10 = Card(cardType: .random)
        test10.position = CGPoint(x: 280, y: 400)
        test10.size = CGSize(width: 50, height: 70)
         test10.zRotation = (3 * CGFloat.pi / 2) + CGFloat.pi / 12
        addChild(test10)
 
        */
 
        counter = resetCounter(counter: counter)
    }
    
    override func sceneDidLoad() {
        

        
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
        }
        //self.pointsOnCircleFor(numberOfPoints: 20, centerX: 200, centerY: 400, radius: 80)
        counter = resetCounter(counter: counter)
    }
    
   
    //////////////////////////////////////////////////////////////////
    
    override func touchesBegan(_ touches:
        Set<UITouch>, with event: UIEvent?) {
        counter = resetCounter(counter: counter)
        for touch in touches {
            let location = touch.location(in: self)
            if let deck = atPoint(location) as? Deck {
                if touch.tapCount == 1 {
                    
                    //reshuffle cards & move to deck
                    
                    for card in dealtCards{
                        if card.redrawing == true {
                            counter += 0.3
                            let card = deck.redraw(card: card, deckLocation: deck.position, counter: counter )
                            card.flip(counter: counter)
                        }
                    }
                    
                    //deal new hand & reposition
                    var position = 0
                    for card in dealtCards{
                        if card.redrawing == true {
                            counter += 0.3
                            let card = deck.reposition(card: card, cardPosition: cardPosition[position], counter: counter)
                            position += 1
                            card.flip(counter: counter)
                        }
                    }
                }
                counter = resetCounter(counter: counter)
            }
            
            if let card = atPoint(location) as? Card {
                if touch.tapCount == 1 {
                    let cardTableLocation = card.position
                    var switching = false
                    var handLocation : CGPoint? = nil
                    for card in dealtCards{
                        if card.selected == true && card.redrawing == true {
                            card.Unhighlight()
                        } else if card.redrawing == false && card.selected == true{
                            handLocation = card.position
                            card.swapToTable(tablePosition: cardTableLocation)
                            playerHand = playerHand.filter {$0 != card}
                            switching = true
                        }
                        
                    }
                    if switching == true {
                        card.swapToHand(handPosition: handLocation!)
                        playerHand.append(card)
                        checkHand(playerHand: playerHand)
                    }else{
                        card.Highlight()
                    }
                }
            }
            
            if let hand = atPoint(location) as? Hand {
                if touch.tapCount == 1 && hand.occupied == false {
                    
                    for card in dealtCards{
                        if card.selected == true && card.redrawing == true {
                            let card = hand.addtoHand(card: card)
                            card.movetoHand(handPosition: hand.position)
                            playerHand.append(card)
                            checkHand(playerHand: playerHand)
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
    
    func checkHand (playerHand: [Card]) {
        let checkHand :[Card] = playerHand
        let size = checkHand.count
        if size == 10 {
            checkGameOver(playerHand: checkHand)
        }
    }
    
    func checkGameOver (playerHand: [Card]) {
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
                self.callGameOver()
                
            }
        }
    }
    
    func callGameOver () {
        let reveal =  SKTransition.reveal(with: .down, duration: 0.5)
        let gameOverScene = GameOverScene(size: self.size, won: true)
        self.view?.presentScene(gameOverScene, transition: reveal)
    }
    
    func flipFirstDeal(card: Card, counter: Double){
        card.isPaused = false
        if card.faceDown == true {
            card.flip(counter: counter)
        }
    }
    
    public func pointsOnCircleFor(numberOfPoints: UInt, centerX: CGFloat, centerY: CGFloat, radius: CGFloat, precision: UInt = 2) -> [CGPoint] {
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
    }
}




