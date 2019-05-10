//
//  FloatingModeViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 10/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class FloatingModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToGameViewController") {
            Utilities.shared.gameMode = .floating
        }
    }
}
