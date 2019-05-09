//
//  GameEngine.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

// MARK: CONSTANT

let MAX_DURATION_KEY = "DURATION_KEY"
let MAX_BUBBLE_KEY = "MAX_BUBBLE_KEY"
let DEFAULT_PLAYER_NAME = "Anonymous"
let DEFAULT_DURATION = 30
let DEFAULT_MAX_BUBBLE = 15

enum GameMode {
    case classic
    case floating
}

class Utilities {
    
    var score : Int = 0
    var currentBubbleNumber : Int = 0
    var currentPlayerName : String = DEFAULT_PLAYER_NAME
    var gameMode : GameMode? = .classic
    var comboLength : Int = 1
    
    
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
        duration = UserDefaults.standard.integer(forKey: MAX_DURATION_KEY)
        maxNumberOfBubble = UserDefaults.standard.integer(forKey: MAX_BUBBLE_KEY)
        lastPoppedBubbleType = nil
        setDefaultValue()
        
    }
    
    func reset() {
        score = 0
        setDefaultValue()
        lastPoppedBubbleType = nil
        currentBubbleNumber = 0
        comboLength = 1
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
    
    func retrievePlayers() -> [Player]{
        // load all player
        var players : [Player] = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let result : [PlayerEntity] = appDelegate.getPlayers()
        players = result.map({$0.toPlayer()})
        players.sort() { $0.score > $1.score }
        return players
    }
    
    func getHighestScore() -> Int{
        // load all player
        let players = retrievePlayers()
        if(players.count >= 1) { return players[0].score }
        else { return 0 }
    }
}
