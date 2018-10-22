//
//  ElectricFlash.swift
//  CardGameProject
//
//  Created by Mark Tompong on 9/24/18.
//  Copyright © 2018 Mark Tompong. All rights reserved.
//

import SpriteKit
import GameplayKit

class dataScreen : SKSpriteNode{
    let dataScreenTexture :SKTexture
    let dataBorderTexture :SKTexture
    let columnNumbersTexture1 :SKTexture
    let columnNumbersTexture2 :SKTexture
    let columnNumbersTexture3 :SKTexture
    let columnNumbersTexture4 :SKTexture
    let columnNumbersTexture5 :SKTexture
    let numberHighlight :SKTexture


    
    
    let dataScreenCrop = SKCropNode()
    var dataBorder :SKSpriteNode! = nil
    
    var columnNumbers1 :SKSpriteNode! = nil
    var columnNumbers2 :SKSpriteNode! = nil
    var columnNumbers3 :SKSpriteNode! = nil
    var columnNumbers4 :SKSpriteNode! = nil
    var columnNumbers5 :SKSpriteNode! = nil
    var columnNumbers6 :SKSpriteNode! = nil
    var columnNumbers7 :SKSpriteNode! = nil
    var columnNumbers8 :SKSpriteNode! = nil
    var columnNumbers9 :SKSpriteNode! = nil
    var columnNumbers10 :SKSpriteNode! = nil
    var columnNumbers11 :SKSpriteNode! = nil
    var columnNumbers12 :SKSpriteNode! = nil
    var columnNumbers13 :SKSpriteNode! = nil
    var columnNumbers14 :SKSpriteNode! = nil
    var columnNumbers15 :SKSpriteNode! = nil
    var columnNumbers16 :SKSpriteNode! = nil
    var columnNumbers17 :SKSpriteNode! = nil
    
    ////////////////////////////////////////
    
