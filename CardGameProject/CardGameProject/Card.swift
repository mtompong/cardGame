//
//  Card.swift
//  CardGameProject
//
//  Created by Mark Tompong on 6/28/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit

enum CardType :Int {
    case back,
        black,
        blue,
        green,
        red,
        white,
        purple,
        random
}

class Card : SKSpriteNode {
    var cardType :CardType
    var frontTexture :SKTexture
    let backTexture :SKTexture
    var faceDown = true
    var redrawing = true
    var selected = false
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardType: CardType) {
        self.cardType = cardType
        backTexture = SKTexture(imageNamed: "card_back")
        
        
        let d6 = GKRandomDistribution.d6()
        let randomCard = d6.nextInt()
        switch randomCard {
        case 1:
            self.cardType = .black
            frontTexture = SKTexture(imageNamed: "card_front_black")
        case 2:
            self.cardType = .blue
            frontTexture = SKTexture(imageNamed: "card_front_blue")
        case 3:
            self.cardType = .red
            frontTexture = SKTexture(imageNamed: "card_front_red")
        case 4:
            self.cardType = .green
            frontTexture = SKTexture(imageNamed: "card_front_green")
        case 5:
           self.cardType = .white
            frontTexture = SKTexture(imageNamed: "card_front_white")
        case 6:
            self.cardType = .purple
            frontTexture = SKTexture(imageNamed: "card_front_purple")
        default:
            self.cardType = .random
            frontTexture = SKTexture(imageNamed: "card_back")
        }
        
        super.init(texture: backTexture, color: .clear, size: backTexture.size())
    }
    
    func flip(counter: Double) {
        if self.redrawing == true {
            let firstHalfFlip = SKAction.scaleX(to: 0.0, duration: 0.2)
            let secondHalfFlip = SKAction.scaleX(to: 1.0, duration: 0.2)
            let delayAction = SKAction.wait(forDuration: 0.5 * counter )
            let faceUpTexture = SKAction.setTexture(SKTexture(imageNamed: shuffle()))
            let faceDownTexture = SKAction.setTexture(SKTexture(imageNamed: "card_back"))
            let sequenceFaceUp = SKAction.sequence([ delayAction, firstHalfFlip,faceUpTexture, secondHalfFlip])
            let sequenceFaceDown = SKAction.sequence([ delayAction, firstHalfFlip,faceDownTexture, secondHalfFlip])
            if self.faceDown == true {
                self.run(sequenceFaceUp)
            }
            else {
                self.run(sequenceFaceDown)
            }
            self.faceDown = !self.faceDown
        }
    }
    
    func shuffle() -> String {
        var color = ""
        let d6 = GKRandomDistribution.d6()
        let randomCard = d6.nextInt()
        switch randomCard {
        case 1:
            self.cardType = .black
            color = "card_front_black"
        case 2:
             self.cardType = .white
            color = "card_front_white"
        case 3:
             self.cardType = .blue
            color = "card_front_blue"
        case 4:
             self.cardType = .red
            color = "card_front_red"
        case 5:
             self.cardType = .green
            color = "card_front_green"
        case 6:
             self.cardType = .purple
            color = "card_front_purple"
        default:
            color = "card_back"
        }
        return color
    }
    
    func Highlight() {
        //find out what texture switch case through cardType
        //change texture to selected texture , selected = true
        if self.redrawing == true {
            let highlightTable = SKAction.scale(to: 1.33, duration: 0.1)
            self.run(highlightTable)
            self.selected = true
        }else{
            if self.redrawing == false{
                let highlightHand = SKAction.scale(to: 0.7, duration: 0.1)
                self.run(highlightHand)
                self.selected = true
            }
            
        }
    }
    
    func Unhighlight() {
        if self.redrawing == true{
            let unhighlightTable = SKAction.scale(to: 1.0, duration: 0.1)
            self.run(unhighlightTable)
            self.selected = false
        }else{
            if self.redrawing == false{
                let unhighlightHand = SKAction.scale(to: 0.5, duration: 0.1)
                self.run(unhighlightHand)
                self.selected = false
            }
        }
    }
    
    func movetoHand (handPosition: CGPoint) {
        
        let delayAction = SKAction.wait(forDuration: 0.1)
        let moveToward = SKAction.move(to: handPosition, duration: 0.2 )
        let moveSequence = SKAction.sequence([delayAction, moveToward])
        self.run(moveSequence)
        self.selected = false
        
    }
    
    func swapToTable (tablePosition: CGPoint) {
        if self.selected == true {
            let placeOnTable = SKAction.scale(to: 1, duration: 0.2)
            let delayAction = SKAction.wait(forDuration: 0.1)
            let moveToward = SKAction.move(to: tablePosition, duration: 0.2 )
            let moveSequence = SKAction.sequence([placeOnTable, delayAction, moveToward])
            self.run(moveSequence)
            self.selected = false
            self.redrawing = true
        }
    }
    
    func swapToHand(handPosition: CGPoint) {
        self.redrawing = false
        let placeInside = SKAction.scale(to: 0.5, duration: 0.2)
        let delayAction = SKAction.wait(forDuration: 0.1)
        let moveToward = SKAction.move(to: handPosition, duration: 0.2 )
        let placeSequence = SKAction.sequence([placeInside, delayAction, moveToward])
        self.run(placeSequence)
    }
}


