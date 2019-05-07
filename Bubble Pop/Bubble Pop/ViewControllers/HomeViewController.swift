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
    @IBOutlet weak var titleSecondLabel: UILabel!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK:
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Bubble POP"
        titleLabel.font = GameEngine.shared.getFont(withSize: 70)
//        titleSecondLabel.font = GameEngine.shared.getFont(withSize: 70)
        
        // Do any additional setup after loading the view, typically from a nib.
        GameEngine.shared.getAllFonts()
        
        let image = UIImage(named: "background1")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    // MARK:
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }


}

