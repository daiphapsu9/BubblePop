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
}

class BubbleNode : SKSpriteNode {
    
    init(type : BubbleType) {
        var imageName = "RedBubble"
        let texture = SKTexture(imageNamed: imageName)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        imageName = getBubbleImageName(type)
        self.texture = SKTexture(imageNamed: imageName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func float(toY y: CGFloat) {
        let moveAction = (SKAction.move(to: CGPoint(x: self.position.x, y: y), duration: 3))
        let doneAction = SKAction.run({ [weak self] in
            self!.removeFromParent()
        })
        self.run(SKAction.sequence([moveAction,doneAction]))
    }
    
    func getBubbleImageName(_ type : BubbleType) -> String {
        switch type {
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
    
}
