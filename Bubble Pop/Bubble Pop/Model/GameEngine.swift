//
//  GameEngine.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

let DEFAULT_DURATION = 5

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
    
    func getFont(withSize size: Float) -> UIFont {
        let myFontSize = CGFloat(size)
        let myFont = UIFont(name: "Double•Bubble Shadow", size: myFontSize)
        
        return myFont!
    }
    
    func getAllFonts(){
        for font in UIFont.familyNames {
            print("font === \(font)")
        }
    }
    
}
