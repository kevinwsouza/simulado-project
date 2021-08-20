//
//  CheckInView.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 02/08/21.
//

import Foundation
import UIKit

class CheckInView: UIView {
    
    private let labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Confirmação no Evento"
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome do Participante do Evento"
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    public let textfieldName: UITextField = {
        let texfield = UITextField()
        texfield.translatesAutoresizingMaskIntoConstraints = false
        texfield.placeholder = "joão da Silva"
        texfield.backgroundColor = .white
        texfield.layer.cornerRadius = 5
        return texfield
    }()
    private let labelEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email do Participante do Evento"
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    public let textfieldEmail: UITextField = {
        let texfield = UITextField()
        texfield.translatesAutoresizingMaskIntoConstraints = false
        texfield.placeholder = "joãosilva@email.com.br"
        texfield.backgroundColor = .white
        texfield.layer.cornerRadius = 5
        return texfield
    }()
    public let buttonCheckEvent: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 0.0
        button.layer.masksToBounds = false
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.setTitle("Check in", for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    // MARK: - init view
    
    init() {
        super.init(frame: .zero)
        setup()
        backgroundColor = .gray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - setup constrains

extension CheckInView {
    
    func setup() {
        setupBinds()
        setupContrains()
    }
    
    private func setupContrains() {
        NSLayoutConstraint.activate([
            
            labelTitle.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 25),
            labelTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            labelTitle.heightAnchor.constraint(equalToConstant: 20),

            labelName.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 70),
            labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            
            textfieldName.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 12),
            textfieldName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textfieldName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textfieldName.heightAnchor.constraint(equalToConstant: 30),

            labelEmail.topAnchor.constraint(equalTo: textfieldName.bottomAnchor, constant: 45),
            labelEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            labelEmail.heightAnchor.constraint(equalToConstant: 20),
            
            textfieldEmail.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 20),
            textfieldEmail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textfieldEmail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            textfieldEmail.heightAnchor.constraint(equalToConstant: 30),
            
            buttonCheckEvent.topAnchor.constraint(equalTo: textfieldEmail.bottomAnchor, constant: 80),
            buttonCheckEvent.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonCheckEvent.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    private func setupBinds() {
        
        addSubview(labelTitle)
        addSubview(labelName)
        addSubview(textfieldName)
        addSubview(labelEmail)
        addSubview(textfieldEmail)
        addSubview(buttonCheckEvent)
    }
}
