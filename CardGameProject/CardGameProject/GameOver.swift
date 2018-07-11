//
//  GameOver.swift
//  CardGameProject
//
//  Created by Mark Tompong on 7/10/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    var notificationLabel = SKLabelNode(text: "You Won")
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = SKColor.darkGray
        
        addChild(notificationLabel)
        notificationLabel.fontSize = 32.0
        notificationLabel.color = SKColor.white
        notificationLabel.fontName = "Thonburi-Bold"
        notificationLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        view?.presentScene(gameScene, transition: reveal)
    }
}
