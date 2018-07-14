//
//  GameOver.swift
//  CardGameProject
//
//  Created by Mark Tompong on 7/10/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    let playagainButtonTexture = SKTexture(imageNamed: "playagain")
    let playagainPressedTexture = SKTexture(imageNamed: "playagainpressed")
    var playagainButton : SKSpriteNode! = nil
    var selectedButton : SKSpriteNode?
    
    
    
    init(size: CGSize, won:Bool) {
        super.init(size: size)
    
        let message = won ? "You Won!" : "You Lose :["
        
    
        let label = SKLabelNode(fontNamed: "Futura-CondensedMedium")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.black
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func sceneDidLoad() {
        
        backgroundColor = SKColor.white.withAlphaComponent(0.5)
        
        playagainButton = SKSpriteNode(texture: playagainButtonTexture)
        playagainButton.position = CGPoint(x: size.width / 2, y: size.height / 4 - playagainButton.size.height / 2)
        playagainButton.size = CGSize(width: 200, height: 100)
        
        addChild(playagainButton)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if selectedButton != nil {
                handlePlayAgainButtonHover(isHovering: false)
                
            }
            
            // Check which button was clicked (if any)
            if playagainButton.contains(touch.location(in: self)) {
                selectedButton = playagainButton
                handlePlayAgainButtonHover(isHovering: true)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            // Check which button was clicked (if any)
            if selectedButton == playagainButton {
                handlePlayAgainButtonHover(isHovering: (playagainButton.contains(touch.location(in: self))))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            if selectedButton == playagainButton {
                // Start button clicked
                handlePlayAgainButtonHover(isHovering: false)
                
                if (playagainButton.contains(touch.location(in: self))) {
                    handlePlayAgainButtonClick()
                }
                
            }
        }
        
        selectedButton = nil
    }
    
    /// Handles play again button hover behavior
    func handlePlayAgainButtonHover(isHovering : Bool) {
        if isHovering {
            playagainButton.texture = playagainPressedTexture
        } else {
            playagainButton.texture = playagainButtonTexture
        }
    }
    
    
    /// Stubbed out play again on click method
    func handlePlayAgainButtonClick() {
        startGame()
    }
    
    func startGame() {
        let delay = SKAction.wait(forDuration: 0.5)
        let sceneChange = SKAction.run({
            let transition = SKTransition.fade(withDuration: 1.0)
            let scene = GameScene(size: self.size)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
            
        })
        
        run(SKAction.sequence([delay, sceneChange]))
    }
    
    
    
}
