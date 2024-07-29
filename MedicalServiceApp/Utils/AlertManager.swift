//
//  AlertManager.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 21/07/24.
//

import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Entiendo", style: .default, handler: nil))
            vc.present(alert, animated: true)
        }
    }
    
}

// MARK: - Show Validation Alerts
extension AlertManager {
    
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Email inválido", message: "El email ingresado no es válido, por favor ingresa un email correcto.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Contraseña no válida", message: "La contraseña ingresada no es válida, por favor elige otra.")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Nombre inválido", message: "El nombre ingresado no es válido, por favor ingresa un nombre correcto.")
    }
}

// MARK: - Registration Errors
extension AlertManager {
    
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Error al registrarse", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error al registrarse", message: "\(error.localizedDescription)")
    }
}

// MARK: - Log In Errors
extension AlertManager {
    
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Error al iniciar sesión", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error al iniciar sesión", message: "\(error.localizedDescription)")
    }
}

// MARK: - Log Out Errors
extension AlertManager {

    public static func showLogoutErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error al cerrar sesión", message: "\(error.localizedDescription)")
    }
}

// MARK: - Forgo Password
extension AlertManager {
    
    public static func showPasswordResetSentAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Correo para restablecer la contraseña enviado", message: nil)
    }
    
    public static func showErrorSendingPasswordResetAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error al restablecer la contraseña", message: "\(error.localizedDescription)")
    }
}

// MARK: - Fetching User Errors
extension AlertManager {
    
    public static func showUnknownFetchingUserErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Error al traer los usuarios", message: nil)
    }
    
    public static func showFetchingUserErrorAlert(on vc: UIViewController, with error: Error) {
        self.showBasicAlert(on: vc, title: "Error al traer los datos de usuario", message: "\(error.localizedDescription)")
    }
}
