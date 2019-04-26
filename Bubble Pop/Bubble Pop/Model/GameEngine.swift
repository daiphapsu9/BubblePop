//
//  GameEngine.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation

let DEFAULT_DURATION = 5

class GameEngine {
    
    var score : Int = 0
    var duration : Int
    static let shared = GameEngine()
    
    private init() {
        score = 0
        duration = DEFAULT_DURATION
    }
    
    func reset() {
        score = 0
        duration = DEFAULT_DURATION
    }
}
