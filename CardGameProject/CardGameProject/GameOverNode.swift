//
//  GameOverNode.swift
//  CardGameProject
//
//  Created by Mark Tompong on 8/15/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit

class gameOverMenu : SKSpriteNode{
    
    var currentScene : SKScene! = nil
    let gameOverMenu :SKTexture
    let mainMenu: SKTexture
    let playAgain: SKTexture
    let mainMenuPressed: SKTexture
    let playAgainPressed : SKTexture
    var mainMenuButton: SKSpriteNode! = nil
    var playAgainButton : SKSpriteNode! = nil
    var selectedButton : SKSpriteNode?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    init(gameOverMenu: SKTexture,mainMenu :SKTexture, playAgain :SKTexture, mainMenuPressed :SKTexture, playAgainPressed : SKTexture, currentScene : SKScene) {
        
        self.currentScene = currentScene
        self.gameOverMenu = gameOverMenu
        self.mainMenu = mainMenu
        self.playAgain = playAgain
        self.mainMenuPressed = mainMenuPressed
        self.playAgainPressed = playAgainPressed
        
        
        super.init(texture: gameOverMenu, color: .clear, size: gameOverMenu.size())
        
    
       
        playAgainButton = SKSpriteNode(texture: playAgain)
        playAgainButton.position = CGPoint(x: -80,y: 330)
        playAgainButton.size = CGSize(width: 100, height: 33.33)
        addChild(playAgainButton)
        
        mainMenuButton = SKSpriteNode(texture: mainMenu)
        mainMenuButton.position = CGPoint(x: 80,y: 330)
        mainMenuButton.size = CGSize(width: 100, height: 33.33)
        addChild(mainMenuButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if selectedButton != nil {
                handleplayAgainButtonHover(isHovering: false)
                handlemainMenuButtonHover(isHovering: false)
                
            }
            
            // Check which button was clicked (if any)
            if playAgainButton.contains(touch.location(in: self)) {
                selectedButton = playAgainButton
                handleplayAgainButtonHover(isHovering: true)
            }
            
            else if mainMenuButton.contains(touch.location(in: self)) {
                selectedButton = mainMenuButton
                handlemainMenuButtonHover(isHovering: true)
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            // Check which button was clicked (if any)
            if selectedButton == playAgainButton {
                handleplayAgainButtonHover(isHovering: (playAgainButton.contains(touch.location(in: self))))
            }
            
            else if selectedButton == mainMenuButton {
                handlemainMenuButtonHover(isHovering: (mainMenuButton.contains(touch.location(in: self))))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            if selectedButton == playAgainButton {
                // Play again button clicked
                handleplayAgainButtonHover(isHovering: false)
                
                if (playAgainButton.contains(touch.location(in: self))) {
                    handleplayAgainButtonClick()
                }
                
            }
            
            else if selectedButton == mainMenuButton {
                // Menu button clicked
                handlemainMenuButtonHover(isHovering: false)
                
                if (mainMenuButton.contains(touch.location(in: self))) {
                    handlemainMenuButtonClick()
                }
                
            }
        }
        
        selectedButton = nil
    }
    
    func handleplayAgainButtonHover(isHovering : Bool) {
        if isHovering {
            playAgainButton.texture = playAgainPressed
        } else {
             playAgainButton.texture = playAgain
        }
    }
    
    func handlemainMenuButtonHover(isHovering : Bool) {
        if isHovering {
            mainMenuButton.texture = mainMenuPressed
        } else {
            mainMenuButton.texture = mainMenu
        }
    }
    
    func handleplayAgainButtonClick() {
        startGame(currentScene: self.currentScene)
    }
    
    func handlemainMenuButtonClick() {
        tomainMenu(currentScene: self.currentScene)
    }
    
    func startGame(currentScene: SKScene) {
        let delay = SKAction.wait(forDuration: 0.5)
        let sceneChange = SKAction.run({
            let transition = SKTransition.fade(withDuration: 1.0)
            let scene = GameScene(size: currentScene.size)
            scene.scaleMode = .aspectFill
            currentScene.view?.presentScene(scene, transition: transition)
            
        })
        
        run(SKAction.sequence([delay, sceneChange]))
    }
    
    func tomainMenu(currentScene: SKScene) {
        let delay = SKAction.wait(forDuration: 0.5)
        let sceneChange = SKAction.run({
            let transition = SKTransition.fade(withDuration: 1.0)
            let scene = MenuScene(size: currentScene.size)
            scene.scaleMode = .aspectFill
            currentScene.view?.presentScene(scene, transition: transition)
            
        })
        
        run(SKAction.sequence([delay, sceneChange]))
    }
    
}
