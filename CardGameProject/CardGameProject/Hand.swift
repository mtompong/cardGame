//
//  Hand.swift
//  CardGameProject
//
//  Created by Mark Tompong on 7/6/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit

var heldCard = Card(cardType: .random)

class Hand : SKSpriteNode {
    
    
    let handTexture :SKTexture
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(handTexture :SKTexture ){
        
        self.handTexture = handTexture
        
        
        super.init(texture: handTexture, color: .clear, size: handTexture.size())
    }
    
    func addtoHand (card: Card) -> Card {
        heldCard = card
        if heldCard.selected == true {
            //let cardSize = CGSize(width: 35.0, height: 35.0)
            
            let placeInside = SKAction.scale(to: 0.33, duration: 0.2)
            let delayAction = SKAction.wait(forDuration: 0.1)
            let placeSequence = SKAction.sequence([placeInside, delayAction])
            heldCard.run(placeSequence)
            heldCard.redrawing = false
        }
        return heldCard
    }
    
}
