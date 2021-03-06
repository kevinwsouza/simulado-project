//
//  EventsCoordinator.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 01/07/21.
//

import Foundation
import UIKit

final class EventsCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = EventsViewModel(coordinator: self)
        let refreshView = RefreshView()
        let viewController = EventsViewController(viewModel: viewModel, refreshView: refreshView)
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func popToPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func eventsDetail(event: Event) {
        DetailEventCoordinator(navigationController: self.navigationController, event: event).start()
    }
}
