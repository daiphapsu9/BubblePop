//
//  GameEngine.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

let MAX_DURATION_KEY = "DURATION_KEY"
let MAX_BUBBLE_KEY = "MAX_BUBBLE_KEY"
let DEFAULT_DURATION = 30
let DEFAULT_MAX_BUBBLE = 15

class Utilities {
    
    var score : Double = 0.0
    var maxNumberOfBubble : Int = DEFAULT_MAX_BUBBLE {
        didSet {
            UserDefaults.standard.set(maxNumberOfBubble, forKey: MAX_BUBBLE_KEY)
        }
    }
    
    var maxDuration : Int = DEFAULT_DURATION {
        didSet {
            UserDefaults.standard.set(maxDuration, forKey: MAX_DURATION_KEY)
        }
    }
    
    var duration : Int {
        didSet {
            if duration == 0 {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: GAME_OVER_NOTIF), object: nil)
            }
        }
    }
    var lastPoppedBubbleType : BubbleType?
    
    static let shared = Utilities()
    
    private init() {
        score = 0
        duration = UserDefaults.standard.integer(forKey: MAX_DURATION_KEY)
        maxNumberOfBubble = UserDefaults.standard.integer(forKey: MAX_BUBBLE_KEY)
        lastPoppedBubbleType = nil
    }
    
    func reset() {
        score = 0
        setDefaultValue()
        lastPoppedBubbleType = nil
    }
    
    func getFont(withSize size: Float) -> UIFont {
        let myFontSize = CGFloat(size)
        let myFont = UIFont(name: "Double•Bubble Shadow", size: myFontSize)
        return myFont!
    }
    
    func setDefaultValue(){
        if (UserDefaults.standard.integer(forKey: MAX_DURATION_KEY) <= 0) {
            duration = DEFAULT_DURATION
        } else {
            duration = UserDefaults.standard.integer(forKey: MAX_DURATION_KEY)
        }
        
        if (UserDefaults.standard.integer(forKey: MAX_BUBBLE_KEY) <= 0) {
            maxNumberOfBubble = DEFAULT_MAX_BUBBLE
        } else {
            maxNumberOfBubble = UserDefaults.standard.integer(forKey: MAX_BUBBLE_KEY)
        }
    }
    
//    func getAllFonts(){
//        for font in UIFont.familyNames {
//            print("font === \(font)")
//        }
//    }
    
}
