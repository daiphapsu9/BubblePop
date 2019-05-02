//
//  GameEngine.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

let DEFAULT_DURATION = 60

class GameEngine {
    
    var score : Double = 0.0
    var duration : Int {
        didSet {
            if duration == 0 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: GAME_OVER_NOTIF), object: nil)
            }
        }
    }
    var lastPoppedBubble : BubbleNode?
    
    static let shared = GameEngine()
    
    private init() {
        score = 0
        duration = DEFAULT_DURATION
        lastPoppedBubble = nil
    }
    
    func reset() {
        score = 0
        duration = DEFAULT_DURATION
        lastPoppedBubble = nil
    }
}
