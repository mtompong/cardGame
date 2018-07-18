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
var currentHand :[Card] = []
var cardCounter = 0
var cardPlaced : CGPoint?

var cardPostion: [CGPoint] = []
let position1 = CGPoint(x: 123.915, y: 174.721)
let position2 = CGPoint(x: 135.279, y: 197.023)
let position3 = CGPoint(x: 152.977, y: 214.72)
let position4 = CGPoint(x: 175.279, y: 226.085)
let position5 = CGPoint(x: 200, y: 230)
let position6 = CGPoint(x: 224.721, y: 226.085)
let position7 = CGPoint(x: 247.023, y: 214.72)
let position8 = CGPoint(x: 264.721, y: 197.023)
let position9 = CGPoint(x: 276.085, y: 174.721)
let position10 = CGPoint(x: 280, y: 150)

var cardRotation : [CGFloat] = []
let rotation1 = (3 * CGFloat.pi / 2) + 5 * CGFloat.pi / 6
let rotation2 = (3 * CGFloat.pi / 2) + 3 * CGFloat.pi / 4
let rotation3 = (3 * CGFloat.pi / 2) + 2 * CGFloat.pi  / 3
let rotation4 = (3 * CGFloat.pi / 2) + 7 * CGFloat.pi / 12
let rotation5 = (3 * CGFloat.pi / 2) + CGFloat.pi / 2
let rotation6 = (3 * CGFloat.pi / 2) + 5 * CGFloat.pi / 12
let rotation7 = (3 * CGFloat.pi / 2) + CGFloat.pi / 3
let rotation8 = (3 * CGFloat.pi / 2) + CGFloat.pi / 4
let rotation9 = (3 * CGFloat.pi / 2) + CGFloat.pi / 6
let rotation10 = (3 * CGFloat.pi / 2) + CGFloat.pi / 12



class Hand : SKSpriteNode {
    
    
    let handTexture :SKTexture
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(handTexture :SKTexture ){
        
        
        self.handTexture = handTexture

        cardPostion.append(position1)
        cardPostion.append(position2)
        cardPostion.append(position3)
        cardPostion.append(position4)
        cardPostion.append(position5)
        cardPostion.append(position6)
        cardPostion.append(position7)
        cardPostion.append(position8)
        cardPostion.append(position9)
        cardPostion.append(position10)
        
        cardRotation.append(rotation1)
        cardRotation.append(rotation2)
        cardRotation.append(rotation3)
        cardRotation.append(rotation4)
        cardRotation.append(rotation5)
        cardRotation.append(rotation6)
        cardRotation.append(rotation7)
        cardRotation.append(rotation8)
        cardRotation.append(rotation9)
        cardRotation.append(rotation10)
       
        super.init(texture: handTexture, color: .clear, size: handTexture.size())
    }
    
    func getCurrentHand (hand: [Card]) {
        currentHand = hand
        cardCounter = currentHand.count
        
    }
    
    func cardPosition () -> CGPoint {
        cardPlaced = cardPostion[cardCounter]
        return cardPlaced!
    }
    
    func addtoHand (card: Card) -> Card {
        heldCard = card
        heldCard.zRotation = cardRotation[cardCounter]
        let cardZ = CGFloat(cardCounter)
        heldCard.zPosition = cardZ
        
        //let placeInside = SKAction.scale(to: 0.5, duration: 0.2)
        let delayAction = SKAction.wait(forDuration: 0.3)
        heldCard.run(delayAction)
        heldCard.Unhighlight()
        heldCard.redrawing = false
        
        
        return heldCard
    }

    
}
