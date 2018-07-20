//
//  Opponent.swift
//  CardGameProject
//
//  Created by Mark Tompong on 7/18/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit

var opHand : [Card] = []
var Table : [Card] = []


class Opponent : SKSpriteNode{
    let opTexture :SKTexture
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    init(opTexture :SKTexture ) {
        self.opTexture = opTexture
        
        super.init(texture: opTexture, color: .clear, size: opTexture.size())
    }
}
