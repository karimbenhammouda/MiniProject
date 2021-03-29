//
//  NSAttributedString+Utils.swift
//  MiniProjet
//
//  Created by Karim BEN-HAMMOUDA on 27/03/2021.
//

import UIKit

public extension NSAttributedString {
    func calculateHeight(width: CGFloat, _ maxHeight: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGFloat {
        let rect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingRect = self.boundingRect(with: rect,
                                             options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                             context: nil)
        return min(ceil(boundingRect.height), maxHeight)
    }
}
