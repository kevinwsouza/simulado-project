//
//  DetailEventView.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 20/07/21.
//

import Foundation
import UIKit

class DetailEventView: UIView {
    
    var eventDetail: Event?
    
    private var eventTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private var eventDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 14)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    public var eventImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        return image
    }()
    
    // MARK: - init view
    
    init(with event: Event) {
        super.init(frame: .zero)
        self.eventDetail = event
        setup()
        backgroundColor = .gray
        detailViewInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - setup constrains

extension DetailEventView {
    
    func setup() {
        setupBinds()
        setupContrains()
    }
    
    private func setupContrains() {
        NSLayoutConstraint.activate([
            
            eventTitle.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 12),
            eventTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            eventTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            eventDescription.topAnchor.constraint(equalTo: eventTitle.topAnchor, constant: 50),
            eventDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            eventDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            eventImage.topAnchor.constraint(equalTo: eventDescription.topAnchor, constant: 200),
            eventImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            
        ])
    }
    
    private func setupBinds() {
        
        addSubview(eventTitle)
        addSubview(eventDescription)
        addSubview(eventImage)
        
    }
}

//MARK: - details events

extension DetailEventView {
    
    func detailViewInfo() {
        eventTitle.text = "\(eventDetail?.title ?? "")"
        eventDescription.text = "\(eventDetail?.description ?? "")"
        //eventImage.image = events.image
    }
}
