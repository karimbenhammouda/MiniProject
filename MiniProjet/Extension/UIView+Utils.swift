//
//  UIView+Utils.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

extension UIView {
    func setRadius(_ radius: CGFloat? = nil) {
        layer.masksToBounds = true
        layer.cornerRadius = radius ?? frame.height / 2
        
    }
}
