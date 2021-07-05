//
//  ViewCodable.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 30/06/21.
//

import Foundation

protocol ViewCodable {
    func viewSetup()
    func constraintsSetup()
}

extension ViewCodable {
    func setup() {
        viewSetup()
        constraintsSetup()
    }
}
