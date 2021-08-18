//
//  DetailEventViewModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 05/07/21.
//

import Foundation
import UIKit

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
//MARK: - details events

extension DetailEventView {
    
    func detailViewInfo() {
        eventTitle.text = "\(eventDetail?.title ?? "")"
        eventDescription.text = "\(eventDetail?.description ?? "")"
        
        if eventDetail?.image != nil {
            eventImage.downloaded(from: "\(eventDetail?.image ?? "")")
        } else {
            eventImage.downloaded(from: "https://copycon.com.br/wp-content/uploads/2018/07/o-maior-erro-no-marketing-420x470.png")
        }
    }
}
