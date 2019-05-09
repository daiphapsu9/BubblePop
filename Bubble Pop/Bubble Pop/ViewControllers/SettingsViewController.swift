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
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noBubbleSlider.value = Float(Utilities.shared.maxNumberOfBubble)
        durationSlider.value = Float(Utilities.shared.maxDuration)
        noBubbleLabel.text = "\(Int(noBubbleSlider.value))"
        durationLabel.text = "\(Int(durationSlider.value))"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
