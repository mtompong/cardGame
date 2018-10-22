//
//  LoadingCircle.swift
//  CardGameProject
//
//  Created by Mark Tompong on 9/20/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit

class LoadingCircle : SKSpriteNode{
    let Ring_Inner1 :SKTexture
    let Ring_Inner2 :SKTexture
    let Ring_Outer1 :SKTexture
    let Ring_Outer2 :SKTexture
    let initTexture = SKTexture(imageNamed: "bg_blank")
    let initSize = CGSize(width: 50, height: 50)
    
    var Inner_Ring1 :SKSpriteNode! = nil
    var Inner_Ring2 :SKSpriteNode! = nil
    var Outer_Ring1 :SKSpriteNode! = nil
    var Outer_Ring2 :SKSpriteNode! = nil

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    init(Ring_Inner1: SKTexture,Ring_Inner2 :SKTexture,  Ring_Outer1 :SKTexture,Ring_Outer2 :SKTexture) {
        self.Ring_Inner1 = Ring_Inner1
        self.Ring_Inner2 = Ring_Inner2
        self.Ring_Outer1 = Ring_Outer1
        self.Ring_Outer2 = Ring_Outer2
        
        
        super.init(texture: initTexture, color: .clear, size: initSize)
        
        Inner_Ring1 = SKSpriteNode(texture: Ring_Inner1)
        Inner_Ring1.size = CGSize(width: 30, height: 30)
        addChild(Inner_Ring1)
        
        Inner_Ring2 = SKSpriteNode(texture: Ring_Inner2)
        //Inner_Ring2.size = CGSize(width: 25, height: 25)
        addChild(Inner_Ring2)
        
        Outer_Ring1 = SKSpriteNode(texture: Ring_Outer1)
        //Outer_Ring1.size = CGSize(width: 37.5, height: 37.5)
        addChild(Outer_Ring1)
        
        Outer_Ring2 = SKSpriteNode(texture: Ring_Outer2)
        addChild(Outer_Ring2)
        
    }
    
    func startRotatingCycle () {
        let rotateOuterRing1 = SKAction.repeatForever(SKAction.rotate(byAngle: (CGFloat(3 * CGFloat.pi / 2)), duration: 1))
        Outer_Ring1.run(rotateOuterRing1, withKey: "ringRotation")
        let rotateInnerRing2 = SKAction.repeatForever(SKAction.rotate(byAngle: (CGFloat(-3 * CGFloat.pi / 2)), duration: 1))
        Inner_Ring2.run(rotateInnerRing2, withKey: "ringRotation")
        let rotateInnerRing1 = SKAction.repeatForever(SKAction.rotate(byAngle: (CGFloat(3 * CGFloat.pi / 2)), duration: 1))
        Inner_Ring1.run(rotateInnerRing1, withKey: "ringRotation")
          let rotateOuterRing2 = SKAction.repeatForever(SKAction.rotate(byAngle: (CGFloat(-3 * CGFloat.pi / 2)), duration: 1))
        Outer_Ring2.run(rotateOuterRing2, withKey: "ringRotation")
    }
    
    func endRotatingCycle () {
        self.removeAction(forKey: "ringRotation")
    }
    
    
}
