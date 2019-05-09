//
//  UIView+Extension.swift
//  Bubble Pop
//
//  Created by Quang Binh Dang on 10/5/19.
//  Copyright © 2019 UTS. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadeIn(duration : Double, delay : Double) {
        UIView.animate(withDuration: duration, delay: delay, options: [UIView.AnimationOptions.curveEaseIn], animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    func fadeOut(duration : Double, delay : Double) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
}
