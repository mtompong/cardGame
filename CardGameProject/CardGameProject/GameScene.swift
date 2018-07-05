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

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let bg = SKSpriteNode(imageNamed: "bg_blank")
        bg.anchorPoint = CGPoint.zero
        bg.position = CGPoint.zero
        addChild(bg)
        
        let deckTexture = SKTexture(imageNamed: "card_back")
       
        let reshuffle_center = SKSpriteNode(imageNamed: "reshuffle_texture")
        reshuffle_center.position = CGPoint(x: 200, y: 480)
        addChild(reshuffle_center)
        
        let deck = Deck(Decktexture: deckTexture)
        deck.position = CGPoint(x: 200, y: 490)
        addChild(deck)
        
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)          
            if let card = atPoint(location) as? Card {
                card.position = location
            }
        }
    }
    
    
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
               
                card.zPosition = CardLevel.moving.rawValue
                card.removeAction(forKey: "drop")
                card.run(SKAction.scale(to: 1.3, duration: 0.25), withKey: "pickup")
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
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
    }
    
    func resetCounter (counter: Double) -> Double {
      let counter = 0.0
        return counter
    }
    
   
}


