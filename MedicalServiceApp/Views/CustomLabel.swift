//
//  CustomLabel.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 24/07/24.
//

import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        // Configura el color de texto personalizado
        textColor = .customTextColor
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
