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
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
        setupView()
        // Do any additional setup after loading the view.
        if let view = self.view as! SKView? {
            let sceneSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height - 50)
            let scene = GameScene(size: sceneSize)
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
        }
    }
    
    // Setup view
    func setupView() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        labelScore.text = "Score: \(GameEngine.shared.score)"
        labelTimeLeft.text = "Time left: \(GameEngine.shared.duration)"
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
        labelScore.text = "Score: \(GameEngine.shared.score)"
    }
    
    @objc func updateTime() {
        labelTimeLeft.text = "Time left: \(GameEngine.shared.duration)"
    }
    
    @objc func handleGameOver() {
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
