//
//  CheckInCoordinator.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 02/08/21.
//

import Foundation
import UIKit

final class CheckInCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CheckInViewModel(coordinator: self)
        let viewController = CheckInViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func popToPrevious() {
        navigationController.popViewController(animated: true)
    }
}
