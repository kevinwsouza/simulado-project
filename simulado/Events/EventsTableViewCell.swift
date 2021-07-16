//
//  EventsTableView.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 01/07/21.
//

import Foundation
import UIKit

class EventsTableViewCell: UITableViewCell {
  

    private var viewCell: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 0.2, alpha: 1)
        return view
    }()
    private var labelTitle: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Rockwell", size: 16)
        
        return label
    }()
    private var labelPrice: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Rockwell", size: 16)
        
        return label
    }()
    private var labelDate: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Rockwell", size: 16)
        
        return label
    }()
    private var labelLocal: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Rockwell", size: 16)
        
        label.textColor = .black
        return label
    }()
    
//MARK: - setup Constrains

func setupContrains() {
    
    heightAnchor.constraint(equalToConstant: 120).isActive = true

    addSubview(viewCell)
    
    viewCell.translatesAutoresizingMaskIntoConstraints = false

    viewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
    viewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    viewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
    viewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true

    viewCell.addSubview(labelTitle)

    labelTitle.translatesAutoresizingMaskIntoConstraints = false

    labelTitle.topAnchor.constraint(equalTo: labelTitle.topAnchor, constant: 12).isActive = true
    labelTitle.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor, constant: 20).isActive = true
    labelTitle.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor, constant: -20).isActive = true
    //labelTitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: -10).isActive = true

    viewCell.addSubview(labelDate)

    labelDate.translatesAutoresizingMaskIntoConstraints = true

    labelDate.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 20).isActive = true
    labelDate.leadingAnchor.constraint(equalTo: labelDate.trailingAnchor, constant: 20).isActive = true
    labelDate.trailingAnchor.constraint(equalTo: labelDate.trailingAnchor, constant: -20).isActive = true

    viewCell.addSubview(labelPrice)

    labelPrice.translatesAutoresizingMaskIntoConstraints = false

    labelPrice.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 20).isActive = true
    labelPrice.leadingAnchor.constraint(equalTo: labelPrice.leadingAnchor, constant: 20).isActive = true
    labelPrice.trailingAnchor.constraint(equalTo: labelPrice.trailingAnchor, constant: -20).isActive = true
    

    viewCell.addSubview(labelLocal)

    labelLocal.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
    labelLocal.centerXAnchor.constraint(equalTo: viewCell.centerXAnchor).isActive = true
    labelLocal.bottomAnchor.constraint(equalTo: labelLocal.bottomAnchor, constant: -20).isActive = true
    
    }
}

//MARK: - Create Cells

extension EventsTableViewCell {
    
    func createCells(with events: Event) {
        labelTitle.text = events.title
        labelDate.text = "\(events.date)"
        labelPrice.text = "\(events.price ?? 0)"
        labelDate.text = "\(events.date)"
        labelLocal.text = "Teste"
    }
}
