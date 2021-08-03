//
//  CheckInViewModel.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 02/08/21.
//

import Foundation
import UIKit

class CheckInViewModel {
    
    let coordinator: CheckInCoordinator
    
    
    //MARK: - init
    
    init(coordinator: CheckInCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - pop previous
        func popToPreviousController(){
            coordinator.popToPrevious()
        }
}
