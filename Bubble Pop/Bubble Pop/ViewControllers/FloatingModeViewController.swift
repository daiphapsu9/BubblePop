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
            // pass data to next view
            Utilities.shared.gameMode = .floating
        }
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
