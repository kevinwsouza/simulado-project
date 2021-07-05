//
//  LoginView.swift
//  simulado
//
//  Created by Kevin willian Jorge souza on 29/06/21.
//

import Foundation
import UIKit

public class LoginView: UIView {
    
    let button = UIButton(type: .custom)
    var hidenclick = false
    
   private let appName: UILabel = {
        var label = UILabel()
        label.text = "City Events"
        label.font = UIFont(name: "Rockwell", size: 26)
        label.textAlignment = .center
        return label
    }()
    private let labelUsername: UILabel = {
        var label = UILabel()
        label.text = "Username"
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .left
        return label
     }()
    private let labelPassword: UILabel = {
        var label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Rockwell", size: 16)
        label.textAlignment = .left
        return label
     }()
    public let textfieldUsername: UITextField = {
        var textfield = UITextField()
        textfield.placeholder = "kevin.souza"
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    public let textfieldPassword: UITextField = {
        var textfield = UITextField()
        textfield.placeholder = "*****"
        textfield.isSecureTextEntry = true
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    public let buttonLogin: UIButton = {
        var button = UIButton()
        button.backgroundColor = UIColor(red: 0.2, green: 0.7, blue: 0.2, alpha: 1)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = UIFont(name: "Rockwell", size: 16)
        button.titleLabel?.textColor = UIColor.white
        button.setTitle("Login", for: .normal)
        return button
    }()
// MARK: - Init
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor(red: 1, green: 1, blue: 0.2, alpha: 1)
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - Constrains
    
    func setupConstrains() {
        
        
        addSubview(appName)
        appName.translatesAutoresizingMaskIntoConstraints = false
        
        appName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 117.5).isActive = true
        appName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 37).isActive = true
        appName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -37).isActive = true
        appName.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        addSubview(labelUsername)
        labelUsername.translatesAutoresizingMaskIntoConstraints = false
        
        labelUsername.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 44).isActive = true
        labelUsername.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 37).isActive = true
        labelUsername.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -37).isActive = true
        labelUsername.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        
        addSubview(textfieldUsername)
        textfieldUsername.translatesAutoresizingMaskIntoConstraints = false
        
        textfieldUsername.topAnchor.constraint(equalTo: labelUsername.bottomAnchor, constant: 5).isActive = true
        textfieldUsername.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 37).isActive = true
        textfieldUsername.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -37).isActive = true
        
        addSubview(labelPassword)
        labelPassword.translatesAutoresizingMaskIntoConstraints = false
        
        labelPassword.topAnchor.constraint(equalTo: textfieldUsername.bottomAnchor, constant: 15).isActive = true
        labelPassword.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 37).isActive = true
        labelPassword.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -37).isActive = true
        labelPassword.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        addSubview(textfieldPassword)
        textfieldPassword.translatesAutoresizingMaskIntoConstraints = false
        
        textfieldPassword.topAnchor.constraint(equalTo: labelPassword.bottomAnchor, constant: 5).isActive = true
        textfieldPassword.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 37).isActive = true
        textfieldPassword.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -37).isActive = true
        
        addSubview(buttonLogin)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        
        buttonLogin.widthAnchor.constraint(greaterThanOrEqualToConstant: 320).isActive = true
        buttonLogin.heightAnchor.constraint(greaterThanOrEqualToConstant: 48).isActive = true
        buttonLogin.topAnchor.constraint(equalTo: textfieldPassword.bottomAnchor, constant: 43).isActive = true
        buttonLogin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 27).isActive = true
        buttonLogin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27).isActive = true
        
        
    }
    
}

