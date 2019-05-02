//
//  GameOverViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
        labelScore.text = "\(GameEngine.shared.score)"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func submitButtonTapped(_ sender: Any) {
        let playerName = (playerNameTextField.text == nil || (playerNameTextField.text?.isEmpty)!) ? "Anonymous" : playerNameTextField.text
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.savePlayer(name: playerName!, score: Int16(GameEngine.shared.score))
        // create player to save
        
        
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popToRootViewController(animated: true)
            self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
    // MARK:
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
