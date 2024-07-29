//
//  UIColor+CustomColors.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 24/07/24.
//

import UIKit

extension UIColor {
    static var customBackground: UIColor {
        return UIColor { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: 5/255, green: 10/255, blue: 48/255, alpha: 1.0)
            } else {
                return UIColor(red: 214/255, green: 236/255, blue: 253/255, alpha: 1.0)
            }
        }
    }
    
    static var customTextColor: UIColor {
        return UIColor { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: 244/255, green: 246/255, blue: 252/255, alpha: 1.0)
            } else {
                return UIColor(red: 5/255, green: 10/255, blue: 48/255, alpha: 1.0)
            }
        }
    }
    
    static var customSecondaryTextColor: UIColor {
        return UIColor { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: 244/255, green: 246/255, blue: 252/255, alpha: 1.0)
            } else {
                return UIColor(red: 58/255, green: 155/255, blue: 220/255, alpha: 1.0)
            }
        }
    }
}
