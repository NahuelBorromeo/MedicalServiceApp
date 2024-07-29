//
//  CustomButton.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 21/07/24.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case big
        case medium
        case small
    }
    
    enum BackgroundColor {
        case green
        case blue
    }
    
    init(title: String, backgroundColor: BackgroundColor? = nil, fontSize: FontSize){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        
        
        let titleColor: UIColor = backgroundColor != nil ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        }
        
        switch backgroundColor {
        case .blue:
            self.backgroundColor = .systemBlue
        case .green:
            self.backgroundColor = .systemGreen
        case .none:
            self.backgroundColor = .clear
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
