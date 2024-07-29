//
//  PaddedLabel.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 24/07/24.
//

import UIKit

class PaddedLabel: UILabel {
    var padding = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) 

    override func drawText(in rect: CGRect) {
        let insetRect = rect.inset(by: padding)
        super.drawText(in: insetRect)
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }
}
