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
    var eventsList: [Event] = []
    var formattedDate = ""
    
    //MARK: - init
    
    init(coordinator: EventsCoordinator) {
        self.coordinator = coordinator
        worker = EventsWorker()
    }
    
    //MARK: - GET
    
    func getEvents(onComplete: @escaping () -> Void) {
        
        worker.getEvents { (events) in
            self.eventsList = events
            //            for event in self.eventsList {
            //                let dateFormatter = DateFormatter()
            //                dateFormatter.dateFormat = "yyyy-MM-dd"
            //                let date = event.date
            //                let dates = dateFormatter.
            //                dateFormatter.dateFormat = "dd/MM/yy"
            //                if let dates = dates{
            //                    let dateRes = dateFormatter.string(from: dates)
            //                    labelDate.text = dateRes
            //                }
            //            }
            onComplete()
        }
    }
    
    //MARK: - Details Events
    
    func didSelect(row: Int) {
        let event = eventsList[row]
        coordinator.eventsDetail(event: event)
    }
}
