//
//  UIViewController+Extension.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 26/4/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

// Extension used to hide keyboard when user taps outside
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
