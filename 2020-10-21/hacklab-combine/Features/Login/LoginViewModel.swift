//
//  LoginViewModel.swift
//  hacklab-combine
//
//  Created by Michal Cichecki on 20/10/2020.
//

import Foundation
import Combine

final class LoginViewModel {
    @Published var login: String = ""
    @Published var password: String = ""
    
    lazy var isValid = $login.combineLatest($password)
        .map { $0.count > 2 && $1.count > 2 }
        .eraseToAnyPublisher()
}
