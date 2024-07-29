//
//  Validator.swift
//  MedicalServiceApp
//
//  Created by Nahuel Borromeo Da costa on 21/07/24.
//

import Foundation

class Validator {
    
    static func isValidEmail(for email: String) -> Bool {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
        return emailPred
    }
    
    static func isValidUsername(for username: String) -> Bool {
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let usernameRegEx = "^[a-zA-Z ]+$"
        let usernamePred = NSPredicate(format: "SELF MATCHES %@", usernameRegEx).evaluate(with: username)
        return usernamePred
    }
    
    static func isPasswordValid(for password: String) -> Bool {
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let passwordRegEx = "^[\\w!@#$%^&*()_+\\{}\\[\\]:;<>,.?~\\/-]{5,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: password)
        return passwordPred
    }
}
