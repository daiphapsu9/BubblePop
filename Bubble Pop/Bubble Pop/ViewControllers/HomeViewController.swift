//
//  ViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 11/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        playerNameTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    // configure and add background image to mainscreen
    func addBackground() {
        let image = UIImage(named: "background1")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    // MARK: Keyboard notification handler
    // used to move view up when keyboard is showing on screen so it wont hide textfield
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    // used to move view up when keyboard disappear
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    // MARK: Textfield delegate
    // when user pressed Return Key on keyboard, make it disappear
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // MARK: Segue prepare

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToModeVC") {
            // pass data to next view
            if let name = playerNameTextField.text {
                Utilities.shared.currentPlayerName = (!name.isEmpty) ? name : DEFAULT_PLAYER_NAME
            } else {
                Utilities.shared.currentPlayerName = DEFAULT_PLAYER_NAME
            }
        }
    }
}

