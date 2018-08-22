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
    
    func startCountDown (startlocation: CGPoint) {
        let pause = SKAction.wait(forDuration: 0.3)
        let moveTo = SKAction.move(to: startlocation, duration: 0.3)
        let second = SKAction.wait(forDuration: 1)
        let set2 = SKAction.setTexture(countDown2)
        let set1 = SKAction.setTexture(countDown1)
        let setGo = SKAction.setTexture(countDownGo)
        let hide = SKAction.hide()
        let initcountDown = SKAction.sequence([moveTo, second,set2,second,set1, second, setGo , pause, hide])
        self.run(initcountDown)
    }
}

    
    
    

