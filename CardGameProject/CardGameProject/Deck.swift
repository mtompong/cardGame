//
//  Deck.swift
//  CardGameProject
//
//  Created by Mark Tompong on 7/2/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit



class Deck : SKSpriteNode {
    var returnedCard = Card(cardType: .random, isPlayer: true)
  
    let Decktexture :SKTexture
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(Decktexture :SKTexture ){
        
        self.Decktexture = Decktexture
        
        
        super.init(texture: Decktexture, color: .clear, size: Decktexture.size())
    }
    
    
    
    func redraw(card: Card, deckLocation: CGPoint, counter: Double) -> Card {
        //take card
        //move card to deck
        returnedCard = card
        let firstCard = 0.0
        if returnedCard.redrawing == true && returnedCard.faceDown == false {
            //move sequence
            if returnedCard.selected == true {
                returnedCard.Unhighlight()
            }
            let delayAction = SKAction.wait(forDuration: 0.5 * counter)
            let firstMove = SKAction.wait(forDuration: 0.5 * firstCard)
            let moveToDeck = SKAction.move(to: deckLocation, duration: 0.2)
            let firstSequence = SKAction.sequence([firstMove, moveToDeck])
            let moveSequence = SKAction.sequence([delayAction, moveToDeck])
            if counter == 0.0 {
                returnedCard.run(firstSequence)
                
            }
            else {
                returnedCard.run(moveSequence)
            }
        }
        else if returnedCard.redrawing == false && returnedCard.selected == true {
            returnedCard.Unhighlight()
        }
        return returnedCard
    }
    
    func reposition(card: Card, cardPosition: CGPoint, hand: [Card] , counter: Double) -> Card {
        returnedCard = card
        if returnedCard.redrawing == true {
            let firstCard = 0.0
            let delayAction = SKAction.wait(forDuration: 0.5 * counter)
            let firstMove = SKAction.wait(forDuration: 0.5 * firstCard)
            let lastCard = SKAction.wait(forDuration: 0.5)
            let movetoTable = SKAction.move(to: cardPosition, duration: 0.2)
            let firstSequence = SKAction.sequence([firstMove, movetoTable])          
            let moveSequence = SKAction.sequence([delayAction, movetoTable])
            let lastCardSequence = SKAction.sequence([lastCard, movetoTable])
            if counter == 0.3 {
                returnedCard.run(firstSequence)
            }
            else if hand.count == 9 {
                
                returnedCard.run(lastCardSequence)
            }
            else {
                returnedCard.run(moveSequence)
            }
        }
        return returnedCard
    }

    
}

