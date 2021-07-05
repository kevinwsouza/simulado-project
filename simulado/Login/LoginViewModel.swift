//
//  LoginViewModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 29/06/21.
//

import Foundation

class LoginViewModel {
    
    let coordinator: LoginViewCoordinator
    
// MARK: - init
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator as! LoginViewCoordinator
    }
}
