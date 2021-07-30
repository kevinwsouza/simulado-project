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
        image.frame = CGRect(x: 0, y: 0, width: 500, height: 400)
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
            eventImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            eventImage.heightAnchor.constraint(equalToConstant: 500),
            eventImage.widthAnchor.constraint(equalToConstant: 350),
        ])
    }
    
    private func setupBinds() {
        
        addSubview(scrollView)
        scrollView.addSubview(eventTitle)
        scrollView.addSubview(eventDescription)
        scrollView.addSubview(eventImage)
        
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

//MARK: - image resize

//extension DetailEventView {
//
//
//    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
//
//        let size = image.size
//
//        let widthRatio = targetSize.width / size.width
//        let heigthRatio = targetSize.height / size.height
//
//
//        var newSize: CGSize
//        if(widthRatio > heigthRatio) {
//            newSize = CGSize(width: size.width * heigthRatio, height: size.height * heigthRatio)
//        } else {
//            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
//        }
//
//        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
//        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//        image.draw(in: rect)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//
//        return newImage!
//
//    }
//}
