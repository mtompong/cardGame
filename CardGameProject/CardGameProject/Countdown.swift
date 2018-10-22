//
//  Countdown.swift
//  CardGameProject
//
//  Created by Mark Tompong on 8/11/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit

class Countdown : SKSpriteNode{
    let countDown3 :SKTexture
    let countDown2 :SKTexture
    let countDown1 :SKTexture
    let countDownGo :SKTexture
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    init(countDown3: SKTexture,countDown2 :SKTexture,  countDown1 :SKTexture,countDownGo :SKTexture) {
        self.countDown3 = countDown3
        self.countDown2 = countDown2
        self.countDown1 = countDown1
        self.countDownGo = countDownGo
       
        
        super.init(texture: countDown3, color: .clear, size: countDown3.size())
    }
    
    func startCountDown (slideLocation: CGPoint, startLocation: CGPoint) {
        let moveTo = SKAction.move(to: slideLocation, duration: 0.3)
        let moveAdjust = SKAction.move(to: startLocation, duration: 0.2)
        let second = SKAction.wait(forDuration: 1)
        let halfsecond = SKAction.wait(forDuration: 0.5)
        let glowfade = SKAction.run({
            self.addGlowCountdown()
        })
        let glowburstHalfSecond = SKAction.group([halfsecond, glowfade])
        let glowburstSecond = SKAction.group([second, glowfade])
        let set2 = SKAction.setTexture(countDown2)
        let set1 = SKAction.setTexture(countDown1)
        let setGo = SKAction.setTexture(countDownGo)
        let hide = SKAction.hide()
        let initcountDown = SKAction.sequence([moveTo, moveAdjust, halfsecond ,set2,glowburstSecond,set1, glowburstSecond, setGo ,glowburstHalfSecond, hide])
        self.run(initcountDown)
    }

    

}

extension SKSpriteNode {
    
    func addGlowCountdown(radius: Float = 10){
    let effectNode = SKEffectNode()
    effectNode.shouldRasterize = true
    
    addChild(effectNode)
    effectNode.addChild(SKSpriteNode(texture: texture))
    effectNode.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": radius])
    effectNode.zPosition = -1
    let fade = SKAction.fadeOut(withDuration: 0.6)
    effectNode.run(fade)
    }


}
    
    

