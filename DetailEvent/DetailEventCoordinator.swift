//
//  DetailEventCoordinator.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 05/07/21.
//

import Foundation
import UIKit

final class DetailEventCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var event: Event
    
    init(navigationController: UINavigationController, event: Event) {
        self.navigationController = navigationController
        self.event = event
    }
    
    func start() {
        let viewModel = DetailEventViewModel(coordinator: self,event: event)
        let viewController = DetailEventViewController(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func popToPrevious() {
        navigationController.popViewController(animated: true)
    }
}