    var columnNumbers1Highlight :SKSpriteNode! = nil
    var columnNumbers2Highlight :SKSpriteNode! = nil
    var columnNumbers3Highlight :SKSpriteNode! = nil
    var columnNumbers4Highlight :SKSpriteNode! = nil
    var columnNumbers5Highlight :SKSpriteNode! = nil
    var columnNumbers6Highlight :SKSpriteNode! = nil
    var columnNumbers7Highlight :SKSpriteNode! = nil
    var columnNumbers8Highlight :SKSpriteNode! = nil
    var columnNumbers9Highlight :SKSpriteNode! = nil
    var columnNumbers10Highlight :SKSpriteNode! = nil
    var columnNumbers11Highlight :SKSpriteNode! = nil
    var columnNumbers12Highlight :SKSpriteNode! = nil
    var columnNumbers13Highlight :SKSpriteNode! = nil
    var columnNumbers14Highlight :SKSpriteNode! = nil
    var columnNumbers15Highlight :SKSpriteNode! = nil
    var columnNumbers16Highlight :SKSpriteNode! = nil
    var columnNumbers17Highlight :SKSpriteNode! = nil
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    init() {
        self.dataScreenTexture = SKTexture(imageNamed: "dataScreen")
        self.dataBorderTexture = SKTexture(imageNamed: "dataBorder")
        self.columnNumbersTexture1 = SKTexture(imageNamed: "bit_numbers1")
        self.columnNumbersTexture2 = SKTexture(imageNamed: "bit_numbers2")
        self.columnNumbersTexture3 = SKTexture(imageNamed: "bit_numbers3")
        self.columnNumbersTexture4 = SKTexture(imageNamed: "bit_numbers4")
        self.columnNumbersTexture5 = SKTexture(imageNamed: "bit_numbers5")
        self.numberHighlight = SKTexture(imageNamed: "bit_numberHighlight")
        
        
        super.init(texture: dataScreenTexture, color: .clear, size: dataScreenTexture.size())
        
        dataScreenCrop.maskNode = SKSpriteNode(texture: dataScreenTexture)
        
        columnNumbers1 = SKSpriteNode(texture: self.columnNumbersTexture1)
        columnNumbers1.position = CGPoint(x: 0, y: 100)
        
        columnNumbers2 = SKSpriteNode(texture: self.columnNumbersTexture2)
        columnNumbers2.position = CGPoint(x: 10, y: 100)
        
        columnNumbers3 = SKSpriteNode(texture: self.columnNumbersTexture3)
        columnNumbers3.position = CGPoint(x: 20, y: 100)
        
        columnNumbers4 = SKSpriteNode(texture: self.columnNumbersTexture4)
        columnNumbers4.position = CGPoint(x: -10, y: 100)
        
        columnNumbers5 = SKSpriteNode(texture: self.columnNumbersTexture5)
        columnNumbers5.position = CGPoint(x: -20, y: 100)
        
        columnNumbers6 = SKSpriteNode(texture: self.columnNumbersTexture1)
        columnNumbers6.position = CGPoint(x: 30, y: 100)
        
        columnNumbers7 = SKSpriteNode(texture: self.columnNumbersTexture2)
        columnNumbers7.position = CGPoint(x: 40, y: 100)
        
        columnNumbers8 = SKSpriteNode(texture: self.columnNumbersTexture3)
        columnNumbers8.position = CGPoint(x: -30, y: 100)
        
        columnNumbers9 = SKSpriteNode(texture: self.columnNumbersTexture4)
        columnNumbers9.position = CGPoint(x: -40, y: 100)
        
        columnNumbers10 = SKSpriteNode(texture: self.columnNumbersTexture5)
        columnNumbers10.position = CGPoint(x: 50, y: 100)
        
        columnNumbers11 = SKSpriteNode(texture: self.columnNumbersTexture2)
        columnNumbers11.position = CGPoint(x: 60, y: 100)
        
        columnNumbers12 = SKSpriteNode(texture: self.columnNumbersTexture4)
        columnNumbers12.position = CGPoint(x: -50, y: 100)
        
        columnNumbers13 = SKSpriteNode(texture: self.columnNumbersTexture3)
        columnNumbers13.position = CGPoint(x: -60, y: 100)
        
        columnNumbers14 = SKSpriteNode(texture: self.columnNumbersTexture4)
        columnNumbers14.position = CGPoint(x: 70, y: 100)
        
        columnNumbers15 = SKSpriteNode(texture: self.columnNumbersTexture3)
        columnNumbers15.position = CGPoint(x: 80, y: 100)
        
        columnNumbers16 = SKSpriteNode(texture: self.columnNumbersTexture4)
        columnNumbers16.position = CGPoint(x: -70, y: 100)
        
        columnNumbers17 = SKSpriteNode(texture: self.columnNumbersTexture3)
        columnNumbers17.position = CGPoint(x: -80, y: 100)
        
        ///////////////////////////////////////////////////////////////////
        
        columnNumbers1Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers1Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers2Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers2Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers3Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers3Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers4Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers4Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers5Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers5Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers6Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers6Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers7Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers7Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers8Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers8Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers9Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers9Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers10Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers10Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers11Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers11Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers12Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers12Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers13Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers13Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers14Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers14Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers15Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers15Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers16Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers16Highlight.position = CGPoint(x: 0, y: -40)
        
        columnNumbers17Highlight = SKSpriteNode(texture: self.numberHighlight)
        columnNumbers17Highlight.position = CGPoint(x: 0, y: -40)
        
        
        ///////////////////////////////////////////////////////////////////
        
        dataScreenCrop.addChild(columnNumbers1)
        dataScreenCrop.addChild(columnNumbers2)
        dataScreenCrop.addChild(columnNumbers3)
        dataScreenCrop.addChild(columnNumbers4)
        dataScreenCrop.addChild(columnNumbers5)
        dataScreenCrop.addChild(columnNumbers6)
        dataScreenCrop.addChild(columnNumbers7)
        dataScreenCrop.addChild(columnNumbers8)
        dataScreenCrop.addChild(columnNumbers9)
        dataScreenCrop.addChild(columnNumbers10)
        dataScreenCrop.addChild(columnNumbers11)
        dataScreenCrop.addChild(columnNumbers12)
        dataScreenCrop.addChild(columnNumbers13)
        dataScreenCrop.addChild(columnNumbers14)
        dataScreenCrop.addChild(columnNumbers15)
        dataScreenCrop.addChild(columnNumbers16)
        dataScreenCrop.addChild(columnNumbers17)

        ///////////////////////////////////////////////////////////////////
        
        columnNumbers1.addChild(columnNumbers1Highlight)
        columnNumbers2.addChild(columnNumbers2Highlight)
        columnNumbers3.addChild(columnNumbers3Highlight)
        columnNumbers4.addChild(columnNumbers4Highlight)
        columnNumbers5.addChild(columnNumbers5Highlight)
        columnNumbers6.addChild(columnNumbers6Highlight)
        columnNumbers7.addChild(columnNumbers7Highlight)
        columnNumbers8.addChild(columnNumbers8Highlight)
        columnNumbers9.addChild(columnNumbers9Highlight)
        columnNumbers10.addChild(columnNumbers10Highlight)
        columnNumbers11.addChild(columnNumbers11Highlight)
        columnNumbers12.addChild(columnNumbers12Highlight)
        columnNumbers13.addChild(columnNumbers13Highlight)
        columnNumbers14.addChild(columnNumbers14Highlight)
        columnNumbers15.addChild(columnNumbers15Highlight)
        columnNumbers16.addChild(columnNumbers16Highlight)
        columnNumbers17.addChild(columnNumbers17Highlight)
      

        
        ///////////////////////////////////////////////////////////////////
        
        addChild(dataScreenCrop)
        
     
        
        
        dataBorder = SKSpriteNode(texture: self.dataBorderTexture)
        dataBorder.setScale(0)
        dataBorder.position = CGPoint(x: -20, y: 0)
        addChild(dataBorder)
        
       
        
        
    }
    
