//
//  UIButton+Validation.swift
//  hacklab-combine
//
//  Created by Michal Cichecki on 20/10/2020.
//

import UIKit

extension UIButton {
    var isValid: Bool {
        get {
            isEnabled
        }
        set {
            backgroundColor = newValue ? .green : .red
            isEnabled = newValue
        }
    }
}
