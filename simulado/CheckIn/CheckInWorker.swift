//
//  CheckInWorker.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 03/08/21.
//

import Foundation

class CheckInWorker {
    
    
    func postCheckInEvent(body: CheckInModel, onComplete: @escaping (String) -> Void) {
        let endPoint = "checkin"
        
        guard let json = try? JSONEncoder().encode(body) else{
            return }
        
        Rest.loadAPI(json: json, header: nil, endPointPath: endPoint, HTTPMethod: .POST) { (data, error) in
            
            do{
                let data = try JSONDecoder().decode(CheckInModel.self, from: data!)
                //onComplete(data)
            }
            catch {
                print(error)
            }
        }
    }
}
