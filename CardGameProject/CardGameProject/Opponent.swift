//
//  Opponent.swift
//  CardGameProject
//
//  Created by Mark Tompong on 7/18/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit


class Opponent : SKSpriteNode{
    var opponentCard = Card(cardType: .random, isPlayer: false)
    var player2Table: [Card] = []
    var player2Hand: [Card] = []
    let player2Position = cardHand(player: .player2)
    let opTexture :SKTexture
    let cardInitPosition = CGPoint(x: 400, y: 670)
    let cardMovePosition = CGPoint(x: 300, y: 670)
    var counter = 0.0
    var determinedType = CardType.random
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(opTexture :SKTexture ) {
  
        self.opTexture = opTexture
       // var count = 0.3
        
        
        
        super.init(texture: opTexture, color: .clear, size: opTexture.size())
        // create table
  
        
        
        for card in self.player2Table {
            
            self.opponentCard = self.drawCard(card: card, cardPosition: cardMovePosition, counter: self.counter )
            card.flip(counter: counter)
            self.counter += 0.3
        }
        
        
    }
    
    func drawCard (card: Card, cardPosition: CGPoint, counter: Double) -> Card {
      let drawnCard = card
        let firstCard = 0.0
        if drawnCard.redrawing == true && drawnCard.faceDown {
            let delayAction = SKAction.wait(forDuration: 0.5 * counter)
            let firstMove = SKAction.wait(forDuration: 0.5 * firstCard)
            let movetoTable = SKAction.move(to: cardPosition, duration: 0.2)
            let firstSequence = SKAction.sequence([firstMove, movetoTable])
            let moveSequence = SKAction.sequence([delayAction, movetoTable])
            if counter == 0.3 {
                drawnCard.run(firstSequence)
            }
            else {
               drawnCard.run(moveSequence)
            }
        }
        return drawnCard
    
    }
    
    func player2Type () -> CardType {
        var colorType : CardType?
        let d6 = GKRandomDistribution.d6()
        let randomCard = d6.nextInt()
        
        switch randomCard {
        case 1:
            colorType = CardType.black
            break
        case 2:
            colorType = CardType.blue
            break
        case 3:
            colorType = CardType.white
            break
        case 4:
            colorType = CardType.red
            break
        case 5:
            colorType = CardType.green
            break
        case 6:
            colorType  = CardType.purple
            break
        default:
            print("error")
        }
        return colorType!
        
    }
    
    func movetoHand (card : Card, count: Int, playerHand: [Card], counter: Double) -> Card {
        opponentCard = card
        player2Hand = playerHand
         let handLocation = self.player2Position.cardPostion[self.player2Hand.count]
          opponentCard.zPosition = CGFloat(self.player2Hand.count)
        let delayAction = SKAction.wait(forDuration: 0.5 * self.counter)
        let handTravel = SKAction.move(to: handLocation, duration: 0.2)
        let move2Hand = SKAction.sequence([delayAction, handTravel])
        card.zRotation = self.player2Position.cardRotation[self.player2Hand.count]
        card.run(move2Hand)
        return opponentCard
    }
    
    func determineCardType (playerHand: [Card]) -> CardType {
        var blue = 0
        var black = 0
        var green = 0
        var red = 0
        var white = 0
        var purple = 0
        
        for card in playerHand {
            switch card.cardType {
            case .blue:
                blue += 1
                break
            case .black:
                black += 1
                break
            case .green:
                green += 1
                break
            case .red:
                red += 1
                break
            case .white:
                white += 1
                break
            case .purple:
                purple += 1
                break
            default:
                print("error in cardtype determination 1")
            }
        }
        let color = [blue, black, green, red, white, purple]
        let chosenType = color.max()
        switch chosenType {
        case blue:
            determinedType = .blue
            break
        case black:
            determinedType = .black
            break
        case green:
            determinedType = .green
            break
        case red:
            determinedType = .red
            break
        case white:
            determinedType = .white
            break
        case purple:
            determinedType = .purple
            break
        default:
            print("error in cardtype determination 2")
        }
        return determinedType
    }
    
}


