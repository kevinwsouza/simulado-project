//
//  LoginViewCoordinator.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 29/06/21.
//

import Foundation
import UIKit

class LoginViewCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
    }
    func start() {
        let viewModel = LoginViewModel(coordinator: self)
        let viewController = LoginViewController(viewModel: viewModel)

        navigationController.pushViewController(viewController, animated: true)
    }
}
