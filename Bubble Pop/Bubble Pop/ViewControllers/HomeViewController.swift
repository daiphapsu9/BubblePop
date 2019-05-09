//
//  ViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 11/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var playerNameTextField: UITextField!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK:
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        hideKeyboardWhenTappedAround()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Bubble POP"
        titleLabel.font = Utilities.shared.getFont(withSize: 70)
//        titleSecondLabel.font = GameEngine.shared.getFont(withSize: 70)
        
        // Do any additional setup after loading the view, typically from a nib.
//        GameEngine.shared.getAllFonts()
        
        let image = UIImage(named: "background1")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    // MARK:
    override func viewWillDisappear(_ animated: Bool) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToGameVC") {
            // pass data to next view
            if let name = playerNameTextField.text {
                Utilities.shared.currentPlayerName = (!name.isEmpty) ? name : DEFAULT_PLAYER_NAME
            } else {
                Utilities.shared.currentPlayerName = DEFAULT_PLAYER_NAME
            }
            
        }
    }
}

