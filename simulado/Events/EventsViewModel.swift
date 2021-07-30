//
//  EventsViewModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 01/07/21.
//

import Foundation
import UIKit

class EventsViewModel {
    
    let coordinator: EventsCoordinator
    let worker: EventsWorker
    var eventsList: [Event] = []
    
    //MARK: - init
    
    init(coordinator: EventsCoordinator) {
        self.coordinator = coordinator
        worker = EventsWorker()
    }
    
    //MARK: - GET
    
    func getEvents(onComplete: @escaping () -> Void) {
        
        worker.getEvents { (events) in
            self.eventsList = events
            onComplete()
        }
    }
    
    //MARK: - Details Events
    
    func didSelect(row: Int) {
        let event = eventsList[row]
        coordinator.eventsDetail(event: event)
    }
}

