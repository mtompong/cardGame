//
//  MenuScene.swift
//  CardGameProject
//
//  Created by Mark Tompong on 7/13/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit

class MenuScene : SKScene {
    
    let startButtonTexture = SKTexture(imageNamed: "startbutton")
    let startButtonPressedTexture = SKTexture(imageNamed: "startbuttonpressed")
    var startButton : SKSpriteNode! = nil
    var selectedButton : SKSpriteNode?
    
    override func sceneDidLoad() {
        backgroundColor = SKColor.black
        
        //Set up start button
        startButton = SKSpriteNode(texture: startButtonTexture)
        startButton.position = CGPoint(x: size.width / 2, y: size.height / 4 - startButton.size.height / 2)
        startButton.size = CGSize(width: 150, height: 50)
        
        addChild(startButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if selectedButton != nil {
                handleStartButtonHover(isHovering: false)
              
            }
            
            // Check which button was clicked (if any)
            if startButton.contains(touch.location(in: self)) {
                selectedButton = startButton
                handleStartButtonHover(isHovering: true)
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            // Check which button was clicked (if any)
            if selectedButton == startButton {
                handleStartButtonHover(isHovering: (startButton.contains(touch.location(in: self))))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            if selectedButton == startButton {
                // Start button clicked
                handleStartButtonHover(isHovering: false)
                
                if (startButton.contains(touch.location(in: self))) {
                    handleStartButtonClick()
                }
                
            }
        }
        
        selectedButton = nil
    }
    
    /// Handles start button hover behavior
    func handleStartButtonHover(isHovering : Bool) {
        if isHovering {
            startButton.texture = startButtonPressedTexture
        } else {
            startButton.texture = startButtonTexture
        }
    }
    
    
    /// Stubbed out start button on click method
    func handleStartButtonClick() {
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
