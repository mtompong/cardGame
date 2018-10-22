//
//  HexagonHighlight.swift
//  CardGameProject
//
//  Created by Mark Tompong on 10/13/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit

class HilightedHexagon : SKSpriteNode{
    
    let hexagonTexture : SKTexture
    let glowTexture : SKTexture
    
    let hexCropNode = SKCropNode()
    
    var glowNodeBottom : SKSpriteNode! = nil
    var glowNodeTop : SKSpriteNode! = nil
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    init() {
        self.hexagonTexture  = SKTexture(imageNamed: "hexagonPattern")
        self.glowTexture = SKTexture(imageNamed: "radialHighlight")
        
        
        super.init(texture: hexagonTexture, color: .clear, size: hexagonTexture.size())
        
        hexCropNode.maskNode = SKSpriteNode(texture: hexagonTexture)
        
        
        glowNodeBottom = SKSpriteNode(texture: glowTexture)
        glowNodeBottom.position = CGPoint(x:0, y: 50)
        glowNodeBottom.alpha = 0.0
        
        glowNodeTop = SKSpriteNode(texture: glowTexture)
        glowNodeTop.position = CGPoint(x:0, y: -50)
        glowNodeTop.alpha = 0.0
        glowNodeTop.zRotation = CGFloat.pi 
    
        hexCropNode.addChild(glowNodeBottom)
        hexCropNode.addChild(glowNodeTop)
        
       
        addChild(hexCropNode)
        
    }
    
    func activateHighlightBottom () {
        let glow = SKAction.run({
            self.glowNodeBottom.addGlowtoNumber()
            self.glowNodeBottom.addHighlightNumber()
        })
        glowNodeBottom.run(
            SKAction.group([
                SKAction.fadeIn(withDuration: 2.0),
                SKAction.moveTo(y: -300, duration: 2.0),
                glow
                ]),
            
            completion: {() -> Void in self.glowNodeBottom.position = CGPoint(x:0, y: 50);self.glowNodeBottom.alpha = 0.0})
        
    }
    
    func activateHighlightTop () {
        let glow = SKAction.run({
            self.glowNodeTop.addGlowtoNumber()
            self.glowNodeTop.addHighlightNumber()
        })
        glowNodeTop.run(
            SKAction.group([
                SKAction.fadeIn(withDuration: 2.0),
                SKAction.moveTo(y: 450, duration: 2.0),
                glow
                ]),
            
            completion: {() -> Void in self.glowNodeTop.position = CGPoint(x:0, y: -50);self.glowNodeTop.alpha = 0.0})
        
    }
    
}
