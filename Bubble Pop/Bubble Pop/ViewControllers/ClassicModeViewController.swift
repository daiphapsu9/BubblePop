//
//  ClassicModeViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 10/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class ClassicModeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ToGameViewController") {
            // pass data to next view
            Utilities.shared.gameMode = .classic
        }
    }
}
