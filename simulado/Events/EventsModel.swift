//
//  EventsModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 04/07/21.
//

import Foundation

struct Events: Codable {
    var events: [Event]
}

struct Event: Codable {
    var date: Date
    var description: String?
    var image: String?
    var longitude: Double?
    var latitude: Double?
    var price: Double?
    var title: String?
    var id: String?
}
