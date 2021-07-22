//
//  DetailEventViewModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 05/07/21.
//

import Foundation

class DetailEventViewModel {
    
    let coordinator: DetailEventCoordinator
    var event: Event
    
    //MARK: - init
    
    init(coordinator: DetailEventCoordinator, event: Event) {
        self.coordinator = coordinator
        self.event = event
    }
    
    // MARK: - pop previous
        func popToPreviousController(){
            coordinator.popToPrevious()
        }
}
