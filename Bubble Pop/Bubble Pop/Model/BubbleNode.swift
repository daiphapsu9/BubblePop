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
            return 100
        case .Pink:
            return 150
        case .Green:
            return 200
        case .Blue:
            return 250
        case .Black:
            return 350
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
    
    init(type : BubbleType) {
        let texture = SKTexture(imageNamed: type.imageName)
        self.type = type
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: 50, height: 50))
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func float(toY y: CGFloat) {
        let duration = Double(Float(y)/Float(50))
        let moveAction = (SKAction.move(to: CGPoint(x: self.position.x, y: y), duration: duration))
        let doneAction = SKAction.run({ [weak self] in
            self!.removeFromParent()
        })
        self.run(SKAction.sequence([moveAction,doneAction]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.run(SKAction.fadeOut(withDuration: 0.1))
        
//        if let lastBubble = GameEngine.sharedz
//            GameEngine.shared.score += type.score
//        } else {
            GameEngine.shared.score += type.score + type.score * 1.5
//        }
        
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: SCORE_UPDATE_NOTIF), object: nil)
    }
    
}
