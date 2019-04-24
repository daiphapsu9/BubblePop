//
//  GameScene.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 24/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        let generateAction = SKAction.run({ [weak self] in
            self!.generateBubble()
        })
        self.run(SKAction.repeatForever(SKAction.sequence([generateAction, SKAction.wait(forDuration: 1.0)])))
//        self.generateBubble()
        
//        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(doAction), SKAction.waitForDuration(1.0)])))
    }
    
    // helper
    func generateBubble() {
        let type = randomType()
        let bubble = BubbleNode(type : type)
        bubble.position = CGPoint(x: Int.random(in: Int(bubble.size.width/2)..<Int((self.view?.bounds.width)!-bubble.size.width/2)), y: 0)
        bubble.size = CGSize(width: 100.0, height: 100.0)
        addChild(bubble)
        bubble.float(toY: (self.view?.bounds.height)!)
    }
    
    
    func randomType() -> BubbleType {
        let randomNumber = Int.random(in: 0 ..< 100)
        if (randomNumber < 5) {
            return .Black
        } else if (randomNumber < 15) {
            return .Blue
        } else if (randomNumber < 30) {
            return .Green
        } else if (randomNumber < 60) {
            return .Pink
        } else {
            return .Red
        }
    }
    
}
