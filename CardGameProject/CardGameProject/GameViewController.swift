//
//  GameViewController.swift
//  CardGameProject
//
//  Created by Mark Tompong on 6/28/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MenuScene(size: view.bounds.size)
        let skView = self.view as! SKView
   
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = false
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        scene.isPaused = false
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}

