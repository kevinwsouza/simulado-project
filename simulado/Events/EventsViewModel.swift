//
//  EventsViewModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 01/07/21.
//

import Foundation

class EventsViewModel {
    
    let coordinator: EventsCoordinator
    let worker: EventsWorker
    
    
    //MARK: - init
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator as! EventsCoordinator
        worker = EventsWorker()
    }
    
    //MARK: - GET
    
    func getEvents() {
        
        worker.getEvents { (events) in
            print(events)
            
        }
    }
}
