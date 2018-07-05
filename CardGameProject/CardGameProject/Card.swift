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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardType: CardType) {
        self.cardType = cardType
        backTexture = SKTexture(imageNamed: "card_back")
        
        var color = ""
        let d6 = GKRandomDistribution.d6()
        let randomCard = d6.nextInt()
        switch randomCard {
        case 1:
            color = "card_front_black"
        case 2:
            color = "card_front_white"
        case 3:
            color = "card_front_blue"
        case 4:
            color = "card_front_red"
        case 5:
            color = "card_front_green"
        case 6:
            color = "card_front_purple"
        default:
            color = "card_back"
        }
        
        switch cardType {
        case .back:
            frontTexture = SKTexture(imageNamed: "card_back")
        case .black:
            frontTexture = SKTexture(imageNamed: "card_front_black")
        case .blue:
            frontTexture = SKTexture(imageNamed: "card_front_blue")
        case .green:
            frontTexture = SKTexture(imageNamed: "card_front_green")
        case .red:
            frontTexture = SKTexture(imageNamed: "card_front_red")
        case .white:
            frontTexture = SKTexture(imageNamed: "card_front_white")
        case .purple:
            frontTexture = SKTexture(imageNamed: "card_front_purple")
        case .random:
            frontTexture = SKTexture(imageNamed: color)
        }
        
        
        super.init(texture: backTexture, color: .clear, size: backTexture.size())
    }
    
    func flip(counter: Double) {
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
    
    func shuffle() -> String {
        var color = ""
        let d6 = GKRandomDistribution.d6()
        let randomCard = d6.nextInt()
        switch randomCard {
        case 1:
            color = "card_front_black"
        case 2:
            color = "card_front_white"
        case 3:
            color = "card_front_blue"
        case 4:
            color = "card_front_red"
        case 5:
            color = "card_front_green"
        case 6:
            color = "card_front_purple"
        default:
            color = "card_back"
        }
        return color
    }
    
    
}
