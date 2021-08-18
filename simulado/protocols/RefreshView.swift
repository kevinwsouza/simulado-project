//
//  RefreshView.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 18/08/21.
//

import Foundation
import UIKit

open class RefreshView: UIView {
    
    private var blankView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var imageError: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private var labelError: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Ocorreu um erro, tente novamente."
        return label
    }()
    public var buttonError: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Refresh", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    // MARK: - init view
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - setup constrains

extension RefreshView {
    
    func setup() {
        setupBinds()
        setupContrains()
    }
    
    private func setupContrains() {
        NSLayoutConstraint.activate([
            
            blankView.topAnchor.constraint(equalTo: self.topAnchor),
            blankView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            blankView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            blankView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            imageError.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageError.bottomAnchor.constraint(equalTo: labelError.topAnchor, constant: -10),
            imageError.widthAnchor.constraint(equalToConstant: 400),
            imageError.heightAnchor.constraint(equalToConstant: 400),
            
            labelError.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelError.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            buttonError.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonError.topAnchor.constraint(equalTo: labelError.bottomAnchor, constant: 10),
            
        ])
    }
    
    private func setupBinds() {
        
        addSubview(blankView)
        blankView.addSubview(imageError)
        blankView.addSubview(labelError)
        blankView.addSubview(buttonError)
    }
}

//MARK: - image error

extension RefreshView {
    func imageDownloadError() {
        imageError.downloaded(from: "https://copycon.com.br/wp-content/uploads/2018/07/o-maior-erro-no-marketing-420x470.png")
    }
}
