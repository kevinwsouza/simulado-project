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
    var events: Event
    
    init(navigationController: UINavigationController, events: Event) {
        self.navigationController = navigationController
        self.events = events
    }
    
    func start() {
        let viewModel = DetailEventViewModel(coordinator: self)
        let viewController = DetailEventViewController(viewModel: viewModel)
    }
    
    func popToPrevious() {
        navigationController.popViewController(animated: true)
    }
}
