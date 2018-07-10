//
//  GameScene.swift
//  CardGameProject
//
//  Created by Mark Tompong on 6/28/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit



enum CardLevel :CGFloat {
    case board = 10
    case moving = 100
    case enlarged = 200
}


var dealtCards: [Card] = []
var cardPosition: [CGPoint] = []
var counter = 0.5
var xCord = 30
var count = 0

class GameScene: SKScene {
    
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
       
        /*while count != 5 {
            let card_placer = SKSpriteNode(imageNamed:"card_placer")
            card_placer.position = CGPoint(x: xCord, y: 80)
            card_placer.size = CGSize(width: 45.0, height: 45.0)
            addChild(card_placer)
            xCord += 50
            count += 1
        }
        xCord = 180
        while count != 10 {
           let card_placer = SKSpriteNode(imageNamed:"card_placer")
            card_placer.position = CGPoint(x: xCord, y: 30)
            card_placer.size = CGSize(width: 45.0, height: 45.0)
            addChild(card_placer)
            xCord += 50
            count += 1
        }*/
        
        //table------------------------------
        let card_placer_tail2 = SKSpriteNode(imageNamed: "Rcard_placer_tail")
        card_placer_tail2.position = CGPoint(x:330, y:80)
        card_placer_tail2.size = CGSize(width: 150, height: 45.0)
        addChild(card_placer_tail2)
        
        let card_placer_tail1 = SKSpriteNode(imageNamed: "Lcard_placer_tail")
        card_placer_tail1.position = CGPoint(x:80, y:30)
        card_placer_tail1.size = CGSize(width: 150, height: 45.0)
        addChild(card_placer_tail1)
        
        let cardDrawn1 = Card(cardType: .random)
        cardDrawn1.position = CGPoint(x: 50, y: 300)
        addChild(cardDrawn1)
        dealtCards.append(cardDrawn1)
        cardPosition.append(cardDrawn1.position)
        
        let cardDrawn2 = Card(cardType: .random)
        cardDrawn2.position = CGPoint(x: 130, y: 300)
        addChild(cardDrawn2)
        dealtCards.append(cardDrawn2)
         cardPosition.append(cardDrawn2.position)
 
        
        let cardDrawn3 = Card(cardType: .random)
        cardDrawn3.position = CGPoint(x: 210, y: 300)
        addChild(cardDrawn3)
        dealtCards.append(cardDrawn3)
         cardPosition.append(cardDrawn3.position)
     
        
        let cardDrawn4 = Card(cardType: .random)
        cardDrawn4.position = CGPoint(x: 290, y: 300)
        addChild(cardDrawn4)
        dealtCards.append(cardDrawn4)
         cardPosition.append(cardDrawn4.position)
       
        
        let cardDrawn5 = Card(cardType: .random)
        cardDrawn5.position = CGPoint(x: 370, y: 300)
        addChild(cardDrawn5)
        dealtCards.append(cardDrawn5)
         cardPosition.append(cardDrawn5.position)
     
        
        //second row
        
        let cardDrawn6 = Card(cardType: .random)
        cardDrawn6.position = CGPoint(x: 50, y: 175)
        addChild(cardDrawn6)
        dealtCards.append(cardDrawn6)
         cardPosition.append(cardDrawn6.position)
      
        
        let cardDrawn7 = Card(cardType: .random)
        cardDrawn7.position = CGPoint(x: 130, y: 175)
        addChild(cardDrawn7)
        dealtCards.append(cardDrawn7)
         cardPosition.append(cardDrawn7.position)
       
        
        let cardDrawn8 = Card(cardType: .random)
        cardDrawn8.position = CGPoint(x: 210, y: 175)
        addChild(cardDrawn8)
        dealtCards.append(cardDrawn8)
         cardPosition.append(cardDrawn8.position)
      
        
        let cardDrawn9 = Card(cardType: .random)
        cardDrawn9.position = CGPoint(x: 290, y: 175)
        addChild(cardDrawn9)
        dealtCards.append(cardDrawn9)
         cardPosition.append(cardDrawn9.position)
        
        
        let cardDrawn10 = Card(cardType: .random)
        cardDrawn10.position = CGPoint(x: 370, y: 175)
        addChild(cardDrawn10)
        dealtCards.append(cardDrawn10)
         cardPosition.append(cardDrawn10.position)
      
        
        for card in dealtCards{
            counter += 0.3
            card.flip(counter: counter)
            }
            counter = resetCounter(counter: counter)
    }

 //////////////////////////////////////////////////////////////////
    
 /*   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)          
            if let card = atPoint(location) as? Card {
                card.position = location
            }
        }
    }*/
    
    
    override func touchesBegan(_ touches:
        Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if let deck = atPoint(location) as? Deck {
                if touch.tapCount == 1 {
                    
                    //reshuffle cards & move to deck
                    
                    for card in dealtCards{
                        counter += 0.3
                        let card = deck.redraw(card: card, deckLocation: deck.position, counter: counter )
                        card.flip(counter: counter)
                    }
                    
                    //deal new hand & reposition
                    var position = 0
                    for card in dealtCards{
                        counter += 0.3
                        let card = deck.reposition(card: card, cardPosition: cardPosition[position], counter: counter)
                        position += 1
                        card.flip(counter: counter)             
                    }
                }
                counter = resetCounter(counter: counter)
            }
            
            if let card = atPoint(location) as? Card {
                if touch.tapCount == 1 {
                    for card in dealtCards{
                        if card.selected == true {
                            card.Unhighlight()
                        }
                    }
                    card.Highlight()
                }
            }
            
            if let hand = atPoint(location) as? Hand {
                if touch.tapCount == 1 {
                    
                    for card in dealtCards{
                           let card = hand.addtoHand(card: card)
                            card.movetoHand(handPosition: hand.position)

                    }
                }
            }
            
        }
    }
    
   /* override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if let card = atPoint(location) as? Card {
                card.zPosition = CardLevel.board.rawValue
                card.removeFromParent()
                addChild(card)
                card.removeAction(forKey: "pickup")
                card.run(SKAction.scale(to: 1.0, duration: 0.25), withKey: "drop")
            }
        }
    }*/
    
    func resetCounter (counter: Double) -> Double {
      let counter = 0.0
        return counter
    }
    
   
}


