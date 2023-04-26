//
//  EmailCriteria.swift
//  TaskOff
//
//  Created by Олег Борисов on 23.03.2023.
//

import Foundation

struct EmailCriteria{
    static func isValidEmail(_ text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: text)
    }
}
