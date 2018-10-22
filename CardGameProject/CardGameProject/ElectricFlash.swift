//
//  ElectricFlash.swift
//  CardGameProject
//
//  Created by Mark Tompong on 9/24/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit

class electricFlash : SKSpriteNode{
    let electricFlash :SKTexture
  
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    init(electricFlash: SKTexture) {
        self.electricFlash = electricFlash
       
        
        
        super.init(texture: electricFlash, color: .clear, size: electricFlash.size())
        
    }
    
    func startElectricFlash (waitDuration: Double) {
        //self.flashLocation1 = flashLocation1
        let fadeOut = SKAction.fadeOut(withDuration: 0.2)
        let reveal = SKAction.unhide()
        let bloomFlash = SKAction.run({
            self.addBloomtoFlash()
        })
        let glowFlash = SKAction.run({
            self.addGlowtoFlash()
        })
        
        let highlightFlash = SKAction.group([reveal,bloomFlash,glowFlash,fadeOut])
        self.run(SKAction.sequence([(SKAction.wait(forDuration: waitDuration)),highlightFlash]))
        
        
    }
}

extension SKSpriteNode {
    
    func addBloomtoFlash(radius: Float = 25, intensity: Float = 10){
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIBloom", withInputParameters: ["inputRadius": radius, "inputIntensity": intensity])
        effectNode.zPosition = 11
        let fadeOut = SKAction.fadeOut(withDuration: 0.15)
        effectNode.run(fadeOut)
    }
    
    func addGlowtoFlash(radius: Float = 25){
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": radius])
        effectNode.zPosition = -1
        let fade = SKAction.fadeOut(withDuration: 0.2)
        effectNode.run(fade)
    }
    
    
    
}




