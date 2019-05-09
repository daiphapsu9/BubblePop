//
//  BubbleNode.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 24/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import SpriteKit

enum BubbleType {
    case Red
    case Pink
    case Green
    case Blue
    case Black
    
    var imageName : String {
        switch self {
        case .Red:
            return "RedBubble"
        case .Pink:
            return "PinkBubble"
        case .Green:
            return "GreenBubble"
        case .Blue:
            return "BlueBubble"
        case .Black:
            return "BlackBubble"
        }
    }
    
    var speed : Int {
        switch self {
        case .Red:
            return 150
        case .Pink:
            return 200
        case .Green:
            return 250
        case .Blue:
            return 300
        case .Black:
            return 400
        }
    }
    
    var score : Double {
        switch self {
        case .Red:
            return 1
        case .Pink:
            return 2
        case .Green:
            return 5
        case .Blue:
            return 8
        case .Black:
            return 10
        }
    }
}

protocol BubbleNodeDelegate: class {
    func bubbleTapped(_ bubble: BubbleNode)
}

class BubbleNode : SKSpriteNode {
    
    var type : BubbleType = .Red
    weak var delegate: BubbleNodeDelegate!
    var isBurstingAnimating = false
    
    init(type : BubbleType) {
        let texture = SKTexture(imageNamed: type.imageName)
        self.type = type
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: 75, height: 75))
        isUserInteractionEnabled = true
        createBurstingSprite()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func float(toY y: CGFloat) {
        let duration = Double(Float(y)/Float(type.speed))
//        let duration = Double(Float(y)/Float(50))
        let moveAction = (SKAction.move(to: CGPoint(x: self.position.x, y: y), duration: duration))
        let doneAction = SKAction.run({ [weak self] in
            self!.removeFromParent()
            Utilities.shared.currentBubbleNumber -= 1
        })
        self.run(SKAction.sequence([moveAction,doneAction]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isBurstingAnimating = true
        if let lastType = Utilities.shared.lastPoppedBubbleType {
            if (lastType == self.type) {
                    Utilities.shared.score += type.score * 1.5
            } else {
                Utilities.shared.score += type.score
            }
        } else {
            Utilities.shared.score += type.score
        }
        Utilities.shared.lastPoppedBubbleType = type
        Utilities.shared.currentBubbleNumber -= 1
        busting()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: SCORE_UPDATE_NOTIF), object: nil)
    }
    
    var bubbleBurstFrames: [SKTexture] = []
    
    func createBurstingSprite() {
        let atlas = SKTextureAtlas(named: "sprite")
        var burstFrame: [SKTexture] = []
        
        let numImages = atlas.textureNames.count
        for i in 1...numImages {
            let textureName = "\(i)"
            burstFrame.append(atlas.textureNamed(textureName))
        }
        bubbleBurstFrames = burstFrame
    }
    
    func busting() {
        let firstFrameTexture = bubbleBurstFrames[0]
        var burstingNode : SKSpriteNode
        burstingNode = SKSpriteNode(texture: firstFrameTexture)
        burstingNode.size = CGSize(width: 75, height: 75)
        burstingNode.position = CGPoint(x: frame.midX, y: frame.midY)
        parent!.addChild(burstingNode)
        let animateAction = SKAction.animate(with: bubbleBurstFrames,
                                             timePerFrame: 0.1,
                                             resize: false,
                                             restore: false)
        let doneAction = SKAction.run({ [weak self] in
            burstingNode.removeFromParent()
            self?.removeFromParent()
        })
        
        burstingNode.run(SKAction.sequence([animateAction,SKAction.fadeOut(withDuration: 0.1), doneAction]))
    }
}
