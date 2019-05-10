//
//  SettingsViewController.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 7/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var noBubbleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var noBubbleSlider: UISlider!
    @IBOutlet weak var durationSlider: UISlider!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup slider init position based on saved value
        noBubbleSlider.value = Float(Utilities.shared.maxNumberOfBubble)
        durationSlider.value = Float(Utilities.shared.maxDuration)
        noBubbleLabel.text = "\(Int(noBubbleSlider.value))"
        durationLabel.text = "\(Int(durationSlider.value))"
    }
    
    @IBAction func numberOfBubbleValueChanged(_ sender: UISlider) {
        noBubbleLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func gameDurationValueChanged(_ sender: UISlider) {
        durationLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        Utilities.shared.maxDuration = Int(durationSlider.value)
        Utilities.shared.maxNumberOfBubble = Int(noBubbleSlider.value)
        navigationController?.popViewController(animated: true)
    }
    
}
