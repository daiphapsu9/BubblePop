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
        setupView()
        setupAction()
        // add observer to notify when game is over
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handleGameOver),
            name: NSNotification.Name(rawValue: GAME_OVER_NOTIF),
            object: nil)
    }
    
    // Setup view
    func setupView() {
        self.backgroundColor = UIColor.white
        removeAllChildren()
        Utilities.shared.reset()
    }
    
    func setupAction() {
        let generateAction = SKAction.run({ [weak self] in
            self!.generateBubble()
        })
        
        let clearAction = SKAction.run({ [weak self] in
            self!.clearCurrentScreen()
        })
        
        self.run(SKAction.repeatForever(SKAction.sequence([generateAction, SKAction.wait(forDuration: 1), clearAction])))
        
        let updateTimeAction = SKAction.run({ [weak self] in
            self!.updateTime()
        })
        self.run(SKAction.repeatForever(SKAction.sequence([updateTimeAction, SKAction.wait(forDuration: 1)])))
    }
    
    func clearCurrentScreen() {
        var count = 0;
        let numberOfBubbleClear = Int.random(in: 0..<self.children.count)
        for child in children {
            if(count >= numberOfBubbleClear) { return }
            if child is BubbleNode {
                let bubbleNode = child as! BubbleNode
                if (bubbleNode.isBurstingAnimating) { return }
                child.removeFromParent()
                count += 1
                Utilities.shared.currentBubbleNumber -= 1
            }
        }
    }
    
    // helper
    
    func randomizeBubblePosition() -> CGPoint {
        switch Utilities.shared.gameMode {
        case .classic?:
            return CGPoint(x: Int.random(in: Int(getBubbleSize().width/2)..<Int((self.view?.bounds.width)!-getBubbleSize().width/2)), y: Int.random(in: Int(getBubbleSize().height/2)..<Int((self.view?.bounds.height)!-getBubbleSize().height/2)))
        default:
            return CGPoint(x: Int.random(in: Int(getBubbleSize().width/2)..<Int((self.view?.bounds.width)!-getBubbleSize().width/2)), y: 0)
        }
    }
    
    
    
    func generateBubble() {
        var numberOfBubble = 0
        switch Utilities.shared.gameMode {
        case .classic?:
            numberOfBubble = Int.random(in: 0...Utilities.shared.maxNumberOfBubble)
        default:
            numberOfBubble = Int.random(in: 1...5)
        }
        
        for _ in 0...numberOfBubble {
            let type = randomType()
            let bubble = BubbleNode(type : type)
            bubble.size = getBubbleSize()
            bubble.position = randomizeBubblePosition()
            var shouldAdd = true
            for child in children {
                if child is BubbleNode {
                    if (child.intersects(bubble) == true) {
                        shouldAdd = false
                    }
                }
            }
            
            if (shouldAdd == true && Utilities.shared.currentBubbleNumber < Utilities.shared.maxNumberOfBubble) {
                addChild(bubble)
                bubble.run(SKAction.fadeIn(withDuration: 0.5))
                if (Utilities.shared.gameMode == .floating) { bubble.float(toY: (self.view?.bounds.height)!) }
                Utilities.shared.currentBubbleNumber += 1
            }
        }
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
    
    func getBubbleSize() -> CGSize {
        return CGSize(width: Int((self.view?.bounds.width)!/6), height: Int((self.view?.bounds.width)!/6))
    }
    
    func updateTime() {
        Utilities.shared.duration -= 1
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: TIME_UPDATE_NOTIF), object: nil)
        
    }
    // MARK: Notification Handler
    @objc func handleGameOver() {
        self.removeAllActions()
        self.removeAllChildren()
    }
}
