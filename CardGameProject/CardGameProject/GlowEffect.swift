//
//  GlowEffect.swift
//  CardGameProject
//
//  Created by Mark Tompong on 8/28/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit

extension SKSpriteNode {
    
    convenience init(texture: SKTexture, glowRadius: CGFloat) {
        self.init(texture: texture, color: .clear, size: texture.size())
        
        
        let glow: SKEffectNode = {
            let glow = SKEffectNode()
            glow.addChild(SKSpriteNode(texture: texture))
            glow.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": glowRadius])
            glow.shouldRasterize = true
            return glow
        }()
        
        let glowRoot: SKNode = {
            let node = SKNode()
            node.name = "Glow"
            node.zPosition = -1
            return node
            
        }()
        glowRoot.addChild(glow)
        addChild(glowRoot)
    }
}