    func expand () {
        
        self.run(SKAction.scale(to: 1.0, duration: 0.2))
        dataBorder.run(SKAction.scale(to: 1.0, duration: 0.2))
        
        columnNumbers1.run(SKAction.sequence([
            SKAction.wait(forDuration: 0.5),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 3),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2)
                    ])
                
                ])
            ]))
       
        self.columnNumbers1Highlight.addHighlightNumber()
        self.columnNumbers1Highlight.addGlowtoNumber()
    
        columnNumbers2.run(SKAction.sequence([
            SKAction.wait(forDuration: 0.7),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.2),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture5),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4)
                    ])
                ])
            ]))
        
        self.columnNumbers2Highlight.addHighlightNumber()
        self.columnNumbers2Highlight.addGlowtoNumber()
        
        columnNumbers3.run(SKAction.sequence([
            SKAction.wait(forDuration: 0.9),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.6),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1)
                    ])
                ])
            ]))
        
        self.columnNumbers3Highlight.addHighlightNumber()
        self.columnNumbers3Highlight.addGlowtoNumber()
        
        columnNumbers4.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.1),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 1.5),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2)
                    ])
                ])
            ]))
        
        self.columnNumbers4Highlight.addHighlightNumber()
        self.columnNumbers4Highlight.addGlowtoNumber()
        
        columnNumbers5.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.3),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.5),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3)
                    ])
                ])
            ]))
        
        self.columnNumbers5Highlight.addHighlightNumber()
        self.columnNumbers5Highlight.addGlowtoNumber()
        
        columnNumbers6.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.5),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 1),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4)
                    ])
                ])
            ]))
        
        self.columnNumbers6Highlight.addHighlightNumber()
        self.columnNumbers6Highlight.addGlowtoNumber()
        
        columnNumbers7.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.7),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 1.4),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture5),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1)
                    ])
                ])
            ]))
        
        self.columnNumbers7Highlight.addHighlightNumber()
        self.columnNumbers7Highlight.addGlowtoNumber()
        
        columnNumbers8.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.9),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 1.8),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2)
                    ])
                ])
            ]))
        
        self.columnNumbers8Highlight.addHighlightNumber()
        self.columnNumbers8Highlight.addGlowtoNumber()
        
        columnNumbers9.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.1),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.3),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1)
                    ])
                ])
            ]))
        
        self.columnNumbers9Highlight.addHighlightNumber()
        self.columnNumbers9Highlight.addGlowtoNumber()
        
        columnNumbers10.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.3),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.4),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture5),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2)
                    ])
                ])
            ]))
        
        self.columnNumbers10Highlight.addHighlightNumber()
        self.columnNumbers10Highlight.addGlowtoNumber()
        
        columnNumbers11.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.5),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.0),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture5)
                    ])
                ])
            ]))
        
        self.columnNumbers11Highlight.addHighlightNumber()
        self.columnNumbers11Highlight.addGlowtoNumber()
        
        columnNumbers12.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.2),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.2),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3)
                    ])
                ])
            ]))
        
        self.columnNumbers12Highlight.addHighlightNumber()
        self.columnNumbers12Highlight.addGlowtoNumber()
        
        columnNumbers13.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.8),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 1.8),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture5),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4)
                    ])
                ])
            ]))
        
        self.columnNumbers13Highlight.addHighlightNumber()
        self.columnNumbers13Highlight.addGlowtoNumber()
        
        columnNumbers14.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.6),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 1.4),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2)
                    ])
                ])
            ]))
        
        self.columnNumbers14Highlight.addHighlightNumber()
        self.columnNumbers14Highlight.addGlowtoNumber()

        columnNumbers15.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.4),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.0),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3)
                    ])
                ])
            ]))
        
        self.columnNumbers15Highlight.addHighlightNumber()
        self.columnNumbers15Highlight.addGlowtoNumber()

        columnNumbers16.run(SKAction.sequence([
            SKAction.wait(forDuration: 1.6),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 1.8),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture3),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture5),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture4)
                    ])
                ])
            ]))
        
        self.columnNumbers16Highlight.addHighlightNumber()
        self.columnNumbers16Highlight.addGlowtoNumber()

        columnNumbers17.run(SKAction.sequence([
            SKAction.wait(forDuration: 2.6),
            SKAction.group([
                SKAction.moveTo(y: -100, duration: 2.0),
                SKAction.sequence([
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture1),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture2),
                    SKAction.wait(forDuration: 0.5),
                    SKAction.setTexture(columnNumbersTexture5)
                    ])
                ])
            ]))
        
        self.columnNumbers17Highlight.addHighlightNumber()
        self.columnNumbers17Highlight.addGlowtoNumber()

    }
    
  
}

extension SKSpriteNode {
    func addHighlightNumber(radius: Float = 10, intensity: Float = 5){
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIBloom", withInputParameters: ["inputRadius": radius, "inputIntensity": intensity])
        effectNode.zPosition = 3
    }
    
    func addGlowtoNumber(radius: Float = 5){
        let effectNode = SKEffectNode()
        effectNode.shouldRasterize = true
        
        addChild(effectNode)
        effectNode.addChild(SKSpriteNode(texture: texture))
        effectNode.filter = CIFilter(name: "CIGaussianBlur", withInputParameters: ["inputRadius": radius])
        effectNode.zPosition = -1
    }
}
