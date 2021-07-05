//
//  EventsModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 04/07/21.
//

import Foundation

struct Events: Codable {
    let events: [Event]
}

struct Event: Codable {
    var people: [People?]
    var date: Int?
    var descripition: String?
    var image: String?
    var longitude: Double?
    var latitude: Double?
    var price: Double?
    var title: String?
    var id: String?
}

struct People: Codable {
    var id: String?
    var eventId: String?
    var name: String?
    var picture: String?
}
