//
//  CoordinatorProtocol.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 29/06/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
}
