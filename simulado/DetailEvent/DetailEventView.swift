//
//  DetailEventView.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 20/07/21.
//

import Foundation
import UIKit

class DetailEventView: UIView, UIScrollViewDelegate {
    
    var eventDetail: Event?
    
    
    public let scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    public var eventTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    public var eventDescription: UILabel = {
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
        return image
    }()
    public let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setTitle("Confirmar no evento", for: .normal)
        button.layer.cornerRadius = 20
        return button
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
        eventImage.backgroundColor = .blue
    }
    
    private func setupContrains() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            eventTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 12),
            eventTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            eventTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            eventDescription.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 15),
            eventDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            eventDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            eventImage.topAnchor.constraint(equalTo: eventDescription.bottomAnchor, constant: 10),
            eventImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            eventImage.heightAnchor.constraint(equalToConstant: 300),
            eventImage.widthAnchor.constraint(equalToConstant: 350),
            
            button.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 10),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
        ])
    }
    
    private func setupBinds() {
        
        addSubview(scrollView)
        scrollView.addSubview(eventTitle)
        scrollView.addSubview(eventDescription)
        scrollView.addSubview(eventImage)
        scrollView.addSubview(button)
    }
}
