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
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let events = try decoder.decode([Event].self, from: data)
                    onComplete(events)
                }
                
            } catch {
                print(error)
            }
        }
    }
}
