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
        deck.position = CGPoint(x: 200, y: 490)
        addChild(deck)
        
        //hand------------------------------
        let hand1 = Hand(handTexture: handTexture)
        hand1.position = CGPoint(x: 30, y: 80)
        hand1.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand1)
        
        let hand2 = Hand(handTexture: handTexture)
        hand2.position = CGPoint(x: 80, y: 80)
        hand2.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand2)
        
        let hand3 = Hand(handTexture: handTexture)
        hand3.position = CGPoint(x: 130, y: 80)
        hand3.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand3)
        
        let hand4 = Hand(handTexture: handTexture)
        hand4.position = CGPoint(x: 180, y: 80)
        hand4.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand4)
        
        let hand5 = Hand(handTexture: handTexture)
        hand5.position = CGPoint(x: 230, y: 80)
        hand5.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand5)
        
        let hand6 = Hand(handTexture: handTexture)
        hand6.position = CGPoint(x: 180, y: 30)
        hand6.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand6)
        
        let hand7 = Hand(handTexture: handTexture)
        hand7.position = CGPoint(x: 230, y: 30)
        hand7.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand7)
        
        let hand8 = Hand(handTexture: handTexture)
        hand8.position = CGPoint(x: 280, y: 30)
        hand8.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand8)
        
        let hand9 = Hand(handTexture: handTexture)
        hand9.position = CGPoint(x: 330, y: 30)
        hand9.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand9)
        
        let hand10 = Hand(handTexture: handTexture)
        hand10.position = CGPoint(x: 380, y: 30)
        hand10.size = CGSize(width: 45.0, height: 44.0)
        addChild(hand10)
        
      
        let card_placer_tail2 = SKSpriteNode(imageNamed: "Rcard_placer_tail")
        card_placer_tail2.position = CGPoint(x:330, y:80)
        card_placer_tail2.size = CGSize(width: 150, height: 45.0)
        addChild(card_placer_tail2)
        
        let card_placer_tail1 = SKSpriteNode(imageNamed: "Lcard_placer_tail")
        card_placer_tail1.position = CGPoint(x:80, y:30)
        card_placer_tail1.size = CGSize(width: 150, height: 45.0)
        addChild(card_placer_tail1)
        
        //table------------------------------
   
        
        let cardDrawn1 = Card(cardType: .random)
        cardDrawn1.position = CGPoint(x: 50, y: 300)
        cardPosition.append(cardDrawn1.position)
        addChild(cardDrawn1)
        dealtCards.append(cardDrawn1)
        cardDrawn1.position = deck.position
        
        let cardDrawn2 = Card(cardType: .random)
        cardDrawn2.position = CGPoint(x: 130, y: 300)
        cardPosition.append(cardDrawn2.position)
        addChild(cardDrawn2)
        dealtCards.append(cardDrawn2)
        cardDrawn2.position = deck.position
        
  
        
        let cardDrawn3 = Card(cardType: .random)
        cardDrawn3.position = CGPoint(x: 210, y: 300)
        cardPosition.append(cardDrawn3.position)
        addChild(cardDrawn3)
        dealtCards.append(cardDrawn3)
        cardDrawn3.position = deck.position
       
        
        let cardDrawn4 = Card(cardType: .random)
        cardDrawn4.position = CGPoint(x: 290, y: 300)
        cardPosition.append(cardDrawn4.position)
        addChild(cardDrawn4)
        dealtCards.append(cardDrawn4)
        cardDrawn4.position = deck.position
       
        
        let cardDrawn5 = Card(cardType: .random)
        cardDrawn5.position = CGPoint(x: 370, y: 300)
        cardPosition.append(cardDrawn5.position)
        addChild(cardDrawn5)
        dealtCards.append(cardDrawn5)
        cardDrawn5.position = deck.position
        

        
        
        //second row
        
        let cardDrawn6 = Card(cardType: .random)
        cardDrawn6.position = CGPoint(x: 50, y: 175)
        cardPosition.append(cardDrawn6.position)
        addChild(cardDrawn6)
        dealtCards.append(cardDrawn6)
        cardDrawn6.position = deck.position
        
        let cardDrawn7 = Card(cardType: .random)
        cardDrawn7.position = CGPoint(x: 130, y: 175)
        cardPosition.append(cardDrawn7.position)
        addChild(cardDrawn7)
        dealtCards.append(cardDrawn7)
        cardDrawn7.position = deck.position
        
        let cardDrawn8 = Card(cardType: .random)
        cardDrawn8.position = CGPoint(x: 210, y: 175)
        cardPosition.append(cardDrawn8.position)
        addChild(cardDrawn8)
        dealtCards.append(cardDrawn8)
        cardDrawn8.position = deck.position

        
        let cardDrawn9 = Card(cardType: .random)
        cardDrawn9.position = CGPoint(x: 290, y: 175)
        cardPosition.append(cardDrawn9.position)
        addChild(cardDrawn9)
        dealtCards.append(cardDrawn9)
        cardDrawn9.position = deck.position

        
        let cardDrawn10 = Card(cardType: .random)
        cardDrawn10.position = CGPoint(x: 370, y: 175)
        cardPosition.append(cardDrawn10.position)
        addChild(cardDrawn10)
        dealtCards.append(cardDrawn10)
        cardDrawn10.position = deck.position
        
        
        
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
}




