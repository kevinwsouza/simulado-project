//
//  EventsWorker.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 04/07/21.
//

import Foundation

class EventsWorker {
    
    func getEvents(onComplete: @escaping ([Event]) -> Void) {
        let endPoint = "events"
        
        Rest.loadAPI(json: nil, header: nil, endPointPath: endPoint, HTTPMethod: .GET) { (data, error) in
            do {
                if let data = data {
                    let events = try JSONDecoder().decode([Event].self, from: data)
                    onComplete(events)
                }
                
            } catch {
                print(error)
            }
        }
    }
    
    func getEventsDetail(id: Int, onComplete: @escaping (Event) -> Void) {
        let endPoint = "events/\(id)"
        
        Rest.loadAPI(json: nil, header: nil, endPointPath: endPoint, HTTPMethod: .GET) { (data, error) in
            do {
                let event = try JSONDecoder().decode(Event.self, from: data!)
                onComplete(event)
                
            } catch {
                print(error)
            }
        }
    }
}
