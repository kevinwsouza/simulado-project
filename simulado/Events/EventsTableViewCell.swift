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
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    public var labelTitle: UILabel = {
        var label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    public var labelPrice: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    public var labelDate: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var labelLocal: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let imageViewTrailing: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "chevron")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - setup Constrains
    
    func setup() {
        setupBinds()
        setupContrains()
    }
    
    private func setupContrains() {
        NSLayoutConstraint.activate([
            
            viewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            viewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            viewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            viewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            labelTitle.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 12),
            labelTitle.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -20),
            
            labelPrice.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -20),
            labelPrice.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 20),
            
            labelDate.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -20),
            labelDate.leadingAnchor.constraint(equalTo: labelPrice.trailingAnchor, constant: 100),
            
            imageViewTrailing.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -55),
            imageViewTrailing.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -10),
            
        ])
    }
    
    private func setupBinds() {
        
        addSubview(viewCell)
        viewCell.addSubview(labelTitle)
        viewCell.addSubview(labelDate)
        viewCell.addSubview(labelPrice)
        viewCell.addSubview(imageViewTrailing)
    }
}
