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
    
    public let viewInScroll: UIView = {
        var view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    public let scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
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
            
            scrollView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            viewInScroll.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            viewInScroll.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            viewInScroll.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            viewInScroll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewInScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            eventTitle.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 12),
            eventTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            eventTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            eventDescription.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 15),
            eventDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            eventDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            eventImage.topAnchor.constraint(equalTo: eventDescription.bottomAnchor, constant: 10),
            eventImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            eventImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            eventImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
        ])
    }
    
    private func setupBinds() {
        
        addSubview(scrollView)
        scrollView.addSubview(viewInScroll)
        viewInScroll.addSubview(eventTitle)
        viewInScroll.addSubview(eventDescription)
        viewInScroll.addSubview(eventImage)
        
    }
}

//MARK: - details events

extension DetailEventView {
    
    func detailViewInfo() {
        eventTitle.text = "\(eventDetail?.title ?? "")"
        eventDescription.text = "\(eventDetail?.description ?? "")"
        eventImage.downloaded(from: "\(eventDetail?.image ?? "")")
    }
}
