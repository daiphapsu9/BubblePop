//
//  MainViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 24/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var labelTimeLeft: UILabel!
    @IBOutlet weak var labelHiScore: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var gameView: SKView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
        setupView()
        // Do any additional setup after loading the view.
        if let view = self.gameView {
            let sceneSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
            let scene = GameScene(size: sceneSize)
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .resizeFill
            
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    // Setup view
    func setupView() {
        labelScore.text = "Score: \(Utilities.shared.score)"
        labelTimeLeft.text = "Time left: \(Utilities.shared.duration)"
    }
    
    // MARK: Notification handler
    func setupNotification() {
        // add observer to update score
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updateScore),
            name: NSNotification.Name(rawValue: SCORE_UPDATE_NOTIF),
            object: nil)
        
        // add observer to update time
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updateTime),
            name: NSNotification.Name(rawValue: TIME_UPDATE_NOTIF),
            object: nil)
        
        // add observer to notify when game is over
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.handleGameOver),
            name: NSNotification.Name(rawValue: GAME_OVER_NOTIF),
            object: nil)
    }

    // MARK: Game update
    @objc func updateScore() {
        labelScore.text = "Score: \(Utilities.shared.score)"
    }
    
    @objc func updateTime() {
        labelTimeLeft.text = "Time left: \(Utilities.shared.duration)"
    }
    
    @objc func handleGameOver() {
        // create player to save
        let playerName = Utilities.shared.currentPlayerName
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.savePlayer(name: playerName, score: Int16(Utilities.shared.score))
        
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            let gameOverVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GameOverViewController")
            navigationController.pushViewController(gameOverVC,animated: true)
        }
    }
    
    // MARK:
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
